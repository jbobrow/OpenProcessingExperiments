
// Perlin java dancing
// by Maxime Gaillard
// some code borrowed from
/**
 * Noise2D 
 * by Daniel Shiffman.  
 * 
 * and
 *
 * SoundCipher library example by Andrew R. Brown
**/



import arb.soundcipher.*;

float[] perl=new float[320000];
float[] temp= new float[400];
int[] danse = new int[10];
float increment = 0.02;
float c;
int inc=0;
float note;

SoundCipher sc = new SoundCipher(this);
SoundCipher sc2 = new SoundCipher(this);
float[] pitchSet = {57, 60, 60, 60, 62, 64, 67, 67, 69, 72, 72, 72, 74, 76, 79};
float setSize = pitchSet.length;
float keyRoot = 0;
float density = 0.8;


void setup() {
  size(400,400);
  colorMode(HSB);
  smooth();
  noiseDetail(32);
  getNoise();
  sc.instrument(0.0f);
  sc2.instrument(0.0f);
  for(int i=0;i<10;i++) danse[i]=int(random(16000));
  frameRate(30);
  sc.channel(1);
  sc2.channel(2);
}

void draw() {
  println(frameRate);
  scroll();
  fill(perl[0],perl[150],perl[3000],140);
  ellipse(perl[danse[0]]*1.5, perl[danse[1]]*1.5,perl[danse[2]]/2,perl[danse[3]]/2);
  fill(perl[300],255,perl[375],140);
  rect(perl[danse[4]]*1.5, perl[danse[5]]*1.5,perl[danse[6]]/2,perl[danse[7]]/2);
  playNotes();
}

void getNoise(){
  //-------------- get perlin noise from window xy
  float xoff = 0.0; // Start xoff at 0
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      perl[x+y*width]=noise(xoff,yoff)*255;
    }
  }
  //---------------- duplicate by symetry
  int s=width*height;
  for (int x = 0; x < width; x++) {
    inc=0;
    for (int y = 0; y < height; y++) {
      inc++;
      perl[s+x+y*width]= perl[x+(height-inc)*width];
    }
  }
}
  
void scroll(){
  //------------------------- scroll perlin noise
  arrayCopy(perl,0,temp,0,width);
  arrayCopy(perl,width,perl,0,perl.length-width);
  arrayCopy(temp,0,perl,perl.length-width,temp.length);
  //-------------- rotate palette and print to screen
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    c=(perl[i]+frameCount)%255 ;
    pixels[i] = color(c,128,196,255);
  }
  updatePixels();
}

void playNotes(){
    if ((frameCount%6 == 0)&&(random(1) < density)) {
    int s=int(perl[danse[0]]*2+perl[danse[1]]*2*width);
    note=map(perl[s],0,255,0,setSize);
    sc.playNote(pitchSet[(int)note]+keyRoot, random(90)+30, random(20)/10 + 0.2);
  }  
  if (frameCount%24 == 0) {
    keyRoot = (random(4)-2)*2;
    density = random(7) / 10 + 0.3;
    sc2.playNote(36+keyRoot, random(20) + 90, 8.0);
  }
}

void keyPressed(){
  for(int i=0;i<10;i++) danse[i]=int(random(16000));
}

