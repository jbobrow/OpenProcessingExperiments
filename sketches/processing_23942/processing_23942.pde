
int r;

int leftinner = 100;
int leftouter = 100;

int rightinner = 100;
int rightouter = 100;

int mouthY;

float centreX;
float centreY;

void setup(){
size(600,600);
frameRate(10);
smooth();



stroke(0);
strokeWeight(5);
}

void draw(){
  background(0);
fill(r,0,0);
r = int(random(0,255));

centreX = 300;
centreY = 300;

ellipse(mouseX-80,mouseY-85,100,100); //left ear
ellipse(mouseX+80,mouseY-85,100,100); //right ear

ellipse(mouseX-80,mouseY-85,60,60); //left inner ear
ellipse(mouseX+80,mouseY-85,60,60); //right inner ear

ellipse(mouseX,mouseY,200,200); //head

ellipse(mouseX-50,mouseY-10,100,leftouter); //left eye
ellipse(mouseX+50,mouseY-10,100,rightouter); //right eye

leftouter = leftouter - 70;
rightouter = rightouter +20;

if (leftouter<30)
leftouter = 100;

if (rightouter>120)
rightouter =100;

fill(0);

ellipse(mouseX-50,mouseY-10,20,leftinner); //left inner eye
ellipse(mouseX+50,mouseY-10,20,rightinner); //right inner eye
leftinner = leftinner-70;
rightinner = rightinner +20;


if (leftinner<30)
leftinner = 100;

if (rightinner>120)
rightinner = 100;


line(mouseX-90,mouseY+40,mouseX+90,mouseY+40); //upper lip
line(mouseX-25,mouseY+40,mouseX,mouseY+100); //toothline left of centre
line(mouseX+25,mouseY+40,mouseX,mouseY+100); //toothline right of centre
line(mouseX-50,mouseY+85,mouseX-25,mouseY+40); //toothline 2nd left of centre
line(mouseX+50,mouseY+85,mouseX+25,mouseY+40); //toothline 2nd right of centre
line(mouseX-75,mouseY+40,mouseX-50,mouseY+85); //toothline 3rd left of centre
line(mouseX+75,mouseY+40,mouseX+50,mouseY+85); //toothline 3rd right of centre
line(mouseX-75,mouseY+40,mouseX-80,mouseY+55); //toothline 4th left of centre
line(mouseX+75,mouseY+40,mouseX+80,mouseY+55); //toothline 4th right of centre

}







