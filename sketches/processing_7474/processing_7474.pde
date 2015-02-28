
//pythagoras

void setup(){
  size(800, 800);
  background(0, 30, 80);
  stroke(255);
  noFill();
  strokeWeight(0.3);
  smooth();


}

void draw(){


  float tempAngel = 180*(0.00125*mouseX);

  background(0, 30, 80);

  stroke(10);
  arc(width/2, 420, 300, 300, PI, TWO_PI);

  stroke(255);
  rect(250, 420, 300, 300);


//------------------------------- floating Point on circle

  float Cx = width/2 + cos(radians(-tempAngel))*150;
  float Cy = 420 + sin(radians(-tempAngel))*150;


//------------------------------- triangle

  line(250, 420, Cx, Cy);
  line(Cx, Cy, 550, 420);


//------------------------------- Square b

  float angelA = tempAngel/2;

  float b = cos(radians(angelA))*300;

  float b04x = 250;
  float b04y = 420;
  float b01x = Cx;
  float b01y = Cy;
  
  float b02x = b01x -sin(radians(angelA))*b;
  float b02y = b01y -cos(radians(angelA))*b;

  float b03x = b02x -sin(radians(angelA+90))*b;
  float b03y = b02y -cos(radians(angelA+90))*b;

  beginShape();
  vertex(b01x, b01y);
  vertex(b02x, b02y); 
  vertex(b03x, b03y); 
  vertex(b04x, b04y); 

  endShape();


//-------------------------------- Square a

  float a = cos(radians(90-angelA))*300;

  float a01x = 550;
  float a01y = 420;
  float a04x = Cx;
  float a04y = Cy;
  
  float a02x = a01x +sin(radians(angelA+90))*a;
  float a02y = a01y +cos(radians(angelA+90))*a;

  float a03x = a02x -sin(radians(angelA))*a;
  float a03y = a02y -cos(radians(angelA))*a;

  beginShape();
  vertex(a01x, a01y);
  vertex(a02x, a02y); 
  vertex(a03x, a03y); 
  vertex(a04x, a04y); 
  endShape();

}







