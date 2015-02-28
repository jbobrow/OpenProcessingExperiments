
//Diego Rodriguez, week 5, CC spring 2014, Rory S. 


int line_x;
int n = 100;
float line_y = 0.05;
float noiseY;
 
//ball
int ball_x = 50;
int ball_y = 100;
int ball_x_direction = 1;
int ball_y_direction = -1;
float easing = 0.05;

 
 
 
void setup() {
  size(400, 400);
}
 
void draw() {
  color white = color(255);
    color pitchBlack = color(44,43,44,200);
     
    float amt = map( mouseX, 0,width, 0,1 );
    color c = lerpColor( white, pitchBlack, amt );
    
    background(c);
    

  ellipse( ball_x, ball_y, 10, 10);
  ball_x = ball_x + ball_x_direction;
  ball_y = ball_y + ball_y_direction;
 
 
  if ( ball_y <= 0 ) {
    ball_y_direction = 3;
  }
  else if ( ball_y >= 400 ) {
    ball_y_direction = -9;
  }
 
  if ( ball_x <= 0 ) {
    ball_x_direction = 9;
  }
  else if ( ball_x >= 400 ) {
    ball_x_direction = -5;
  }
 
  if ( ball_x >= 400 ) {
    
    background(255,0,0);
    ellipse(200, 200, 350, 350);
  }
  else if ( ball_x <= 0 ) {
    
    background(255,0,0);
    ellipse(200, 200, 350, 350);
  }
  if ( ball_y >= 400 ) {
    
    background(0,255,0);
    triangle(20, 380, 200, 20, 380, 380);
  }
  else if ( ball_y <= 0 ) {
    
    background(0,0,255);
    fill(255, 10);
    triangle(20, 20, 200, 380, 380, 20);
  }
 
  if ( mousePressed || millis() > 2000 && millis () < 4000) {
    fill(0);
    for (int i = 1; i < n; i++) {
      line_y += 0.02;//increment every time it runs by .02
      line_x = i* (width/n);//starts at 1 through 99, multiplied by width of window/#of bars = distribute evenly acroos window
      noiseY = noise(line_y) * height;
      line(line_x, height, line_x, noiseY);
    }
  }
  else  if (keyPressed) {
    fill(255);
    for (int i = 1; i < n; i++) {
      line_y += 0.02;//increment every time it runs by .02
      line_x = i* (width/n);//starts at 1 through 99, multiplied by width of window/#of bars = distribute evenly acroos window
      noiseY = noise(line_y) * height;
      line(line_x, height, line_x, noiseY);
    }
  }
  
}



