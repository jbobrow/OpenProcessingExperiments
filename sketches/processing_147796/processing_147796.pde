
float cx;
float cy;
PImage img;
//PImage ladyBug;
float randX;
float randY;
float r;
float g;
float b;
//food ellipse vaeiables
//food coordinates
int foodx;
int foody;
int bugSize = 20;
//state 
int state;

float speed = 3.0f; // move speed

float d;

void setup() {
  size(300, 300);
  cx = 100;
  cy=100;
  smooth();
  
  foodx=-100;
  foody=-100;


  img = loadImage("grasstexture.jpg");
  //ladyBug = loadImage("ladybug.png");
  state =1;
}

void draw() {
  
  frameRate(15);
  ellipseMode(CENTER );
 
   background(img);
    //image(ladyBug, cx, cy, 30,30);
  //randomizing movement
  randX = random(-2,2);
  randY = random(-2,2);
  
  cx = cx + randX;
  cy = cy + randY;
  
  noStroke();

 
  fill(r, g, b);
  ellipse(cx, cy, bugSize, bugSize);
  
//big ellipse runs away from mouse
 d = dist(mouseX, mouseY, cx, cy);
 
  if (state==1) {
    println("State is 1");
  runaway();
  screenBoundaries();
  }else{
    
      println("State is -1");
    foodFollow();
  }
   
 
    //food drop
    fill(255,51,153);
  stroke(255);
  ellipse(foodx, foody, 5,5);
   //when the big ellipse goes over the food
      if (dist(cx,cy,foodx,foody)<1) {
 //change the color of big ellipse
 r = random(0,256);
 g = random(0,256);
 b = random(0,256);
 //make bug get bigger
 bugSize = bugSize + 3;
 //make the food disappear
   foodx = -100;
  foody = -100; 
  //go back to running away from the mouse
  state = 1;
  }
   
  }



 
  
  
  void runaway(){
  //big ellipse runs away from mouse
  //if distance is less than 100
  if (d < 100) {
    //jump in here
    if (cx > mouseX) { 
      cx = cx +1;//move cx further away
    }
    if (cy > mouseY) {
      cy = cy + 1;
    }
    if (cy < mouseY) {
      cy = cy - 1;
    }
    if (cx < mouseX) {
      cx = cx - 1;
    }
}
}


void foodFollow() {
 
     if (cx > foodx) {
     cx = cx - 1;
     
  }
  if (cx < foodx) {
    cx = cx + 1;
  }
   if (cy > foody) {
     cy = cy - 1;
  }
  if (cy < foody) {
    cy = cy + 1;
  }



}


void mousePressed() {
  //drop food
   //food coordinates
    foodx = mouseX;
    foody = mouseY;
  
 

state = state * -1;
}



void screenBoundaries(){
     //screen constraints
    if ( cx <= 0) {
      cx = cx+5;
    }
    if (cx >= width) {
      cx = cx-5;
    }
    if ( cy <= 0) {
      cy = cy+5;
    }
    if (cy >= height) {
      cy = cy-5;
    }
} 


