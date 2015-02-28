
/*------------------------------------------------------------------
End assignment 1 by Lennard van den Berg
For the course Programming and physical computing

Example used:
http://processing.org/learning/topics/bouncybubbles.html
---------------------------------------------------------------------*/

int numBalls = 7;                      //Number of moving creatures
Ball[] balls = new Ball[numBalls];      //Initialize an arry of creatures
int windowwidth = 618;                 //Width of the window
int windowheight = 500;                 //Height of the window
int x2, y2;                             //Initialize the position for the prisoners in prison
int prisoners;                          //Variable for keeping track of the number of prisoners in prison at the moment
boolean newprison = true;               //Boolean to see if it is possible to have a new prisoner
boolean distanceprison;                 //Boolean to see if the creatures should bounce. It becomes true when the prison is full


/*---------------------------------------------------------------------------
 Void Setup()
 ----------------------------------------------------------------------------*/
void setup() 
{
  size(618, 500);      //Set the windowsize
  smooth();                             //Make everything look more smooth

    //Make all the creatures and give them all a random position
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width-150), random(height-150), 65, i, balls);
  }
}

/*---------------------------------------------------------------------------
 Void draw()
 ----------------------------------------------------------------------------*/
void draw() 
{
  background(225);                          //Set the background color and redraw it everytime at the beginning of void draw
  textSize(10);
  text("You can click on the prison",width-200,height-105);//Text above the prison
  
  for (int i = 0; i < numBalls; i++) {      //Update all the balls at the beginning of the loop
    balls[i].collide();                     //See if there is a collision
    balls[i].move();                        //Move the creature according
    balls[i].display();                     //Display the creature
    balls[i].prisonCollide();               //Check if creature bounces with the prison
  }
  //Draw all the prisoners in prison if needed
  if (prisoners>=1) {
    x2 = width-35;                           //The x2 position for prisoner 1
    y2 = height-35;                          //The y2 position for prisoner 1
    Prisoner();                              //Execute Prisoner to draw a prisoner at the given x2 and y2 position
  }
  if (prisoners>=2) {
    x2 = width-105;                          //The x2 position for prisoner 2
    y2 = height-35;                          //The y2 position for prisoner 2
    Prisoner();                              //Execute Prisoner to draw a prisoner at the given x2 and y2 position
  }
  if (prisoners>=3) {
    x2 = width-160;                          //The x2 position for prisoner 3
    y2 = height-35;                          //The y2 position for prisoner 3
    Prisoner();                              //Execute Prisoner to draw a prisoner at the given x2 and y2 position
  }
  if (prisoners>=4) {
    x2 = width-225;                          //The x2 position for prisoner 4
    y2 = height-35;                          //The y2 position for prisoner 4
    Prisoner();                              //Execute Prisoner to draw a prisoner at the given x2 and y2 position

    newprison=false;                         //With 4 prisoners the prison is full, so there can be no new prisoners
    distanceprison=true;                     //When true, the creatures start to bounce with the prison
  }
  
  //Draw the prison
  rectMode(CORNER);
  fill(0);                                      //Make the prison black
  noStroke();                                   //No outline with the prisonbars
  rect(width-265, height-10, 275, 10);          //Bottom bar
  rect(width-265, height-100, 275, 10);         //Top bar
  for (int i= width-265; i<width; i=i+30) {     //All the vertical bars in a for loop
    rect(i, height-100, 7, 100);
  }
 }


/*---------------------------------------------------------------------------
 Void mousePressed()
 ----------------------------------------------------------------------------*/
void mousePressed() {
  if (mouseX>width-275&&mouseY>height-250) {      //If the mouse is over the prison
    prisoners=0;                                  //Set to zero to tell that there are no prisoners in the prison
    newprison=true;
    distanceprison=false;                         //Stop the bounce of creatures with the prison
    for (int i = 0; i < numBalls; i++) {
      balls[i].mouse();                          // Execute mouse() to make the removed creatures come back
    }
  }
}

