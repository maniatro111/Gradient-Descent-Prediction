function [w] = learn(X, y, lr, epochs)
    %scalarea coloanelor din X
    X(:) = (X(:) - mean(X(:))) / std(X(:));
    [latime lungime] = size(X);
    %crearea vectorului W cu valori random intre -0.1 si 0.1
    xmin = -0.1;
    xmax = 0.1;
    w = xmin + rand(1, lungime + 1) * (xmax - xmin);
    w = w';
    Xtilda = zeros(latime, lungime + 1);
    Xtilda = X;
    Xtilda(:, lungime + 1) = 1;
    wi = w;
    %aplicarea Mini-batch Gradient Descent
    for epoch = 1:epochs
        batch = randi(latime, 64, 1);
        Xbatch = Xtilda(batch(:), :);
        ybatch = y(batch(:));

        for i = 1:lungime + 1
          %calcularea sumei
            suma = sum((Xbatch(:, :) * wi - ybatch(:)) .* Xbatch(:, i));
            wi(i) = wi(i) - lr * 1 / latime * suma;
        endfor

        w = wi;
    endfor

endfunction
