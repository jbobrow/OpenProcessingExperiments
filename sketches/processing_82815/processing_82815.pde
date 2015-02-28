
float probability = 0;
float ellSize;
int x;
int dir;
import ddf.minim.*;//processing.org     
import ddf.minim.signals.*;//processing.org

Minim minim;
AudioOutput out;
SineWave sine;
//processing.org
void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  imageMode(CENTER);
  smooth();
  ellSize=0;


  size(800, 600, P3D);
  background(75, 89, 38);
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);
  //processing.org
}


void draw() {
  probability = random(1);
  stroke(random(255), random(255), random(255));
  strokeWeight(random(35));

  if (mousePressed) {

    line(mouseX, mouseY, pmouseX, pmouseY);

    rect(500, 550, 20, 20);

    rect(500, 300, 30, 30);

    rect(20, 70, 10, 10);

    rect(100, 150, 20, 20);

    if (mouseX>100 && mouseX<120 && mouseY>150 && mouseY<170) {
      //fill
      if (mouseX>100 && mouseX<120 && mouseY>150 && mouseY<170) {
        println("YES!");
      }
      if (mousePressed) {
        translate(200, 200);
        for (int i=0; i<180; i++) {
          if (probability < .005) {
            fill(0, 100, 100 );
          } 
          else if (probability < .0001) {
            fill(0, 0, 100);
          } 
          else {
            fill(0, 0, 0);
          }

          rect(i++, i++, 500, 10);
          rotate(radians(45));
        }
      } 

      else {
        fill(6, 17, 111);
      }
    }
    else {
      fill(255);
    }

    textSize(32);
    text("begin", 100, 100);
    fill(0);

    if (mouseX>20 && mouseX<40 && mouseY>70 && mouseY<90) {
      if (mouseX>20 && mouseX<40 && mouseY>70 && mouseY<90) {
        println("yee");
      }
      if (mousePressed) {
        sine.setFreq(10000);//processing.org
      }
    }
  }
  if (mouseX>500 && mouseX<530 && mouseY>300 && mouseY<330) {
    //fill
    if (mouseX>500 && mouseX<530 && mouseY>300 && mouseY<330) {
      println("oskry");
      if (mousePressed) {
        ellipse(width/2, height/2, ellSize, ellSize);
        ellSize++;
        if (ellSize > 2000) {
          ellSize = 40;
        }
      }
    }
  }
  if (mouseX>500 && mouseX<520 && mouseY>550 && mouseY<570) {
    //fill
    if (mouseX>500 && mouseX<520 && mouseY>550 && mouseY<570) {
      println("no!");
    }
    if (mousePressed) {
      background (random(100));


      for (int i=0; i<180; i++) {
        if (probability < .005) {
          fill(0, 100, 100 );
        } 
        else if (probability < .0001) {
          fill(0, 0, 100);
        } 
        else {
          fill(0, 0, 0);
        }
      }
    }
  }
  save("collageME.jpeg");//processing.org
}


void mouseMoved()
{
  // with portamento on the frequency will change smoothly
  float freq = map(mouseY, 0, height, 1500, 60);//processing.org
  sine.setFreq(0);//processing.org
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = map(mouseX, 0, width, -1, 1);//processing.org
  sine.setPan(pan);
  //processing.org
}
void stop()
{
  out.close();//processing.org
  minim.stop();//processing.org

  super.stop();//processing.org
}
