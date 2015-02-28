
void setup(){
  size(400, 320);
  smooth();
}
void draw() {
  fill(97,12,129);
  beginShape();
  vertex(120,100);
  vertex(70,20);
  vertex(70,170);
  vertex(200,300);
  vertex(300,170);
  vertex(300,20);
  vertex(250,100);
  vertex(200,130);
  endShape(CLOSE);
  
  line(200,140,270,100);
  line(200,160,270,120);
  
  line(170,130,100,100);
  line(170,150,100,120);
  
  beginShape();
  vertex(150,50);
  vertex(160,150);
  vertex(190,180);
  vertex(220,150);
  vertex(230,50);
  vertex(200,100);
  vertex(180,100);
  endShape(CLOSE);
  
  triangle(70,180,190,308,100,280);
  triangle(210,308,300,180,280,280);
  
  fill(0);
  
  triangle(175,120,205,120,190,170);
  
  triangle(100,150,130,210,180,200);
  triangle(270,150,250,210,210,200);
}
