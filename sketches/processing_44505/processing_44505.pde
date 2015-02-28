
void setup(){
size(400,400);
background(0,150,0);
}

void draw(){
fill(0,150,0);
stroke(0,100,0);
line(100, 100, 300, 100);
arc(100,140,80,80,6*PI/7,TWO_PI-PI/2);
arc(300,140,80,80,TWO_PI-PI/2, TWO_PI+PI/6);
line(63, 155, 150, 300);
line(337, 155, 250, 300);
arc(200,300,100,50,0,PI);
noStroke();
stroke(0);
line(190,300,210,300);
fill(0);
stroke(255);
ellipse(150,170,40,100);
ellipse(250,170,40,100);
noFill();
noStroke();
fill(0);
ellipse(190,250,10,10);
ellipse(210,250,10,10);
noLoop();
}

