
void setup() {
  size(800,500);
  textSize(64);
  textAlign(CENTER);
  smooth();
}
 
void draw() {
  background(191,239,255);
   
  rectMode(CENTER);
  fill(65,105,225);
  noStroke();
  rect(400,400,width,height/2);
   
  fill(255,255,0);
  ellipse(100,50,50,50);
   
  fill(100,69,19);
  quad(50,200,250,300,500,300,700,200);
   
  fill(139,69,19);
  rect(500,180,20,40);
   
  fill(255,246,150);
  //noStroke();
  bezier(370,170,500,5,500,5,550,170);
   
  strokeWeight(9);
  stroke(0,0,0);
  line(370,170,550,170);
   
  line(300,220,300,280);
  fill(255,255,0);
  ellipse(350,250,60,60);
  line(400,220,400,280);
   
  fill(255,240,9);
  noStroke();
  triangle(500,5,450,180,600,200);
   
  text("SAILING ON!",350,380);
   
}
