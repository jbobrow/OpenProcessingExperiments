

void setup(){
size(400,400);
background(255);
noStroke();
smooth();
}

void draw(){
  float x=mouseX;
  float y=mouseY;
  float m=width-mouseX;
  float p=height-mouseY;
background(255);
fill(255,0,0,100);
  ellipse(m-20,height/1.5,y,y);
  fill(0,255,0,100);
  ellipse(p+40,height/1.5,y,y);
  fill(0,0,255,100);
  ellipse(x,height/3.5,y,y);
}



