
int lnh  = 5;

float x[] = new float[lnh];
float y[] = new float[lnh];

float spx[] = new float[lnh];
float spy[] = new float[lnh];
float acx[] = new float[lnh];
float acy[] = new float[lnh];
float scl = 0.0005;
int sz =20;

void setup(){
  size(400, 400);
  colorMode(HSB, 100);
  background(99);
  frameRate(20);
  noStroke();
  smooth();
  
  for(int i = 0; i<lnh; i++){
  x[i] = random(width);
  y[i] = random(height);
  acx[i] = 0;
  acy[i] = 0;
  spx[i] = random(-2, 2);
  spy[i] = random(-2, 2);
  }
}

void draw(){
  whiteout();
  
  attraction();

  for(int i = 0; i < lnh; i++){ 
   ellipse(x[i], y[i], sz, sz);
  }
  ellipse(width/2, height/2, 6, 6);
  
}

void whiteout(){
  rectMode(CORNER);
  fill(100, 20);
  rect(0, 0, width, height);
}

void attraction(){
  for(int i = 0; i<lnh; i++){
  float dstx = x[i] - width/2;
  float dsty = y[i] - height/2;
  acx[i] = sq(dstx) * scl;
  acy[i] = sq(dsty) * scl;
   if(x[i] > width/2)acx[i] = -acx[i];
   if(y[i] > height/2)acy[i] = -acy[i];
  spx[i] += acx[i];
  spy[i] += acy[i];

  x[i] = x[i] + spx[i];
  y[i] = y[i] + spy[i];
  
  float dstcolor = dist(x[i], y[i], width/2, height/2);
  fill(0, 99, min(dstcolor*0.8, 99));
  }

}



