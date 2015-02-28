
float x, y;
float time = 0.0;
int score = 0;

//float size = 10;
PShape star;
PShape square;
PShape line1;
PShape line2;
PShape bubble;

int size = 1;      
float xpos, ypos;    

float xspeed = 2.8;  
float yspeed = 2.2;  

int xdirection = 1;  
int ydirection = 1;  





void setup() 
{
  size(480, 320);
  background(0);
  noStroke();
  smooth();
  frameRate(30);
  xpos = width/2;
  ypos = height/2;
  bubble = loadShape("bubble.svg");
  star = loadShape("big star.svg");
  square = loadShape("square.svg");
  line1 = loadShape("line.svg");
  line2 = loadShape("line2.svg");
  bubble = loadShape("bubble.svg");

}

void draw() 
{
  noCursor();
  background(0);
  
if (mousePressed){
  float d = dist(mouseX, mouseY, xpos, ypos);

}

  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
if (xpos > width-30|| xpos < 0) {
xdirection *= -1;
  }
if (ypos > height-30 || ypos < 0) {
ydirection *= -1;
  }



 shape( bubble, xpos+size/2, ypos+size/2, 30, 30);

  x = x + 0.8;
  y = y + 0.02;
  
  if (x > width - size) {
    x = size;
  }
  pushMatrix();
  translate(x, height/3-size/2);
   star.disableStyle();
   fill(0, 102, 153, 140);
  shape(star, -80, 20, 200, 200);
  star.enableStyle();
  translate(x-100, height/y);
  shape(star, -350, size - height, 600, 600);
  star.disableStyle();
  translate(-x,height/4- size);
    fill(127, 62, 95, 200);
  shape(star, -50, size - height/y*2, 200, 400);
  translate(-x, height/2- size);
    fill(109, 71, 255, 200);
  shape(star, -50, size - height/y*2, 200, 400);
  popMatrix();
  
   shape(square, mouseX - 20, mouseY - 20);
  shape(line1, mouseX - 20, mouseY - 20);
  shape(line2, mouseX - 20, mouseY - 20);
}

  



