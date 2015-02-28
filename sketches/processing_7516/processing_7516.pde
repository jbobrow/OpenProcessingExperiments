
import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioMetaData meta;
AudioInput input;

float speed = 0.5;
int buffers;
float[] preX, preY;

PGraphics colorWheel;

void setup(){
  size(500,500);
  
  PFont font;
  font = loadFont("DejaVuSans-18.vlw");
  textFont(font,18);
  
  minim = new Minim(this);
  player = minim.loadFile("Wataridori 2.mp3",512);
  meta = player.getMetaData();
  input = minim.getLineIn();
  player.play();
  buffers = player.bufferSize();
  
  precalcCircle();
  
  colorWheel = createGraphics(500,500,JAVA2D);
  makeColorWheel();
  
  colorMode(HSB,100);
  frameRate = 60;
  noStroke();
}

void draw(){
  background(0,0,100);
  smooth();
  image(colorWheel,0,0);
  stroke(0,0,100);
  strokeWeight(16);
  drawWaveform(230,-1);
  drawWaveform(170,1);
  stroke(0,0,0);
  strokeWeight(1);
  drawWaveform(224,-1);
  drawWaveform(176,1);
  fill(0,0,0);
  text(meta.title() + "\nby " + meta.author(),15,25);
  noFill();
  println(frameRate);
}

void makeColorWheel(){
  colorWheel.beginDraw();
  colorWheel.colorMode(HSB,100);
  colorWheel.strokeWeight(2);
  for(float i = 0; i<=100; i+=.05){
    colorWheel.stroke(i,100,100);
    float lineX = 250+(450*cos((TWO_PI/100)*i))/2;
    float lineY = 250+(450*sin((TWO_PI/100)*i))/2;
    colorWheel.line(250,250,lineX,lineY);
  }
  colorWheel.noStroke();
  colorWheel.fill(0,0,100);
  colorWheel.ellipse(250,250,350,350);
  colorWheel.endDraw();
}

//Precalculates the coordinates for the circular waveform
//and places the values into an array
void precalcCircle(){
  preX = new float[buffers];
  preY = new float[buffers];
  for(int i = 0; i < buffers; i++){
    preX[i] = cos((TWO_PI/buffers)*i);
    preY[i] = sin((TWO_PI/buffers)*i);
  }
}

//makes a circular waveform of the specified radius and channel type
//-1 is left, 1 is right, and 0 (or anything else) is mix
void drawWaveform(int radius,int channel){
  float amplitude1, amplitude2;
  float lineX1 = 250+radius, lineY1 = 250+radius,
  lineX2 = 250+radius, lineY2 = 250+radius;
  int ampRamp = 25;
  for(int i = 0; i < buffers - 1; i++){
    if(channel == -1){
      amplitude1 = player.left.get(i)*ampRamp;
      amplitude2 = player.left.get(i+1)*ampRamp;
    }
    else if(channel == 1){
      amplitude1 = player.right.get(i)*ampRamp;
      amplitude2 = player.right.get(i+1)*ampRamp;
    }
    else{
      amplitude1 = player.mix.get(i)*ampRamp;
      amplitude2 = player.mix.get(i+1)*ampRamp;
    }
    lineX1 = 250+(radius+amplitude1)*preX[i];
    lineX2 = 250+(radius+amplitude2)*preX[i+1];
    lineY1 = 250+(radius+amplitude1)*preY[i];
    lineY2 = 250+(radius+amplitude2)*preY[i+1];
    line(lineX1,lineY1,lineX2,lineY2);
    //point(lineX1,lineY1);
  }
}

void stop(){
  player.close();
  input.close();
  minim.stop();
  super.stop();
}

