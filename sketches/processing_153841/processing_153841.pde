
ArrayList<TriStack> myTriStack;
int pCount = 6;

void setup() {
  randomSeed(hour()+minute()+second()+millis());
  size(600, 600);
  background(0);
  myTriStack = new ArrayList<TriStack> ();
}

void draw() {
  colorMode(HSB);
  fill(random(360),random(255),random(255),32);
  for (int j=0; j<100; j++) {
    myTriStack.add( new TriStack(int(random(pCount)), int(random(pCount)), int(random(pCount))) );
  }
  translate(width/2, height/2);
  while (myTriStack.size() > 0) {
    process_triStack(myTriStack.size()-1);
  }
}

void process_triStack(int topOfStack) {
  TriStack ts = myTriStack.get(topOfStack);
  int tsb = (int)ts.b + 1;
  int tsc = (int)ts.c + 1;
  switch (int(ts.a)) {
  case 0:
    ellipse(tsb*25, tsc*25, tsc*10, tsb*10);
    ts.a = ts.b;
    ts.b = ts.c;
    ts.c = int(random(pCount));
    break;
  case 1:
    scale(tsb/(pCount/2.0), tsc/(pCount/2.0));
    ts.a = ts.b;
    ts.b = ts.c;
    ts.c = int(random(pCount));
    break;
  case 2:
    myTriStack.remove(topOfStack);
    break;
  case 3:
    rotate(tsb-tsc);
    ts.a = ts.b;
    ts.b = ts.c;
    ts.c = int(random(pCount));
    break;
  case 4:
    translate(tsb-(pCount/2.0), tsc-(pCount/2.0));
    ts.a = ts.b;
    ts.b = ts.c;
    ts.c = int(random(pCount));
    break;
  case 5:
    if (myTriStack.size() < 100 && random(2) < 1) {
      myTriStack.add( new TriStack(int(random(pCount)), int(random(pCount)), int(random(pCount))) );
    }
    ts.a = ts.b;
    ts.b = ts.c;
    ts.c = int(random(pCount));
    break;
  }
}

class TriStack {
  float a;
  float b;
  float c;

  TriStack(float a_, float b_, float c_) {
    a = a_;
    b = b_;
    c = c_;
  }
  
  TriStack(TriStack ts_) {
    this.a = ts_.a;
    this.b = ts_.b;
    this.c = ts_.c;
  }
}


