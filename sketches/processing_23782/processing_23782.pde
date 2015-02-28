

int x =50;
int y =30;
int eyeSize =20;
// ellipse (x,y,w,h)
void setup (){
  //set the size of window 
  size(300,300);

}

void draw() {
// - left, +right
//set ellipses and rects to CENTRER mode
background (255);
ellipseMode(CENTER);
rectMode(CENTER);

//draw body
//stroke (0);
//fill(255,51,153);
//rect(mouseX, mouseY, 20,100);

//draw head
stroke (0);
fill (153,204,0);
rect (mouseX, mouseY, 60,60);

//draw hand
stroke(0);
fill (153,204,0);
ellipse(mouseX-40,mouseY-10,20,20);
ellipse(mouseX+40,mouseY-10,20,20);


//draw eye
fill(255);
ellipse(mouseX-19, mouseY-30, 16,23);
ellipse(mouseX+19,mouseY-30,16,32);
fill(0);
noStroke();
ellipse(mouseX-19, mouseY-30, 10,13);
ellipse(mouseX+19,mouseY-30,10,13);

//draw noes
stroke(0);
point(mouseX-10,mouseY-10);
point(mouseX+10,mouseY-10);

//draw snor
smooth();
strokeWeight(4);
stroke(51,153,255);
line(mouseX-10,mouseY-5,pmouseX-10,pmouseY+50); 
line(mouseX+10,mouseY-5,pmouseX+10,pmouseY+50);
}

