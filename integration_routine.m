close all 

R1 = eye(3); %rotation matrix 1

for i=1:(length(looptime)-1)

 % update matrix
  time_for_loop_s=looptime(i)*1E-6;
  delta_theta(1)=decodehex(wx{i})*time_for_loop_s;
  delta_theta(2)=decodehex(wy{i})*time_for_loop_s;
  delta_theta(3)=decodehex(wz{i})*time_for_loop_s;
  if isnan(delta_theta(1)) | isnan(delta_theta(2)) | isnan(delta_theta(3))
      fprintf('problem row %d', i);
  end
  
  M = [ 1.0, -delta_theta(3), delta_theta(2);
    delta_theta(3), 1.0, -delta_theta(1);
    -delta_theta(2), delta_theta(1), 1.0 ]; 
   
  R2 = R1 * M;
  
  %Renormalization of R
  R1 = Normalize_M(R2);
  
end

R1
