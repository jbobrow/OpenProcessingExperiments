
//declare shapes as variables - to contain svg files
PShape landscape;
PShape ant;
PShape owl;
float owlFly = 215; //1st owl on top
float owlFly2 = 320; //2nd owl
float owlFly3 = 95; //3rd owl
float owlFall = 300;
float owlDropX = 480; //owl location of drop: x coordinate
float owlDropY = 240; //owl location of drop: y coordinate
float xpos = 600; //end of right screen
float x = 400;   // x location of square
float y = 320;     // y location of square
float speed = 0;   // speed of owl
float gravity = .05; // variable for gravity



//global variables for animation and interactivity
void setup() {
  size (600, 800);
  smooth();
  frameRate(10);
  background(0);
  
  
//initialize shape variable with loadShape function
  landscape = loadShape("landscape.svg");
  ant = loadShape("ant.svg");
  owl = loadShape("owl.svg");

}

  void draw() {
  background(0);
  float b = map(xpos, 600, 0, 255, 0);
  background(b);
  noStroke();
  


 //dim the scene and add twinking stars as the ant walks across the screen
  
  float m = map(xpos, 600, 0, 0, 255);
  fill(0, 0, 0, m);
 
  
  for (int i=0; i<100; i++) {
    fill(600, 800, 0, m-40);
    ellipse(random(width), random(200), 3.5, 3.5);
    ellipse(random(width), random(height), 3, 3);
  }
  
//bring in the static background
shape(landscape, -62, 20, 600, 800);


 //1st owl moving from knot to the right
 shape(owl, owlFly, 80, 140, 100);
  owlFly=owlFly+1.95;
  if (owlFly>600) {
   owlFly=215;
  }
 
 //2nd owl moving from knot to the left
 shape(owl, owlFly2, 180, 190, 130);
  owlFly2=owlFly2-1.61;
   if (owlFly2<0) {
    owlFly2=320;
   } 
 
//3rd owl moving to right

shape(owl, owlDropX, owlDropY, 220, 150);
  owlDropY = owlDropY + speed; // add speed to a location
 speed = speed + gravity; //add gravity to speed
   if (owlDropY > height) {
  
     // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).  
     // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
     speed = speed * -.095;
   }

  
//the window and doors will turn on and off by being mousepressed

  if (mousePressed == true) {
    fill(219,29,29);
    quad(240, 530, 255, 470, 275, 470, 290, 533);
  } else {
    fill(0);
  }
    
  if (mousePressed == true) {  
    fill(219,29,29);
    quad(310, 533, 325, 470, 345, 470, 360, 533);
    } else {
    fill(0);
  }
   
if (mousePressed == true) {  
    fill(219,29,29);
    quad(260, 550, 280, 678, 345, 678, 360, 550);
    } else {
    fill(0);
  }

if (mousePressed == true) {  
    stroke(0);
    line(315, 678, 305, 550);
    } else {
    fill(0);
  }


//ant will walk across the screen from right to left
shape(ant, xpos, 620, 255, 174);
  xpos=xpos-2;
  
//if ant leaves the screen, move it back to the right
  if (xpos<0) {
    xpos=620;
  }   

  
  }


