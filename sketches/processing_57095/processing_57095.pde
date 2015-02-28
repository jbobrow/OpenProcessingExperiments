
PImage space;

void setup() {
  size(1000,1000);
  smooth();
  strokeWeight(1);
  ellipseMode(CENTER);
  space = loadImage("space.jpg");
}

void draw() {
  image(space,0,0);
  //ORBIT
  fill(255,224,0);
  arc(mouseX,mouseY+70,80,80,0,PI);
  
  //TOP HEAD 
  fill(255,224,0);
  ellipse(mouseX,mouseY-160,40,40);
  
  //RIGHT EAR
  fill(255,224,0);
  ellipse(mouseX+40,mouseY-110,60,60);
  
  //LEFT EAR
  fill(255,224,0);
  ellipse(mouseX-40,mouseY-110,60,60);
  
  //BODY
  fill(205);
  ellipse(mouseX,mouseY,160,160);
  
  //HEAD
  ellipse(mouseX,mouseY-110,100,100);
  
  //TUMMY
  fill(205);
  stroke(255,224,0);
  strokeWeight(4);
  ellipse(mouseX,mouseY+12,120,120);
  fill(205);
  ellipse(mouseX,mouseY+3,90,90);
  //fill(255,224,0);
  ellipse(mouseX,mouseY,70,70);
  
  //ANNTENAE
  fill(255,224,0);
  stroke(0);
  strokeWeight(1);
  line(mouseX,mouseY-180,mouseX,mouseY-190);
  line(mouseX,mouseY-190,mouseX+10,mouseY-200);
  line(mouseX+10,mouseY-200,mouseX,mouseY-210);
  line(mouseX,mouseY-210,mouseX,mouseY-230);
  ellipse(mouseX,mouseY-230,15,15);
  
  //MOUTH
  line(mouseX-48,mouseY-100,mouseX-30,mouseY-100);
  line(mouseX-30,mouseY-100,mouseX-20,mouseY-90);
  line(mouseX-20,mouseY-90,mouseX-10,mouseY-100);
  line(mouseX-10,mouseY-100,mouseX+10,mouseY-100);
  line(mouseX+10,mouseY-100,mouseX+20,mouseY-110);
  line(mouseX+20,mouseY-110,mouseX+30,mouseY-100);
  line(mouseX+30,mouseY-100,mouseX+48,mouseY-100);
  
  if(mousePressed) {
   //EYE 
  fill(155,0,255);
  ellipse(mouseX-20,mouseY-130,20,20);
  fill(255);
  ellipse(mouseX-20,mouseY-130,10,10);
  fill(155,0,255);
  ellipse(mouseX+20,mouseY-130,30,30);
  fill(255);
  ellipse(mouseX+20,mouseY-130,20,20);
  
  }else{
  
  //EYE
  fill(255);
  ellipse(mouseX-20,mouseY-130,30,30);
  fill(155,0,255);
  ellipse(mouseX-20,mouseY-130,20,20);
  fill(255);
  ellipse(mouseX+20,mouseY-130,20,20);
  fill(155,0,255);
  ellipse(mouseX+20,mouseY-130,10,10);
}
}

