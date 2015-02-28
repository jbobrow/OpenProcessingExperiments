
float x = 100; 
float y = 100; 
float w = 60; 
float h = 60; 
float eyeSize = 16; 
void setup() {
  size(200,200); 
  smooth();
}

void draw() {
  background(255);


jiggleZoog(constrain(mouseX/10,0,5));


float d = dist(x,y,mouseX,mouseY); 
color c = color(d);
drawZoog(c);
}

void jiggleZoog(float speed) { 
x = x + random(-1,1)*speed; 
y = y + random(-1,1)*speed;

x = constrain(x,0,width); 
y = constrain(y,0,height);
}

void drawZoog(color eyeColor) { 
ellipseMode(CENTER); 
rectMode(CENTER);

for (float i = y-h/3; i < y + h/2; i += 10) {
  stroke(0); 
  line(x-w/4,i,x+w/4,i);
}

  stroke(0); 
  fill(175); 
  rect(x,y,w/6,h);
  
ellipseMode(CENTER);
  rectMode(CENTER);
   
  stroke(0);
  fill(175);
  rect(mouseX,mouseY,20,100);
   
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
   
  fill(mouseX,0,mouseY);
  ellipse(mouseX-19,mouseY-30,16,32);
  ellipse(mouseX+19,mouseY-30,16,32);
   
  stroke(0);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);

  
  stroke(0); 
  line(x-w/12,y+h/2,x-w/4,y+h/2+10); 
  line(x+w/12,y+h/2,x+w/4,y+h/2+10);
}
