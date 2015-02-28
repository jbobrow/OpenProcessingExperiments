
size(700, 700);
smooth();
background(255);
 
      for (int g = 3; g<=width; g=g+5) {
        for (int j = 4; j<=width; j=j+180) {
          stroke(0);
          noFill();
          quad (g, j, g+20, j+20,g*1.75, j*1.75, 470, 300);
        }
      }

    for (int g = 8; g<=128; g=g+1) {
     {
        for (int j = 34; j<=width; j=j+55) {
          stroke(55,10);
          noFill();
        }
      }
    }
   

      for (int g = 3; g<=width; g=g+5) {
        for (int j = 3; j<=width; j=j+180) {
          stroke(255);
          noFill();
          quad (g, j, g+20, j+20, g*1.3, j*1.7, 470, 10);
        }
      }



