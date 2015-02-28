
/*

 the goal was to draw snakes of different colors moving across the screen. somehow, this turned into an airplane.
 I'd like to re-visit this when I have more time to complete it.
 
 */

// global variables
int leng = 235;
float x = -leng;
float speed = 0.5;

void setup() {
  size(600, 600);
  smooth();
  rectMode(CENTER);
  colorMode( HSB, 360, 100, 100);
  //frameRate(10);
 
}

void draw() {
  println(frameRate);
  //background(0);


  //snake shape
  
  int snakefillHue;
  snakefillHue = (int)random(0, 360);
  
  int snakefillBrightness;
  snakefillBrightness = (int)random(0, 100);
  
  int snakefillSaturation;
  snakefillSaturation = (int)random(0, 100);
  

  x += speed;
  
  //int _y;
  //_y = (int)random(15, 585);
  
  fill(snakefillHue, snakefillBrightness, snakefillSaturation);
  noStroke();
  rect(x+(leng/2), 300, leng, 30);
  triangle(x, 315, x, 225, x+(leng/4), 315);
  triangle(x+(leng/3), 315, x+(leng/1.5), 315, x+(leng/3), 450); 
  
  ellipse(x+leng, 300, 50, 29);
  
}



