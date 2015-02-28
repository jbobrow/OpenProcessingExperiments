
int x= 0;
int y = 0;
int speed = 5;
int my = 10;
int mx = 50; 
int spacing = 20;
int rectwidth = 100;
float rw = 100;
float ry = 0; 

float speed1 = 5;
float gravity = 0.5;

int state = 0;

void setup() {
  size (200,200);

}
void draw () { 
  background (0);
  stroke(0,255,0);
  fill(255,0,255);
  rectMode (CENTER); // rectangle in centre of screen
  rect(100,100,100,100); // size of rectangle
  fill(0,255,0);
  stroke(255,0,255);
  rectMode(CENTER); 
  rect( 100,100,75,75);
  fill(255);
  noStroke();
  rectMode(CENTER);
  rect(38,38,25,25);
  rectMode(CENTER);
  rect(164,165,25,25);
  fill (155);
  stroke (255);
  ellipse (x,y,10,10); // moving ball around the window
 
  if (state == 0){
    x=x+speed;
    if (x >width-10) {
      x=width-10;
      state = 1;  
    }
  } else if (state == 1) {
    y=y + speed;
    if (y>height-10) {
      y= height -10;
      state = 2;
    }
  } else if (state == 2) {
    x=x - speed;
    if ( x<0 ){
      x=0;
      state= 3;
    }
  } else if (state == 3) {
    y = y - speed;
    if ( y < 0 ) {
      y = 0;
      state = 0; 
      
 
      
      fill (255);
      noStroke();
      rectMode(CENTER);
      rect ( rw,ry,10,10);
      
      ry = ry + speed1; 
      
      speed1 = speed1 + gravity; 
      
      // if the circle reaches the bottom, reverse speed
      if (ry > height) {
        ry = height; 
        speed1=speed1 * - 0.95;
      }
    }
  }
}
  
    
    
   
      

    
  



