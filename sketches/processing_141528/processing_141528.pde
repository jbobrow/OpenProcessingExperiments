
int width = 600;
int height = 600;
float in = 5;
int a = 0;
int i = 0;
int Rijen = 6;

cID col;
Particle[] point;

void setup() {
  size(width, height);
  background(0);
}

void draw() {
  point = new Particle[int(width*height/in)];
  for (int x = 1; x< width/in; x++) {
    for (int y = 1; y< height/in; y++) {
      i = x-1+((y-1)*(x-1));
      col = new cID(int((x*in/width)*1530));
      if (a >= width*2) a = 0;
      if (a<width) {
        point[i] = new Particle(x*in, y*in, a+1, col);
      }
      else if (a>=width && a< (width*2)) {
        point[i] = new Particle(x*in, y*in, width+(width-a), col);
      }


      point[i].display();
      i++;
    }
  }
  i = 0;
  a++;
  if (in< (height/Rijen)) {
    in++;
  }
}


class Particle {
  float x;
  float y;
  int yd = 0;
  int xd = 0;
  int grootte;
  cID C;

  Particle(float xcoord, float ycoord, int diameter, cID col) {
    x = xcoord;
    y = ycoord;
    grootte = diameter;
    C = col;
  }
  void update() {
    if (abs(mouseY-y)<grootte && abs(mouseX-x)<grootte) {
      float angle2mouse = atan2(mouseY-y, mouseX-x);
      x += cos(angle2mouse)*grootte;
      y += sin(angle2mouse)*grootte;
    }
  }

  void display() {
    update();
    strokeWeight(abs(grootte));
    stroke(C.r, C.g, C.b, 4);
    fill(1, 7);
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
    ellipse(x, y, grootte+xd, grootte+yd);
  }
}

class cID {
  int r;
  int g;
  int b;
  color rgb;

  cID(int kleur) { 
    int cx = kleur;
    while (cx>1530)cx-=1530;
    if (cx<=255) {
      r=255;    
      g=0;      
      b=cx;
    }
    else if (255<cx && cx<=510) {
      r=510-cx; 
      g=0;      
      b=255;
    }
    else if (510<cx && cx<=765) {
      r=0;      
      g=cx-510; 
      b=255;
    }
    else if (765<cx && cx<=1020) {
      r=0;      
      g=255;    
      b=1020-cx;
    }
    else if (cx>1020 && cx<=1275) {
      r=cx-1020;
      g=255;    
      b=0;
    }
    else if (cx>1275 && cx<=1530) {
      r=255;    
      g=1530-cx;
      b=0;
    }
    rgb = color(r, g, b);
  }
}


