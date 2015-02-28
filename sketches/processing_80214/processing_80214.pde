
void setup(){
size(320,480);
frameRate(10);
background(255);
}



public void draw(){
float x = random(width);
float y = random(height);
int r = 50;

//noStroke();
fill(#e6b422);
ellipse(x,y,r,r);
}
