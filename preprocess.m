function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
    path_to_cats = path_to_dataset;
    path_to_no_cats = path_to_dataset;
    path1 = strcat(path_to_cats, 'cats/');
    path2 = strcat(path_to_no_cats, 'not_cats/');
    path_to_cats = strcat(path_to_cats, 'cats/*jpg');
    path_to_no_cats = strcat(path_to_no_cats, 'not_cats/*jpg');
    img_cats = dir(path_to_cats);
    img_not_cats = dir(path_to_no_cats);
    n_cats = length(img_cats);
    n_not_cats = length(img_not_cats);

    for i = 1:n_cats
        l = 1:length(img_cats(i).name) + 13;
        images(i, l) = strcat(path1, img_cats(i).name);
    endfor

    images = char(images);

    for i = 1:n_not_cats
        l = 1:length(img_not_cats(i).name) + 17;
        image(i, l) = strcat(path2, img_not_cats(i).name);
    endfor

    image = char(image);
    X = zeros(n_cats + n_not_cats, 3 * count_bins);

    if strcmp(histogram, "RGB")

        for i = 1:n_cats
            X(i, :) = rgbHistogram(images(i, :), count_bins);
        endfor

        for i = 1:n_not_cats
            X(i + n_cats, :) = rgbHistogram(image(i, :), count_bins);
        endfor

    else

        for i = 1:n_cats
            X(i, :) = hsvHistogram(images(i, :), count_bins);
        endfor

        for i = 1:n_not_cats
            X(i + n_cats, :) = hsvHistogram(image(i, :), count_bins);
        endfor

    endif

    y = zeros(n_cats + n_not_cats, 1);
    y(1:n_cats, 1) = 1;
    y(n_cats + 1:n_not_cats + n_cats) = -1;
endfunction
