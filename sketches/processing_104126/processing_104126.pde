
PVector location;
PVector velocity; 

float grafity = 0.03;
float fraction = 0.002;
int score = 0;

boolean clicked = false;

PImage img1; // cannon image
PImage img2; // tank image
PImage img3; // fire button image
PImage img4; // right button image
PImage img5; // left button image
PImage img6; //balckpicture to show score
PImage img7; //reset background

Button fire; //fire button
Button right; // eight arrow button
Button left; // left arrow button
Button reset; // reset button

float cannonX = 0;
float tankx = 0;

PFont display;

void setup()
{
  size(950, 540);
  
  display = createFont("DIGITAL",20);
  smooth();
  img1 = loadImage("cannon.png");
  img2 = loadImage("tank.png");
  img3 = loadImage("fire.png");
  img4 = loadImage("right.png");
  img5 = loadImage("left.png");
  img6 = loadImage("background.png");
  img7 = loadImage("reset.png");

  location = new PVector(width-182+cannonX, height-182);
  velocity = new PVector(-3.5, -3.5);

  fire = new Button("", width-180, height-80, 80, 80);
  fire.setImage(img3);

  right = new Button("", width-100, height-80, 80, 80);
  right.setImage(img4);

  left = new Button("", 0, height-80, 80, 80);
  left.setImage(img5);
  
    reset = new Button("reset", width-100, 0, 100, 80);
  reset.setImage(img7);
}

void draw()
{
  background(255);
  basic();
  
  //loading cannon image
  image(img1, width-182+cannonX, height-182, 100, 100);
  //loading tank image
  if (tankx+80 < width/2) {
    image(img2, tankx, height-162, 80, 80);
    tankx = tankx + 0.5;

  }
  else 
  {
    tankx=0;
  }

image(img6, 0, 0, 200, 40);
textFont(display);
text("Your Score  " + score, 30, 30); 



 
  
  fire.display();
  right.display();
  left.display();
  reset.display();
  text("reset", width-70, 50);
  
  if (location.x > width || location.y > height-80) {
    clicked = false;
    grafity = 0.03;
    fraction = 0.002;
    velocity = new PVector(-3.7, -3.7);
    location = new PVector(width-182+cannonX, height-182);
  }

  if (clicked == true)
  {  
    ellipse(location.x, location.y, 16, 16);
    location.add(velocity);
    velocity.y = velocity.y + grafity;
    velocity.x = velocity.x + fraction;
    grafity = grafity + 0.0007;
    fraction = fraction + 0.00006;
  }
  //if bullate hit the tank
  if (location.x-5 <=  tankx+80 && location.x-16 >=  tankx && location.y-5 >= height-162) {
        clicked = false;
    grafity = 0.03;
    fraction = 0.002;
    velocity = new PVector(-3.7, -3.7);
    location = new PVector(width-182+cannonX, height-182);
    tankx=0;
    score = score + 1;
  }
}

void mousePressed()
{ 
    if (reset.mousePressed())
  {
    score = 0;
    
  }
  if (fire.mousePressed())
  {  
    clicked = true;
  }

  if (left.mousePressed())
    if (!clicked) {
      if (width-190+cannonX > width/2) {
        {
          cannonX = cannonX - 10;
          location.x = width-182+cannonX;
        }
      }
    }

  if (right.mousePressed())
    if (!clicked) {
      if (width-182+cannonX+100 < width) {
        {
          cannonX = cannonX + 10;
          location.x = width-182+cannonX;
        }
      }
    }
}
