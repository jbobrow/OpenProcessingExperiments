
int ellipseX = 100;
int ellipseY = 100;

float quadX = 40;
float quadY = 45;

int theta = 0;

void setup(){
size(450,450);
frameRate(3);
}


void draw(){

background(0);
fill(225);
quad(quadX,quadY,quadX + 100,quadY + 0,quadX + 100,quadY + 100,40,50);
quadX = cos(theta) * 25 + width/2;
quadY = sin(theta) * 100 + height/2;

theta++;

}


