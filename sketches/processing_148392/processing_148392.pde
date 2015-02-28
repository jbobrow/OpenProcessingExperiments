
//uma experiência com a função for.


int x;
int x2;
float y;
float y2;
float d;
float d2;

float espessura;
float espessura2;

void setup() {
  size(700,700);
  frameRate(20);
  smooth();
}

void draw() {
  background(255);
  
  espessura = random(1,10);
  espessura2 = random(1,10);
  
  d = random(10,100);
  d2 = random(10,100);
  
  for (y = random(100,200); y <= 600; y += 200) {
    for (x = 100; x <= 600; x += 200) {
      strokeWeight(espessura);
      stroke(0);
      noFill();
     ellipse(x,y,d,d);
    }
  }
  
  for (y2 = random(100,200); y2 <= 600; y2 += 200) {
    for (x2 = 200; x2 <= 600; x2 += 200) {
      strokeWeight(espessura2);
      stroke(0);
      noFill();
     ellipse(x2,y2,d2,d2);
    }
  }
}


