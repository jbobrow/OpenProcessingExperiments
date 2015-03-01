
float x, y, z, a, b, e ;
float angle = 0;
float angle2 = 300;
float angle3 = 200;
float r = 600;
float d = 1;
float c1 = 0;

void setup() {
size(600,600);
//import processing.pdf.*;
//beginRecord(PDF, "hologram.pdf"); 

background(0,0,0);
colorMode(HSB, 100);

}

void draw(){
  x = r*sin(angle);
  y = r*cos(angle);
  z = r*sin(angle2);
  a = r*cos(angle2);
  b = r*sin(angle3);
  e = r*cos(angle3);
 
  //color
  c1 = c1 +1;
  
  if( c1 > 100 ) {
      c1=0;
  }
stroke(c1,150,100,50);

  noFill();
  translate(width/2, height/2);
  rotate(angle);

  //line(0, 0, x, y);
  ellipse(0, 0, x, y);
  ellipse(0, 0, z, a);
  ellipse(0, 0, b, e);
  
  angle += angle2;
  r = r-d;
 
  if (r == 0 || r == 300); {
  d = d*-1;
  }
  println(x + " : "  +y);
}

void keyPressed() {
if (key == 'q' ){
  endRecord();
  exit();
 }
}
