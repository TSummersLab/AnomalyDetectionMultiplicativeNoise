function [raw_moments] = CentralToRawMoments(central_moments, z_mean)

    num_moments = size(central_moments, 2)-1; % subtract the zero moments
    raw_moments = zeros(num_moments+1,1);
    raw_moments(1) = 1;        % 0th moment = 1
    raw_moments(2) = z_mean;   % 1st moment = mean
    
    for i = 3:num_moments+1 % vector index
        j = i - 1; % moment index          
        raw_moments(i) = 0; 
        for k = 1:j+1
            l = k - 1;
            raw_moments(i) = nchoosek(j, l)*central_moments(k)*z_mean^(j-l) + ...
                             raw_moments(i); 
        end
    end
%     check_val = central_moments(end) + z_mean^5 + 5*central_moments(5)*z_mean + ...
%                 10*(central_moments(4)*z_mean^2 + central_moments(3)*z_mean^3);
%     if norm(raw_moments(end) - check_val) <= 1e-03
%         disp(['Correct'])
%     end
end

