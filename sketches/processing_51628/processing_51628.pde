
//HW5
//COPYRIGHT 2012

float x,y,w,h;

void setup(){
  size(400,400);
  smooth();
  noStroke();
  
  x=200;
  y=200;
  w=200;
  h=200;
}

void draw(){
  background(255);
  Initials(mouseX,mouseY);
}

void Initials (float x, float y){
  stroke(255, 0, 0);
strokeWeight(w/3.5);
fill(216, 126, 35);
ellipse(x,y,w*1.4,h*1.4);


//strokeWeight(5);
//beginShape(POINTS);
//vertex(x-100, y-27);
//vertex(x-80, y-27);
//vertex(x-15, y);
//vertex(x-90, y+37);
//vertex(x-110, y+37);
//endShape();

fill(15, 15, 15);
stroke(255, 255, 255);
strokeWeight(15);
beginShape();
curveVertex(x-160, y-57);
curveVertex(x-100, y-57);
curveVertex(x-20, y-45);
curveVertex(x-15, y);
curveVertex(x-140, y+77);
curveVertex(x-170, y+77);
endShape(CLOSE);

stroke(255, 255, 255);
beginShape();
vertex(x, y-67);
vertex(x+25, y-72);
vertex(x+20, y+34);
vertex(x+120, y+6);
vertex(x+105, y+80);
vertex(x-8, y+60);
endShape(CLOSE);
}
  

