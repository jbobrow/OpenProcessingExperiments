
final int CIRCLE_NUM = 3;
CircleCollection _circles = new CircleCollection(CIRCLE_NUM);
ArrayList _pg_list = new ArrayList();
StepSequence _seq;
boolean _rotate_clock_direction = true;


interface Func { 
  float func(float value);
}

interface Block {
  void block(StepSequence seq);
}

void setup() {  
//  size(500, 500);
//  size(150, 150);
  size(100, 100);
  smooth();
  frameRate(24);
  noStroke();
  
  for (int i = 0;  i < CIRCLE_NUM;  i++) {
    _pg_list.add(createGraphics(width, height));
  }  

  //final int expandCount = (int)frameRate * 3;
  final int expandCount = 40;  
  _seq = new StepSequence(); 
  
  _seq.wait(10);  
  _seq.repeat(0, new Block() { 
    public void block(StepSequence sub) {
      sub.repeat(expandCount*2, new Block() {
        public void block(StepSequence sub) {
          sub.add(HALF_PI/expandCount);
        }
      }
      ).wait(0).zerostep(new Runnable() {
        public void run() {
          updateColors();
          // _rotate_clock_direction = !_rotate_clock_direction;
//          _rotate_power += PI/12;
        }
      }
      );
    }
  }
  );
}



void draw() {
  // blendMode(ADD);
  // blendMode(SCREEN);

  background(PI/4, PI/4, PI/4);

  float value = _seq.next(); 
  float rate = sin(value) * 3.0;
  _circles.draw(rate, _pg_list);
}


void updateColors() {
  final float a = 2*PI;
  final float b = a/4;
  float r0 = random(b, a);
  float g0 = random(0, a-b);
  float b0 = random(0, a);

  float r1 = random(0, a-r0);
  float g1 = random(b, a-g0);
  float b1 = random(0, a-b0-b);

  float r2 = a - r0 - r1;
  float g2 = a - g0 - g1; 
  float b2 = a - b0 - b1;
  _circles.setSupplementR(r0, r1, r2);
  _circles.setSupplementG(g0, g1, g2);
  _circles.setSupplementB(b0, b1, b2);
}


static abstract class Step {
  float _value;
  void begin(float value) {
    _value = value;
  }
  float next() {
    return _value;
  }
  boolean isEnd() {
    return true;
  }
}

static class StepSequence extends Step {
  final ArrayList _steps = new ArrayList();
  int _stepIndex;
  boolean _needInitNextStep;

  void begin(float initValue) {
    super.begin(initValue);
    _stepIndex = 0;
  }

  float next() {
    boolean shouldContinue = true;

    while (_stepIndex < _steps.size () && shouldContinue) {
      Step step = (Step)_steps.get(_stepIndex);
      if (_needInitNextStep) {
        _needInitNextStep = false;
        step.begin(_value);
      }

      _value = step.next();

      if (step.isEnd()) {
        _stepIndex++;
        _needInitNextStep = true;
      }

      if (_stepIndex >= _steps.size()) {
        didReachLastSequence();
      }

      shouldContinue = (step instanceof ZeroStep);
    }
    return _value;
  }

  void didReachLastSequence() {
  }  

  boolean isEnd() {
    return _stepIndex >= _steps.size();
  }

  private StepSequence addStep(Step step) {
    _steps.add(step);
    return this;
  }

  StepSequence repeat(int repeatCount, Block block) {
    StepSequence sub = new StepRepeat(repeatCount);
    addStep(sub);
    block.block(sub);
    return this;
  }

  StepSequence wait(int waitCount) {
    if (waitCount > 0) {
      StepSequence sub = new StepRepeat(waitCount);
      addStep(sub);
      sub.addStep(new OneStep());
    }
    return this;
  }

  StepSequence zerostep(Runnable run) {
    return addStep(new ZeroStep(run));
  }

  StepSequence set(float value) {
    return addStep(new StepSet(value));
  }  
  StepSequence add(float arg) {
    return addStep(new StepAdd(arg));
  }
  StepSequence multiply(float arg) {
    return addStep(new StepMultiply(arg));
  }

  StepSequence func(Func f) {
    return addStep(new StepFunc(f));
  }
}

static private class StepRepeat extends StepSequence {
  int _repeatCount;
  int _count;

  StepRepeat(int repeatCount) {    
    _repeatCount = repeatCount;
  }

