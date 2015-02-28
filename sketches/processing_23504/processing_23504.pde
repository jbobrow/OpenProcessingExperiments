

//Footsteps//
//Sketch uses Functions, External Library(Image), iteration, mouse interaction//


PImage sand; // adds image file

float rdfp= 50; //rdfp= Rate of Dissappearing Foot Print (the smaller the number the longer it stays)
int r=130; // integer varible for red colour 
int g=92; //integer varible for green colour
int b=41; //integer varible for blue colour


void setup() {

  size(900,600); //size of sketch 
  sand = loadImage("beach-sand.jpg"); //loads beach-sand image
  smooth();//smoothes out drawing
 
}


void  draw() {

  image(sand,0,0,width,height); 
  //draw sand image which starts at 0,0 xy co-ord and is defined by width and height of sketch size
  tint(254,rdfp); //the image is continually reappearing, the tint allows the next appearance of the image to be 
  //at less opacity therefore leaving the trace of the footprint

}


void drawRightFoot(float xpos, float ypos) { //<-- Function to make Right foot
  //the foot
  noStroke(); //do not outline each ellipse

  fill(r,g,b); //colour of the foot controlled by r,g,b int varibles
  for(int i=0; i<1; i++) { //repeat foot drawing
    //the foot
    ellipse(mouseX+12,mouseY, 15,28);
    ellipse(mouseX+8,mouseY-4, 15,28);
    ellipse(mouseX+8,mouseY+10, 15,28);
    ellipse(mouseX+4,mouseY+18, 17,15);
    ellipse(mouseX+6,mouseY-13, 25,20);
    //its toes
    ellipse(mouseX-5,mouseY-28, 7,13); //big toe
    ellipse(mouseX+2,mouseY-28, 6,11); //toe 2
    ellipse(mouseX+8,mouseY-28, 4,10); //toe 3
    ellipse(mouseX+13,mouseY-25, 4,8); //toe 4
    ellipse(mouseX+17,mouseY-23, 3,8); // toe 5
  }
}


void drawLeftFoot(float xpos, float ypos) { // <<---- Function to make Left Foot
  noStroke(); //do not outline each ellipse
  fill(r,g,b); //colour of the foot controlled by r,g,b int varibles
  for( int i=0; i<1; i++) {//ellipse x, y, co-ord width height
    //the foot
    ellipse(mouseX-12,mouseY,15,28);
    ellipse(mouseX-8,mouseY-4, 15,28);
    ellipse(mouseX-8,mouseY+10, 15,28);
    ellipse(mouseX-4,mouseY+20,17,15); //top part
    ellipse(mouseX-6,mouseY-13, 25,20); //bottom part
    //the toes
    ellipse(mouseX+5,mouseY-28, 7,13); //big toe
    ellipse(mouseX-2,mouseY-28, 6,11); //toe 2
    ellipse(mouseX-8,mouseY-28, 4,10); //toe 3
    ellipse(mouseX-13,mouseY-25, 4,8); //toe 4
    ellipse(mouseX-17,mouseY-23, 3,8); // toe 5
  }
}


void mousePressed() {


  if (mouseButton ==RIGHT) { // if the right mouse button is pressed do this-->>
    drawRightFoot(mouseX,mouseY); // draw the right foot with its position at mouseX and mouseY

  }

  if(mouseButton==LEFT) { //if the left mouse button is pressed do this-->>
    drawLeftFoot(mouseX, mouseY); // draw the right foot with its position at mouseX and mouseY
  
  }
}


