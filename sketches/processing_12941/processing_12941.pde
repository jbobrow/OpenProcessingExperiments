
int frameWidth = 600;
int frameHeight = 600;
SoundWave[] Wave1 = new SoundWave[99];
int i = 0;
 
void setup() {
  size(frameWidth,frameHeight);
  background(90);
  smooth();
  frameRate(10);
}
 
void draw() {
  
  if(mousePressed && i < Wave1.length){
    Wave1[i] = new SoundWave();
    i = i + 2;
  }
 
  for(int ab = 0; ab < Wave1.length; ab++){
    if(Wave1[ab] != null) {
      Wave1[ab].move();
      Wave1[ab].display();
    }
  }
 
}
class SoundWave {
  float grownVal;
  float waveSize;
 
  SoundWave() {
    waveSize = random(15,20);
    grownVal = random(5,20);
  }
 
 
  void display() {
    ellipse(mouseX,mouseY,waveSize,waveSize);
    fill (50, 60, 180, 250);
  }
  
 
  void move() {

    if(waveSize > frameWidth * 4 || waveSize > 05){
      grownVal = grownVal * (-1.2);
    }
    waveSize = waveSize + grownVal; 
  }
  
}


