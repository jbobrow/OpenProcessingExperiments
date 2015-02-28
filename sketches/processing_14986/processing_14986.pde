
int x = 400;

void setup() {
  size(400,400);
  background(229,145,12);
  colorMode(HSB,114,94,85);

  smooth();
  //noLoop();
}

void draw() {
  if (x > 400) {
    x = -00;
  } 
  else {
    x++;
  }

  background(34,255,15);
  for (int v=0; v <800; v+=5) {
    stroke(v,100,700);
    strokeWeight(1);
    bezier(v, 0,x+mouseX,x+ mouseX,v,1, v, 400);
  }
}


