
float v = 0;
float inc = 2;
int total = 120;
float[] x = new float[total];
float[] y = new float[total];
float[] vx = new float[total];
float[] vy = new float[total];
float[] transparencia = new float[255];

color color1 = #361D2E;
color color2 = #212234;
float variacio, s, m, h;
color fondo;


void setup() {
  size(400, 400);
  float mFondo = map(minute(), 0, 60, 0, 1);
  color fondo = lerpColor(color1, color2, mFondo);

  for (int i= 0; i < total; i++) {
    x[i]= random(width);
    y[i]= random(-200, 0);
  }
  background(fondo);
  
}

void draw() {
  
  float s = second();
  float mFondo = map(minute(), 0, 60, 0, 1);
  color fondo = lerpColor(color1, color2, mFondo);
  if (s == 0) { 
    //vuelve a dibujar background al empezar un minuto
    for (int i= 0; i < total; i++) {
      x[i]= random(width);
      y[i]= random(-200, 0);
    }
    background(fondo);
  }
  println(s);

  // calcular velocidad segun noise 
  for (int i= 0; i < s*2; i++) {
    transparencia[i] = map(y[i], 0, height, int(random(200,255)), int(random(0, 50)));
    stroke(random(220,255), transparencia[i]);
    vx[i]= noise(v)*3; 
    vy[i]= noise(v);

    y[i] = y[i] + vy[i]*random(0.5, 3);
    x[i] = x[i] + random(-vx[i], vx[i]);

    v = v + inc;
    point(x[i], y[i]);
  }
  
  
}
