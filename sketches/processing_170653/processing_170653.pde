

float circulox;
int circuloy;
int dim;
int dimB=120;

float velocidad = 0.01;
float r=100;
float g=100;
float b=200;

void setup() {
  size(500, 800);
  background(255);
  circulox=70;
  circuloy=100;
  dim=60;
}

void draw() {
  //background(random(0, 255));
  fill(r, g, b);

  fill(circulox);
  circuloy=100;

  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  

  ellipse(width/2,height/2,100,100);
  circulox=circulox+velocidad;
  r=r+velocidad;

  ellipse(random(500),random(200),dim,dim);
  noStroke();
  float dim2= random(100);

  ellipse(random(400, width)/2, random(height), dim, dim);
  println(circulox);

  fill(100, random(0, 200), random(100, 255), random(0, 255));
  ellipse(random(50, 100), random(height), dim2, dim2);//random(cualquier punto entre dos X, o dos Y)

  fill(r, random(100, 255), random(0, 255), random(0, 255));
  ellipse(random(350, 450), random(height), random(100), random(100)); }
