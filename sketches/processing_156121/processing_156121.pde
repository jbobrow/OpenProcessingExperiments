
PImage photo;
int point;
float time;

void setup(){
size(400,600);
photo=loadImage("scen.jpg");
background(255);
smooth();
frameRate(4000);
}


void draw(){
int x=int(random(photo.width));
int y=int(random(photo.height));
int all=x+y*photo.width;
float time=millis()*0.01;

loadPixels();

float r=red(photo.pixels[all]);
float g=green(photo.pixels[all]);
float b=blue(photo.pixels[all]);


point=int(random(9,30));

noStroke();
fill(r,g,b,100);
ellipse(x,y,point,point);

}


