
PGraphics pg;
PImage tex;
float rotx = PI/4;
float roty = PI/4;
int maxCubes = 12;
int maxLines = 3;
float atten = .8;
float amtAlpha = atten; 
float saturate = .1;
float randXX;
float randYY;
float randColor;
float randLength;
int tone;
float thick;
color bgColor = color(0,0,0);
color satColor;
color [] colors = {
  color(230,220,255,255),
  color(230,100,255,255),
  color(167,150,255,255),
  color(124,250,255,255),
  color(100,50,255,255),
  color(200,250,255,255),
  color(255,250,255,255)};
float time = 0;
float margin = 300;
int odd = 0;
int blurOn = 1;
int colorOn = 1;
void setup() 
{
  colorMode(HSB,1.0);
  pg = createGraphics(100,100,P2D);
  pg.colorMode(HSB,1.0);
  tex = createImage(100,100,ARGB);
  size(500, 500,P3D);
  textureMode(NORMALIZED);
}

void draw() 
{
  if (keyPressed) {
    if (key == 'b') {
      blurOn = 1 - blurOn;
    }
  }
  if (keyPressed) {
    if (key == 'v') {
      colorOn = 1 - colorOn;
    }
  }
  pg.beginDraw(); 
  if (keyPressed == true) {
    if (key == 'c') {
      pg.loadPixels();  
      for (int i = 0; i < (pg.pixels.length); i++) {
        pg.pixels[i] = color(0,0,0,0);
      }
    }
  }
  randLength = random(0,50);
  randColor = noise(frameCount) * 255;
  randXX = random(20,50);
  randYY = random(10,80);
  thick = noise(thick+frameCount) * 10;
  pg.strokeWeight(noise(thick*frameCount)+2);
  tone = int(noise(frameCount)*colors.length);
  if (colorOn == 1) {
    pg.stroke(colors[tone]);
  } 
  else {
    pg.stroke(color(.3,0,1,1));
  }
  if (odd == 1) {
    pg.line(randXX,randYY,randXX+randLength,randYY);
  } 
  else {
    pg.line(randXX,randYY,randXX,randYY+randLength);
  }
  pg.loadPixels(); 
  for (int i = 0; i < (pg.pixels.length); i++) {
    pg.pixels[i] = color(hue(pg.pixels[i]),
    constrain(saturation(pg.pixels[i]) + saturate,0,1),
    brightness(pg.pixels[i]),      
    alpha(pg.pixels[i]) * amtAlpha);
  }

  if (blurOn == 1) {
    pg.filter(BLUR,.8);
    amtAlpha = .97;
  } 
  else {
    amtAlpha = atten;
  }

  pg.endDraw();
  tex = pg;
  background(bgColor);
  noStroke();
  for (int i =0;i<maxCubes;i++) {  
    pushMatrix();  
    float randX = (noise(i+4)* (width + (margin * 2))) - margin;
    float randY = (noise(i-37)* (height + (margin * 2))) - margin; 
    float randZ = noise(i+43) * 200;
    randZ -= 50;   
    float randScale = noise(i+37) + 200; 
    randScale -= 50;
    translate(randX,randY,randZ);
    //rotx += .00001 * frameCount;
    rotx = time*.05;
    rotateX(rotx);
    rotateY(roty);
    scale(randScale);    
    TexturedCube(pg);
    popMatrix();
  }
  time++;
  odd = 1 - odd;
}

void TexturedCube(PImage tex) {
  beginShape(QUADS);
  texture(tex);
  // +Z "front" face
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);
  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);
  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);
  // +X "right" face
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);
  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  endShape();
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}












































