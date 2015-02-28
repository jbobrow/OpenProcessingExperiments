
  size(420,600, P3D);
  background(176, 186, 175);
  smooth();
  
  fill(139, 119, 119);
  beginShape();
  vertex(300, 200);
  vertex(300, 550);
  vertex(350, 580);
  vertex(350, 230);
  endShape(CLOSE);

     //BLACK ARC 
   pushMatrix(); 
   translate (-260, -60);
   fill(255, 0);
   ellipse(150, 150, 1000, 900);
   popMatrix();
   
   pushMatrix(); 
   translate (-200, -60);
   fill(255, 0);
   ellipse(150, 150, 1000, 900);
   popMatrix();

  fill(211, 201, 201, 200);
  beginShape();
  vertex(325, 120);
  vertex(325, 500);
  vertex(375, 470);
  vertex(375, 90);
  endShape(CLOSE);
  
  PFont f;
  String message="PNEUMATIK";
  f = createFont("Arial",220,true);
  fill(0);
  textFont(f);                  // Set the font
  translate(0,330);  // Translate to the center 
  rotateY(radians(67));  
  text(message,0,0);            


