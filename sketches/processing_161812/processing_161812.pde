
float speed = .5;
float y = 300;
float x2 = -.5;
int sizeX = 10;
int sizeY = 10;
int W = 40;
int H = 10;
float expand = .5;
float gravity = .02;
float decay = .8;
float t = millis() * 10000;




void setup() {
 size(600,600);
 smooth();
 noStroke();
 fill(0);
 ellipseMode(RADIUS); 
 
  
}





void draw() {
  background(0);
  fill(255,0,0);
  rect(mouseX, .85*height,W,H);
  y += speed;
  speed = speed + gravity;
  ellipse(width/2, y, sizeX, sizeY);
  //when the ball hits the bottom, reverse direction.
  if (y > height - sizeY || y == .85*height) {
    sizeX += expand;
    expand = speed + expand;
    y -= speed;
    speed = -speed * decay;
   } else  {
     sizeX = 10;
     sizeY = 10;
   }

if (mousePressed)  {
  gravity = .01;
  } else { 
    gravity = .05;
}

if (y == mouseX) {
  y -= speed;
  speed = -speed * decay;
} else {
  y += speed;
  speed = speed + gravity;
}
  
}
   
 
  
   
 


 
 
  



  





