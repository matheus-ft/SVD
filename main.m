img_path = 'java.jpg';
A = imread(img_path);
G = A(:, :, 2);

r = rank(G);
printf("The original photograph is given by a matrix with rank %d.\n", r);

M0 = svd_img(A, 1);
imwrite(M0, strcat("recovered_r1.png"));

M1 = svd_img(A, 51);
imwrite(M1, strcat("recovered_r51.png"));

M2 = svd_img(A, 101);
imwrite(M2, strcat("recovered_r101.png"));

M3 = svd_img(A, 151);
imwrite(M3, strcat("recovered_r151.png"));

M4 = svd_img(A, 201);
imwrite(M4, strcat("recovered_r201.png"));

