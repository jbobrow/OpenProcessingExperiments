
void setup() {
  size(400,450);
  smooth();
}
 
void draw() {
  background(mouseY,10,mouseX);
  fill(62,28,2);
  stroke(0);
  strokeWeight(2);
 
  //head
  beginShape();
  vertex(100, 90);
  vertex(300, 90);
  vertex(350, 130);
  vertex(350, 350);
  vertex(300, 400);
  vertex(100, 400);
  vertex(50,350);
  vertex(50,130);
  endShape(CLOSE);
 
  //ear left
  triangle(50,30,50,130,100,90);
 
  //ear right
  triangle(350,30,350,130,300,90);
 
  //chin
  fill(203,118,6);
  rectMode(CENTER);
  rect(200,325, 90,150);
  fill(255);
 
  //white eye left
  beginShape();
  vertex(100,90);
  vertex(202,197);
  vertex(155,250);
  vertex(100,250);
  vertex(50,200);
  vertex(50,130);
  endShape(CLOSE);
 
  //white eye right
  fill(255);
  beginShape();
  vertex(245,250);
  vertex(295,250);
  vertex(350,205);
  vertex(350,130);
  vertex(300,90);
  vertex(199,197);
  endShape(CLOSE);
 
  //black pupil left
  smooth();
  fill(0);
  float mx = constrain(mouseX,85,135);
  float my = constrain(mouseY,160,220);
  ellipse(mx,my,40,40);
 
  //black pupil right
  fill(0);
  float nx = constrain(mouseX,265,315);
  float ny = constrain(mouseY,160,220);
  ellipse(nx,ny,40,40);
 
   //beak
  fill(255,196,0);
  strokeWeight(3);
  quad(155,250,200,295,245,250,200,195);
   
  if(mousePressed) {
    //left blink
    fill(0);
    stroke(255);
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

  }
}
