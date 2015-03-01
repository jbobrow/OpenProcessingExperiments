
//Monster Mig

// Declare Variables

float migX;
float migY;

float eyeR;
float eyeG;
float eyeB;

void setup(){
  
//Size, Position, & Smoothness
size(500,500);
migX = width/2;
migY = height+100;
smooth();
}

void draw(){

//Background Color
background(255);

//Modes
ellipseMode(CENTER);
rectMode(CENTER);

//Mig's Feet
fill(#607146);
ellipse(migX,migY+200,150,35);

//Mig's Legs
fill(#4D6681);
rect(migX,migY+150,100,100);

//Separation Line For Feet & Legs
line(migX,migY,migX,migY+215);

//Mig's Arms & Hands
fill(#607146);
rect(migX-90,migY+100,20,150); //Left Arm
rect(migX+90,migY+100,20,150); //Right Arm
ellipse(migX-90,migY+160,40,40); //Left Hand
ellipse(migX+90,migY+160,40,40); //Right Hand

//Mig's Body
fill(#607146);
ellipse(migX,migY,200,350);

//Mig's Eyes
eyeR = random(255);
eyeG = random(255);
eyeB = random(255);
fill(eyeR,eyeG,eyeB); //Randomize Eye Color

ellipse(migX-30,migY-100,55,30); //Left Eye
ellipse(migX+30,migY-100,55,30); //Right Eye
fill(0);
ellipse(migX-20,migY-100,20,20); //Left Iris
ellipse(migX+20,migY-100,20,20); //Right Iris

//Mig's Mouth
fill(0);
rect(migX,migY,125,100);
fill(255);
ellipse(migX-40,migY-40,15,15); //Top 1
ellipse(migX-20,migY-40,15,15); //Top 2
ellipse(migX,migY-40,15,15); //Top 3
ellipse(migX+20,migY-40,15,15); //Top 4
ellipse(migX+40,migY-40,15,15); //Top 5
ellipse(migX-40,migY+40,15,15); //Bottom 1
ellipse(migX-20,migY+40,15,15); //Bottom 2
ellipse(migX,migY+40,15,15); //Bottom 3
ellipse(migX+20,migY+40,15,15); //Bottom 4
ellipse(migX+40,migY+40,15,15); //Bottom 5
fill(255,0,0);
ellipse(migX,migY+10,50,25); //Tongue
line(migX,migY-10,migX,migY+10); //Tongue Line

//Mig Moves Up
migY = migY-1;
}

void mousePressed(){
  println("Derpa derpa derp.");
}



