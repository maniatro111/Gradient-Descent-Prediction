function [sol] = hsvHistogram(path_to_image, count_bins)
    img_hsv = Rgb2hsv(path_to_image);
    div = double(1.01 / count_bins);
    [latime lungime] = size(img_hsv(:, :, 1));
    img_hsv(:, :, 1) = floor(img_hsv(:, :, 1) ./ div);
    img_hsv(:, :, 2) = floor(img_hsv(:, :, 2) ./ div);
    img_hsv(:, :, 3) = floor(img_hsv(:, :, 3) ./ div);
    img_hsv = img_hsv .+ 1;
    h = img_hsv(:, :, 1);
    v1 = accumarray(h(:), 1, [1 count_bins]);
    s = img_hsv(:, :, 2);
    v2 = accumarray(s(:), 1, [1 count_bins]);
    v = img_hsv(:, :, 3);
    v3 = accumarray(v(:), 1, [1 count_bins]);
    sol = [v1, v2, v3];
endfunction
