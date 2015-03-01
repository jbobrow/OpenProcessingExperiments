
void setup(){
size (800,500);
frameRate(3);
//background(255);
rectMode(CENTER);
smooth();
}
void draw(){
background(255);
fill(255,5);
for (int i = 10; i < width; i = i+20){
for (int j= 10; j < height; j = j+20){
fill(0,0,random(0,255),180);
rect(i,j,20,20);
fill(255);
ellipse(i,j,18,18);
fill(0,random(0, 255),0,100);
ellipse(i,j,18,18);
}
}
}

