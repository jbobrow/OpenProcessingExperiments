
class Circle
{
  float x;
  float y;
  int siz;
  int track;  //the track it travels in. Starting from 0 to work with array indexing nicely.
  boolean live;  //each circle may fire its ding only once in its little life
  
  Circle(int xx, int yy, int s, int t)
  {
    x = xx;
    y = yy;
    siz = s;
    track = t;
    siz = s;
    live = true;
  }
  
  void display(boolean ding)
  {
    if (ding) {
      fill(#000000);
    } else {
      noFill();
    }
    stroke(0);
    ellipse(x, y, siz, siz);
    noStroke();
  }
  
  void ding()
  {
    int index = int(map(this.y, height, 0, 0, scaleArray.length - 1));  //remember higher y coords are lower numbers
    index = constrain(index, 0, scaleArray.length - 1);  // y values can be off the screen, array indexes dont tolerate this
    Oscillator wave = (Oscillator)signalArray.get(track);
    wave.setFreq(scaleArray[index]);
    wave.setAmp(0.3);
    if (!out.isEnabled(wave)) {
      out.enableSignal(track);
    }
  }
  
}


