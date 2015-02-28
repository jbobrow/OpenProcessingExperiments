
void setup() {
  size(340,480);
  smooth();
  strokeWeight(1);
  ellipseMode(CENTER);
}

void draw() {
  background(178,223,247);
  //ORBIT
  fill(255,224,0);
  arc(160,340,80,80,0,PI);
  
  //TOP HEAD 
  fill(255,224,0);
  ellipse(160,110,40,40);
  
  //RIGHT EAR
  fill(255,224,0);
  ellipse(200,160,60,60);
  
  //LEFT EAR
  fill(255,224,0);
  ellipse(120,160,60,60);
  
  //BODY
  fill(205);
  ellipse(160,270,160,160);
  
  //HEAD
  ellipse(160,160,100,100);
  
  //TUMMY
  fill(205);
  stroke(255,224,0);
  strokeWeight(4);
  ellipse(160,282,120,120);
  fill(205);
  ellipse(160,273,90,90);
  //fill(255,224,0);
  ellipse(160,270,70,70);
  
  //ANNTENAE
  fill(255,224,0);
  stroke(0);
  strokeWeight(1);
  line(160,90,160,80);
  line(160,80,170,70);
  line(170,70,160,60);
  line(160,60,160,40);
  ellipse(160,40,15,15);
  
  //MOUTH
  line(112,170,130,170);
  line(130,170,140,180);
  line(140,180,150,170);
  line(150,170,170,170);
  line(170,170,180,160);
  line(180,160,190,170);
  line(190,170,208,170);
  
  //EYE
  fill(255);
  ellipse(140,140,30,30);
  fill(155,0,255);
  ellipse(140,140,20,20);
  fill(255);
  ellipse(180,140,20,20);
  fill(155,0,255);
  ellipse(180,140,10,10);
}

