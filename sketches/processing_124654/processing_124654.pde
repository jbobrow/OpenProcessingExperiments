
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine1;
SineWave sine2;

float freq1, freq2;
ArrayList entries;
ArrayList uglyEntries;
PFont font;


void setup()
{
  background(0);
  frameRate(8);
  size(500, 500, P3D);
  entries = new ArrayList();
  uglyEntries = new ArrayList();

  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine1 = new SineWave(440, 0.5, out.sampleRate());
  sine2 = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine1.portamento(200);
  sine2.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine1);
  out.addSignal(sine2);
  font = createFont("SansSerif-32.vlw", 16);
  
}

void draw()
{
  background(0);
stroke(255);
  textFont(font, 16);
  text("Move your mouse around the screen. If the sound you hear strikes you as being especially beautiful, press 'a.' If it strikes you as especially ugly or difficult to listen to, press 'z.'", 10, height-100, width-20, height);
  // draw the waveforms
  for (int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i-10, 0, out.bufferSize(), 0, width);
    stroke(255, int(map(freq1, 23, 522, 0, 255)), int(map(freq2, 23, 522, 0, 255)));
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, height/2+50 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
    println(freq1 + ", " + freq2);
  }

  for (int j = 0; j <entries.size(); j++) {
    Entry e = (Entry) entries.get(j);
    e.update();
    e.display();
  }
  for (int k = 0; k<uglyEntries.size(); k++) {
    UglyEntry u = (UglyEntry) uglyEntries.get(k);
    u.update();
    u.display();
  }
}

void mouseMoved()
{
  freq1 = map(mouseX, 0, height, 23, 522);
  sine1.setFreq(freq1);

  freq2 = map(mouseY, 0, width, 23, 522);
  sine2.setFreq(freq2);

  for (int i = 0; i <entries.size(); i++) {
    Entry e = (Entry) entries.get(i);

    if (dist(mouseX, mouseY, e.xVal, e.yVal) < e.w + 10) {
      e.changeColor = true;
    } 
    else {
      e.changeColor = false;
    }
  }

  for (int j = 0; j <uglyEntries.size(); j++) {
    UglyEntry u = (UglyEntry) uglyEntries.get(j);

    if (dist(mouseX, mouseY, u.xVal, u.yVal) < u.w + 10) {
      u.changeColor = true;
    } 
    else {
      u.changeColor = false;
    }
  }
}

void keyPressed() {
  if (key == 'a') {
    noStroke();
    entries.add(new Entry());
    loadStrings("http://www.eamonabraham.com/finaltest/sendit.php?freq1=" + freq1 + "&freq2=" + freq2 + "&feeling=" + "beautiful");
    println(mouseX + ", " + mouseY);
  }

  if (key == 'z') {
    noStroke();
    uglyEntries.add(new UglyEntry());
    loadStrings("http://www.eamonabraham.com/finaltest/sendit.php?freq1=" + freq1 + "&freq2=" + freq2 + "&feeling=" + "ugly");
  }
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}

class Entry {
  color color1;
  color color2;
  int xVal;
  int yVal;
  int w;
  String message;
  boolean changeColor = false;

  Entry () {
    xVal = mouseX;
    yVal = mouseY;
    w = 5;
    color1 = color(map(xVal, 0, width, 0, 255));
    color2 = color(map(yVal, 0, height, 0, 255));
    message = " ";
  }

  void update() {
    if (changeColor) {
      color1 = color(255, 30);
    } 
    else {
      color1 = color(255, map(xVal, 0, width, 0, 255), map(yVal, 0, height, 0, 255));
      color2 = color(map(yVal, 0, height, 0, 255), map(xVal, 0, width, 0, 255), 100);
    }
  }
  void display() {
    noStroke();
    if (changeColor) {
      fill(255);
      ellipse(xVal, yVal, w, w);
      w = 20;
    } 
    else {
      fill(color1, 100);
      ellipse(xVal, yVal, w, w);

      fill(color2, 100);
      ellipse(xVal, yVal, w, w);
      w =5;
    }
  }
}


class UglyEntry {
  color color1;
  color color2;
  int xVal;
  int yVal;
  int w;
  String message;
  boolean changeColor = false;

  UglyEntry () {
    xVal = mouseX;
    yVal = mouseY;
    w = 5;
    color1 = color(map(xVal, 0, width, 0, 255));
    color2 = color(map(yVal, 0, height, 0, 255));
    message = " ";
  }

  void update() {
    if (changeColor) {
      color1 = color(255, 30);
    } 
    else {
      color1 = color(255, map(xVal, 0, width, 0, 255), map(yVal, 0, height, 0, 255));
      color2 = color(map(yVal, 0, height, 0, 255), map(xVal, 0, width, 0, 255), 100);
    }
  }
  void display() {
    noStroke();
    if (changeColor) {
      fill(255);
      ellipse(xVal, yVal, w, w);
      w = 20;
    } 
    else {
      fill(color1, 100);
      ellipse(xVal, yVal, w, w);

      fill(color2, 100);
      ellipse(xVal, yVal, w, w);
      w =5;
    }
  }
}



