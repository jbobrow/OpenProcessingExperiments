
//Jupiter Rotation by Daniel G Washburn
//Press the up arrow to rotate the planet 
//(this will allow you to view the north and south poles). 

//Press down arrow to return the planet to its starting position.


import surface.*;
Sphere s;
PImage z, jt;
float a;
float rotateval;

void setup(){
size(400,400,P3D);
a=0.0;
frameRate(24);
}

  void draw(){
  a=a+.01;
  background(0);
  noStroke();
  directionalLight(254,254,254,250,-250,-250);
  z = loadImage("jupiter3.jpg");
  jt = loadImage("jupitertitle.JPG"); 
  jt.resize(150, 50);
  image(jt,jt.width+50,jt.height+40);
  translate(width/2,height/2);
  rotateY(a);
  rotateX(radians(90));
  rotateX(rotateval);
  s=new Sphere(g, 120, 120);
  s.setScale(80); 
  s.setTexture(z,"WHOLE");
  s.draw();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      rotateval = rotateval+.1;
    } else if (keyCode == DOWN) {
      rotateval = 0;
    } 
  }
}



