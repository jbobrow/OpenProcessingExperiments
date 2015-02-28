
 //SPRITE credit to Sprite Example on Processing by James PAtterson
PImage rocket;
float xpos;
float ypos;
float drag = 30;
int x;
int y;


void setup(){
  size(700,700);
  rocket = loadImage("rocket.gif");
  xpos = width/2;
  ypos = height/2;
}

void draw() {
  background(1);

  
  float difx = mouseX - xpos-rocket.width/2;
  if (abs(difx) > 1) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width-rocket.width);
  }  
  
  float dify = mouseY - ypos-rocket.height/2;

  if (abs(dify) > 1) {
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 0, height-rocket.height);
    //SPRITE credit to Sprite Example on Processing by James PAtterson
  
  }  
  image(rocket, xpos, ypos);
}

