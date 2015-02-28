
// clickto stop random color painter

boolean dMode = true;
color backColor;
color drawColor;

// checks if left mouse clicked last to prevent frantic color switching
boolean leftClicked = true;

void setup() {
  size(1400,750);
  drawColor = color(random(255), random(255), random(255));
  backColor = color(0);
  background(backColor);
   
  // I limited the frameRate to save your computer but change it for faster expansion
  frameRate(30);
}

void draw() {
  if(mousePressed) {
    if (mouseButton == LEFT) {
      burn(drawColor);
      // the dMode determines if draw is erasing or drawing
      dMode = true;
      leftClicked = true;
    } else {
    if (leftClicked) {
      // the right click reset
      backColor = drawColor;
      drawColor = color(random(255), random(255), random(255));
      leftClicked = false;
    }
  }
  }
    noiser();  
}

// draw a line this shade
void burn(int dStroke) {
 stroke(dStroke);
 strokeWeight(10);
 line(pmouseX,pmouseY, mouseX, mouseY);
}

 
// variables for noiser
color black = color(0);
color white = color(255);
color c = color(0);

   
void noiser() {
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      float rand = random(0,100);
       
      // change this random limit to change the behavior of the noise expansion
      if (rand > 0 && dMode) {
        if (get(x,y) == drawColor) {
          // then expand and conquer with the drawColor
          set(x+int(random(-4,4)),y+int(random(-4,4)), drawColor);
        } else {
          //set(x+int(random(-10,10)),y+int(random(-10,10)), backColor);
        }
      } else {
        if (get(x,y) != backColor) {
          // start eradicating non comformists
            c = drawColor;
          set(x+int(random(-4,4)),y+int(random(-4,4)),backColor);
        }
      }
    }
  }
}


