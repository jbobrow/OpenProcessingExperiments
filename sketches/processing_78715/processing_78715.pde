
PImage laimagen;
int x=-400;
void setup(){
size(400,400);
laimagen=loadImage("http://4.bp.blogspot.com/-ufg0nZYhiQ8/Tq9zCXSlG1I/AAAAAAAAIBs/cMc4KkvOzFM/s1600/Mickey-Mouse.jpg");
frameRate(12);
}
void draw(){
background(255);
image(laimagen,x,0);
x=x+1;
}
