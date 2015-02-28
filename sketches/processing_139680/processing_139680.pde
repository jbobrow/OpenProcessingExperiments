
//amanda strauss
//squidward sketch
//declare global veriables
boolean clicked= false;
int eyeSize;
int widthOne;
int lengthOne;
int widthTwo;
int lengthTwo;
int widthThree;
int lengthThree;
int widthFour;
int lengthFour;
float brows;

//runs once
void setup(){
  size(300,300);
  background(255,255,255);}

void keyPressed(){
  clicked =! clicked;
  brows = random(-125,-85);
}  

//runs forever
void draw(){
  if(clicked==false){
    eyeSize=0;
    widthOne=30;
    lengthOne=40;
    widthTwo=30;
    lengthTwo=40;
    widthThree=15;
    lengthThree=20;
    widthFour=15;
    lengthFour=20;
  }
  if(clicked==true){
    eyeSize=-20; 
    widthOne=40;
    lengthOne=50;
    widthTwo=40;
    lengthTwo=50; 
    widthThree=20;
    lengthThree=25;
    widthFour=20;
    lengthFour=25;
  } 
  
//Head
translate(150,100);
noStroke();
fill(144,210,185);
ellipse(0,0,130,110);

//Chin
fill(144,210,185);
rect(-35,30,70,55);

//Right Eye
fill(248,245,198);
ellipse(18,30,widthOne,lengthOne);

//Right Pupil
fill(80,47,25);
ellipse(18,30,widthThree,lengthThree);

//Left Eye
fill(248,245,198);
ellipse(-18,30,widthTwo,lengthTwo);

//Left Pupil
fill(80,47,25);
ellipse(-18,30,widthFour,lengthFour);

//Eyelids
fill(144,210,185);
rect(-35,eyeSize,70,25);

translate(0,40);

//Neck
fill(144,210,185);
rect(-15,30,30,70);

//Mouth
fill(144,210,185);
ellipse(0,50,110,30);

translate(-46,50);
pushMatrix();
stroke(0,0,0);
line(0,0,90,0);
popMatrix();

//Nose
noStroke();
pushMatrix();
translate(44,-50);
fill(124,190,165);
triangle(2,-5,-15,50,30,50); 
popMatrix();
ellipse(51,5,44,44);

//Brows
fill(0,0,0);
rect(10,brows,35,5);
rect(47,brows,35,5);

//Spots
fill(124,190,165);
ellipse(0,-120,3,3);
ellipse(15,-135,3,3);
ellipse(25,-123,3,3);
ellipse(45,-117,3,3);
ellipse(70,-125,3,3);
ellipse(40,-137,3,3);
ellipse(95,-117,3,3);}


