

int xPos;
int yPos;
int cx = 100;
int cy = 10;
int r=75; //radius of bouncing ball
int vx=2; //bouncing ball's direction on the x-axis
int vy=3; //bouncing ball's direction on the y-axis
 
void setup (){
  size (600,700);
PImage img;
   background(255);
   img= loadImage("body.jpg");
tint(255, 255);
image(img, 150, 180, 300, 300);
 
 img= loadImage("face.png");
tint(255, 255);
  image(img, 150, 10, 300, 180);
  
  img= loadImage("arm1.png");
tint(255, 255);
  image(img, 10, 200, 210, 180);
  
  img= loadImage("arm2.jpg");
tint(255, 255);
  image(img, 380, 200, 210, 180);
  
  img= loadImage("leg.jpg");
tint(255, 255);
  image(img, 200, 470, 210, 180);


}
 
void draw(){
   
 
  fill(255, 0, 0);

  smooth();
  ellipseMode(CENTER);
  ellipse(cx, cy, r, r);
   
  cy = cy + vy;
   
  if(mouseX > 0){
    xPos ++;
  } 
   
if((cy>height-40)||(cy<0)){
  vy = vy * -1;
}
 
cx = cx + vx;
 
if((cx > width - 10)||(cx < 0)){
  vx = vx * -1;
 
   
 
}
  }



