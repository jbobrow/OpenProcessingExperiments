
int frame = 0;
float centerX;
float centerY;
float r = 0;
float theta = 0;
float inc = 0.1;
float ellipseRad = 4;
float ballR = 0;
float ballTheta = 0;
float ballInc = 0.1;
float ballRad = 4;
PImage img;

void setup() {
  size(900,900);
  smooth();
  background(255);
  ellipse(width/2,height/2,width,height);
  img = loadImage("image1420.jpg");
}

void draw() {
  //middle circle
  fill(80);
  ellipse(width/2, height/2, 100, 100);
  
  //spiral
  float x = r * cos(theta);
  float y = r * sin(theta);
  float ballX = ballR * cos(ballTheta); //new variable for ball starting point
  float ballY = ballR * sin(ballTheta);
  if(dist(width/2, height/2, x+width/2, y+height/2) <= width/2) {
    noStroke();
    fill(40);
    ellipse(x+width/2, y+height/2, ellipseRad += 0.01, ellipseRad += 0.01);
    
    theta += 0.02;
    r += inc;
    inc += 0.0003;
  }else{
    background(0);
    image(img,0,0,width,height);
    //ball
    fill(155,155,0);
    ellipse(ballX+width/2, ballY+height/2, ballRad += 0.01, ballRad += 0.01);
    
    ballTheta += 0.02;
    ballR += inc;
    ballInc += 0.0003;
  }//end of else////////////////////
  
  /*saveFrame("holly-#####.jpg"); //frame collection
  frame = frame + 1;
  
  if (frame > 1800) {
    exit();
  }*/
}//end of draw////////////////////

void mousePressed() {
  saveFrame("image###.jpg");
}

