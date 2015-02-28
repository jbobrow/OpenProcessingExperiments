
int [] bob = {
  5, 29, 50, 10, 5, 0
};

String [] pat  =  {"."};


PFont p;
void setup() {
  size(800, 800, P3D);
  frameRate(100);
  p = loadFont("Corbel-48.vlw");
  
}

int index=0;


void draw() {
 
  fill(0);
  textFont(p);
  textSize(random(1,50));
  text(pat[index], mouseX, mouseY);

  index++;
  if (index>=pat.length) {
    index=0;
  }
}



