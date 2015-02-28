
int sup;
int r;
 float eyeR;
 float eyeG;
 float eyeB;
 


void setup () {
size(400,400);
smooth();
 frameRate (30);
}

void draw(){
  background(200);
rectMode(CENTER);
point(50,50);
//line(150,300,100,200);
//head
fill(255);
rect(mouseX,mouseY, 60,125);
// mouth
fill(r,0,0);
rect(mouseX,mouseY+45,50,25);

//body
fill(255);
rect(mouseX, mouseY+90,40,50);

//feet
rect(mouseX+25,mouseY+145,40,25);
rect(mouseX-25,mouseY+145,40,25);
//eye
eyeR = random(255);
eyeG = random(255);
eyeB = random(255);
fill(eyeR,eyeG,eyeB);
//fill(255);
ellipse(mouseX-50,mouseY-110,60,60);
ellipse(mouseX+50,mouseY-110,60,60);
//pupil
fill(255,0,0);
ellipse(mouseX+50,mouseY-110,30,30);
ellipse(mouseX-50,mouseY-110,30,30);
mouseX = mouseX+1;
}

void mousePressed() {
  r= r+50;
}


