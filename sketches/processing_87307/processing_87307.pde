
int s=150;
color[] palette = {#223333, #466A6A, #6AA1A1, #8FD9D9, #A8FFFF};
color c1=palette[int(random(5))];
color c2=palette[int(random(5))];
color c3=palette[int(random(5))];
float a=255;

void setup(){
size(800,300);
rectMode(CENTER);
frameRate(50);
}

void draw(){
background(255-a);
noStroke();
a=(mouseX/width)*255;
fill(c1,a);
rect(width*1/4,height/2,s,s);
fill(c2,a);
rect(width*2/4,height/2,s,s);
fill(c3,a);
rect(width*3/4,height/2,s,s);
}
