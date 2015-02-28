
//bouncing ball that moves around the screen (wihout gravity
//changing number to keep score for each side
//paddles are needed for left and right one is 
//controlled by keys and one by the mouse
//a line to divide the screen vertically
//the ball must reverse direction when it hits the mouse
//Declarations: 

float xpos; //declare a variable for x
float ypos; //declare a variable for y
float xs; //declare a variable for x
float ys; //declare a variable for y
int radius; //radius!!
float x ; //left rectangle x 
float y ; //left rectangle y 
int scorel; //score on left side
int scorer; //score on right side
PFont font;




void setup() {
  colorMode(HSB, 255);
  size(500, 500);
  xs = 5; //initialize x speed 
  ys = 5; //initialize y speed 
  xpos = 250;
  ypos = random(0, 450);
  radius = 15;
  y = 220;
  x = 40;
  scorer = 0;
  scorel = 0;
  font=loadFont("agoth.vlw");
}

void draw() {
  noStroke();
  background(255, 255, 255);

  //draw line
  fill(12);
  stroke(5);
  line(250, 0, 250, 500);
  //end line
  //rectangle left
  rect(x, y, 10, 30);
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode == UP) {
        y=y-5;
      }
      if (keyCode == DOWN) {
        y=y+5;
      }
    }
  }
  //end right rectangle
  //ball
  fill(200, 0, 0);
  xpos = xpos + xs;

  //this describes the right paddle action
  if ((xpos >= 440 && xpos <= 460) && (ypos >= mouseY-30 && ypos <= mouseY+30)) {
    xs = xs * -1;
  }

  //this describes the paddle action
  if ((xpos >= 30 && xpos <= 50) && (ypos >= y-30 && ypos <= y+40)) {
    xs = xs * -1;
  }

  ypos = ypos + ys;
  if ((ypos >= height-radius/2) || (ypos <= radius/2)) {
    ys = ys * -1;
  }

  if (ypos>=height-radius/2&&ys;<=0) {
    ypos=height-radius/2;
  }
  ellipse(xpos, ypos, radius, radius); 

  //end ball


  //right rectangle 
  rect(450, mouseY, 10, 30);

  //left side score
  if (xpos == 500) {
    scorel++;
    fill(255);//set font color
    //display score
    xpos = 250;
    ypos = random(0, 480);
  }
  //display l score
  textSize(20);
  text (scorel, 50, 100);

  //right side score
  if (xpos == 0) {
    scorer++;
    fill(255);//set font color
    xpos = 250;
    ypos = random(0, 480);
  }
  //display r score
  textSize(20);
  text (scorer, 450, 100);

  // if the L players score equals ten they win 
  if (scorel == 10) {
    background(255);
    fill(6); 
    textSize(30);
    text("Left Player WINS!", 175, 200);
    xs=0;
    ys=0;
  }
  // if the R players score equals ten they win
  if (scorer == 10) {
    background(255);
    fill(6);
    textSize(30);
    text("Right Player WINS!", 175, 200);   
    xs=0;
    ys=0;
  }
}



