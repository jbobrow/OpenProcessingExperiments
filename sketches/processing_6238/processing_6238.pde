
void setup() {
  size(512,512);
  colorMode(HSB,255);
  background(0);
}

// http://en.wikipedia.org/wiki/Iterated_function_system
void draw() {
  float x = 0.04f, y = 0.04f;
  int iterations = 65535;
  float angle = map(mouseX,0,width,-PI/40,PI/40);
  for (int i=0; i<iterations; i++) {
    float r = random(100);
    int function = r <= 1 ? 0 : r <= 8 && r > 1 ? 1 : r <= 15 && r > 8 ? 2 : 3;
    switch(function) {
    case 0:	
      x = 0; 
      y = 0.18f*y; 
      break; // 1%
    case 1:	
      x = 0.2f*x - 0.26f*y; 
      y = 0.23f*x + 0.40f*y + 1.6f; 
      break; // 7%
    case 2:	
      x = -0.22f*x + 0.28f*y; 
      y = 0.26f*x + 0.40f*y + 0.44f; 
      break; // 7%
    case 3:	
      x = 0.85f*x + angle*y; 
      y = -angle*x + 0.85f*y + 1.6f; 
      break; // 85%
    }
    int xs = (int)((x*width) * 0.1 + 256);
    int ys = (int)(512-((y*height)* 0.08) ); 
    set(xs,ys,color(32+random(64),255,255));
  }
  tint(0,64,250);
  image(get(3,3,width-6,height),0,0,width,height);
  filter(BLUR,1);
}



