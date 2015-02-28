
/* @pjs preload="heart.png"; 
 */

void setup() {
  size(800, 600, P3D);
  noCursor();
  strokeWeight(1);
  h=loadImage("heart.png");
}
float bz=0;
PImage h;

float z;
float dx;
float r=650;
float mx = -100;
float za;
boolean end=false;

void draw() {
  background(255);
  dx=(mx-width/2)*2*PI/width;

  z=cos(dx)*r;
  camera(sin(dx)*r+400, -700, z, 400, 300, 0.0, 0.0, 1.0, 0.0);

  pushMatrix();

  translate(58, 48, 0); 
  color(255);
  box(90);
  strokeWeight(5);
  stroke(255, 0, 0);
  line(0, -45, -bz*2/3, 0, -95, -bz*2/3);

  stroke(0);

  strokeWeight(1);

  popMatrix();
  pushMatrix();

  translate(163, 310, 100); 
  color(255);
  box(120);
  strokeWeight(5);
  stroke(0, 0, 255);

  line(0, -60, bz, 0, -110, bz);
  if (mx>=210&& mx<=216) {
    if (bz>-50) {
      bz--;
    }
    else {
      bz=-50;
    }
  }

  if (bz==-50) {
    end=true;
  }
  if (end==true) {
    pushMatrix();

    translate(0, -250, -60);
    rotateY(PI/2);
    rotateX(-PI/3);
    noStroke();
    image(h, -15, -15);
    popMatrix();
  }

  strokeWeight(1);
  stroke(0);
  popMatrix();

  //point(mouseX,mouseY,za);
  //
  //println(mouseX);
  //println(mouseY);
  //println(mx);
}





void keyPressed() {
  if (end==false) {
    if (key=='a') {
      if (mx>-100) {
        mx-=2;
      }
      else {
        mx=-100;
      }
    }
    if (key=='d') {
      if (mx<600) {
        mx+=2;
      }
      else {
        mx=600;
      }
    }
  }

  //  if (key=='w'){
  //  za++;}
  //  
  //  else if (key=='s'){
  //    za--;
  //  }
}



