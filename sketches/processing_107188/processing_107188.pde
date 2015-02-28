
void setup(){
  size(500,500);
   background(0);
}
  void draw(){
  rectMode(CORNER);
  
   

    fill (random(0,250),0,21,80);
    stroke(2);
    strokeWeight(1);
    ellipse(250,random(0,500),250,200);
    
  fill(250,random(0,255),0,180);
  stroke(0);
  strokeWeight(1);
  ellipse(125,random(0,500),150,100);
  fill(3,12,random(0,255),120);
  stroke(1);
  strokeWeight(1);
  ellipse(375,random(0,500),150,100);
  fill(123,4,147,100);
  stroke(0);
strokeWeight(0);
triangle(0,0,250,166.6,500,0);
fill(250,0,9,30);
stroke(0);
strokeWeight(0);
triangle(0,166,250,332,500,166);
fill(143,255,0,10);
stroke(0);
strokeWeight(0);
triangle(0,332,250,500,500,332);
}
