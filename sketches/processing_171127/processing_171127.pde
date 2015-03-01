
//Electric Fire Visualizer
//By: Johnny Dunn
//Last Edit: November 12 2014

 
import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioPlayer song;
FFT fft;
AudioInput in;
float num;
float[] angle;
float[] y, x;
float freq;
float k = 0;
float p = 0;
 
//Credit for the flame shape / movement from Michael Pinn
 
 
void setup()
{
  size(1280, 768, P3D);
  frameRate(30.0f);
  background(0);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 1024, 48000.0);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  y = new float[fft.specSize()];
  x = new float[fft.specSize()];
  angle = new float[fft.specSize()];
   
}
 
 
void draw()
{
       rectMode(CENTER);
       fill(0,0,0,20);
       rect(width/2, height/2, width, height);
 
  fft.forward(in.mix);
  drawRoseCenter();
  drawRoseRight();
  drawRoseLeft();
  drawRoseLCenter();
  drawRoseRCenter();
  drawRoseRCenter1();
  drawRoseRCenter2();
  drawRoseRCenter3();
  drawRoseRCenter4();
  drawRoseLCenter1();
  drawRoseLCenter2();
  drawRoseLCenter3();
  drawRoseLCenter4();
 
   
 
}
 
 
void keyPressed()
{
  if (keyCode == UP) {
    k+=5;
      } else if (keyCode == DOWN) {
    k-=5;
  }
  if (keyCode == RIGHT) {
    p+=5;
  } else if (keyCode == LEFT) {
    p-=5;
     
}
}
void drawRoseCenter() {
    pushMatrix();
      translate(width/2, height);
      for (int q = 60; q > 0; q--) {
        beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i)*random(7.5,10.0f)+k); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);i+=fft.getFreq(i)/5000)
          //angle[i] = angle[i] + fft.getFreq(i)/2000;
          fill(fft.getFreq(i)/fft.getBand(i)+(fft.getFreq(i)*p), random(0.0f,35.0f), fft.getFreq(i));
          float d = map(q, 60, 0, 4, 0.1);
          num += fft.getFreq(i) * fft.getBand(i) / 1000;
          vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
        
 
         }
       endShape();
      }
    popMatrix();
 
}
 
 
void drawRoseLeft() {
    pushMatrix();
      translate(width-70, height);
      for (int q = 60; q > 0; q--) {
        beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i)+random(k/1.1f,k/1.5f)); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);
        //angle[i] = angle[i] + fft.getFreq(i)/2000;
          fill(fft.getFreq(i)/fft.getBand(i)+p, random(35.0f,70.0f), fft.getFreq(i));
        float d = map(q, 60, 0, 4, 0.1);
        num = fft.getFreq(i) * fft.getBand(i) / 1000;
        vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
 
        }
      endShape();
      }
    popMatrix();
 
}
 
void drawRoseRight() {
    pushMatrix();
      translate(5, height);
      for (int q = 60; q > 0; q--) {
      beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i)+random(k/1.1f,k/1.5f)); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);
       //angle[i] = angle[i] + fft.getFreq(i)/2000;
          fill(random(0.0f,35.0f),fft.getFreq(i)/fft.getBand(i)+p, fft.getFreq(i));
      float d = map(q, 60, 0, 4, 0.1);
      num = fft.getFreq(i) * fft.getBand(i) / 1000;
      vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
 
      }
      endShape();
    }
    popMatrix();
 
}
 
 
void drawRoseLCenter() {
    pushMatrix();
      translate(550, height);
      for (int q = 60; q > 0; q--) {
        beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i)*random(6.0f,7.0f)+k); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);
          //angle[i] = angle[i] + fft.getFreq(i)/2000;
          fill(fft.getFreq(i)/fft.getBand(i)+p, fft.getFreq(i), random(35.0f,70.0f));
          float d = map(q, 60, 0, 4, 0.1);
          vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
          num += fft.getFreq(i) * fft.getBand(i) / 1000;
         }
       endShape();
      }
    popMatrix();
 
}
 
void drawRoseRCenter() {
    pushMatrix();
      translate(width-180, height);
      for (int q = 60; q > 0; q--) {
        beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i)+random(k/1.1f,k)); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);
          fill(fft.getFreq(i)/fft.getBand(i)+p, fft.getFreq(i), random(0.0f,35.0f));
          //angle[i] = angle[i] + fft.getFreq(i)/2000;
          float d = map(q, 60, 0, 4, 0.1);
          num += fft.getFreq(i) * fft.getBand(i) / 1000;
          vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
         }
       endShape();
      }
    popMatrix();
 
}
 
