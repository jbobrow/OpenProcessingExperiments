
class Ball
{
  float x;
  float y;
  float r = 0;
  float c_r = 0;
  float c_g = 255;
  float c_b = 0;
  float speed = 6;
  boolean d;
  float col = -10;

  float offsetx = 0;
  float offsety = 0;

  int explod = 0;
  float explodacc = 1;

  boolean deletme = false;

  AudioOutput out;
  SineWave sine;

  Ball(float xp, float yp, Minim minim)
  {
    x = xp;
    y = yp;

    out = minim.getLineOut(Minim.STEREO);
    sine = new SineWave(440, 0.5, out.sampleRate());
    sine.portamento(200);
    out.addSignal(sine);
  } 

  void say(String stri) {
    println(stri + " " + x);
  }

  void drawme() {
    if(explodacc<10000) {
      pushMatrix();
      translate(x, y);
      rotate(r);
      fill(c_r,c_g,c_b,200);
      noStroke();
      //strokeWeight(10);

      rect(col, 0+offsety, 20, 100); 
      rect(col, -100-offsety, 20, 100); 

      rect(-100-offsetx, -10,100, 20);
      rect(0+offsetx, -10, 100, 20);

      ellipse(0+offsetx, 0, 80, 80);
      fill(255);
      ellipse(0+offsetx, 0, 20, 20);
      popMatrix();

      if(explod > 0) {
        println("exploding");
        offsetx += explodacc;
        offsety += explodacc;
        explodacc *= 1.1;
        explod--;
      }
    }
  }

  void rotplus() {
    if(explodacc<10000) {
      r += (PI/180)*speed;

      //float freq = map(r, 0, 120, speed*12, 300);
      float freq = map(speed*12, 0, 120,10, 300);
      sine.setFreq(freq);
    }
  }


  float speedUp() {
    if(explodacc<10000) {
      col = col + 10;

      if (dist(x, y, mouseX, mouseY) < 50) {
        speed = speed+10;
        c_r=c_r+30;
        c_g=c_g-30;
        c_b=c_b;
        if (speed>120) {
          out.noSound();
          p.loop(0);


          /*
          c_r=0;
           c_g=0;
           c_b=0;
           */

          explo();
        }
      }
    }
    return speed;
  }

  void explo() {
    explod = 100;
  }
}


