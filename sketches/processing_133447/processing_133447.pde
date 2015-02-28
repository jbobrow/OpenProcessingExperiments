
PMatrix3D cam;

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


box(20);

//box(40);

box(60);

//box(80);
fill(255,0,0,50);

box(100);

//box(120);
fill(0,0,255,40);

box(140);

//box(160);
fill(0,255,255,30);

box(180);

//box(200);

fill(255,0,255,20);

box(220);


//box(240);

fill(255,255,0,10);

box(260);


//box(280);

fill(255,0,0,10);

box(300);


//box(320);

popMatrix();


  
  
  
  
  
}

