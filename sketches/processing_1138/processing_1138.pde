
 import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
ByteSynth byteSynth;

float frequencyScale = PI / 2;

void setupSynth(PppProgram program) {
    minim = new Minim(this);
    out = minim.getLineOut(Minim.MONO, 1024, 44100 / 2);
    byteSynth = new ByteSynth(program);
    out.addSignal(byteSynth);
}

void stop() {
  out.close();
  minim.stop();
  super.stop();
}

class ByteSynth implements AudioSignal {
  PppProgram program;
  
  ByteSynth(PppProgram program) {
    this.program = program;
  }
  
  int curPosition = 0;
  int feedbackPosition = 0;
  void generate(float[] samp) {
    float sumPosition = 0;
    for(int i = 0; i < samp.length; i++) {
      sumPosition += program.loopGet(curPosition) * frequencyScale;
      samp[i] = sin(sumPosition);
      curPosition++;
    }
    frequencyScale = map(samp[feedbackPosition], -1, +1, -TWO_PI, +TWO_PI);
    feedbackPosition = (feedbackPosition + mouseY) % samp.length;
  }
  
  // this is a stricly mono signal
  void generate(float[] left, float[] right) {
    generate(left);
    generate(right);
  }
}

