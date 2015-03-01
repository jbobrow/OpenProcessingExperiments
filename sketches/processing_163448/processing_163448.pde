
float diam;
float x;
float y;
float value = random(255);



void setup() {
size(600,600);
background(255);
smooth();


}

void draw() {
diam = 60;
x = random(10);
y = random(10);
x = int(x) * diam;
y = int(y) * diam;


noStroke();
fill(value);
ellipseMode(CORNER);
ellipse(x,y,diam,diam);
}



void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }

}

