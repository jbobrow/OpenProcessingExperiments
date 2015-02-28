
int headX;
int headY;
int eye=10;
float r = 0;
float g = 0;
float b = 0;
float a = 0;

float diam = 250;
float x = 100;
float y = 100;


//START AS CODE BLOCKS
void setup() {
size(500,500);
frameRate(30);
smooth();

};

//keep this outside of void setup, although not necessary

void draw () {
  

  background(200);
  
rectMode(CENTER);

//float a = random(100,255);
//float diam = random (350, 400);
fill(r,g,b,a);
ellipse(headX,headY,diam,diam);


noStroke();
fill(255);
ellipse(headX,headY,150,100); /*head*/

ellipse(headX,headY+150,250,200); /*body*/


stroke(0);
fill(0);
strokeWeight(4);
line(headX+120,headY+100,pmouseX+200,pmouseY+100); /*R_arm*/
line(headX-120,headY+100,pmouseX-200,pmouseY+100); /*L_arm*/

fill(r,0,0,mouseX);
strokeWeight(1);
ellipse(headX+30,headY+5,eye,eye); /*R_eye*/
ellipse(headX-30,headY+5,eye,eye); /*L_eye*/

fill(250,140,5);
ellipse(headX,headY+20,50,20); /*nose*/

headX = mouseX;
headY = mouseY;

}


 
void mousePressed(){
  r=r+50;
  g= random(255);
  b=random(255);
  a=random(255);
  diam=random(200,500);

println("Take me to your leader!");

}




