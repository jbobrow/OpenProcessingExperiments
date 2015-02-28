
class CustomSignal extends Oscillator {
  public int id;

  void setID(int _id) {
    id = _id;
  }

  public CustomSignal(float frequency, float amplitude, float sampleRate) {
    super(frequency, amplitude, sampleRate);
  }

  protected float value(float step) {
    switch(id % 4) {
    case 0 : 
      return (1 - 4 * Math.abs(Math.round(step) - step)) * 0.2; //triangle
    case 1 : 
      return (step < 0.5 ? 1 : -1) * 0.08; //square
    case 2 : 
      return 2 * ( step - (float)Math.round(step)) * 0.06; //saw
    default : 
      return (float)Math.sin(TWO_PI*step) * 0.24; //sine
    }
  }
}


