
//Sun Kyung Park
//andrewID: sunkyunp
//Copyright Sun Kyung park 2012

final int MAX = 100;

float [] x;
float [] y;
float [] dia;
float [] dia2;
float [] dx;
float [] dy;
color [] col;

void setup () {
  size (600, 600);
  noStroke ();
  smooth ();
  background (255);

  x = new float [MAX];
  initializeFloatArray (x, 0, width);

  y = new float [MAX];
  initializeFloatArray (y, 0, height);

  dx = new float [MAX];
  initializeFloatArray (dx, 0.5, 0.2);

  dy = new float [MAX];
  initializeFloatArray (dy, 0.5, 0.2);

  dia = new float [MAX];
  initializeFloatArray (dia, 0, height*0.2);
  
  dia2 = new float [MAX];
  initializeFloatArray (dia2, 0, 1);

  col = new color [MAX];
  initializeColorArray();
}


void draw () {
  prepScreen ();
  drawEllipse ();
  growEllipse ();
  moveEllipse ();
}

void initializeFloatArray (float [] now, float low, float high) {
  for (int i = 0; i < now.length; i++) {
    now [i] = random (low, high);
  }
}

void initializeColorArray(){
  for (int i = 0; i < col.length; i++){
    col[i] = color(random (255), random (255), random (255), 50);
  }
}

void drawEllipse () {
  for (int i = 0; i < x.length; i++) {
    fill (col [i]);
    ellipse (x [i], y[i], dia[i], dia[i]);
  }
}

void growEllipse () {
  for (int i = 0; i < x.length; i++) {
    dia[i] += dia2[i]; 
    if (dia[i] > random (height*0.3, height*0.2)) {
      dia[i] = 0;
    }
  }
}

void moveEllipse () {
  for (int i = 0; i < dx.length; i++) {
    x[i] += dx[i];
    if (x[i] > width) {
      x[i] = 0;
    }
    y[i] += dy [i];

      if (y[i] > height ) {
        y[i] = 0;
      }
    }
  }

  void prepScreen () {
    fill (255);
    rect (0, 0, width, height);
  }


