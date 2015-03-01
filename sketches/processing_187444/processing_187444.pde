
void setup(){
size (800,500);
frameRate(3);
//background(255);
rectMode(CENTER);
smooth();
noStroke();
}
void draw(){
background(255,35,155,55);
fill(255,5);
for (int i = 10; i < width; i = i+20){
for (int j= 10; j < height; j = j+20){
fill(0,0,random(0,255),180);
rect(i,j,random(20,25), random(20,25));
//fill(255);
//ellipse(i,j,random(3,15),random(3,15));
fill(0,random(0, 255),0,180);
ellipse(i,j,random(10,15),random(10,15));
}
}
}
