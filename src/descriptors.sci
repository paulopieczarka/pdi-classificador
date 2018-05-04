function [a,d] = descriptors(im)

    im = (im < 255);
    a = sum(im);

    [x y] = follow(im, 8);

    maxDist = 0;
    for j = 1:size(x,1)
        for j = i+1:size(y,1)
            eucl = sqrt(((x(i)-x(j))^2)+((y(i)-y(j))^2));
            if(eucl > maxDist)
                maxDist = eucl;
            end
        end
    end
    d = maxDist;
    
endfunction
