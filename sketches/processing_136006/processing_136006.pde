
import ddf.minim.*;

Minim minim;
//AudioPlayer bells;
AudioSample bells;

color strokeColor = color(0, 10);

void setup() {
  minim = new Minim(this);
//  bells = minim.loadFile("bell01.wav");
//  bells.play();

  bells = minim.loadSample("bell01.wav");
  size(720, 720);
  colorMode(HSB, 360, 100, 100, 100);
  background(360);
}

//Draw code block (anything goes
void draw() {
//  background(0);
}

//Create a key trigger
void keyPressed() {
  if (key == 'b' || key == 'B') bells.trigger();
  if (key == 'b') println("sample triggered");
}
void keyReleased() {
  bells.trigger();
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  
  switch (key) {
    case '1':
      strokeColor = color(0, 10);
      break;
    case '2':
      strokeColor = color(192, 100, 64, 10);
      break;
    case '3':
      strokeColor = color(52, 100, 71, 10);
      break;
      
   }
}

void mousePressed() {
    pushMatrix();
    translate(width/2, height/2);
    // map(value, start1, stop1, start2, stop2);
    int circleResolution = (int) map(mouseY+100, 0, height, 2, 10);
    int radius = mouseX - width/2;
    float angle = TWO_PI/circleResolution;
    //style
    strokeWeight(2);
    stroke(strokeColor);
    
    beginShape();
    for (int i = 0; i <= circleResolution; i++) {
      float x = 0 + cos(angle*i) * radius;
      float y = 0 + sin(angle*i) * radius;
      vertex(x, y);
    }
    endShape();
    popMatrix();  
}
  

