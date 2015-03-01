

int rightX;
int rightY;
int leftX;
int leftY;
void setup(){
  size(800,700);
  
}

void draw(){
  
  rightX=constrain(mouseX, 490, 530);
  rightY=constrain(mouseY, 315, 330);
  leftX=constrain(mouseX, 285, 325);
  leftY=constrain(mouseY,315,330);
//Background
background(255);

//Back hair part 2
fill(153,101,21);
stroke(255,140,0);
strokeWeight(5);
ellipse(580,250,100,100);
ellipse(230,250,100,100);

//Face arc
fill(255, 204, 153);
stroke(0, 0, 0);
strokeWeight(5);
arc(400, 350, 400, 400, -0.8, PI+QUARTER_PI, CHORD);

//Mouth
fill(255, 51, 51);
triangle(400, 450, 385, 480, 415, 480);

//Blush Left
noStroke();
fill(255, 102, 153);
ellipse(290, 390, 70, 30);

//Blush Right
ellipse(515, 390, 70, 30);

//Left Eye
fill(255);
stroke(0, 0, 0);
strokeWeight(5);
arc(305, 320, 90, 80, -0.8, PI+QUARTER_PI, CHORD);

//Right Eye
arc(510, 320, 90, 80, -0.8, PI+QUARTER_PI, CHORD);

//Left Pupil
fill(102, 153, 204);
stroke(22, 81, 183);
strokeWeight(9);
ellipse(leftX,leftY, 40, 40);

//Right Pupil

ellipse(rightX, rightY, 40, 40);


//Back Hair
fill(153,101,21);
stroke(255,140,0);
strokeWeight(5);
ellipse(250,180,100,100);
ellipse(300,160,120,120);
ellipse(370,140,160,160);
ellipse(430,140,150,150);
ellipse(500,150,125,125);
ellipse(550,185,110,110);

//Hair Pieces

/////////1
fill(212,175,55);
stroke(255,140,0);
strokeWeight(5);
triangle(400,300,370,250,440,160);
 
 /////////2
 
 fill(255,215,0);
 triangle(320,170,360,270,410,190);
 
 /////////3
 
 fill(218,165,32);
 triangle(340,270,340,130,270,200);
 
 /////////4
 
 triangle(420,180,450,260,500,190);

/////////5
fill(255,215,0);
triangle(540,160,480,200,560,250);

/////////6
triangle(280,210,240,150,240,270);

}

/* Some credit goes to Anthony for teaching me how to use 
constrain for the eyes! */


