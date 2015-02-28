
class Audio {
  int instrument, pitch, dynamic, duration;
  SoundCipher score;
  Audio(int h, int pitch, int dynamic, int duration, SoundCipher score) {
    float[] inst = {
      104, 33, 81, 94, 36, 91, 108, 12, 98, 102, 115
    };
    pitch = pitch;
    dynamic = dynamic;
    duration = duration;
    score = score;
    instrument=(int)inst[getInstrument(h, inst)];
    // define instrument
    score.instrument(instrument);
    // play the audio
    score.playNote(pitch, dynamic, duration);
  }

  int getInstrument(float hu, float[] inst) {
    // write logic to map hue values to your instrument array
    int ins = (int)map(hu, 0, 255, 0, inst.length-1);
    return ins;
  }
}


