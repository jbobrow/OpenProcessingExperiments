
//formo.co stanley

float[] sinvals = new float [6];
float[] cosvals = new float [6];

void setup () {
  size (300, 300);
  smooth();

  for (int i=0; i< sinvals.length;i+=1) {
    sinvals[i] = sin (radians(i*60));
    cosvals[i]= cos (radians (i*60));
  }
}



void draw() {

  background (255);


  for (int i=0; i<sinvals.length; i++) {

    {
      drawPolygon(6, sinvals[i]*35+mouseX, cosvals[i]*35+mouseY, 20);
    }
  }
}


//FUNCTION
void drawPolygon(int n, float cx, float cy, float r)
{
  float angle = 360.0 / n;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + r * cos(radians(angle * i)), 
    cy + r * sin(radians(angle * i)));
  }
  endShape(CLOSE);
}