class Ball {
  float x, y;                            //The x and y position of the creature, gets it value random from the array in the setup
  float diameter;                        //The size of the creature, gets it value from the array in the setup
  float vx = random(-2, 2);              //Starting speed in x direction is randomly chosen
  float vy = random(-2, 2);              //Starting speed in y direction is randomly chosen
  boolean inPrison = false;              //The creature currently isn't in prison
  int id;
  Ball[] others;
  

  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
    
  } 

  void collide() {    //If there is a collision with two creatures they should bounce
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) {       //If the distance between the creatures is smaller than their diameter/2
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * 0.04;
        float ay = (targetY - others[i].y) * 0.04;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;      //Bounce in a new x direction
        others[i].vy += ay;      //Bounce in a new y direction
      }
    }
  }

  void mouse() {
    if (inPrison==true) {              //If mouse is pressed all the creatures who disappeared with appear again
      inPrison=false;                  //Say that they are no longer in prison
      x=random(width-300);             //Spawn them at a random x position
      y=random(height-300);            //Spawn them at a random y position
    }
  }

  void prisonCollide() {
    //If a creature bounces with the prison while there is still space, the creature gets transported to a place far away and the collision with the windows is disabled
    if (x>width-295&&y>height-135&&newprison==true&& inPrison==false) {  
      x=random(width*100, width*200);     //Transport the create to a place far away
      y=random(height*100, width*200);    //Transport the create to a place far away
      prisoners++;                        //The number of prisoners increases by one
      inPrison=true;                      //The creature is now in prison
    }
  }


  void move() {              
    if (x>width-295&&y>height-135&&distanceprison==true) {    //Bounce the creature back if the prison is full and the creature bounces with the prison
      vx=-vx;
      vy=-vy;
    }

    if (x>windowwidth-(0.5*diameter) && inPrison==false) {     //if the figure reaches the left wall or the right wall, it bounces
      x=windowwidth-(0.5*diameter); 
      vx=-vx;
    }
    if (x<diameter/2-vx) { 
      x=diameter/2-vx; 
      vx=-vx;
    }
    x=x+vx;                                                    //New x position is given old x + calculated vx


      if (y>windowheight-(0.5*diameter)&& inPrison==false) {     //if the figure reaches the top wall or the botton wall, it bounces
      y=windowheight-(0.5*diameter); 
      vy=-vy;
    }
    if (y<diameter/2-vy) {
      y=diameter/2-vy;  
      vy=-vy;
    }
    y=y+vy;                        //New y position is given old y + calculated vy
  }

  void display() {                 //Draw the creature
    fill(255, 204);
    stroke(0);
    fill(255, 150, 100);
    ellipseMode(CENTER);
    ellipse(x, y, 50, 50);         //Head
    fill(255);
    stroke(165, 114, 80);
    ellipse(x-10, y-8, 10, 10);    //Left eye 
    fill(0);
    ellipse(x-9, y-8, 1, 1);       //Left pupil 
    fill(255);
    ellipse(x+10, y-8, 10, 10);    //Right eye
    fill(0);
    ellipse(x+9, y-8, 1, 1);       //Right pupil

    //Hat
    noStroke();
    rectMode(CENTER);
    fill(0);
    rect(x, y-20, 40, 2);
    fill(255);
    rect(x, y-24, 40, 6);
    fill(0);
    rect(x, y-28, 40, 2);
    fill(255);
    rect(x, y-32, 40, 6);
    fill(0);
    rect(x, y-36, 40, 2);
    rect(x-20,y-29, 1, 17);
    rect(x+20,y-29, 1, 17);
    stroke(0);
    line(x-9,y-15, x-3,y-11);    //Eyebrow left
    line(x+9,y-15, x+3,y-11);    //Eyebrow right

    //Mouth
    rect(x, y+10, 10, 1);
  }
}

void Prisoner() {                              //Void prisoner is called to draw a prisoner in the prison. The x2 and y2 are given in the void loop
  stroke(0);
  fill(255, 150, 100);
  ellipseMode(CENTER);
  ellipse(x2, y2, 50, 50);         //Head
  fill(255);
  stroke(165, 114, 80);
  ellipse(x2-10, y2-8, 10, 10);    //Left eye 
  fill(0);
  ellipse(x2-9, y2-8, 1, 1);       //Left pupil 
  fill(255);
  ellipse(x2+10, y2-8, 10, 10);    //Right eye
  fill(0);
  ellipse(x2+9, y2-8, 1, 1);       //Right pupil

  //Hat
  noStroke();
  rectMode(CENTER);
  fill(0);
  rect(x2, y2-20, 40, 2);
  fill(255);
  rect(x2, y2-24, 40, 6);
  fill(0);
  rect(x2, y2-28, 40, 2);
  fill(255);
  rect(x2, y2-32, 40, 6);
  fill(0);
  rect(x2, y2-36, 40, 2);
  rect(x2-20,y2-29, 1, 17);
    rect(x2+20,y2-29, 1, 17);

  //Mouth
  rect(x2, y2+10, 10, 1);
}



