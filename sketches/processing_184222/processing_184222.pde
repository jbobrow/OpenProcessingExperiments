



float satanas;
float jesus;
void setup(){
  size(600,600);
  stroke(0,150,200);
  background(255,255,255);
  // line(width,height,0,0);
  satanas = width;
  jesus = width;
  noFill();
}
void draw(){
  satanas = satanas / 1.001;
  ellipse(satanas, 100, 10, 10);
  println(satanas);
  
 // ellipse(satanas*0.2, 200, 10, 0);
 // println(satanas);
  
  jesus = jesus * 1.001;
  ellipse(mouseX, mouseY/2, jesus, 10);
  println(jesus);
  
  }
  
 
