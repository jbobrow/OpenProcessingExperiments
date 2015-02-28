
//Final project Introduction to Computational Arts: Processing
//march 2014 by Alexander Nikonov

PImage plasma;
PImage plasmaNoise;
PImage plasmaOff;
PImage noise;
PImage img;



int x = 200; // 1 button
int xOff = 350; // 2 button
int xNoise = 500; // 3 button
int y = 50;
int w = 100;
int h = 35;
int r = 5;


void setup() {
  size(800, 600);
  noStroke();
  smooth();
  plasma = loadImage("plasma.png");
  plasmaNoise = loadImage("plasmaNoise.png");
  plasmaOff = loadImage("plasmaOff.png");
  noise = createImage(400, 220, RGB);
  img = plasmaOff;
}




void draw() {
  background(255);
  
  //draw white noise
  image(noise, (width-img.width)/2, (height-img.height)/2);


  //create white noise
  noise.loadPixels();
  for (int i = 0; i < noise.pixels.length; i++) {
    noise.pixels[i] = color(random(255));
  }
  noise.updatePixels();
  
  
  
  image(img, (width-img.width)/2, (height-img.height)/2);

  //draw buttons
  drawButton(x, "Test");
  drawButton(xOff, "Off");
  drawButton(xNoise, "Noise");

  fill(255, 0, 0);
  textAlign(LEFT);
  textSize(16);
  text("Click on the red buttons", 2, height-2);
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("screenshot-####.png");
}


void mousePressed() {
  if (overButton(x)) {
    img = plasma;
  }
  if (overButton(xOff)) {
    img = plasmaOff;
  }
  if  (overButton(xNoise)) {
    img = plasmaNoise;
  }
}

//function over button
boolean overButton(int x) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true;
  }
  else {
    return false;
  }
}

//function for draw button
void drawButton(int x, String s) {
  if (overButton(x)) {
    fill(#956E6E);
  } 
  else {
    fill(#EA6666);
  }
  rect(x, y, w, h, r);

  fill(0, 0, 0);
  
  textAlign(CENTER);
  textSize(16);
  text(s, x+w/2, y+h/2+7);
}



