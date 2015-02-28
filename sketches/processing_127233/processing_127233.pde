
int counter;

int WIDTH = 400;
int HEIGHT = 400;

void setup() {  //setup function called initially, only once
  background(0);  //set background white
  counter = 0;
  size(WIDTH, HEIGHT);
}

float offset() {
    return random(-6, 6) + random(-4, 4) + random(-3, 3) + random(-2, 2) + random(-2, 2);
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(0,0,0,3);
 rect(0,0,WIDTH,HEIGHT);
       if(mousePressed == true) { //add some interaction
    fill(255,255,255,11);
    textSize(128);
    text("-", mouseX-50+offset(), mouseY+32+offset());
    text("∞", mouseX-10+offset(), mouseY + 44+offset());
    text("-", WIDTH + mouseX-50+offset(), HEIGHT + mouseY+32+offset());
    text("∞", WIDTH + mouseX-10+offset(), HEIGHT + mouseY + 44+offset());
    text("-", WIDTH + mouseX-50+offset(), mouseY+32+offset());
    text("∞", WIDTH + mouseX-10+offset(), mouseY + 44+offset());
    text("-", WIDTH + mouseX-50+offset(), -HEIGHT + mouseY+32+offset());
    text("∞", WIDTH + mouseX-10+offset(), -HEIGHT + mouseY + 44+offset());
    text("-", -WIDTH + mouseX-50+offset(), HEIGHT + mouseY+32+offset());
    text("∞", -WIDTH + mouseX-10+offset(), HEIGHT + mouseY + 44+offset());
    text("∞", -WIDTH + mouseX-50+offset(), mouseY+32+offset());
    text("8", -WIDTH + mouseX-10+offset(), mouseY + 44+offset());
    text("∞", -WIDTH + mouseX-50+offset(), -HEIGHT + mouseY+32+offset());
    text("8", -WIDTH + mouseX-10+offset(), -HEIGHT + mouseY + 44+offset());
  }
}
