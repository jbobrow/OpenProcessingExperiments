
//First attempt at interactive sketch
//play with keys abcde to attain tunnel-like forms
//and different shades of red and blue
//press s to save a screenshot
//press backspace to clear

color strokeColor = color(0, 9);

void setup() {
  size(800, 600);
  colorMode(HSB, 150, 200, 100, 100);
  noFill();
  background(150);
}
void draw(){
if(mousePressed){
  pushMatrix();
  translate(width/2, height/2);
  
  int circleResolution = (int)map(mouseY+10, 0, height, 100, 100);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;

  strokeWeight(2);
  stroke(strokeColor);
  
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle*i) * radius;
    float y = 0 + sin(angle*i) * radius;
    vertex(x,y);
  }
  endShape();
  popMatrix();
}
}

void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(150);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  
  switch(key){
    case 'a':
    strokeColor = color(80, 10, 20, 10);
    break;
    case 'b':
    strokeColor = color(100, 150, 50, 90);
    break;
    case 'c':
    strokeColor = color(200, 100, 80, 10);
    break;
    case 'd':
    strokeColor = color(500, 200, 180, 110);
    break;
    case 'e':
    strokeColor = color(700, 250, 90, 150);
    break;
  }  
}

//end
