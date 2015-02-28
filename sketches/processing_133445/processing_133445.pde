

void setup()
{
  size(1200,800,P3D);
  smooth();

}

void draw()
{
  background(255);
  lights();

 float cameraY = height/2.0;
  float fov = mouseX/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  
  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  
  translate(width/2+30, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3 + mouseY/float(height) * PI);

//  Change height of the camera with mouseY
/* camera(30.0, 30.0,mouseY, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         1.0, 1.0,1.0); // upX, upY, upZ

*/


  pushMatrix(); 
  translate(000,000);
  //noFill();
fill(255,0,0,10);

stroke(0);
box(20);stroke(0);
box(40);stroke(0);
box(60);stroke(0);
box(80);stroke(0);
box(100);stroke(0);
box(120);stroke(0);
box(140);stroke(0);
box(160);stroke(0);
box(180);

stroke(0);
box(200);

stroke(0);
box(220);

stroke(0);
box(240);

stroke(0);
box(260);

stroke(0);
box(280);

stroke(0);
box(300);

stroke(0);
box(320);

popMatrix();


  
  
  
  
  
}

