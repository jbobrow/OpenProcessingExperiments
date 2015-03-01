
float circPosX;
void setup(){
size (600,100);
frameRate(10);
}
void draw(){
circPosX = random(-50,50)
background(0,255,0);
fill(255,0,0);
ellipse(width/2+circPosX,height/2,50,50);
}
