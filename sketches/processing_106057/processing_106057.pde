
import processing.opengl.*;
float a;  //declare variable

void setup(){
size(600,600,OPENGL); //open 3D Mode
smooth();
fill(0,0,255);
}

void draw(){
background(0,200,255);
lights();//open light
noStroke();
translate(250,0,0);//rotate the x, y, z radians
rotateY(a);//ratate as y coordinate
a+=0.05;//plus the radians of y

for(int i=0;i<250;i+=25){
translate(0,0,25);          //rotate as the z coordinate
for(int x= -250; x<250; x+=50){    // as X coordinate to move
for(int y= 0; y<500; y+=50){  // as X coordinate to move
ellipse(x,y,25,25);}
}
}
}
