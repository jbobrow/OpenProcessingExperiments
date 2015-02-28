
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

float size=1024/10;
int[] randomCoordX = new int[(int)size];
int[] randomCoordY = new int[(int)size];
color[] colorade = new int[(int)size];

Minim minim;
AudioInput in;
FFT fft;
void setup()
{
  smooth();
  noStroke();
  size(800, 800);
  background(255);
  minim = new Minim(this);
  in = minim.getLineIn();
  for (int i = 0; i < size; i++) {
    randomCoordX[i]=(int)random(-3, 3);
    randomCoordY[i]=(int)random(-3, 3);
    //randomCoordX[i]=(int)map(i, 0, size, -3, 3);
    //randomCoordY[i]=(int)map(i, 0, size, 3, -3);
    println(randomCoordX[i]+", "+randomCoordY[i]);
    colorade[i]=color(map(i, 0, size, 100, 255),  0,map(i, 0, size, 255, 0));
  }
}

void draw()
{
  display();
}

void display() {
  fill(255, 10);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  rotate(radians(-45)); 
  for (int i = 0; i < size; i++) {
    float multiplier = in.left.get(i)*(size-i)*10;
    fill(colorade[i]);
    beginShape();
    vertex(0, 0);
    vertex(randomCoordX[i]*multiplier, randomCoordY[i]*multiplier);
    vertex((randomCoordX[i]+1)*multiplier, (randomCoordY[i]+1)*multiplier);
    vertex(0, 0);
    endShape(CLOSE);
  }
}



