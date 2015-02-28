
//Blue Robot Head
//DeVico 09-03-2009
void setup(){
size(400,400);
smooth();
background(200,70,100);
}
void draw(){
//head shadow
stroke(0,0,100);
fill(0,0,100);
rectMode(CENTER);
rect(200,200,300,250);
//head
stroke(0,0,200);
fill(0,0,200);
rectMode(CENTER);
rect(200,200,270,225);
//neck
stroke(0,0,100);
fill(0,0,100);
rectMode(CENTER);
rect(200,375,80,100);
//eyes
stroke(150,150,255);
fill(150,150,255);
ellipse(125,175,60,60);
stroke(150,150,255);
fill(150,150,255);
ellipse(275,175,60,60);
//retinas
stroke(20,20,25);
fill(0);
rectMode(CENTER);
rect(125,175,40,20);
stroke(20,20,25);
fill(mouseX,pmouseX,mouseY);
rectMode(CENTER);
rect(125,175,30,10);
stroke(20,20,25);
fill(0);
rectMode(CENTER);
rect(275,175,40,20);
stroke(20,20,25);
fill(mouseX,pmouseX,mouseY);
rectMode(CENTER);
rect(275,175,30,10);
//mouth
stroke(20,20,25);
fill(0);
rectMode(CENTER);
rect(200,275,120,40);
stroke(20,20,25);
fill(pmouseY,mouseX,mouseY);
rectMode(CENTER);
rect(200,275,100,10);
//antenna
stroke(0,0,100);
fill(0,0,100);
rect(200,60,10,40);
stroke(0,0,200);
fill(0,0,200);
ellipse(200,40,35,35);
}

