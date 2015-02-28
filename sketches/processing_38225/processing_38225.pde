
size(600, 400);


translate(0, 135); //changing the origin so that the horizontal lines are centered

for (int x=50; x < 550; x+=random(10,30)) { 
  for (int y=30; y < 100; y+=10) { 

    for (float z=random(10,200); z < 100; z+=random(30,60)) {
      
      strokeWeight(1.5); 
      stroke(255, 0, 0); 
      line(x, z, x, z+10); 

      strokeWeight(1);
      stroke(0, 0, 255);
      line(x, y, x+random(40), y);

      for (int i = 0; i < 90; i +=10) {
        pushMatrix();
        rotate(radians(i));//rotating vertical lines as to create a radar-like spiral

        strokeWeight(1.5);
        stroke(255, 0, 0); 
        line(x, z, x, z+10); 

        popMatrix(); 

        for (int j = 0; j > -120; j -=10) {
          pushMatrix();
          rotate(radians(j));//same rotation just in the opposite direction

          strokeWeight(1.5); 
          stroke(255, 255, 0); 
          line(x, z, x, z+10); 

          popMatrix();
          

        }
      }
    }
  }
}


