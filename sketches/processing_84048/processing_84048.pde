


Particulas mesh;

color[] col = { 
                #891201, #860919, #751214, #821204, #860803, #891202, #841014, #540414, #530316,
                #FAF1EB, #E0D9D5, #939291, #FCFBFA, #C1B1A6, #F0EEED, #FFF2F2, #ADA4A4, #D3D3D3};

void setup() {
  size(800, 700, P3D);
  smooth();
  mesh = new Particulas();
  background(100);
}

void draw() {
  
  noStroke();
  fill(0, 200);
  rect(0, 0, width, height);
 translate(width/2, height/2);
  noFill();
  hint(DISABLE_DEPTH_TEST);
  mesh.draw();
}


color getColor(){
  color c;
  int index = (int)random(0, col.length -3);
  c = col[index];
  return c;
}
class Particula {
  float x;
  float y;
  float z;

  float fx;
  float fy;
  float fz;

  float ox;
  float oy;
  float oz;

  float ruidoValue;
  float radio;

  float theta1;
  float theta2;

  color c;
  float t =0;

  Particula(color c) {
    this.theta1 = random(360);
    this.theta2 = random(360);
    this.ruidoValue = random(-0.1, 0.1);
    //radio = random(100, 160);
    radio = 250;
    this.c =c;
    ox = random(-width/2, width/2);
    oy = random(-height/2, height/2);
    oz = random(-width/2, width/2);
  }

  void update() {
    x = radio * cos ( radians(theta1) )* cos( radians(theta2));
    y = radio * sin ( radians(theta1) )* cos( radians(theta2));
    z = radio * sin ( radians(theta2) ); 

    ox = (x - ox)*t + ox;
    oy = (y - oy)*t + oy;
    oz = (z - oz)*t + oz;

    if (dist(x, y, z, ox, oy, oz) < 0.4) {
      t= 0;
      ox = random(-width/2, width/2);
      oy = random(-height/2, height/2);
      oz = random(-width/2, width/2);
      this.theta1 = random(300);
      this.theta2 = random(270);
    }


    ruidoValue += 0.03;
    radio = noise(ruidoValue)*230 + 100;
    t+=0.000008;
  }
}

class Particulas {
  int nParticulas = 1000;
  int nRuido = 10;
  float radio = 10;
  float noiseValue;
  
  Particula[] particulas = {
  };

  Particulas() {
    noiseValue = random(-0.6, 0.6);

    particulas = new Particula[nParticulas];
    for (int i = 0; i < particulas.length; i++)
      particulas[i] = new Particula(getColor());
  }

  void draw() {
    rotateX(frameCount*0.006);
    rotateY(frameCount*0.007);


    for (int i= 0; i < particulas.length; i++) {
      Particula a = particulas[i];
     
      for (int j= 1; j < particulas.length-1; j++) {
        Particula b = particulas[j];

        float d = dist(a.ox, a.oy, a.oz, b.ox, b.oy, b.oz);
          if (d < radio){
            stroke(a.c, 88);
            beginShape();
            vertex(a.ox, a.oy, a.oz);
            vertex( b.ox, b.oy, b.oz);
            endShape();
          }
      }
    }

    for (int i =0; i < particulas.length; i++) {
      Particula p = particulas[i];
      p.update();
    }

    noiseValue += 0.02;
    radio = int(noise(noiseValue)*45 + 25);  
  }
}



