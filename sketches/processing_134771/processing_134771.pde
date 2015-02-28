
void setup()
{
  size(1200,800,P3D);
// noLoop();
//smooth();
 
}
 
void draw()
{
  background(0);
  //  lights();
   
// camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
 
//  Change height of the camera with mouseY
 camera(30.0, mouseX, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
   
/*
 
  noFill();
 //fill(0,0,255,130);
  stroke(255);
strokeWeight(2);
  
  ellipse (600,400,400,400); //middle
   
  //fill(255,255,0,90);
  ellipse (300,400,400,400);
   
  ellipse (900,400,400,400);
   
  ellipse (600,200,400,400);
   
  ellipse (600,600,400,400);
   
  line (600,0,600,800);
  line (400,0,400,1200);
  line (800,0,800,1200);
   
  line (100,0,100,1200);
  line (1100,0,1100,1200);
  line (700,0,700,1200);
  
    line (500,0,500,1200);
  */
   
   
  pushMatrix();
translate(000,000);
noFill();

stroke(100);
sphere(200);
 
stroke(150);
sphere(400);
 
stroke(200);
sphere(600);
 
popMatrix();
 
 
   
   
   
   
   
}
