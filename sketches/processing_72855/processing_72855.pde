
class ArcChain {
  float x, w;
  boolean pos;
  color c;
  int note, currFrame;
  SawWave sine;
  ArcChain(float w, color c, int note, int currFrame) {
    this.w = w;
    this.pos = true;
    this.x = 0;
    this.c = c;
    this.note = note;
    this.sine =  new SawWave(440, 0.5, 44100);
    this.currFrame = currFrame;
    playNote(note*50);
  }

  void move(int frame) {
    stroke(0, 0, 0, 80);
    fill(c);
    if (this.x>0) {
      for (float i=(this.x-this.w); i>=0; i-=this.w) {
        if ((i/this.w)%2 == 0) {
          arc((this.w/2)+i, height/2, this.w, this.w, -PI, 0);
        } 
        if ((i/this.w)%2 != 0) {
          arc((this.w/2)+i, height/2, this.w, this.w, 0, PI);
        }
      }
    }
    if (this.x<width) {
      float remainder;
      if (frame-this.currFrame != 0) {
        remainder = (frame-this.currFrame)%(this.w/4);
        println("remainder: " + remainder);
        float a1 = map(remainder, 0, this.w/4, -PI, 0);    
        float a2 = map(remainder, 0, this.w/4, PI, 0);
        stroke(0, 0, 0, 80);
        if (pos) {
          arc((this.w/2)+this.x, height/2, this.w, this.w, -PI, a1);
          changeVol(a1, this.pos);
        } 
        else {
          arc((this.w/2)+this.x, height/2, this.w, this.w, a2, PI);
          changeVol(a2, this.pos);
        };
        if (remainder == 0 && frame>0) {
          this.x += this.w;
          if (pos) {
            pos = false;
          } 
          else {
            pos = true;
          }
        }
      }
    } 
    else {
      this.sine.setAmp(0);
    }
  }
  void playNote(float freq) {
    AudioOutput out = minim.getLineOut(Minim.STEREO, 2048);
    out.addSignal(this.sine);
    this.sine.setFreq(5*freq+200);
  }
  void changeVol(float y1, boolean pos) {
    float vol = 0;
    if (pos) {
      if (y1 <= -PI/2) {
        vol = map(y1, -PI, -7*PI/8, 1, 0);
      } 
      else {
        vol = map(y1, -PI/8, 0, 0, 1);
      }
    } 
    else {
      if (y1 >= PI/2) {
        vol = map(y1, PI, 7*PI/8, 1, 0);
      } 
      else {
        vol = map(y1, PI/8, 0, 0, 1);
      }
    }
    this.sine.setAmp(vol);
  }
}


