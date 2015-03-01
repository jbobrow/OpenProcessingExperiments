
import processing.opengl.*;

float center = 250;
float eyepos = 10;

float R_x =0;
float R_y =0;

Eye e1, e2, e3, e4, e5;

void setup() {
  
  size(500, 500, OPENGL);
  
  e1 = new Eye( 290,  240,  30);

  e2 = new Eye( 210, 240,  30);  
}

void draw() {

background(94, 222, 161);
noFill();
noStroke();
pushMatrix();
translate(250, height/2, 0);
rotateY(R_y);
rotateX(R_x);
R_y+=0.01;
R_x+=0.01;
stroke(0,0,255);
box(200);
popMatrix();


  noStroke();
  fill(255, 238, 215);
  ellipse(center, center, 230, 250);
  
  fill(210, 194, 172);
  noStroke();
  
  fill(255, 238, 215);
 
  
  //fill(249, 255, 255);                   //eye-color
  //ellipse(center+40, center-eyepos, 60, 40);    //eye1
  //ellipse(center-40, center-eyepos, 60, 40);    //eye2

  fill(70, 211, 255);                          
  ellipse(center+40, center-eyepos, 20, 20);    //eye1-blue
  ellipse(center-40, center-eyepos, 20, 20);    //eye2-blue

  noFill();
  stroke(87, 32, 14);
  strokeWeight(3);

  arc(center+40, center-30, 60, 50, 4.2, 5.5);
  arc(center-40, center-20, 60, 50, 4.0, 5.2);
  
  
  arc(center, center+20, 30, 30, 0, 3.1);   //mund
  
  e1.update(mouseX, mouseY);

  e2.update(mouseX, mouseY);
  
  e1.display();

  e2.display();
  
  

}


class Eye 

{

  int ex, ey;

  int size;

  float angle = 0.0;

  

  Eye(int x, int y, int s) {

    ex = x;

    ey = y;

    size = s;

 }



  void update(int mx, int my) {

    angle = atan2(my-ey, mx-ex);

  }

  

  void display() {

    pushMatrix();

    translate(ex, ey);

    fill(255);

    ellipse(0, 0, size, size+20);

    rotate(angle);

    fill(153);

    ellipse(size/4, 0, size/2, size/2);

    popMatrix();

  }

}
