img_path = 'java.jpg';
A = imread(img_path);
R = A(:, :, 1);

r = rank(R)
r0 = 1;
r1 = int32(r / 5);
r2 = int32(r / 4);
r3 = int32(r / 3);
r4 = int32(r / 2);

M0 = svd_img(A, r0);
imwrite(M, strcat("recovered_r", int2str(r0), ".png"));

M1 = svd_img(A, r1);
imwrite(M, strcat("recovered_r", int2str(r1), ".png"));

M2 = svd_img(A, r2);
imwrite(M, strcat("recovered_r", int2str(r2), ".png"));

M3 = svd_img(A, r3);
imwrite(M, strcat("recovered_r", int2str(r3), ".png"));

M4 = svd_img(A, r4);
imwrite(M, strcat("recovered_r", int2str(r), ".png"));

