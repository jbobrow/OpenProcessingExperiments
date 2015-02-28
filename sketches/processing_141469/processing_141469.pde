
void setup(){
  size(512,512);
  background (0,0,0);
  frameRate(120);
  smooth();
}

void draw(){

//width, height  
filter(BLUR);

int d= int(random(40, 120));
noStroke();
fill(255, 10);
ellipse(random(width), random(width), d,d);

  
fill(25,60,80,100);
noStroke();
ellipse(mouseX,mouseY,d,d);
}
