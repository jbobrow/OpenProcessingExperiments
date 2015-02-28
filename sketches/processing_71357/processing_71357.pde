
/* Assignment ##
 * Name: Suki Lopez
 * E-mail:  plopez@brymnawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    09/20/2012
 * This is a picture of outer space; it is the moon in the sky and some stars.*/
//Declaring variables.
float x;
float a;
float b;
float c;
void setup(){
  size(500,500);
  smooth();
  background(0);
  frameRate(10);
  
}

void draw() {
 //more variables declared.
  a = random(0,5);
  b = random(0,10);
  c = random(255);
  //If you press the mouse you get one big ellipse- the moon, and it changes colors everytime you press the mouse.
  if (mousePressed){
      noStroke();
      fill(random(255),random(255),random(255),random(255));
      ellipse(255,155,180,180);
  }
  //adds purple stars randomly thoughout the scene of uniform size- cosmic noise.
  for(int i = 0; i <1; i++){
    y = random(width);
    x = random(height);
    noStroke();
    fill(135,49,211,100);
    ellipse(x,y,5,5);
 }
 //adds more random stars to make it more interesting to look at. Does this when the mouse goes past the 400 point.
   if (mouseX>400){
     fill(random(255), random(255), random(255));
     ellipse(x,y,5,5);
    }
    
    
}
    

   
//the background changes when you press the key.
 void keyPressed(){
    background(19,0,201,255);
 }
