
boolean needtorun = true;
int wonky = 50;
int linespacing = 10;

void setup() {
  size(400, 800);
  background( 230);
}

void draw() {
  if (needtorun) {
    
    for (int i=0; i<height; i+=linespacing) {
      line(0, i+random(-wonky,wonky), width, i+random(-wonky,wonky));
    }
    
    needtorun = false;
  }
}

