
int num = 500;

float[] vx = new float[num];
float[] vy = new float[num];

float[] acelX = new float[num];
float[] acelY = new float[num];

float[] tam= new float[num];

color[] cols = new color[num];

float[] peso = new float[num];

void setup() {
  size(600, 600);
  noFill();
  smooth();

  for (int i=0; i<num; i+=1) {
    vx[i] = random(100, width-100);
    vy[i] = random(100, height-100);
    acelX[i] = random(-5, 5);
    acelY[i] = random(-5, 5);
    tam[i] = random(5,15);
    cols[i] = color(random(255),random(255),random(255),random(100,200));
    peso[i] = random(1,15);
  }

}

void draw() {
  //background(0);
  fill(0,50);
  noStroke();
  rect(0,0,width,height);

  for (int i=0; i<num; i+=1) {
    noFill();
    strokeWeight(peso[i]);
    stroke(cols[i]);
    
    ellipse(vx[i], vy[i], tam[i]*2, tam[i]*2);

    vx[i] += acelX[i];
    vy[i] += acelY[i];

    if (vx[i] < -tam[i]) {
      vx[i] = width + tam[i];
    } else if (vx[i] > width+tam[i]) {
      vx[i] = -tam[i];
    }

    if (vy[i] < -tam[i]) {
      vy[i] = height + tam[i];
    } else if (vy[i] > height+tam[i]) {
      vy[i] = -tam[i];
    }
    
  }
  
}


void mousePressed() {
  for (int x2=0; x2<num; x2+=1) {
    acelX[x2] = random(-10, 10);
  }

  for (int y2=0; y2<num; y2+=1) {
    acelY[y2] = random(-10, 10);
  }
}



