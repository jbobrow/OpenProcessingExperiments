
import controlP5.ControlListener;

/**
 * An LFO for Processing
 * Not to be used for audio
 * 'freq' also determines number of unique steps
 * Setting freq = 2 means step() returns one of two values
 * It's weirder if you set freq to 2.5, get different values each cycle!
 */
class Oscillator implements ControlListener {
  
  int _t; //timestep
  float _freq;
  float _phase;
  
  public Oscillator(float lambda, float phase) {
    assert lambda!=0 : "freq must be non-zero!";
    
    _t = 1;
    setLambda(lambda);
    setPhase(phase);
  }
  
  /**
   * Get next step in oscillation
   */
  public float step() {
    float sine = sin(_freq*_t + _phase);
    _t++;
    return sine;
  }
  
  
  public Oscillator setLambda(float lambda) {
    assert lambda!=0 : "wavelength must be non-zero!";
    _freq = TWO_PI/lambda;
    return this;
  }
  
  public Oscillator setFreq(float freq) {
    assert freq!=0 : "wavelength must be non-zero!";
    _freq = freq;
    return this;
  }
  
  public Oscillator setPhase(float phase) {
    _phase = phase;
    return this;
  }
  
  public Oscillator setStep(int t) {
    _t = t;
    return this;
  }
  
  public void controlEvent(ControlEvent e) {
    Controller c = e.controller();
    switch(c.id()) {
      case(1):
        setLambda(c.value());
        break;
      case(2):
        setPhase(c.value());
        break;
      case(3):
        setFreq(c.value());
        break;
    }
  }
}

