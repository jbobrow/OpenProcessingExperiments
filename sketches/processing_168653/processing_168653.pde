
int ellipseX = 200;
int ellipseY = 200;
float horn = 0.0;
int radius = 200;

void setup(){
size(400,400);
frameRate(40);
}


void draw(){

background(30,5,201);

fill(255,255,0);

ellipse(ellipseX+radius*cos(horn),ellipseY+radius*sin(horn), 20, 20);

horn += 0.05;

}
