
/* @pjs font="Fruktur-Regular.otf"; */

int x = 0;
int x1 = 0;
int x2 = 0;
int x3 = 0;
PFont myFont;
PImage myImage;

void setup() {
  
  size(700,500);
  
  myFont =createFont ("Fruktur-Regular.otf", 170);
  textFont (myFont);
  textAlign(CENTER, CENTER);
  
  myImage=loadImage("mattkim.JPG");
  
}

void draw() {
  
  background(100);
  
  image(myImage, 0, 0, width, height);
  fill(255);
  text("In the daylight I don’t pick up my phone",x,10,width/2,x);
  fill(#1B9BE0);
  text("cause in the daylight anywhere feels like home",x, 150, width/2,100);
  x++;

  if (x>width) {
    x=0;
   
}
noStroke();
fill(#F299C2);
ellipse(5,x1,10,10);

ellipse(200,x3, 20, 20);


ellipse(250, x2, 10, 10);
ellipse(275, x1, 15, 15);

ellipse(415, x3, 15, 15);
ellipse(450, x1, 10, 10);


ellipse (530, x3, 20, 20);

ellipse(600, x1, 10, 10);

ellipse(650, x2, 20, 20);
ellipse(670, x3, 10, 10);

ellipse(700, x2, 20, 20);

noStroke();
fill(#F5A716);

ellipse(100, x2, 10, 10);
ellipse(570, x1, 15, 15);
ellipse(370, x1, 20, 20);


noStroke();
fill(#1B9BE0);
ellipse(415, x3, 15, 15);
ellipse(620, x3, 13, 13);
ellipse(480, x3, 20, 20);
ellipse(150, x3, 20, 20);


noStroke();
fill(#4DC966);
ellipse(200,x3, 20, 20);
ellipse(500, x2, 13, 13);
ellipse(50,x2,13,13);
ellipse(690, x1, 13, 13);
x1++;
if (x1> height){
  x1=0;
}
x2= x+1+1;
if (x2>height){
  x2=0;
}
x3 = x3+1+1+1;
if (x3>height){
  x3=0;
}
}



