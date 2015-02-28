
void setup() {
size(400,400);
background(0);
rectMode(CENTER);
noStroke();
frameRate(2);
}

//custom function:

void heart(float x,float y,float z){
  fill(z,0,0);
  beginShape();
  vertex(x,y);
  vertex(x-24,y-24);
  vertex(x-24,y-39);
  vertex(x-17,y-46);
  vertex(x-7,y-46);
  vertex(x,y-39);
  vertex(x+7,y-46);
  vertex(x+17,y-46);
  vertex(x+24,y-39);
  vertex(x+24,y-24);
  endShape();
}

void draw() {
  for(int X=25;X<width;X+=50){
    for(int Y=50;Y<height+50;Y+=50)
  heart(X,Y,random(155,255));
}
}


