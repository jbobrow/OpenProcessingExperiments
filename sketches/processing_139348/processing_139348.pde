

void setup(){
size(800,600);
background(0);}

void draw(){
movingColor();
randomCube();
}
void mousePressed(){
  background(0);}
  
int q=0;
float a=0;float s=0;


void movingColor(){
q=abs(pmouseX-mouseX);
stroke(random(255),random(255),random(255),random(255));
strokeWeight(q);
line(mouseX,mouseY,pmouseX,pmouseY);
}

void randomCube(){
   stroke(random(255),random(255),random(255));
  fill(0,random(100));
  rect(random(width),random(height),30,30);
  a= random(width);
  s= random(height);}
  


