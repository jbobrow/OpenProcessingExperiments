
int c = 0; // x location of square
int d = 0; // y location of square

int speed = 5; //speed of square

int state = 0; //this is what allows ellipse to follow edge of the screen             

float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  size(700,700);
  background(255);                     //background will be white so allow circles to leave a print
  
}
void draw() {
 
// display the cricle
 
  noStroke();
  fill(255,255,0);
  ellipse(c,d,110,110);
  
// expanding and reducing circle
  
  fill(frameCount/7); //changes from black to white and removes fill
  ellipse(c+200, d+60,c+10, d+10);
 
// instructions for yellow circle move around the screen

  if (state == 0) { //if the state is 0 move to the right
   c = c + speed;
   if (c > width-10) { //if, while the state is 0, it reaches the right side of the wndow, then change the state to 1
    c = width-10;       //keeps repeating for all states
    state = 1;
  }
  } else if (state ==1) {
    d = d + speed;
     if (d > height-10) { //if, while the state is 0, it reaches the right side of the wndow, then change the state to 1
    d = height-10;       //also repeats for all states
      state = 2;
    }
    } else if (state ==2) {
    c = c - speed;
    if (c <0) {
      c = 0;
      state = 3;
    }
  } else if (state == 3) {
    d = d - speed;
    if (d < 0) {
      d = 0;
      state = 0;
    }
  } 
  
// all variables with be set with random values  
  
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam =random(100);
  x = random(width);
  y = random(height);
  
  // this brings up the random ellipses on screen
  
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  
  // random moving ellsipse, followes mouse movement
  
  smooth();
  noStroke(); 
  fill(r,g,b,a);
  ellipse(mouseX,mouseY,100,100);
  
  //expanding rectangle
  
  stroke(255);
  fill(frameCount/2); //rectangle turns from black to white and removes fill
  rectMode(CENTER);
  rect(width/2,height/2,mouseX+100,mouseY+100); // expanding rectangle will stays in the middle
  
  
    
}


    







