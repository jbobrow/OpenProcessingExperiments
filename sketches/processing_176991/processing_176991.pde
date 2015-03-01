
size(640, 360, P3D); 
background(215, 158, 164);
lights(54, 34, 123);

noStroke();
pushMatrix();
translate(300, height/2, 0);
rotateY(1.25);
rotateX(-0.4);
box(100);
popMatrix();

noFill();
stroke(245);
pushMatrix();
translate(500, height*0.35, -200);
sphere(360);
popMatrix();
