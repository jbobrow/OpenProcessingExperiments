
import netscape.javascript.*;

int _firework_y[] = {600, 600, 600, 600, 600};
int _firework_x[] = {0, 0, 0, 0, 0};
int _firework_speed[] = {0, 0, 0, 0, 0};
color _fireworkColor[] = {#000000, #000000, #000000, #000000, #000000};
boolean _bomb[] = {false, false, false, false, false};
color _color[] = {#FFFF00, #00CC00, #9900FF, #006699, #EB6912};
boolean start = false;
float frStart;
String victoryMessage = "VICTORY";
PFont f;
int logoSize[] = {0, 0, 0, 0, 0};
boolean logoSW[] = {false, false, false, false, false};
int logoSpeed = 5;
int colorIndex = 0;
boolean colorAdd = true;

void setup()
{
  size(800, 600);
  background(0);
  frameRate(30);
  colorMode(RGB, 255, 255, 255, 100);
  smooth();

  for (int i=0; i<5; i++) {
    _fireworkColor[i] = colorSelect();
    _firework_x[i] = locationX();
    _firework_speed[i] = int(round(random(-2, 3)));
    _firework_y[i] += int(round(random(0,50)));
  }
  
  f = createFont("Arial",32,true);
}

void draw()
{
  if (!start) {
    start = true;
    frStart = frameCount;
  }
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);

  for (int i=0; i<5; i++) {
    pushStyle();
    fill(_fireworkColor[i], 100);
    stroke(_fireworkColor[i], 100);

    ellipse(_firework_x[i], _firework_y[i]-5, 5, 10);

    if (_firework_y[i] > 100) {
      _firework_y[i] -= (4 + _firework_speed[i]);
    }
    else
    {
      _firework_y[i] = 600;
      _firework_x[i] = locationX();
      _fireworkColor[i] = colorSelect();
    }
    popStyle();
  }
  
  println(frameCount);
  if (frStart + 150 < frameCount) {
    drawCircle();
  }
  if (frStart + 250 < frameCount) {
    drawWord();
  }
  
  if (logoSW[0] && logoSW[1] && logoSW[2] && logoSW[3] && logoSW[4]){
     drawWord();
  }
}

color colorSelect() {
  return _color[round(random(0, 4))];
}

int locationX() {
  return round(random(50, 750));
}

void drawCircle(){
  pushStyle();
  
  ellipseMode(CENTER);
  noFill();
  stroke(255, 100);
  strokeWeight(8);
  logoSW[0] = true;
  
  if (logoSW[0]){
    ellipse(width/2, height/4, logoSize[0], logoSize[0]);
    if (logoSize[0] < 120) {
      logoSize[0] += logoSpeed;
    }
    else{
      logoSW[1] = true;
    }
  }

  if (logoSW[1]){
    ellipse((width/2) + 100, height/4, logoSize[1], logoSize[1]);
    if (logoSize[1] < 120) {
      logoSize[1] += logoSpeed;
    }
    else{
      logoSW[2] = true;
    }
  }
  
  if (logoSW[2]){
    ellipse((width/2) - 100, height/4, logoSize[2], logoSize[2]);
    if (logoSize[2] < 120) {
      logoSize[2] += logoSpeed;
    }
    else{
      logoSW[3] = true;
    }
  }
  
  if (logoSW[3]){
    ellipse((width/2) - 50, height/4 + 90, logoSize[3], logoSize[3]);
    if (logoSize[3] < 120) {
      logoSize[3] += logoSpeed;
    }
    else{
      logoSW[4] = true;
    }
  }
  
  if (logoSW[4]){
    ellipse((width/2) + 50, height/4 + 90, logoSize[4], logoSize[4]);
    if (logoSize[4] < 120) {
      logoSize[4] += logoSpeed;
    }
  }

  popStyle();
}

void drawWord(){
  pushStyle();
  colorMode(HSB, 255, 255, 255, 100);
  if (colorAdd){
    if (colorIndex < 255){
      colorIndex += 1;
    }
    else{
      colorAdd = false;
    }
  }
  else{
    if (colorIndex > 0){
      colorIndex -= 1;
    }
    else{
      colorAdd = true;
    }
  }
  fill(colorIndex, colorIndex, colorIndex, 100);
  textFont(f,72);
  text(victoryMessage,250,500);
  popStyle();
  
  drawShade();
}

int shadeSize = 0;
boolean shadeAdd = true;

void drawShade(){
  pushStyle();
  noFill();
  strokeWeight(4);
  
  stroke(0, 157, 255, 20);
  ellipse((width/2) - 100, height/4, shadeSize, shadeSize);
  
  stroke(255, 51, 51, 20);
  ellipse((width/2) + 100, height/4, shadeSize, shadeSize);
  
  stroke(255, 255, 0, 20);
  ellipse((width/2) - 50, height/4 + 90, shadeSize, shadeSize);
  
  stroke(0, 204, 0, 20);
  ellipse((width/2) + 50, height/4 + 90, shadeSize, shadeSize);
  
  if (shadeAdd){
    if (shadeSize < 110){
      shadeSize++;
    }
    else{
      shadeAdd = false;
    }
  }
  else{
    if (shadeSize > 0){
      shadeSize--;
    }
    else{
      shadeAdd = true;
    }
  }
  popStyle(); 
}

