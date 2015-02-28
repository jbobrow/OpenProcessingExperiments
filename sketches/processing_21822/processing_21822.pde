
void setup(){
//Set the size of the window
size(200,200);
smooth();
}

void draw(){
//Draw a white background
background(255);
//Set CENTER mode
ellipseMode(CENTER);
rectMode(CENTER);
//Draw Zoog's body
stroke(0);
fill(150);
rect(mouseX,mouseY,20,50);
//Draw Zoog's head
stroke(0);
fill(255);
ellipse(mouseX,mouseY-50,60,60);
//Draw Zoog's eyes
fill(0);
ellipse(mouseX-18,mouseY-50,16,32);
ellipse(mouseX+18,mouseY-50,16,32);
//Draw Zoog's legs
stroke(0);
line(mouseX-10,mouseY+25,pmouseX-10,pmouseY+40);
line(mouseX+10,mouseY+25,pmouseX+10,pmouseY+40);
}

