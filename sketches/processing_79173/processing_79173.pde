
int x = 0;
int speed = 1;

void setup() {
  size(200,200);
  smooth();
}

void draw() {
background(20,44,225);

x = x + speed;

if ((x > 100) || (x < -100)) {
  speed = speed * - 1;
}

ellipseMode(CENTER);
rectMode(CENTER);

//body
stroke(225,63,235);
fill(40,32,145); 
rect(x+100,100,40,100);

//head
fill(40,32,145);
rect(x+100,80,70,60);

//eyes
fill(255);
ellipse(x+81,70,16,32);
ellipse(x+119,70,16,32);
//mouth
fill(255);
rect(x+100,94,34,17);
rect(x+100,94,34,17);

//pupils
fill(0);
ellipse(x+81,70,5,12);
ellipse(x+119,70,5,12);

//arms
stroke(225,63,235);
fill(40,32,145);
rect(x+70,124,15,40);
rect(x+130,124,15,40);

//legs
stroke(225,63,235);
fill(40,32,145);
rect(x+88,162,13,20);
rect(x+112,162,13,20);
}

