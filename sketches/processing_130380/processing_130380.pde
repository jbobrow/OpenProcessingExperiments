
//luiz merkle
// exemplo de história em várias partes
int parte=0;

void setup() {
}
void draw() {
  background(255);
  noStroke();
  switch(parte) {
  case 0: 
    parte0();
    break;
  case 1:
    parte1();
    break;
  case 2:
    parte2();
    break;
  }
}

void parte0() {
  fill(255,0,255);
  rect(10, 10, 20, 20);
}

void parte1() {
  fill(255,255,0);
  triangle(40, 40, 60, 40, 50, 60);
}

void parte2() {
  fill(0,255,255);
  ellipse(80, 80, 20, 20);
}


void keyPressed()
{
  parte=parte+1;
  if (parte==3)
    parte = 0;
}

