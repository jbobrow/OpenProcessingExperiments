
//Arthur Siebesian
//February 25, 2014
//HW 4

float r = 0;

void setup(){
size(400,400);
rectMode(CENTER);
frameRate(4);
}

void draw () {
fill(200,30);
translate (200,200);
fill(255);
rotate(r);
rect(0,0,100,100);
r=r+0.08;

rotate(0.05);
fill(255, 50);
rect(0, 0, width, height/3);
rotate(0.2);
fill(200, 50);
rect(0, 0, width, height/3);
rotate(0.4);
fill(150, 50);
rect(0, 0, width, height/3);
rotate(0.6);
// rotate(-­‐0.1);
fill(100, 50);
rect(0, 0, width, height/3);
fill(0, 10); //use opacity
rect(0, 0, width, height);
fill(255);
ellipse(random(width), random(height), 4, 4);
ellipse(0,0,50,50);
fill(255,0,0);
}

