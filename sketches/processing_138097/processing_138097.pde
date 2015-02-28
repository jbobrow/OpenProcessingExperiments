
void setup(){
  size(400,400);
  noStroke();
  background(0);
}

void draw(){
}

void mousePressed(){
float p=random(250);
float q=random(255);
float r=random(255);
float s=random(255);
fill(q,r,s);
ellipse(mouseX,mouseY,p,p);
}

void mouseReleased(){
float t=random(255);
float u=random(255);
float v=random(255);
float w=random(350);
fill(t,u,v,70);
ellipse(mouseX,mouseY,w,w);
}

void keyPressed(){
  background(0);
}
