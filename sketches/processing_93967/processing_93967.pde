
/*Michelle Li
 Calli Higgins
 CST 1101
 March 19, 2013
 Midterm Project*/

//LOADED IMAGE
PImage bunny;

int x=0;
int y=0;
int speed=4;
int spacing=100;
boolean click=false;

void setup() {
  size(1000, 700);
  bunny = loadImage("Bunny.png");
}

void draw() {
  background(0);

  //TIMER
  int s = second();
  //FOR LOOPS
  for (int timer=0; timer<=30; timer++) 
    //for (int timer=0;timer<=30;timer+=s)
  {
    println(s);
  }

  //ALL OF THE RABBITS
  bunny();
  bunny2();
  bunny3();
  bunny4();
  bunny5();
  bunny6();
  //morebunny();

  //IF.ELSE STATEMENTS
  if (x > width) {
    speed=speed*-1;
  }
  else if (x<0) {
    speed = speed*-1;
  }
  x = x + speed;

  if (y> height) {
    speed=speed*-1;
  }
  else if (y<0) {
    speed=speed*-1;
  }
  y=y+speed;
}

//FUNCTIONS

void bunny() {
  image(bunny, x, 100, 100, 100);
}
void bunny2() {
  image(bunny, 100, y, 100, 100);
}

void bunny3() {
  image(bunny, x+10, y+10, 100, 100);
}
void bunny4() {
  image(bunny, x-300, y-50, 100, 100);
}

void bunny5() {
  image(bunny, x*2, y*2, 100, 100);
}

void bunny6() {
  image(bunny, x*3, y, 100, 100);
}

//USER INTERFACE
void mouseClicked() {
  //if (mousePressed==true) {
  if (click=true) {
    tint(255, 0, 0);
    bunny();
  }
  else {
    tint(255);
  }
  if (click=true) {
    tint(0, 255, 0);
    bunny2();
  }
  else {
    tint(255);
  }

  if (click=true) {
    tint(0, 0, 255);
    bunny3();
  }
  else {
    tint(255);
  }
  if (click=true) {
    tint(255, 255, 0);
    bunny4();
  }
  else {
    tint(255);
  }
  if (click=true) {
    tint(0, 255, 255);
    bunny5();
  }
  else {
    tint(255);
  }
  if (click=true) {
    tint(255, 0, 255);
    bunny6();
  }
  else {
    tint(255);
  }
}
/*else {
 tint(255);
 bunny();
 }
 }*/

void keyPressed() {
  if (keyPressed==true) { //BOOLEAN
    tint(255);
  }
  else
  {
    tint(0);
  }
}


/*
//WHILE LOOP (DIDN'T WORK)
 void morebunny(){
 x=10;
 while (x<width){
 image(bunny,x,100,100,100);
 x=x+spacing;
 }
 }
 
 Bugs:
 Clicking one bunny ends up affecting them all instead of individually.
 In fact, clicking anywhere will cause all bunnies to change into the same color.
 Unable to make multiple rabbits move randomly through loops
 Timer is a lot more complicated that planned so game doesn't automatically stop
 after 10 seconds
 
 What I wanted to do:
 Rather than rounds, it's just a "Change the color of the rabbits in 10 seconds or less"*/


