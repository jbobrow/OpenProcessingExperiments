
float centerX;
float centerY;
float raggioIniziale=150;
int ondulazione=15;
int risoluzione=10;
float[] x = new float[risoluzione];
float[] y = new float[risoluzione];

void setup() {
  size(600, 600);
  smooth();

  centerX=width/2;
  centerY=height/2;
  float angle=radians(360/float(risoluzione));
  for (int i=0;i<risoluzione; i++) {
    x[i]=cos(angle*i)*raggioIniziale;
    y[i]=sin(angle*i)*raggioIniziale;
  }
  stroke(0, 50);
}

void draw() {
  rect(0, 0, width, height);
  fill(200, 5);
  centerX = mouseX;
  centerY = mouseY;
  float radius = raggioIniziale * random(0.5, 5.0);
  float angle = random(PI);
  radius = raggioIniziale*4;
  angle = 0;

  float x1 = cos(angle) * radius;
  float y1 = sin(angle) * radius;
  float x2 = cos(angle-PI) * radius;
  float y2 = sin(angle-PI) * radius;
  for (int i=0; i<risoluzione; i++) {
    x[i] = lerp(x1, x2, i/(float)risoluzione);
    y[i] = lerp(y1, y2, i/(float)risoluzione);
  }

  //calcola nuovi punti e fa modificare la forma delle linee (onde sul cerchio, ondulazioni)
  for (int i=0; i<risoluzione; i++) {
    x[i] += random(-ondulazione, ondulazione);
    y[i] += random(-ondulazione, ondulazione);
  }

  strokeWeight(0.75);
  beginShape();
  // start controlpoint
  curveVertex(x[0]+centerX, y[0]+centerY);  //primo punto nell'array
  // only these points are drawn
  for (int i=0; i<risoluzione; i++) {
    curveVertex(x[i]+centerX, y[i]+centerY);
  }
  // end controlpoint
  curveVertex(x[risoluzione-1]+centerX, y[risoluzione-1]+centerY);//ultimo punto nell'array
  endShape();
}





