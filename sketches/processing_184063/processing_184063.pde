

PImage pacManOpen, pacManClosed, RedGhost, BlueGhost, OrangeGhost, PurpleGhost;
 
boolean moveUp = false;
boolean moveRight = false;
boolean moveLeft = false;
boolean moveDown = false;
float flash = 0;
float speed = 5;  
float x = width/2;
float y = height/2;
float c = 0;
float z = 0;
float r = 0;
float i = 0;
float backColor = 0;
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
int counter = 0;
void setup()
{
  size(600,720);
  background(0);
  smooth();
  noStroke();
  imageMode(CENTER);
  c=0;
   xpos = width/2;
  ypos = height/2;
  
  pacManOpen = loadImage("http://i.imgur.com/GUhBVGy.png");
  pacManClosed = loadImage("http://i.imgur.com/E2KLguP.png");
  RedGhost = loadImage("http://i.imgur.com/ku9eOdq.png");
  BlueGhost = loadImage("http://i.imgur.com/aF9wmBP.png");
  OrangeGhost = loadImage("http://i.imgur.com/LM8ckFv.png");
 PurpleGhost = loadImage("http://i.imgur.com/nszoIeq.png?1");

}
void draw() {
   counter++;
  background(backColor);
   frameRate(30);
  // image(pacManOpen, 0, height/2, pacManOpen.width/2, pacManOpen.height/2);
  //image(pacManClosed, 0, height/2, pacManClosed.width/2, pacManClosed.height/2);
 
  
  if(moveRight)
      {
       
        x=x+speed;
      }
  if(moveLeft)
      {
        
        x=x-speed;
      }
  if(moveUp)
      {
        y=y-speed;
      }
  if(moveDown)
      {
        y=y+speed;
      }
      
  //Ghost Code   
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-(PurpleGhost.width/2) || xpos < (PurpleGhost.width/2)) {
    xdirection *= -1;
  }
  if (ypos > height-(PurpleGhost.height/2) || ypos < (PurpleGhost.height/2)) {
    ydirection *= -1;
  }  
  pushMatrix();
   for(i=65; i<600; i+=60)
    for(int j=65; j<800; j+=60){
      
      if(moveRight){
        fill(random(100),100,255,200);
        ellipse(i,j, flash, flash);
      }
      if(moveLeft){
        fill(random(255),50,50,200);
        ellipse(i,j, flash, flash);
      }
      if(moveUp){
        fill(0,random(100),50,200);
        ellipse(i,j, flash, flash);
      }
      if(moveDown){
        fill(50,255,random(255),200);
        ellipse(i,j, flash, flash);
      }
      else{
        ellipse(i,j, 10, 10);
      }
    } 
    
    flash = (80*sin(counter))/2;
    popMatrix();
   if(x*pacManOpen.width == width/2 && y*pacManOpen.height == height/2)
   {
     backColor = random(255);
   }
   
    
  
  //draw pacMan   
  pushMatrix();
  translate(pacManOpen.width/2,pacManOpen.height/2);
  rotate(radians(c));
  image(pacManOpen,x,y);
  translate(-width/2,-height/2);
  popMatrix();
  //draw PurpleGhost
  image(PurpleGhost, xpos, ypos);
    //draw PurpleGhost
  image(BlueGhost, xpos, ypos);
    //draw PurpleGhost
  image(RedGhost, xpos, ypos);
    //draw PurpleGhost
  image(OrangeGhost, xpos, ypos);
}
void keyPressed() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       moveLeft = true;
     } else if(keyCode == RIGHT) {
        c=0;
       moveRight = true;
     } else if(keyCode == UP) {
       moveUp = true;
     } else if(keyCode == DOWN) {
       
       moveDown = true;
     }
  }
}
 
void keyReleased() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       moveLeft = false;
     } else if(keyCode == RIGHT) {
       moveRight = false;
     } else if(keyCode == UP) {
       moveUp = false;
     } else if(keyCode == DOWN) {
       moveDown = false;
     }
  }
}






