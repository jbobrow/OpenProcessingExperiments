
void setup(){
size(800,400);
background(69,199,185);
//1
fill(255,255,255,20);
noStroke();
ellipse(50,200,600,600);
//2
fill(255,255,255,20);
noStroke();
ellipse(200,400,600,600);
//3
fill(255,255,255,20);
noStroke();
ellipse(100,200,600,600);
//4
fill(255,255,255,20);
noStroke();
ellipse(400,400,600,600);
//5
fill(255,255,255,20);
noStroke();
ellipse(400,200,600,600);
//6
fill(255,255,255,20);
noStroke();
ellipse(800,400,600,600);
}

void draw(){
stroke(255,40);
line(mouseX,600,mouseX,200);
stroke(255,80);
line(600,mouseX,200,mouseX);
stroke(255,160);
line(mouseX,40,mouseX,100);
stroke(255);
line(40,mouseX,100,mouseX);
}
