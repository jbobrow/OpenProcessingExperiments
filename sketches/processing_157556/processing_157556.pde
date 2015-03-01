
float[] circleX;
float[] circleY;
float[] audio;

// sound input
import ddf.minim.*;
Minim minim;
AudioInput in;

void setup(){
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  circleX = new float[100];
  circleY = new float[100];
// sound input
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw(){

  float audioValue = in.right.get(0);
  audioValue = audioValue*500 +15;
  background(0, 0, 0);
//  loadPixels();
//  for(int i = 0; i <pixels.length; i++)
//  pixels[i] = color(random(255), 255, 255);
//  updatePixels();
  stroke(audioValue, 100, 100);
  noFill();
  translate(width/2, height/2);

  for(int i = 0; i < 20; i++){
    circleX[i] = random(width/2);
    circleY[i] = random(height/2);
  }

  rotate(audioValue/10);
  for(int i = 0; i < 20; i++){
    ellipse(0, 0, circleX[i]/2 + in.right.get(i)*500, circleY[i]/2 + in.left.get(i)*800);
  }
}


