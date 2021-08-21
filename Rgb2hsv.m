function [matr] = Rgb2hsv(path_to_image)
    img = imread(path_to_image);
    [latime lungime straturi] = size(img);
    matr = zeros(latime, lungime, straturi);
    img = double(img) ./ 255;
    Cmax = max(max(img(:, :, 1), img(:, :, 2)), img(:, :, 3));
    Cmin = min(min(img(:, :, 1), img(:, :, 2)), img(:, :, 3));
    delta = Cmax - Cmin;
    matr(:, :, 3) = Cmax;
    aux = zeros(latime, lungime);
    aux(find(Cmax)) = delta(find(Cmax)) ./ Cmax(find(Cmax));
    aux(find(Cmax == 0)) = 0;
    matr(:, :, 2) = aux;
    rprim = img(:, :, 1);
    gprim = img(:, :, 2);
    bprim = img(:, :, 3);
    aux = zeros(latime, lungime);
    aux(find(Cmax == rprim)) = mod((gprim(find(Cmax == rprim)) - bprim(find(Cmax == rprim))) ./ delta(find(Cmax == rprim)), 6) / 6;
    aux(find(Cmax == gprim)) = ((bprim(find(Cmax == gprim)) - rprim(find(Cmax == gprim))) ./ delta(find(Cmax == gprim)) + 2) / 6;
    aux(find(Cmax == bprim)) = ((rprim(find(Cmax == bprim)) - gprim(find(Cmax == bprim))) ./ delta(find(Cmax == bprim)) + 4) / 6;
    aux(find(delta == 0)) = 0;
    matr(:, :, 1) = aux;
endfunction
