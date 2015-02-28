

float a;

void setup() {
  size(640, 500);
  stroke(255);
  a = height/2;
}

void draw() {

  //céu
  noStroke();
  fill(100);
  for (int i = 0; i<width; i+=3)
  {
    for (int j = 0; j<height; j+=3)
    {
      fill(155 +j/6, 200 +i/40, 210);
      rect(i, j, 20, 20);
    }
  }
pushMatrix();
  //torres
  translate(0,200);
  scale(1,0.5);
  fill (136, 139, 139);
  stroke (107, 108, 108);
  strokeWeight (2);
  rect (240, a, 50, a);
  a = a + 2;

  //Janelas
  strokeWeight (3);
  for ( int j=0; j<9; j++)
    for ( int i=0; i<10; i++) {
      fill (random (255));
      rect (242+j*5, a+i*30, 5, 28);
        }
   popMatrix();
  //fumaça
  for (int b=0; b<30; b+=1) {
    noStroke ();
    fill(random(0),random(0),random(0),random(200));
    ellipse(random(210, 400), random(480,500), random(b, b), random(b, b));
  }
}

