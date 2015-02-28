
/* SnowMan version 5- variables and conditionals
 Button activates snowflakes, function for drawing snowman
 
 */

boolean buttonWhite=false;
boolean buttonColor=false;


float r;
float g;
float b;
float a;

float diam;
float x;
float y;

int buttonX= 20;
int buttonY= 350;
int buttonW= 50;
int buttonH= 35;


void setup () {
  size(420, 400);
  background(209, 42, 48);
  smooth();
  frameRate(60);
}

void draw() {
  // Each time new random numbers are creating the snowflakes
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);

  // these random values are creating the colour and size of snowflakes
  if (buttonColor) {
    stroke(0);
    fill(r, g, b, a);
    ellipse(x, y, diam, diam); 
    
  } 
  else {
    background(209, 42, 48);
   
  }
  /*if(buttonColor) {
   stroke(0);
   fill(r, g, b, a);
   ellipse(x, y, diam+10, diam+10);
   } else {
   background(209, 42, 48);
   }
   */

  //ground
  stroke( 0);
  fill(118, 6, 10);
  rect(0, 330, 420, 80);
  fill(255);
  text("click on the button to make snowflakes appear", 100, 370);
  //ground
  line(0, 330, 161, 330);

  //draw snowman- function detailed below

drawSnowMan();

//drawHandsDown();

  //button that activates the color snowflakes
  fill (255);
  rect (buttonX, buttonY, buttonW+15, buttonH);
  fill (0);
  text("Snowing!", 25, 370);
  //button that activates the white snowflakes
  // fill (255);
  // rect (buttonX, buttonY, buttonW, buttonH);
}

// function for drawing snowman HANDS DOWN
void drawSnowMan() {

  //lower belly
  stroke(0);
  fill(255);
  ellipseMode(CENTER);
  ellipse(200, 300, 100, 100);

  //middle belly
  ellipseMode(CENTER);
  ellipse(200, 250, 60, 60);

  //face 
  ellipseMode(CENTER);
  ellipse(200, 205, 50, 50);

  //smile
  noFill();
  arc(202, 216, 20, 20, 0.5, PI/1.3);

  //left eye
  ellipseMode(CENTER);
  fill(0);
  ellipse(192, 205, 5, 5);

  //right eye
  ellipseMode(CENTER);
  ellipse(215, 205, 5, 5);

  //nose
  triangle(202, 212, 204, 218, 230, 212);

   //belly dot high
  fill(0);
  ellipseMode(CENTER);
  ellipse(208, 240, 7, 7);

  //belly dot middle
  fill(0);
  ellipseMode(CENTER);
  ellipse(210, 255, 7, 7);

  //belly dot low
  fill(0);
  ellipseMode(CENTER);
  ellipse(208, 270, 7, 7);
}


//draw hands up
void drawHandsUp () {
  
   
  //right hand up
  line(226, 240, 260, 200);

  //left hand up
    line( 180, 245, 130, 200);

}
//draw hands down

void drawHandsDown () {
//left hand points down
  line( 130, 280, 175, 240);

  //left fingers
  line( 130, 280, 120, 284);
  line( 130, 280, 122, 294);
  line( 130, 280, 129, 294);

  //right hand points down
  line( 223, 236, 260, 270);

  //right fingers
  line (261, 270, 260, 280);
  line (260, 270, 270, 280);
  line (261, 270, 273, 273);
}


void mousePressed() {

  //when mouse is clicked, snowflakes change colour based on the location of the mouse
  if (mouseX> buttonX && mouseX< buttonX+buttonW && mouseY> buttonY && mouseY< buttonY+buttonH) {
    buttonColor= !buttonColor;
    drawHandsUp ();
  }
 
}

