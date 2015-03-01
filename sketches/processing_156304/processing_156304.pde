
PImage photo;
int point;


void setup(){
size(620,800);
photo=loadImage("me.jpg");
background(255);
smooth();

}


void draw(){
int x=int(random(photo.width));
int y=int(random(photo.height));
int all=x+y*photo.width;
float time=millis()*0.5;

loadPixels();

float r=red(photo.pixels[all]);
float g=green(photo.pixels[all]);
float b=blue(photo.pixels[all]);


point=int(random(35,35));

noStroke();
fill(r,g,b,100);
ellipse(x,y,point,point);

}



