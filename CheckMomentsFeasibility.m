function infeasible_flag = CheckMomentsFeasibility(z_raw_moments, num_moments)
    if rem(num_moments,2) == 0
        % Even number of moments in hand
        l = num_moments/2;
        % Construct R_k Matrix        
        R_k_matrix = zeros(num_moments+1, num_moments+1);
        for j = 1:num_moments+1
            R_k_matrix(:,j) = z_raw_moments(j:j+num_moments)';
        end        
        % Construct R_{k-1} Matrix: K-1 will be odd
        KK = num_moments - 1;
        l  = (KK-1)/2;
        R_k1_matrix = zeros(l+1, l+1);
        for j = 1:l+1
            R_k1_matrix(:,j) = z_raw_moments(j+1:j+1+l)';
        end
    else
        % Odd number of moments in hand . Eg. K = 3, then l = 1             
        % Construct R_{k} Matrix (Eg. R_3 matrix)
        l  = (num_moments-1)/2;
        R_k_matrix = zeros(l+1, l+1);
        for j = 1:l+1
            R_k_matrix(:,j) = z_raw_moments(j+1:j+1+l)';
        end
        % Construct R_{k-1} Matrix (Eg. R_2 matrix)
        R_k1_matrix = zeros(l+1, l+1);
        for j = 1:l+1
            R_k1_matrix(:,j) = z_raw_moments(j:j+l)';
        end  
    end 
    
    % Check if R_k_matrix >= 0 & R_k1_matrix >= 0
    if (all(eig(R_k_matrix)) >= 0) && (all(eig(R_k1_matrix)) >= 0) 
        infeasible_flag = 0;
    else
        infeasible_flag = 1;
    end
end

