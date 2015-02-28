
int hotX, hotY, hotW, hotH, state;
PImage prompt, rollover, mousedown, feedback;

void setup() {
  // runs once at the start  
  size(500,750);
  smooth();
  
  prompt = loadImage("prompt.jpg");
  rollover = loadImage("rollover.jpg");
  mousedown = loadImage("mousedown.jpg");
  feedback = loadImage("feedback.jpg");

  hotX = 128;
  hotY = 450;
  hotW = 110;
  hotH = 230;
  
  state = 0;
}

void draw() {
  // runs in a loop, every frame  
  background(100);
    
  // first figure out what the current "state" is
  if (state != 3) {
    if (mouseOver(hotX, hotY, hotW, hotH)) {
      if (mousePressed) {
        state = 2; // mouse down but not clicked yet
      } else {
        state = 1; // mouse over but not down
      }
    } else {
      state = 0; // mouse not over
    }
  }
  
  // draw to the screen based on the "state"
  if (state == 0) {
    image (prompt, 0, 0);
  }
  if (state == 1) {
    image (rollover, 0, 0);
  }
  if (state == 2) {
    image (mousedown, 0, 0);
  }
  if (state == 3) {
    image (feedback, 0, 0);
  }
  
}

void mouseReleased() {
  if (state==2) {
    state = 3;
  }
}

boolean mouseOver(int oX, int oY, int oW, int oH) {
  // runs when called by draw
  if (mouseX >= oX && mouseX <= oX+oW && 
      mouseY >= oY && mouseY <= oY+oH) {
    return true;
  } else {
    return false;
  }
}

void keyPressed() {
  state = 0;
}


