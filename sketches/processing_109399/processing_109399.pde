
boolean needtorun = true;
int wonky = 1;
int linespacing = 10;

void setup() {
  size(400, 800);
  background( 230);
}

void draw() {
  if (needtorun) {
    
    for (int i=0; i<height; i+=linespacing) {
      line(0, i+random(-wonky*i/3,wonky*i/3), width, i+random(-wonky*i/3,wonky*i/3));
    }
    
    needtorun = false;
  }
}

