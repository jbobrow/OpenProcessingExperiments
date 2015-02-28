
/*this is a work in progress*/
import processing.opengl.*;
float x=0, y=0, z=0;
void setup(){
size(400,400,OPENGL);
}
void draw(){
  background(0);
 // noStroke();//avec nostroke ajouter texture irrégulière
  x+=0.001;
  y+=0.005;
  z+=0.0025;
  /*pointLight(26, 102, 256, width/2, height/2, 0);
  pointLight(51, 102, 126, width/2, height/2, 400);
  pointLight(51, 345, 126, width/2, height/2, 200);*///a essayer /Try this three
//  pointLight(51, 102, 256, width/2, height/2, 0);
 // pointLight(51, 102, 126, width/2, height/2, 400);
  pointLight(51, 102, 126, width/2, height/2, 200);
smooth();
//shininess(175);//do nothing
//emissive(252,210,117); //yellow boxes
//emissive(125,320,45);//fluo
//lightSpecular(255, 255, 255);
translate(100,100,0);
rotateX(x);
rotateY(y);
rotateZ(z);
//sphereDetail(30,30);//try to test value 0,1,2,3,5,6...& so one
//sphere(50);
//specular(100,10,20);
box(50,50,50);
translate(170,10,100);
rotateX(x);
rotateY(y);
rotateZ(z);
box(50,50,50);
translate(240,200,60);
rotateX(x);
rotateY(y);
rotateZ(z);
box(50,50,50);
translate(310,150,400);
rotateX(x);
rotateY(y);
rotateZ(z);
box(50,50,50);
translate(380,300,0);
rotateX(x);
rotateY(y);
rotateZ(z);
box(50,50,50);
}
void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("waveclock-####.tif");
  }
}

