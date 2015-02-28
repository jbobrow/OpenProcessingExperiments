
// random spot 
float q = 0; // spot's x axis
float z = 0; // spot's y axis
int bspeed = 1;// spot's speed
int k = 0; // location randomizer



// background colour changer
float r3 = 0;
float g3 = 100;
float b3 = 155;
float a3 = 10;


// move car up the sketch window in drawCar() 
float drawCary;





// snake coordinates 
int x = 0;// snake x axis
int y = 100; // snake y axis


// coloured setting for gravity ball
float r; // red 
float g; // green
float b; // blue
float a; // transparent



// colour settings for shapes
float r2 = 0; // red 2
float g2 = 0; // green 2
float b2 = 0; // blue 2
float a2 = 0; // transparent 2






// draws rectangle top left of sketch window
int t = 10; // drawRect x axis
int u = 10; // drawRect y axis
int w = 60; // drawRect width
int h = 45; // drawRect height


// for gravityball
float gbs = 0; // gravity ball's starting point 
float gbp = 250; // gravity ball stays in centre
float gbspeed = 1; // gravity ball's speed 
float gravity = 0.1; // gravity ball's gravity 







void setup() {

  size(500, 500); // window size
  background(255); // background colour
  smooth(); // smooth
  
  drawCary = height; // to move the car the height of the sketch window by holding the mouse button   


}

void draw() {
  drawRect();
  drawsnake();
  drawSquare();
  shapecolourChanger();
  snakeOperator();
  drawCar();
  drawTriangle();
  backgroundColourChanger();
  redDot();
  spotmove();
  spotbounce();
  displayspot();
  gravityball();
}

void drawRect() { 
  noStroke(); // no outline top left object
  fill(255, g2, b2); // top left object's colour
  rect(t, u, w, h); // top left object's location and size 
} 



void drawSquare() {
  noStroke(); // no outline
  fill(r2, 255, b2); // fill colour
  rect(440, 25, 50, 50); // top right square location and size
}

void drawTriangle () {
  noStroke(); // no out line
  //strokeWeight(0);
  fill(r2,200,0,a2); // coulour 
  triangle(350, 420, 390, 420, 370, 300); // triangle location and size

}


void redDot() {
 // when the snake goes through the red dot from the right side the triangle appears
  noStroke(); // no outline 
  fill(255,0,0); // red fill
  ellipse(387,440,4,4); // dot's location and size

}


void drawCar() {


  strokeWeight(0); // black outline
  stroke(0); // black outline
  fill(255); // colour
 // rect(145, 160, 20, 30); // car body location and size 
  rect(145,drawCary,20,30); // car body location and size

  fill(0); // tire colour
   
  rect(142,drawCary+2,5,10); // top left wheel
  rect(142,drawCary+18,5,10); // bottom left wheel
  rect(163,drawCary+2,5,10); // top right wheel
  rect(163,drawCary+18,5,10); // bottom right wheel

 // rect(142,162,5,10); // top left wheel
 // rect(142,178,5,10); // bottom left wheel
 // rect(163,162,5,10); // top right wheel
 // rect(163,178,5,10); // bottom right wheel

if (mousePressed) {
 drawCary = drawCary - 1; // car speed moving the height of screen when mouse button held down

}

} 



void drawsnake() {
  stroke(255,0,0); // snake's colour
  strokeWeight(2); // snake's line thickness
  line(x, y, x, y); // snake's variable cooridnates 
}



void snakeOperator() {

  if (key == 'd') { // snake is operated to move right when 'd' is pressed

    x = x+1;

  }
  else if (key == 's') { // snake is operated to move down when 's' is pressed
    y = y+1;
 
  }

  else if (key == 'w') { // snake is operated to move up when 'w' is pressed
    y = y-1;

  }

  else if (key == 'a') { // snake is operated to move left when 'a' is pressed
    x = x-1;
  
  }

    x = constrain(x, 0, 500);
    y = constrain(y, 0, 500);
  
 
}

































void backgroundColourChanger() { 
 noStroke(); // no out line for background colour
 fill(r3,g3,b3,a3); // colour 
 //fill(0,100,155,10);  // blue background
 rect(0,0,500,500); // background size




/// Increase Colours
 if (key == 'r') { // red is increased when the 'r' key is pressed 
    r3 = r3 + 1;
  }


 if (key == 'g') { // green is increased when the 'g' key is pressed 
    g3 = g3 + 1;
  }

if (key == 'b') { // blue is increased when the 'b' key is pressed 
    b3 = b3 + 1;
  }

if (key == 'p') { // transparent is increased when the 'p' key is pressed 
    a3 = a3 + 1;
  }


//Decrease Colours
 if (key == 't') { // red is decreased when the 't' key is pressed 
    r3 = r3 - 1;
  }


 if (key == 'h') { // green is decreased when the 'h' key is pressed 
    g3 = g3 - 1;
  }

if (key == 'n') { // blue is decreased when the 'n' key is pressed 
    b3 = b3 - 1;
  }

if (key == 'o') { // transparent is decreased when the 'o' key is pressed 
    a3 = a3 - 1;
  }

}

// changes colour of shapes 
void shapecolourChanger() {
  if (y < u+h && x < t+w) { // if snake reaches this point colour changes on the rectangle
    g2 = g2 + 255;
  } 

  if (x > 440 && y < 70) { // if snake reaches this point colour changes in the square and rectangle 
    r2 = r2 + 10;
    g2 = g2 + 100;    
} 


if (x < 390 && y > 420) { // if snake reaches this point the triangle appears 
  a2 = a2 + 10;
}


}
 












// random coloured spot move
void spotmove() {
   z = z + random(-10,10); // y axis shaking space
  //float k = random(0,100);

  z = z + bspeed; // y axis speed 



q = q + random(-10,10); // x axis shaking space
  //float k = random(0,100);

  q = q + bspeed; // x axis speed


}

// random coloured spot bounce 
void spotbounce() {
   if ((z > height) || (z < 0)) {
    bspeed = bspeed * -1; // y axis bounce
  }


if ((q > width) || (q < 0)) {
    bspeed = bspeed * -1; // x axis bounce
  }


}



// random coloured spot display
void displayspot() {
  
  r = random(255); // random spot colour
  g = random(255); // random spot colour
  b = random(255); // random spot colour
  a = random(255); // random spot colour
 
 
 // Display circle at x location
  noStroke(); // no out line for spot 
 fill(r,g,b,a); // random spot colour 
  //stroke(0); // outline
  //fill(175); // grey
  ellipse(q, z, 7, 7); // spot location and size

q = constrain(q,0,500); // constrain spot to this space
z = constrain(z,0,500); // constrain spot to this space
}











// ball bounces up and down sketch window with a gravity setting 
void gravityball() {
  
gbs = gbs + gbspeed; // moves the ball

gbspeed = gbspeed + gravity; // adds the gravity

if ((gbs > width) || (gbs < 0)) {
  gbspeed = gbspeed * -1; // changes ball's moving position
}


 r = random(255); // random red
 g = random(255); // random green
 b = random(255); // random blue
 a = random(255); // random transparent




stroke(r,g,b,a); // random stroke colour
fill(r,g,b,a); // random fill colour
ellipse(gbp,gbs,32,32); // bouncing ball 

gbs = constrain(gbs,0,500); // constrain ball between these points
gbp = constrain(gbp,0,500); // constrain ball between these points
}