  void begin(float value) {
    super.begin(value);    
    _count = 0;
  }

  void didReachLastSequence() {
    _count++;
    super.begin(_value);
  }  

  float next() {
    return super.next();
  }
  boolean isEnd() {
    return _repeatCount != 0 && _count >= _repeatCount;
  }
}

static private class ZeroStep extends OneStep {
  Runnable _run;
  ZeroStep(Runnable run) {
    _run = run;
  }
  float next() {
    super.next();    
    _run.run();
    return _value;
  }
}
static private class OneStep extends Step {
  boolean _isEnd;
  void begin(float value) {    
    super.begin(value);
    _isEnd = false;
  }
  float next() {
    _isEnd = true;    
    return 0;
  }
  boolean isEnd() {
    return _isEnd;
  }
}

static private class StepSet extends OneStep {
  float _setValue;    
  StepSet(float value) {
    _setValue = value;
  }
  float next() {
    super.next();
    return _setValue;
  }
}

static private class StepFunc extends OneStep {
  Func _func;
  StepFunc(Func func) {
    _func = func;
  }
  float next() {
    super.next();
    return _func.func(_value);
  }
}


static private class StepAdd extends OneStep {
  final float _increment;
  StepAdd(float increment) {
    _increment = increment;
  }
  float next() {
    super.next();
    return _value + _increment;
  }
}
static private class StepMultiply extends OneStep {
  final float _arg;
  StepMultiply(float arg) {
    _arg = arg;
  }
  float next() {
    super.next();
    return _value * _arg;
  }
}





class CircleCollection {
  final int _colorNum;
  float _r0, _r1, _r2;
  float _g0, _g1, _g2;
  float _b0, _b1, _b2;  



  CircleCollection(int colorNum) {
    _colorNum = colorNum;
    _r0 = 2*PI;
    _g1 = 2*PI;
    _b2 = 2*PI;
  }


  void draw(final float distance_rate, ArrayList pg_list) {
    colorMode(RGB, 2*PI);
    final float l = min(width, height);  
    final float cross = l/(_colorNum * _colorNum) * 4;
    final float r = (width-cross)/4;    

    for (int i = 0;  i < _colorNum;  i++) {
      PGraphics pg = (PGraphics)pg_list.get(i);
      float rad = 2*PI / _colorNum * i;
      float x = r * cos(rad);
      float y = r * sin(rad);
      
      pg.beginDraw();
      pg.pushMatrix();
      pg.translate(width/2, height/2);
      pg.rotate(distance_rate * (_rotate_clock_direction ? 1 : -1));            
      pg.background(0);      
      //pg.translate(width/2, height/2);
      pg.fill(colorOfRadian(rad, _colorNum, i));
      pg.ellipse(x*distance_rate, y*distance_rate, r*2+cross, r*2+cross);
      pg.popMatrix();      
      pg.endDraw();            
    }

    for (int i = 0;  i < _colorNum;  i++) {
      PGraphics pg = (PGraphics)pg_list.get(i);      
      blend(pg, 0,0, width, height, 0, 0, width, height, ADD);
    }        
  }

  void setSupplementR(float r0, float r1, float r2) {
    _r0 = r0;
    _r1 = r1;
    _r2 = r2;
  }
  void setSupplementG(float g0, float g1, float g2) {
    _g0 = g0;
    _g1 = g1;
    _g2 = g2;
  }
  void setSupplementB(float b0, float b1, float b2) {
    _b0 = b0;
    _b1 = b1;
    _b2 = b2;
  }

  color colorOfRadian(float radian, int div, int index) {
    if (div <= 1) {
      return color(2*PI, 2*PI, 2*PI);
    }
    int rgb_index = index / (div / 3); 
    float value = valueOfColor(div, index);  
    switch (rgb_index) {
    case 0:
      return color(_r0, _g0, _b0);    
    case 1:
      return color(_r1, _g1, _b1);    
    case 2:
      return color(_r2, _g2, _b2);
    default:
      return color(0, 0, 0);
    }
  }

  float valueOfColor(int div, int index) {
    switch (div) {
    case 3:
      return 2*PI;
    case 6:
      switch (index % 2) {
      case 0:
        return PI/3.0*4;    
      case 1:
        return PI/3.0;
      }
    default:
      return color(0, 0, 0);
    }
  }
}



