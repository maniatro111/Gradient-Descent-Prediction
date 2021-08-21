function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
    [X y] = preprocess(path_to_testset, histogram, count_bins);
    [latime lungime] = size(X);
    %scalarea coloanelor din matrice
    X(:) = (X(:) - mean(X(:))) / std(X(:));
    %crearea lui Xtilda
    Xtilda = zeros(latime, lungime + 1);
    Xtilda = X;
    Xtilda(:, lungime + 1) = 1;
    ycomp = Xtilda * w;
    cazposib = latime;
    contor = 0;
    %calcularea cazurilor favorabile
    for i = 1:latime

        if (ycomp(i) >= 0 && y(i) >= 0) || (ycomp(i) <= 0 && y(i) <= 0)
            contor++;
        endif

    endfor

    percentage = double(contor / cazposib);
endfunction
