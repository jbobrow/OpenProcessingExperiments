
    void setup() {

size(200,200);
background(255,204,0);
rectMode(CENTER);
fill(165,52,62);
rect(100,100,20,100);
stroke(251,85,122);
noFill(165,52,62);
fill(162,62,185);
ellipse(100,70,60,60);
noFill(162,62,185);
fill(255);
ellipse(40,40,50,60);
line(58,58,80,80);
fill(1,0,0);
ellipse(81,70,16,32); 
ellipse(119,70,16,32); 
line(90,150,70,170);
line(110,150,130,170);
line(90,100,50,80);
line(110,100,150,80);
}

int value = random(250,255);
string hi = "HI DOOD :)";


void draw() {
  fill(value);
  text(hi,25,25,45,45);
  rect(100, 123, 20, 55);
  ellipse(81,70,16,32); 
ellipse(119,70,16,32);
  
}

void mousePressed() {
if (value == 255) {
value = 255,204,0;
}
  if (value == 250) {
    value = 0,255,204;
  } else {
    value = random(0,255);
  }
}
