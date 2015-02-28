

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
  
 camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);

//  Change height of the camera with mouseY
 /*camera(30.0, mouseY, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ */
  pushMatrix();
  
 translate(600,400);

noFill();
//fill(200);
stroke(255);

sphereDetail(8,16);
sphere(75);

sphereDetail(4,8);
sphere(150);

sphereDetail(2,4);
sphere(300);


sphereDetail(1,2);
sphere(600);

popMatrix();


  
  
  
  
  
}

