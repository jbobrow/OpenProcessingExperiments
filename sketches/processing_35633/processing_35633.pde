
void setup() {
  size(300,300);
  smooth();
  
}

void draw() {
  
  //Sky
  noStroke();
  colorMode(RGB,255);
  fill(50,mouseX,250);
  rect(0,0,width,250);
  
   //Goals
  stroke(155);
  strokeWeight(7);
  line(10,250,10,100);
  line(290,250,290,100);
  
  stroke(255);
  strokeWeight(3);
  line(13,height/2,13,90);
  line(287,height/2,287,90);
  
  stroke(250,10,2);
  line(15,140,50,140);
  line(285,140,250,140);
  strokeWeight(2);
  
  stroke(0,255);
  line(15,140,20,175);
  line(285,140,280,175);
  line(50,140,45,175);
  line(250,140,255,175);
  
  
  //Court Paint
  stroke(255,255,255);
  strokeWeight(5);
  line(0,250,width,250);
  
  //Court
  fill(0,250);
  noStroke();
  rect(0,250,width,50);
  
  //ball
  fill(250,150,mouseX);
  stroke(0,250);
  strokeWeight(1);
  ellipse(mouseX,mouseY,30,30); 
}

