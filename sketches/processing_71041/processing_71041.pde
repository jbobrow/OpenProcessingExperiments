
//zhaochang He zhaochah@andrew.cmu.edu
//hw5 Bounce
//copyrights 


//variables
float x = 200;
float y = 200;
float a = 150;
float b = 150;
float c = 230;
float d = 230;
float m = 260;
float n = 260;
float e = 260;
float f = 260;
float speed = 1;
float speedAB=.5;
float speedCD=.7;
float speedMN = 1.4;
float speedEF = 2;

//setup
void setup(){
  size(600,400);
  smooth();
  noCursor();
}

void draw(){
  background(255);
  display();
  moveEllipse();
  shootline();
  cursorBall();

}
  
//display ellipses  
void display(){
 noStroke();
fill(mouseX, mouseY,random(50,150),80);
ellipse(x, y, 50,50);
fill(mouseY, mouseX,random(50,150),80);
ellipse(a, b, 30, 30);
fill(random(50,150),mouseX, mouseY,80);
ellipse(c,d, 40,40);
fill(random(50,150),mouseY, mouseX,80);
ellipse(m,n, 40,40);
fill(mouseY, random(100,150), mouseX,80);
ellipse(e,f, 60,60);
}


//let the ellipse follow mouse
void moveEllipse(){
if (mouseX < width/2 && mouseY < height/2) {
x -=speed;
y -=speed;
a -=speedAB;
b -=speedAB;
c -=speedCD;
d -=speedCD;
m -=speedMN;
n -=speedMN;
e -=speedEF;
f -=speedEF;
}else if (mouseX < width/2 && mouseY > height/2) {
x -=speed;
y +=speed;
a -=speedAB;
b +=speedAB;
c -=speedCD;
d +=speedCD;
m -=speedMN;
n +=speedMN;
e -=speedEF;
f +=speedEF;
}else if (mouseX > width/2 && mouseY < height/2) {
x +=speed;
y -=speed;
a +=speedAB;
b -=speedAB;
c +=speedCD;
d -=speedCD;
m +=speedMN;
n -=speedMN;
e +=speedEF;
f -=speedEF;
}else if (mouseX > width/2 && mouseY > height/2) {
x +=speed;
y +=speed;
a +=speedAB;
b +=speedAB;
c +=speedCD;
d +=speedCD;
m +=speedMN;
n +=speedMN;
e +=speedEF;
f +=speedEF;
}
}


//Shoot linef to link the mouse cursor and ellipses. From this line you can vividly see that
//you can use your mouse to drag the ellipse back 
void shootline(){
  strokeWeight(3);
  stroke(random(100,255), random(100, 255), random(100,255));
  line(x,y, mouseX, mouseY);
  line(a,b, mouseX, mouseY);
  line(c,d, mouseX, mouseY);
  line(m,n, mouseX, mouseY);
  line(e,f, mouseX, mouseY);
}

//replace the cursor with a ball
void cursorBall (){
  fill(random(100,255), mouseX, mouseY,80);
  
  ellipse(mouseX, mouseY, 30, 30);
}





