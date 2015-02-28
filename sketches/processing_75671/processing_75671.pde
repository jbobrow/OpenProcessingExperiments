
//Madhura V Kharche
//Introduction to Digital Media Fall 2012
//Section B
//09/13/2012
 
float randomRadius = 5; //global variable - float -
int growingRadius = 25; //global variable int
 
float randomDiameter = 3; //global variable - float -
int growingDiameter = 25; //global variable int
int randomGreen = 0; //Global variable - colour-
int randomBlue = 0; //Global variable - colour-
boolean boolGrowing = false; //
//int randomLength = 20;
int growingLength = 1200;
 
//int randomDivision = 500;
//int growingDivision = 900;
float randomInt = 0.1;
float randomGrey = 0;
int randomRed = 0;
//int randomPoint = 750;
 
void setup ()
{
  size (1200, 600); //screen size
  background (165); //white background
}
 
void draw()
{
  fill(255,255);
  rect (100, 50, 50, 50);
   
   
  fill(255,200);
  rect (100, 500,50,50);
   
  fill(255,150);
  rect (1100, 50, 50, 50);
   
  fill(255,100);
  rect (1100, 500, 50, 50);
    
  fill(255,200);
  rect (800, 200, 200, 200);
   
  fill(255,50);
  ellipse (mouseX+20, mouseY+20, 30, 30);
   
 fill(255,19);
  ellipse (mouseX+100, mouseY+120, 75, 75);
   
   
 stroke (randomRed, randomGreen, randomBlue); //make a random green colour
  randomGreen = int(random(25)); //convert a random float to an int
  randomBlue = int(random(125)); //convert a random float to an int
  randomRed = int(random(155));
   
  strokeWeight (randomInt);
  randomInt = int(random(5));
 
 for (int i = 600; i < 1200; i = i + 225) {
    //randomPoint = int(random(1200));
    line(i, 300, mouseX, mouseY);
    //strokeWeight (1);
    // for (int i = 300; i < 1100; i = i+7) {
    //stroke (175, 0, 20);
    //  line(i, 775, 0, 0);
 
  
    if (boolGrowing == true) {
      if (growingLength < 1200) {
        growingLength++;
      }
      else {
        growingLength = 600;
      }
    }
 
 
 
    //randomLength = int (random (20)); //random number generator
    //for (int i = 150; i < 1200; i = i+ randomDivision) {
    //    stroke (150, 0, 20);
    //  line(i, randomLength, mouseX, mouseY);
 
 
 
    //randomLength = random (600); //random number geenrator
    //for (int i = randomLength; i < 1200; i = i + randomDivision) {
    //  stroke (150, 0, 20);
    //line(i, randomLength, mouseX, mouseY);
  }
 
  
 
  if (boolGrowing == false) {
    if (boolGrowing = true) {
    }
    else {
      boolGrowing = false;
    }
  }
   
  stroke (randomGrey);
  randomGrey = int(random(255));
  strokeWeight (int(random(2.5)));
   
if (boolGrowing ==true) { //is boolGrowing equal to TRUE? ; if not, ignore...
if (growingDiameter < 30) {
growingDiameter++;
}
else {
growingDiameter = 0;
}
}
  smooth (); //anti-aliasing
  fill (randomRed, 0 , 50);
  randomRed = int(random(255));
  ellipse (mouseX, mouseY, randomRadius, randomRadius); //ellipse drawn under our mouse
  
  fill (0, randomGreen, 0);
  randomGreen = int(random(255));
  ellipse (mouseX, mouseY, growingDiameter, growingDiameter);
 
}
 
 
 
void mouseClicked()
{
if (boolGrowing == false) {
 boolGrowing = true;
}
else {
 boolGrowing = false;
}
}
 
 
 
 
//void mouseClicked()
//{
//if (boolGrowing == false) {
// boolGrowing = true;
//}
//else {
//  boolGrowing = false;
//}
//}
 
 
 
 
//fill(255,25);
//rect (0,0,width,height);
 
// if (x < 100) {
//   x++; // x = x + 1
// }
// else {
//  x = 0;
// }
 
 
//smooth (); //anti-aliasing
//fill (randomRed, 0, 0); //make a random red colour
// randomRed = int(random(255)); //convert a random float to an int
 
//if (boolGrowing ==true) { //is boolGrowing equal to TRUE? ; if not, ignore...
//if (growingDiameter < 100) {
//growingDiameter++;
//}
//else {
//growingDiameter = 0;
//}
//}
// randomDiameter = random (50); //random number geenrator
// ellipse (mouseX, mouseY, randomDiameter, randomDiameter); //ellipse drawn under our mouse
//ellipse (mouseX, mouseY, growingDiameter, growingDiameter);
//}
 
//void mouseClicked()
//{
//if (boolGrowing == false) {
// boolGrowing = true;
//}
//else {
//  boolGrowing = false;
//}
//}
 
 
void keyPressed () {
if (key == 's') {
save ("MadhuraKharche.pde");
}
}
