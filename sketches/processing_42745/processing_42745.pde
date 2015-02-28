
/*
M. Kontopoulos
Lissajou figure generator. Click to print the A and B vals
http://en.wikipedia.org/wiki/Lissajous_curve
*/

float rad  = 150;
float px, py;
float A, B;
void setup()
{
  size(500, 500);
  smooth();
  stroke(200);
  A = 1;
  B = 1;
}

void draw()
{
  background(40);
  A = map(mouseX, 0, width, 0, 10);
  B = map(mouseY, 0, height, 0, 10);


  for (int i=0; i<=360; i++) {
    float x = width/2 +  sin(A*radians(i)) * rad;
    float y = height/2 + sin(B*radians(i)) * rad;

    if (i>0) { //Takes care of the connecting line problem
      line(x, y, px, py);
    }

    px = x;
    py = y;
  }

  //  angle += 0.1;
}

void mousePressed()
{
  println("A: " + floor(A) + ", B: " + floor(B));
}


