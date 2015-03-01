
// Declare Variables

float migX = 250;
float migY = 250;

PFont f;

void setup(){
  
//Size, Smoothness, & Font
size(500,500);
smooth();
f = createFont("Arial",35,true);
}

void draw(){

//Background Color
background(255);

//Write "CLICK ME"
textFont(f,35);
fill(0);
text("CLICK ME",10,490);

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
fill(255);
ellipse(migX-30,migY-100,55,30); //Left Eye
ellipse(migX+30,migY-100,55,30); //Right Eye
fill(0);
ellipse(migX-20,migY-100,20,20); //Left Iris
ellipse(migX+20,migY-100,20,20); //Right Iris

//Mig's Mouth
  fill(0);
  line(migX-62.5,migY,migX+62.5,migY);

if(mousePressed){
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
  textFont(f,35);
  fill(0);
  text("DERP",205,50);
} else {
    fill(0);
    line(migX-62.5,migY,migX+62.5,migY);
}
}



