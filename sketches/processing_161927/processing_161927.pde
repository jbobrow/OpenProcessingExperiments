
/* Homework 3: Grab Bouncing Ball
 by Leiah Fournier */
 
//UPDATED FOR EXTRA CREDIT! Changes made in code are indicated with "UPDATE" in the comments
// all code that is cancelled out /* */ is previous code being replaced 
 
//UPDATE: Importing new images and font
PImage background;
PImage ball;
PFont pokefont;
 
//Variables *CREDIT: Caio Sorrentino
float x;
float y;
 
float xSpeed;
float ySpeed;
 
float gravity = 0;
float friction = 0.875;
 
float diam = 100;
 
float mousex;
float mousey;
 
 
void setup() {
  size (900, 600);
  smooth();
  background = loadImage("background.png");
  

  ball = loadImage ("pokeball.png");
 
  x = width/2;
  y = height/2;
  
}
 
void draw () {
  imageMode(CORNER);
  image (background, 0, 0, width, height);
  
  //UPDATE: Pokeball image
  imageMode(CENTER);
  image (ball, x, y, diam, diam);

  
  /* //Text
  String s = "Take the pokeball!";
  font = loadFont("font.vlw");
  textSize(30);
  text(s, 10, width/2, height/2, 400); */
  
  //UPDATE: Text
  pokefont = createFont("pokefont.ttf",50);
  textFont(pokefont);
  textAlign (RIGHT,RIGHT);
  text("Take the pokeball!", width/2, height/2);
  fill (0);
  
  /*//Pokeball
  fill(255);
  stroke(0);
  strokeWeight(2);
  ellipse(x, y, diam, diam); 
   
  noStroke();
  fill(84,84,84,150);
  arc(x,y,diam,diam,0,PI); */
   
  ySpeed += gravity;
  y += ySpeed;
  x += xSpeed;
   
 
  //*CREDIT: Caio Sorrentino
  if (y >= height - (diam/2)) {
    ySpeed *= -friction;
    y = height-diam/2;
  }
 
  if (x >= width - (diam/2)) {
    xSpeed *= -friction;
    x = width - diam/2;
  }
 
  if (x <= diam/2) {
    xSpeed *= -friction;
    x = diam/2;
  }
 
  if (y == height - diam/2) {
    xSpeed *= friction;
  }
}
 
void mouseReleased()
{
  gravity = 5;
  ySpeed += gravity + ((mouseY - (pmouseY))/2 );
  xSpeed = (mouseX - pmouseX)/2;
  y += ySpeed;
  print(mouseY-pmouseY);
}
 
 
void mouseDragged()
{
 
  if (mouseX > x - (diam/2) && mouseX < x + (diam/2) && mouseY > y - (diam/2) && mouseY < y + (diam/2)) {
    x=mouseX;
    y=mouseY;
    xSpeed=0;
    ySpeed = 0;
    gravity = 0;
  }
}