void drawRoseRCenter1() {
    pushMatrix();
      translate(width-290, height);
      for (int q = 60; q > 0; q--) {
        beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i) * random(3.5f,5.0f) + k); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);5
          //angle[i] = angle[i] + fft.getFreq(i)/2000;
          fill(random(35.0f,70.0f),fft.getFreq(i)/fft.getBand(i) +p, fft.getFreq(i));
          float d = map(q, 60, 0, 4, 0.1);
          vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
          num += fft.getFreq(i) * fft.getBand(i) / 1000;
         }
       endShape();
      }
    popMatrix();
 
}
 
void drawRoseRCenter2() {
    pushMatrix();
      translate(width-370, height);
      for (int q = 60; q > 0; q--) {
        beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i)*random(1.5f,3.0f)+k); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);
         //angle[i] = angle[i] + fft.getFreq(i)/2000;
          fill(fft.getFreq(i)/fft.getBand(i) + p, random(0.0f,35.0f), fft.getFreq(i));
          float d = map(q, 60, 0, 4, 0.1);
          num += fft.getFreq(i) * fft.getBand(i) / 1000;
          vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
         }
       endShape();
      }
    popMatrix();
 
}
 
void drawRoseRCenter3() {
    pushMatrix();
      translate(width-445, height);
      for (int q = 60; q > 0; q--) {
        beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i) * random(3.5f,5.0f) + k); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);5
          //angle[i] = angle[i] + fft.getFreq(i)/2000;
          fill(random(35.0,70.0f), fft.getFreq(i), fft.getFreq(i)/fft.getBand(i)+p);
          float d = map(q, 60, 0, 4, 0.1);
          num += fft.getFreq(i) * fft.getBand(i) / 1000;
          vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
         }
       endShape();
      }
    popMatrix();
 
}
 
 
void drawRoseRCenter4() {
    pushMatrix();
      translate(width-540, height);
      for (int q = 60; q > 0; q--) {
        beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i)*random(5.5,7.0)+k); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);
          //angle[i] = angle[i] + fft.getFreq(i)/2000;
          fill(fft.getFreq(i),random(0.0f,35.0f), fft.getFreq(i)/fft.getBand(i)+p);
          float d = map(q, 60, 0, 4, 0.1);
          num += fft.getFreq(i) * fft.getBand(i) / 1000;
          vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
         }
       endShape();
      }
    popMatrix();
 
}
 
void drawRoseLCenter1() {
  pushMatrix();
      translate(400, height);
      for (int q = 60; q > 0; q--) {
        beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i)*random(3.5,6.5f)+k); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);
          //angle[i] = angle[i] + fft.getFreq(i)/2000;
          fill(random(35.0f,70.0f), fft.getFreq(i)/fft.getBand(i) + p, fft.getFreq(i));
          float d = map(q, 60, 0, 4, 0.1);
          num += fft.getFreq(i) * fft.getBand(i) / 1000;
          vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
         }
       endShape();
      }
    popMatrix();
 
}
 
void drawRoseLCenter2() {
    pushMatrix();
      translate(320, height);
      for (int q = 60; q > 0; q--) {
        beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i) * random(3.5f,6.5f)); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);
          //angle[i] = angle[i] + fft.getFreq(i)/2000;
          fill(fft.getFreq(i)/fft.getBand(i), random(0.0,35.0f), fft.getFreq(i));
          float d = map(q, 60, 0, 4, 0.1);
          num += fft.getFreq(i) * fft.getBand(i) / 1000;
          vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
         }
       endShape();
      }
    popMatrix();
 
}
 
void drawRoseLCenter3() {
    pushMatrix();
      translate(220, height);
      for (int q = 60; q > 0; q--) {
        beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i) * random(1.5f,3.0f) + k); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);5
          //angle[i] = angle[i] + fft.getFreq(i)/2000;
          fill(fft.getFreq(i)/fft.getBand(i) +p, random(35.0f,70.0f), fft.getFreq(i));
          float d = map(q, 60, 0, 4, 0.1);
          num += fft.getFreq(i) * fft.getBand(i) / 1000;
          vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
         }
       endShape();
      }
    popMatrix();
 
}
 
void drawRoseLCenter4() {
    pushMatrix();
      translate(120, height);
      for (int q = 60; q > 0; q--) {
        beginShape(TRIANGLE_STRIP);
          for(int i = 0; i < (fft.getFreq(i)+random(k/1.1f,k)); i+= 12){      //float d = map(i, 60, 0, 4, 0.1);
          //angle[i] = angle[i] + fft.getFreq(i)/2000;
          fill(fft.getFreq(i)/fft.getBand(i)+p, random(0.0f,35.0f), fft.getFreq(i));
          float d = map(q, 60, 0, 4, 0.1);
          num += fft.getFreq(i) * fft.getBand(i) / 1000;
          vertex(sin(radians(i*2))*50+sin(q+i+num)*50, cos(radians(i*2))*50-i*d);
         }
       endShape();
      }
    popMatrix();
 
}

void stop()
{
  // always close Minim audio classes when you are done with them
  song.close();

}

