close all 

R1 = eye(3); %rotation matrix 1

for i=104700:130000

 % update matrix
  time_for_loop_s=looptime(i)*1E-6;
  delta_theta(1)=decodehex(wx{i})*time_for_loop_s;
  delta_theta(2)=decodehex(wy{i})*time_for_loop_s;
  delta_theta(3)=decodehex(wz{i})*time_for_loop_s;
  if isnan(delta_theta(1)) | isnan(delta_theta(2)) | isnan(delta_theta(3))
      fprintf('problem row %d', i);
      fprintf('\n');
      delta_theta=[0 0 0];
  end
  
  
  
  M = [ 1.0, -delta_theta(3), delta_theta(2);
    delta_theta(3), 1.0, -delta_theta(1);
    -delta_theta(2), delta_theta(1), 1.0 ]; 
   
  R2 = R1 * M;
  
  %Renormalization of R
  R1 = Normalize_M(R2);
  
    plot3([0,R1(1)],[0,R1(2)],[0,R1(3)]);
    title('3D');
    axis([-2 2 -2 2 -2 2]);
    hold on
    plot3([0,R1(4)],[0,R1(5)],[0,R1(6)]);
    plot3([0,R1(7)],[0,R1(8)],[0,R1(9)]);
    hold off
    pause(0.005)
    
  
  
end

R1
