
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

float size=1024/10;
int[] randomCoordX = new int[(int)size];
int[] randomCoordY = new int[(int)size];
color[] colorade = new int[(int)size];
float count=0;

Minim minim;
AudioInput in;
FFT fft;
void setup()
{
  smooth();
  noStroke();
  size(800, 800);
  background(0);
  minim = new Minim(this);
  in = minim.getLineIn();

  for (int i = 0; i < size; i++) {
    randomCoordX[i]=(int)random(-3, 3);
    randomCoordY[i]=(int)random(-3, 3);
    colorade[i]=color( map(i, 0, size, 0, 255), 200, map(i, 0, size, 200, 0), 100 );
  }
}

void draw()
{
  display();
}

void display() {
  fill(0, 10);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  pushMatrix();
  rotate(radians(count)); 
  for (int i = 0; i < size; i++) {
    float multiplier = in.left.get(i)*(size-i)*50;
    fill(colorade[i]);
    bezier(0, 0, randomCoordY[i]*multiplier, randomCoordX[i]*multiplier, (randomCoordX[i]+1)*multiplier, (randomCoordY[i]+1)*multiplier, 0, 0);
  }
  count+=1;
  popMatrix();
}



