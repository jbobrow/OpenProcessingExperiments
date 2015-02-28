
float[] a;
float[] b;
float[] c;
float[] d;

int count= 2;

float aNoiseSource= 10;
float bNoiseSource= 10; 
float cNoiseSource= 10;
float dNoiseSource= 10; 

float mod= 0.009; //noise increment

void setup() {
  size(600, 600, P2D); 
  background(175);
  smooth();


  a= new float[count];
  b= new float[count];
  c= new float[count];
  d= new float[count];


  a[0] = width/2; 
  a[1]=width/2;
  b[0] = width/2; 
  b[1]=width/2;
  c[0] = width/2; 
  c[1]=width/2;
  d[0] = width/2; 
  d[1]=width/2;
}

void draw() {

  background(175);

  for(int i=1; i<a.length; i++) {
    stroke(240, 4, 7, 12); 
    line(a[i], b[i], c[i], d[i]);
    line(b[i], a[i], c[i], d[i]);
    line(a[i], b[i], d[i], c[i]);
    line(b[i], a[i], d[i], c[i]);

    line(a[i], b[i], a[i-1], b[i-1]);
    line(c[i], d[i], c[i-1], d[i-1]);
    line(b[i], a[i], b[i-1], a[i-1]);
    line(d[i], c[i], d[i-1], c[i-1]);   

    stroke(4, 3, 245, 12);
    line(a[i], c[i], b[i], d[i]);
    line(c[i], a[i], d[i], b[i]);
    line(d[i], c[i], c[i], d[i]);
    line(b[i], a[i], a[i], b[i]);

    line(a[i], c[i], a[i-1], c[i-1]);
    line(b[i], d[i], b[i-1], d[i-1]);
    line(d[i], c[i], d[i-1], c[i-1]);
    line(c[i], d[i], c[i-1], d[i-1]);
    line(b[i], a[i], b[i-1], a[i-1]);
    line(a[i], b[i], a[i-1], b[i-1]);
  }

  float nextA= calc(aNoiseSource);
  float nextB= calc(bNoiseSource);
  float nextC= calc(cNoiseSource);
  float nextD= calc(dNoiseSource);

  a=append(a, nextA);
  b=append(b, nextB);
  c= append(c, nextC);
  d= append(d, nextD);

  println(a.length);

  aNoiseSource += random(mod);
  bNoiseSource += random(mod);
  cNoiseSource += random(mod);
  dNoiseSource += random(mod);
}

void keyPressed() {
  if (key == ' ') {
    setup();
  }
//  if (key== 's') {                   //don't think this works online
//    saveFrame("Perlin2d-###.jpg");
//  }
}

float calc(float source) {
  float noiseResult= noise(source);
  float noiseMap= map(noiseResult, 0, 1, 0, (width*1.2));
  return noiseMap;
}


