
boolean shot = false; // boolean for gun 

Enemy [] myEnemys = new Enemy[40]; // global  variable for enemy array

int enemySize = 25; // 25 pixels for enemy size as an interger type


int random (){
  return int (random(975)); // works as a barrier to so as the enemy squares dont spawn outside the window, random() is so for the xpos1 
}

int  [] xpos1 = {random(),random(),random(),random(),random()}; // random width position
int  [] ypos2 = {-10,-10,-10,-10,-10}; // starts above the window


float thingX;
float thingY; // variables for character
float thingX2;
float thingY2; // variables for character's head

int bulletX; 
int bulletY; // variables for gun, these are integers because of later equations

int  fire;  
int  fireX; // variables for shot from gun

float r= 5;
float g= 5;
float h= 2; // variables for colours of background

float a=80;
float b=80;
float c=80; // variables for colours of character

float d=20;
float e=20;
float f=80; // variables for colours of character's head 

void setup() {
  
  size(1000, 650); // size of window
  smooth(); // smooth edges
  
  for(int i = 0; i < myEnemys.length-39; i++ ){
   myEnemys[i] = new Enemy();                   // for loop equation for the speed of the enemy, is set in the last slot (-39) so the enemy moves at a reasonable speed
  } 
  
  thingX= width/2.09;
  thingY= height/1.2; // variables initailised for the first part of spaceship and start position

  thingX2= width/2.072;
  thingY2= height/1.193; // variables initialised for the second part of spaceship and start position

  bulletX= width/2-15;
  bulletY= height/2+207; // variables initialised for gun and start position



}

void draw() {
  

  background(r, g, h); // background colour is a shade of black
  
  for(int i = 0; i < myEnemys.length-39; i++ ){ // for loop with equation for speed of enemys 
    myEnemys[i].display();  // display calling method
  }
 
  fill(a, b, c);
  rect(thingX, thingY, 20, 20); // spaceship part 1 created and coloured

  fill(d, e, f);
  rect(thingX2, thingY2, 12, 12); // spaceship part 2 created and coloured

  fill(255);
  rect(bulletX, bulletY, 6, 20); // cannon for space ship created and coloured

if(shot)

{
  gun(bulletX);
  shot = false; // initialisation of bulletX with the gun section spaceship
}

  
    
}

class Enemy { // enemy class initialisation
   
   color c; // colour variable
  
  Enemy() {
    c = color(100,100,200); // enemy is blue
 
        
  }
  
void display() { // display calling method initialised

stroke(0); // black stroke
fill(c); // display blue colour
for (int i=0; i<5; i++) // for loop for how many enemys appear on the screen
{
  
rect(xpos1[i],ypos2[i]++,enemySize,enemySize); // setting up of the size of the enemy

}
}


}

void keyPressed() { // setting up the movement for the spaceship

  if (key == CODED) {
    if (keyCode == LEFT) 
      thingX = thingX - 3;
  }

  {
    if (key == CODED) {
      if (keyCode == RIGHT)
        thingX = thingX + 3; // bottom part of space ship can move left and right
    }
  }

  if (key == CODED) {
    if (keyCode == LEFT)
      thingX2 = thingX2 - 3;
  }

  if (key == CODED) {
    if (keyCode == RIGHT)
      thingX2 = thingX2 + 3; // middle part of space ship can move left and right
  }

  if (key == CODED) {
    if (keyCode == LEFT)
      bulletX = bulletX - 3;
  }

  if (key == CODED) {
    if (keyCode == RIGHT)
      bulletX = bulletX + 3; // cannon of the space ship can move left to right
  }
}

void mousePressed() {
  
  shot = true; // setting up for if the mouse is pressed and the equation is true the cannon will fire
}

void gun (int fireX) { // setting up the cannon shot and what happens if it hits, fireX works as an initialiser for the if shot equation up in void draw and is the integer name for the shot from the cannon
  
  boolean hit = false; // new boolean for if the shot hits the target
  
  for (int i=0; i<5; i++) // equation for the number of enemys on the screen at any given time
{
  if((fireX >= (xpos1[i] - enemySize/2)) && (fireX <= (xpos1[i] + enemySize/2))) { // equation for if the shot hits 
    hit = true;
    stroke(255); // white stroke so shot stands out 
    line(bulletX,520,bulletX,xpos1[i]); // line co ordinates
    rect(xpos1[i],ypos2[i],enemySize-25,enemySize-25); // the enemy's size is zero if the shot hits
    xpos1[i] = random(); 
    ypos2[i] = 0;  // resets the cycle for the enemy objects, and creates a new square
    
  }
  
}
}
