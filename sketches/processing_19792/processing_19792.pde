
/**Processing Sketch for Introduction to Programming for Creative Technology
*Made by Duuk Baten 2010
*Smileys bounce arround on gravity
*You can interact with the smileys by left or right mouse clicking
*Left mouse click will bring all smileys to the mouse Y position
*Right mouse click will bring all smileys to the mouse X position  */

//Variable declaration
PImage img;  //image of smiley
int numSmileys = 25;  //number of smileys
float spring = 0.06; //bouncyness
float gravity = 0.07;  //gravitational pull
float friction = -0.9; //friction
Smiley[] smileys = new Smiley[numSmileys];


void setup() 
{
  size(500, 500);
  noStroke();
  smooth();
  for (int i = 0; i < numSmileys; i++) { //smileys get 'made' with random coordinates and random size
    smileys[i] = new Smiley(random(width), random(height), random(20, 40), i, smileys);//choosing random location and restricted height for ball
  }

  img = loadImage("smiley.png"); //image gets loaded
}

void draw() 
{
  background(255,0,0);
  for (int i = 0; i < numSmileys; i++) {//draw a number of smileys
    smileys[i].collide();
    smileys[i].move();
    smileys[i].display();  
  }  
 
}

//bouncing ball class
class Smiley {
  float x, y;
  float diameter;
  float vx = 0; //x speed
  float vy = 0; //y speed
  int id; //identification code for ball
  Smiley[] others;
 
  Smiley(float xin, float yin, float din, int idin, Smiley[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  //Making it possible for the smileys to collide
  void collide() {
    for (int i = id + 1; i < numSmileys; i++) {//selecting which ball it is
      float dx = others[i].x - x; //x distance
      float dy = others[i].y - y; //y distance
      float distance = sqrt(dx*dx + dy*dy); //
      float minDist = others[i].diameter/2 + diameter/2; //minimal distance between two balls coordinates
      if (distance < minDist) { //if the distance is smaller as the minimal distance. The bounce sequence starts
        float angle = atan2(dy, dx); //determine collision angle
        float targetX = x + cos(angle) * minDist; //x position it should go to
        float targetY = y + sin(angle) * minDist; //y position it should go to
        float ax = (targetX - others[i].x) * spring; //direction of the ball with bounce accelaration
        float ay = (targetY - others[i].y) * spring; //direction of the ball with bounce accelaration
        
        //x and y accelaration of the balls
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  //making the smileys move and bounce against the walls
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) { //bounce against right wall
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) { //bounce against left wall
      x = diameter/2;
      vx *= friction; 
    }
    if (y + diameter/2 > height) { //bounce of the bottom 
      y = height - diameter/2;
      vy *= friction; //gravity*friction
    } 
    else if (y - diameter/2 < 0) {//bounce of the top
      y = diameter/2;
      vy *= friction; //gravity*friction
    }
    //Makes the smileys reposition if the mouse buttons are pressed
    if (mousePressed) {
      if (mouseButton == LEFT)     //Reset using Left mouse button
     {   
    y = mouseY;
    x = mouseX;
     }
    }

    if (mousePressed) {
      if (mouseButton == RIGHT)    //Reset using Right mouse button
     {   
    x = mouseX;
    y = mouseY;
     }
    }
  }
  
  //display the images
  void display() {
    
    image(img, x, y, diameter, diameter);
  }


}

