
float spaceX; //starting position of spaceship
float spaceY;//starting position of spaceship

float spaceXspeed = 2.8; //speed of spaceship
float spaceYspeed = 2.2;//speed of spaceship

int spaceXdirection = 1; //move left or right
int spaceYdirection = 1; //move down or up

boolean button = false; //button starts in off state
//button position
int x=570;
int y=10;
int d=100;
int h=90;

void setup() 
{
size(600,200); //window size
//starting position of spaceship
spaceX=width/2;
spaceY=height/2;
 smooth(); //smooth edges
}

void draw() 
{

  if (button) { //if button is on, do this:
background(0); //black background
noStroke(); //no stroke
fill(255); //white fill
ellipse(random(width), random(height), 10, 10); //random dots(stars)

fill(234,234,232); //moon
ellipse(x, y, d, h);
  } else { //if button is off, do this
    background (0,0,255); //blue background
  //}
fill(246,255,3); //yellow sun/button
ellipse(x, y, d, h);

if (keyPressed) { //when spacebar is pressed do this:
if (key == ' ') 
strokeWeight(random(3, 6)); //random strokeweight between 3 and 6
stroke(0,random(255),0); //random stroke clour
}
 }


rectMode(CENTER);

//update the position of spaceship
spaceX = spaceX + (spaceXspeed * spaceXdirection );
spaceY = spaceY + (spaceYspeed * spaceYdirection );

//test for when spaceship touches boundaries and when it does,
//change its direction by multiplying by -1
if (spaceX > width || spaceX < 0) {
  spaceXdirection *= -1;
}
if (spaceY > height || spaceY <0) {
  spaceYdirection *= -1;
}

//draw spaceship
fill(0,255,0); //green dome
arc(spaceX,spaceY, 100, 100, -PI, 0);

fill(200,0,100); //outer pink base
rect(spaceX,spaceY,210,40);

fill(0,0,250); //middle blue design
rect(spaceX,spaceY,180,30);

fill(250,0,170); //inner pink design
rect(spaceX,spaceY,160,20);


}
//when button is pressed toggle on/off state
void mousePressed() {
    if (dist(x, y, mouseX, mouseY) < d/2) {
      button = !button;
  }
}



