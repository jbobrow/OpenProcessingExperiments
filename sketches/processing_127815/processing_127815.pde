
void setup(){
  size(500,300);
  frameRate(24);
}
 
void draw(){
  
  background(0,0,0);
   textSize(48);
fill(0, mouseX, mouseY);
text("PRESS START", 150, 200);
  fill(255,mouseX,mouseY);
  beginShape();
  vertex(30, 30);
  vertex(30, 40);
  vertex(40, 40);
  vertex(40, 50);
  vertex(30, 50);
  vertex(30, 60);
  vertex(20, 60);
  vertex(20, 70);
  vertex(10, 70);
  vertex(10, 100);
  vertex(20, 100);
  vertex(20, 80);
  vertex(30, 80);
  vertex(30, 100);
  vertex(40, 100);
  vertex(40, 110);
  vertex(60,110);
  vertex(60,100);
  vertex(40,100);
  vertex(40,90);
  vertex(90,90);
  vertex(90,100);
  vertex(70,100);
  vertex(70,110);
  vertex(90,110);
  vertex(90,100);
  vertex(100,100);
  vertex(100,80);
  vertex(110,80);
  vertex(110,100);
  vertex(120,100);
  vertex(120,70);
  vertex(110,70);
  vertex(110,60);
  vertex(100,60);
  vertex(100,50);
  vertex(90,50);
  vertex(90,40);
  vertex(100,40);
  vertex(100,30);
  vertex(90,30);
  vertex(90,40);
  vertex(80,40);
  vertex(80,40);
  vertex(80,50);
  vertex(50,50);
  vertex(50,40);
  vertex(40,40);
  vertex(40,30);
  endShape(CLOSE);
  
  fill(0,0,0);
  rect(80,60,10,10);
  rect(40,60,10,10);
}



