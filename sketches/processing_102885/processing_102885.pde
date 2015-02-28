
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave[] waves;
int[] sums;

void setup() {
  size(780, 400);
  smooth();
  sums = new int[width];
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  waves = new SineWave[60];
  float f = 40.0f;
  float g = 100.0f;
  for(int i=0; i<waves.length; ++i) {
    waves[i] = new SineWave((f+g)/2, 0.05f, out.sampleRate());
    waves[i].portamento(100);
    out.addSignal(waves[i]);
    f *= 1.062f;
    g += 80.0f;
  }
}

float theta1=0.0f, theta2=0.0f;
float delta1=0.11f, delta2=0.17f;
float radius1=233.0f, radius2=260.0f;

void draw() {
  background(255);
  
  noStroke();
  fill(255, 200, 220, 192);
  
  theta1 += delta1;
  theta2 += delta2;
  
  float x1 = sin(theta1) * (300 - radius1) / 2;
  float y1 = cos(theta1) * (300 - radius1) / 2;
  ellipse(300+x1, 200+y1, radius1, radius1);
  
  float x2 = cos(theta2) * (300 - radius2) / 2;
  float y2 = sin(theta2) * (300 - radius2) / 2;
  ellipse(480+x2, 200+y2, radius2, radius2);
  
  loadPixels();
  for(int i=0; i<width; ++i)
    sums[i] = 0;
  for(int i=width*height-1; i>=0; --i) {
    boolean b = (green(pixels[i]) < 210);
    if(b) ++sums[i%width];
  }
  
  background(255);
  strokeWeight(1);
  stroke(255, 128, 0);
  for(int i=0; i<width; ++i) {
    line(i, height-sums[i], i, height);
    if((i % 2 == 0) && (i >= 330) && (i < 450)) {
      waves[(i - 330) / 2].setAmp(
        sq((sums[i] + sums[i+1]) / 4000.0f)
      );
    }
  }
  
  stroke(192, 128, 128);
  line(330, 0, 330, height);
  line(450, 0, 450, height);


  strokeWeight(2);
  stroke(190, 200, 220);
  noFill();
  ellipse(300, 200, 300, 300);
  ellipse(480, 200, 300, 300);
  
  
  noStroke();
  fill(220, 255, 200, 128);
  ellipse(300+x1, 200+y1, radius1, radius1);
  ellipse(480+x2, 200+y2, radius2, radius2);
}


