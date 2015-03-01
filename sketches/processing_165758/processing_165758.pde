
int ellipseX = 100;
int ellipseY = 100;

float quadX = 40;
float quadY = 45;

int theta = 0;

void setup(){
size(450,450);
}


void draw(){
if (mouseX < width/2) {
background(0);
fill(225);
quad(quadX,quadY,quadX + 100,quadY + 0,quadX + 100,quadY + 100,40,50);
quadX = cos(radians(theta)) * 25 + width/2;
quadY = sin(radians(theta)) * 100 + height/2;
}
else {
  background(255);
fill(0);
quad(quadX,quadY,quadX + 100,quadY + 0,quadX + 100,quadY + 100,40,50);
quadX = cos(radians(theta)) * 25 + width/2;
quadY = sin(radians(theta)) * 100 + height/2;
}
theta++;

}


