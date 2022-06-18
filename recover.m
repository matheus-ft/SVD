function M = recover(image_path, r)
    % Recovers an image by approximating its matrix for another with lower rank.
    % image_path (string) relative path for the image file to be recovered
    % r (integer) custom rank of the recovery matrix
    % M (n by m by 3 matrix) recovery matrix
    M = svd_img(imread(image_path));
    imwrite(M, strcat("recovered_r", int2str(r), ".png"));
end

