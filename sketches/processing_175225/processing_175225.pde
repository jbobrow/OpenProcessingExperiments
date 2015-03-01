
//Import image
PImage img;

//color pattern dependant on mouse X position
int c1;
int c2;
int c3;
int gx = 1;
int gy = 1;

//Import sound
import arb.soundcipher.*;
SoundCipher sc = new SoundCipher(this);
SoundCipher sc2 = new SoundCipher(this);
SoundCipher sc3 = new SoundCipher(this);
float[] pitchSet = {
  57, 60, 60, 60, 62, 64, 67, 67, 69, 72, 72, 72, 74, 76, 79
};

float setSize = pitchSet.length;
float keyRoot = 0;
float density = 0.8;


//For the camera shape
float cameraX = 0;
float cameraY = 50;
float angle1 = 0.0;
float angle2 = 0.0;
float angle3 = 0.0;
float segLength = 100;

//Setting size of the sketch and image for the background
void setup() {
  size(1280, 720);
  img = loadImage("background.jpg");
  smooth();
  image (img, 0,0);
  
//For the sound
 sc3.instrument(49); 
}

//Setting background movement
void draw() {
  update(mouseX); 
    noStroke();
  smooth();
  translate(400, 200);
  c1 = (int)random(10, 20);
  c2 = (int)random(20, 255);
  c3 = (int)random(20, 255);
  
//Setting camera movement
  angle1 = (mouseX/float(width) - 0.5) * -PI;
  angle2 = (mouseY/float(height) - 0.5) * PI;
  angle3 = (mouseY/float(height) - 0.2) * -HALF_PI;
  pushMatrix();
  segment(cameraX, cameraY, angle1);
  segment(segLength, 0, angle2);
  camera(segLength, 0, angle3);
  popMatrix();
}

void segment(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  stroke (0);
  line(0, 0, segLength, 0);
  noStroke();
  fill(0, 50);
  ellipse(0, 0, 40, 40);
}
void camera(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  noStroke();
  rect(0, -30, 120, 60);
  rect(110, -20, 20, 40);
  rect(120, -10, 20, 20);
  
  //Setting sound

  if (random(1) < density) {
  sc.playNote(pitchSet[(int)random(setSize)]+keyRoot, random(90)+30, random(20)/10 + 0.2);
  eye((int)random(width), (int)random(height));
  }                                                                                                                                                      

  if (frameCount%32 == 0) {
  keyRoot = (random(4)-2)*2;
  density = random(7) / 10 + 0.3;
  sc2.playNote(36+keyRoot, random(40) + 70, 8.0);
  }

  if (frameCount%16 == 0) {
  float[] pitches = {
  pitchSet[(int)random(setSize)]+keyRoot-12, pitchSet[(int)random(setSize)]+keyRoot-12
  };

    sc3.playChord(pitches, random(50)+30, 4.0);
  }
}

//Shape of the eyes

void eye(float x, float y) {
  fill(255, 50);
  ellipse(x+80, y, 100, 100); // White circle
  fill(0);
  ellipse(x+90, y, 40, 40); // iris
  fill(255);
  ellipse(x+100, y, 10, 10); // Small, white circle
  fill(255);
  ellipse(x, y, 100, 100); // White circle
  fill(0);
  ellipse(x+10, y, 40, 40); // iris
  fill(255);
  ellipse(x+20, y, 10, 10); // Small, white circle

//Setting shape and movement of the background colours
  for (int i=0; i<32; i++) {  
  rotate(PI/20.0*8);
  ellipse(gx, gy*6, gx, 19/gx+6);
  fill(c2, c3, c1, c1);
  rotate(PI/80*5*1);
  ellipse(20, gy, 40, gx);
  fill(c1, c2, c3, 30);    
  }  
}
    void update(int x) 
{
 
  gx = x/4;
  gy = 100-x/5;
  if (gx < 10) {
    gx = 10+c1;
  } else if (gx > 90) {
    gx = gx+c2;
  }
  if (gy > 90) {
    gy = c3/6;
  } else if (gy < 10) {
    gy = 10+c1;
  }
}
void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(img);
}

