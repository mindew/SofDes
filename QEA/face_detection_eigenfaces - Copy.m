function [Reduced_Train, Reduced_Test] = face_detection_eigenfaces(face_number)

load face_detect.mat
load face_detect_fixed_names.mat

% vectorize the test images 
% face_number = randi(size(faces_test_hard,3));

vectorized_images_train = reshape(faces_train, [size(faces_train,1)*size(faces_train,2),size(faces_train,3)]);
vectorized_images_test = reshape(faces_test_hard(:,:,face_number), [size(faces_test_hard(:,:,face_number),1)*size(faces_test_hard(:,:,face_number),2),size(faces_test_hard(:,:,face_number),3)]);

% change into value from paper
approx_num_train = 50;

% create a covariance matrix
mean_centered_data_train = mean_centered(vectorized_images_train);


% SVD
[~, largest_eigenvectors_train] = single_value_decomp(mean_centered_data_train, approx_num_train);


end