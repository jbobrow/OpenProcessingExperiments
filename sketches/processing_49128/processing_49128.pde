
class Button {
  
  float x;
  float y;
  float eSize;
  float xspeed;
  float yspeed;
  color c;
  boolean clicked;
  
  Button(float xpos, float ypos, float bSize) {
    
    x = xpos;
    y = ypos;
    eSize = bSize;
    yspeed = random(-1,1);
    xspeed = random(-1,1);
      
    clicked = false;
    
  }
  
  void update() {
    x = x + xspeed;
    y = y + yspeed;
  }
    
void collider() {
  if ((x<eSize) || ( x> width - eSize)) {
      xspeed = -xspeed;
    }
    if ((y<eSize) || ( y > height - eSize)) {
      yspeed = -yspeed;
    }
}

void drawButton() {
  
     
  if (clicked) {
    fill(random(255),random(255),random(255),random(50,100));
  }
  else {
    fill (0,0,0,50);
  }
   rect (x,y,eSize,eSize);
}

void checkMousePress() {
  if((mouseX > x) && (mouseX< x + eSize) && (mouseY > y) && (mouseY < y + eSize)) {
    clicked = !clicked;
  }
}
}

