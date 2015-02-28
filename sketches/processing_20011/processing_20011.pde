
// physics 101:
// moving an object at a certain speed is just adding the speed
// to the object's postion

// making an object accelerate means every frame its speed gets
// larger by a small ammount

float y = -100;
float speed = 0;
float gravity = 0.1;

boolean animate = true;

int btnX = 260;
int btnY = 50;
int btnW = 80;
int btnH = 80;

//--------------------------------------------------------
void setup() {
  size(400, 500);
  smooth();
}

//--------------------------------------------------------
void draw() {
  background(64);
  
  if (animate == true) { 
    y = y + speed;
    speed = speed + gravity;
    if (y >= height-120) {
      // reduce the speed on every bounce to make it more 
      // realistic.. try -1 and see what happens
    speed *= -0.9;  
    }
  }
  
  fill(255);
  ellipse(width/4, y, 50, 50);
  
  // draw the button
  if (animate == true) {
    fill(128);
  }
  rect(btnX, btnY, btnW, btnH);
}

//--------------------------------------------------------
void mousePressed() {
  if ( mouseX > btnX && mouseX < (btnX+btnW) && mouseY > btnY && mouseY < (btnY+btnH)) {
    // toggle the value of on
    // in other words, if on == true, then on becomes not true (false) and
    // vice versa
    animate = !animate;   // on = (not)on
  }
}
