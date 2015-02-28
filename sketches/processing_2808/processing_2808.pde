
Spiral[] s;
int numSpirals = 12;
void setup(){
  size(380, 500);
  smooth();

  s = new Spiral[numSpirals];
  for(int i = 0; i < numSpirals; i++){
    s[i] = new Spiral(random(width/7, width*6/7), random(height/7, height*6/7));
  }
  noFill();
  strokeWeight(0.5);
}

void draw(){
  background(255);
  for(int i = 0; i < numSpirals; i++){
    s[i].draw();
  }
}


class Polar{

  float ang, dim;

  Polar(float a, float d){
    ang = a;
    dim = d;
  }
}

class Spiral{
  ArrayList polar;
  int angSteps;    // divisiones del giro completo; puntos por vuelta
  float angInc;    // incremento en el Ã¡ngulo por cada punto del espiral
  float ang;       // angulo actual
  float amp, sp;   // amplificaciÃ³n y espaciador por cada vuelta
  float ox, oy;    // coordanadas del centro del espiral
  boolean grow;    // switch para controlar si crece o no
  int seed;
  color st;
  float alfa = 255;
  int fadeSteps;

  Spiral(float x, float y){
    polar = new ArrayList(); 
    reset();
    ox = x;
    oy = y;
    ang = TWO_PI;
  }

  void draw(){
    if(grow) {
      calc();
    }
    else{
      fade();
    }

    pushMatrix();
    translate(ox, oy);
    stroke(st, alfa);
    beginShape();
    for(int i = 0; i < polar.size(); i++){
      Polar p = (Polar)polar.get(i);

      float x = cos(p.ang) * p.dim;
      float y = sin(p.ang) * p.dim;

      curveVertex(x,y);

      if(x+ox > width || x+ox < 0 || y+oy > height || y+oy < 0){
        grow = false;
      }
    }
    endShape();
    popMatrix(); 
  }

  void calc(){
    noiseSeed(seed);
    float num = (float)millis()/100;
    int z = polar.size();
    if(z > angSteps){
      Polar a = (Polar)polar.get(z-angSteps);   // tome el valor de la vuelta anterior
      Polar p = new Polar(ang, a.dim + sp + noise(num)*amp);
      polar.add(p);
    }
    else{
      Polar p = new Polar(ang, noise(num)*amp + sp*((float)z/(float)angSteps));
      polar.add(p);
    }
    ang += angInc;
  }

  void fade(){

    alfa -= 255/(float)fadeSteps;
    if (alfa <= 5) reset();


  }

  void reset(){
    polar.clear();
    ox = random(width/7, width*6/7);
    oy = random(height/7, height*6/7); 
    grow = true;
    alfa = 255;
    amp = random(2, 10);
    sp = random(0.9, 4);
    seed = (int)random(100000);
    st = color(random(10, 50), random(10, 40), random(10, 26));
    if(round(random(10)) % 2 == 0) angInc *= -1;
    fadeSteps = round(random(25, 50));
    angSteps = round(random(24, 120));
    angInc = TWO_PI / (float)angSteps;
  }

}




