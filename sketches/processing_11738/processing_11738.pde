
//import processing.opengl.*;
import peasy.*;

PeasyCam cam;

float[] a;
float[] b;
float[] c;
float[] d;
float[] e;
float[] f;

int count= 2;


float aNoiseSource= 0;
float bNoiseSource= 0; 
float cNoiseSource= 0;
float dNoiseSource= 0; 
float eNoiseSource= 0;
float fNoiseSource= 0;

float mod= 0.0099; //noise increment


void setup() {
  size(600, 600, P3D);
  background(175);
  smooth();
  cam = new PeasyCam(this, 300);

  a= new float[count];
  b= new float[count];
  c= new float[count];
  d= new float[count];
  e= new float[count];
  f= new float[count];

  a[0] = 0; 
  a[1]=1;
  b[0] = 0; 
  b[1]=1;
  c[0] = 0; 
  c[1]=1;
  d[0] = 0; 
  d[1]=1;
  e[0] = 0; 
  e[1]=1;
  f[0] = 0; 
  f[1]=1;
}



void draw() {

  background(175);




  for(int i=1; i<a.length; i++) {
    stroke(240, 4, 7, 20); 


    line(a[i], b[i], c[i], a[i-1], b[i-1], c[i-1]);
    line(d[i], e[i], f[i], d[i-1], e[i-1], f[i-1]);

    line(b[i], c[i], d[i], b[i-1], c[i-1], d[i-1]);
    line(e[i], f[i], a[i], e[i-1], f[i-1], a[i-1]); 


    line(a[i], b[i], c[i], d[i-1], e[i-1], f[i-1]);
    line(d[i], e[i], f[i], a[i-1], b[i-1], c[i-1]);

    line(b[i], c[i], d[i], e[i-1], f[i-1], a[i-1]);
    line(e[i], f[i], a[i], b[i-1], c[i-1], d[i-1]);




    stroke(4, 3, 245, 20);


    line(f[i], e[i], d[i], f[i-1], e[i-1], d[i-1]);
    line(c[i], b[i], a[i], c[i-1], b[i-1], a[i-1]);

    line(e[i], d[i], c[i], e[i-1], d[i-1], c[i-1]);
    line(b[i], a[i], f[i], b[i-1], a[i-1], f[i-1]);

    line(f[i], e[i], d[i], c[i-1], b[i-1], a[i-1]);
    line(c[i], b[i], a[i],  f[i-1], e[i-1], d[i-1]);

    line(e[i], d[i], c[i], b[i-1], a[i-1], f[i-1]);
    line(b[i], a[i], f[i], e[i-1], d[i-1], c[i-1]);
  }

  float nextA= calc(aNoiseSource);
  float nextB= calc(bNoiseSource);
  float nextC= calc(cNoiseSource);
  float nextD= calc(dNoiseSource);
  float nextE= calc(eNoiseSource);
  float nextF= calc(fNoiseSource);





  a=append(a, nextA);
  b=append(b, nextB);
  c= append(c, nextC);
  d= append(d, nextD);
  e= append(e, nextE);
  f= append(f, nextF);

  println(a.length);


  aNoiseSource += random(mod);
  bNoiseSource += random(mod);
  cNoiseSource += random(mod);
  dNoiseSource += random(mod);
  eNoiseSource += random(mod);
  fNoiseSource += random(mod);
}

void keyPressed() {
  if (key == ' ') {
    setup();
  }
  else

      if (key == 's') {
      saveFrame("Perlin3d-###.jpg");
    }
}

float calc(float source) {
  float noiseResult= noise(source);
  float noiseMap= map(noiseResult, 0, 1, -width/2, width/2);
  return noiseMap;
}


