
void setup() {
size(200,200);
background(255);
smooth();
}

void draw() {

rectMode(CENTER);
ellipseMode(CENTER);

//legs
stroke(5,90,26);
strokeWeight(4);
line(90,140,80,160);
line(110,140,120,160);

//arms
stroke(5,90,26);
strokeWeight(3);
line(90,120,70,100);
line(110,120,130,100);


//body
strokeWeight(2);
stroke(5,90,26);
fill(15,240,68);
ellipse(mouseX,mouseY,30,100);

//head
strokeWeight(2);
stroke(5,90,26);
fill(15,240,68);
ellipse(mouseX,mouseY-30,60,60);

//eyes
strokeWeight(1);
fill(255);
ellipse(85,70,20,20);
ellipse(115,70,20,20);
fill(0);
ellipse(85,70,10,10);
ellipse(115,70,10,10);

//mouth
strokeWeight(2);
line(90,90,110,90);
}

//interaction
void mousePressed() {
  background(mouseX,mouseY,100,200);
}

