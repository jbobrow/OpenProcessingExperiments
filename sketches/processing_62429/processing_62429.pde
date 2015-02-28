
int wide=50;

void setup(){
  size(400,400);
  background(0);
  smooth();
  noStroke();
   noCursor();
}

void draw(){
UFO();
stars();
  if(mousePressed==true){
 beam();
  }
}

void stars(){
  frameRate(20);
  float w=random(255);
  float s=random(7);
  float x=random(width);
  float y=random(height);
  fill(255,255,255,w);
  ellipse(x,y,s,s);
}


void umbrella(){
  background(#a4a4a4);
  fill(0);
  ellipse(mouseX,mouseY,wide,20);
  quad(mouseX+25,mouseY,mouseX+15,mouseY+15,mouseX,mouseY,mouseX+10,mouseY);
  quad(mouseX+10,mouseY,mouseX+5,mouseY+15,mouseX,mouseY,mouseX,mouseY);
  quad(mouseX-10,mouseY,mouseX-5,mouseY+15,mouseX,mouseY,mouseX,mouseY);
  quad(mouseX-25,mouseY,mouseX-15,mouseY+15,mouseX,mouseY,mouseX-10,mouseY);
}

void beam(){
   fill(#F3F781);
  quad(mouseX-20,mouseY+10,mouseX-70,height,mouseX+70,height,mouseX+20,mouseY+10);
}

void UFO(){
  background(0);
  fill(#a4a4a4);
  ellipse(mouseX,mouseY,100,40);
  quad(mouseX-25,mouseY,mouseX-15,mouseY-30,mouseX+15,mouseY-30,mouseX+25,mouseY);
  fill(255);
  rect(mouseX-10,mouseY-25,20,7);
}


    

