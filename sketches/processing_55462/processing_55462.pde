

float v;
float a = 100;
float r =random(255);
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;
float mx;


/*import java.awt.*;
 
 float[] dashes = { 29.0f, 25.0f, 29.0f, 25.0f };
 BasicStroke pen; //BasicStroke for Vertex
 
 float[] dashes2 = {26.0f, 22.0f, 26.0f, 22.0f};
 BasicStroke pen2;  //BasicStroke for lines */

PShape s;
PShape sm;

void setup()
{
  size(900, 900, P3D);
  smooth();

  s=loadShape("asterisk.svg");
  sm=loadShape("asterisk_mag.svg");
}
void draw()
{


  background(#FFFFFF);
  strokeWeight(.5);
  strokeCap(SQUARE);

  x = x + xspeed;
  y = y + yspeed;

  if ((x > width/3) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height/3) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  a = a - 0.5;
  if ( a < 0 ) {
    a = height;
  }
  pushMatrix();
  translate(-1250, -1000, -2000);
  beginShape();
  noFill();
  stroke(y-v);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  stroke(#03FF4C);
  stroke(x);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);
  stroke(#EA1870);
  stroke(y);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  popMatrix();

////////////////// row 1 far left



pushMatrix();
translate(-515, -1000, -2000);
  beginShape();
  noFill();
  stroke(y+v);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  stroke(#1839EA);
  stroke(x);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);
  stroke(#EA1870);
  stroke(v);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  popMatrix();

////////////////// row 1 second from left

pushMatrix();
translate(200, -1000, -2000);
  beginShape();
  noFill();
  stroke(y+v);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  stroke(#FF2903);
  stroke(x+v);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);
  stroke(#EA1870);
  stroke(y+v);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  popMatrix();

////////////////// row 1 third from left

pushMatrix();
translate(925, -1000, -2000);
  beginShape();
  noFill();
  stroke(y-v);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  stroke(#1839EA);
  stroke(x+v);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);
  stroke(#EA1870);
  stroke(y+v);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  popMatrix();

////////////////// row 1 fourth from left

pushMatrix();
translate(925, -100, -2000);
  beginShape();
  noFill();
  stroke(v);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  stroke(#1839EA);
  stroke(x);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);
  stroke(#EA1870);
  stroke(y);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  popMatrix();

////////////////// row 2 first from right

pushMatrix();
translate(200, -100, -2000);
  beginShape();
  noFill();
  stroke(y+v);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  stroke(#1839EA);
  stroke(x-v);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);
  stroke(#EA1870);
  stroke(y+v);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  popMatrix();

////////////////// row 2 second from right

pushMatrix();
translate(-525, -100, -2000);
  beginShape();
  noFill();
  stroke(y-v);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  stroke(#1839EA);
  stroke(x+v);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);
  stroke(#EA1870);
  stroke(mx);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  popMatrix();

////////////////// row 2 third from right

pushMatrix();
translate(-1250, -100, -2000);
  beginShape();
  noFill();
  stroke(v);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  stroke(#1839EA);
  stroke(x+v);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);
  stroke(#EA1870);
  stroke(y+v);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  popMatrix();

////////////////// row 2 fourth from right

pushMatrix();
translate(-1250, 775, -2000);
  beginShape();
  noFill();
  stroke(y+v);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  stroke(#1839EA);
  stroke(x+v);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);
  stroke(#EA1870);
  stroke(y+v);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  popMatrix();

////////////////// row 3 first from left

pushMatrix();
translate(-525, 775, -2000);
  beginShape();
  noFill();
  stroke(v);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  stroke(#1839EA);
  stroke(mx);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);
  stroke(#EA1870);
  stroke(y+v);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  popMatrix();

////////////////// row 3 second from left

pushMatrix();
translate(200, 775, -2000);
  beginShape();
  noFill();
  stroke(y-v);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  stroke(#1839EA);
  stroke(x+v);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);
  stroke(#EA1870);
  stroke(y+v);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  popMatrix();

////////////////// row 3 third from left

pushMatrix();
translate(925, 775, -2000);
  beginShape();
  noFill();
  stroke(y+v);
  vertex (609, 122);
  vertex (881, 279);
  vertex (881, 591);
  vertex (609, 748);
  vertex (338, 591);
  vertex (338, 279);
  endShape(CLOSE);
  stroke(#1839EA);
  stroke(mx);
  line(338, 279, 881, 591);
  line(338, 279, 881, 591);
  line(609, 122, 609, 748);
  line(338, 591, 881, 278);
  stroke(#EA1870);
  stroke(y+v);
  line(338, 435, 745, 670);
  line(474, 200, 881, 436);
  line(338, 435, 745, 201);
  line(474, 200, 474, 670);
  line(745, 201, 745, 670);
  line(474, 670, 881, 436);
  popMatrix();

////////////////// row 3 fourth from left


///////// mouse parameters

  v=mouseX/4;
  float v2 = map(v, 0, 255, 0, 255);

  float mx = map(mouseX, 0, mouseY, 5, 50);
}


