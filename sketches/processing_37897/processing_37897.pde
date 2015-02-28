
int numCuadrados = 60;
int rx = 200;
int ry = 100;
int dis1 = 30;
int dis2 = 2;
int dis3 = 30;
float[] nx = new float[numCuadrados];
float[] ny = new float[numCuadrados];
float[] x1 = new float[numCuadrados];
float[] y1 = new float[numCuadrados];
void setup() {
  size(800, 400);
  background(255);
  smooth();
  for (int x = 0;x<numCuadrados;x++) {
    nx[x] = random(-3, 3);
    ny[x] = random(-3, 3);
    x1[x]=random(0, this.width);
    y1[x]=random(0, this.height);
  }
}
void draw() {
  background(255);
  //noStroke();
  //rect(this.width/2, this.height/2, this.width, this.height);
  //fill(255, 255);

  for (int x = 0;x<numCuadrados;x++) {
    x1[x] = x1[x]+nx[x];
    y1[x] = y1[x]+ny[x];
    cuadradito(x1[x], y1[x]);
    //   if (x>0) {
    //  if (((x1[x-1]<=x1[x]+dis1) && (x1[x-1]>=x1[x]-dis1)) || ((y1[x-1]<=y1[x]+dis1) && (y1[x-1]>=y1[x]-dis1))) {
    //for (int h = 0;h<numCuadrados;h++) {
    for (int h = 0;h<numCuadrados;h++) {
      //sensor de proximidad
      if (((x1[h]<=x1[x]+dis1 && x1[h]>=x1[x]-dis1) || (x1[x]<=x1[h]+dis1 && x1[x]>=x1[h]-dis1))&&((y1[h]<=y1[x]+dis1 && y1[h]>=y1[x]-dis1) || (y1[x]<=y1[h]+dis1 && y1[x]>=y1[h]-dis1))) {
        stroke(255, 0, 0);
        line(x1[h], y1[h], x1[x], y1[x]);
      }
      else {
      }
      //sensor de colisión      
      if (((x1[h]<=x1[x]+(dis2/2) && x1[h]>=x1[x]-(dis2/2)) || (x1[x]<=x1[h]+(dis2/2) && x1[x]>=x1[h]-(dis2/2)))&&((y1[h]<=y1[x]+(dis2/2) && y1[h]>=y1[x]-(dis2/2)) || (y1[x]<=y1[h]+(dis2/2) && y1[x]>=y1[h]-(dis2/2)))) {
        nx[x] = nx[x] *(-1);
        nx[h] = nx[h] *(-1);
        ny[x] = ny[x] *(-1);
        ny[h] = ny[h] *(-1);
      }
      else {
      }
      if (mousePressed == true) {
        if (((x1[h]<=(mouseX+dis3) && x1[h]>=(mouseX-dis3)) || (x1[x]<=(mouseX+dis3) && x1[x]>=(mouseX-dis3)))&&((y1[h]<=(mouseY+dis3) && y1[h]>=(mouseY-dis3)) || (y1[x]<=(mouseY+dis3) && y1[x]>=(mouseY-dis3)))) {
          nx[x] = nx[x] *(-1);
          nx[h] = nx[h] *(-1);
          ny[x] = ny[x] *(-1);
          ny[h] = ny[h] *(-1);
        }
        else {
        }
      }
    }
    //bordes de canvas
    if (x1[x] >= this.width) {
      nx[x] = nx[x] *(-1);
    }
    else if (x1[x] <=0) {
      nx[x] = nx[x] *(-1);
    }
    if (y1[x] >= this.height) {
      ny[x] = ny[x] *(-1);
    }
    else if (y1[x] <=0) {
      ny[x] = ny[x] *(-1);
    }
  }
}
void mousePressed() {
}
void cuadradito(float prx, float pry) {
  stroke(0);
  rect(prx, pry, dis2, dis2);
  rectMode(CENTER);
  return;
}


