
void setup(){
  size(512,512);
  background (0,0,0);
  frameRate(15);
  smooth();
}

void draw(){

int d= int(random(40, 120));
noStroke();
fill(255, 5);
ellipse(random(width), random(height), d,d);


if (mousePressed == true){ 
  if (mouseButton == LEFT )
  
  
fill(25,60,80,60);
noStroke();
ellipse(mouseX,mouseY,d,d);
  
  }
  
}


