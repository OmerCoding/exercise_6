function [C, sigma] = dataset3Params(X, y, Xval, yval)


C = 1;
sigma = 0.3;


C_trial = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_trial = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
error = 0
min_error = 0
best_i = 0;
best_j = 0;

for i = 1:length(C_trial)
  for j = 1:length(sigma_trial)
    [model] = svmTrain(X, y, C_trial(i), @(x1, x2) gaussianKernel(x1, x2, ...
    sigma_trial(j)));
    
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval));
    
    if (i == 1 && j == 1)
      min_error = error;
    else
      if (error < min_error)
        min_error = error;
        best_i = i;
        best_j = j;
      endif
    endif
    
   end
 end



C = C_trial(best_i);
sigma = sigma_trial(best_j);


end
