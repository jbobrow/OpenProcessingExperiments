
int npuntos = 150;
float n1 =0.3;
float n2 =0.3;
float n3 =0.3;
float m =5;
float phi =PI;
float xx,yy;
float[][] puntos;

int escala = 200;



void setup(){
  size(500,500);
  background(255,10);
  noStroke();
  fill(0,10);
  puntos = new float[npuntos+1][npuntos+1];


}
void draw() {
  translate(mouseX, mouseY);
  render();
  display();
  if (key == 'c'){
  fill(180,10,0,10);
}
}

void render(){
  int j = 0;

  for (int i=0;i<=npuntos;i++) {
    phi = i * TWO_PI / npuntos;

    float r;
    float t1,t2;
    float a=1,b=1;

    t1 = cos(m * phi / 4) / a;
    t1 = abs(t1);
    t1 = pow(t1,n2);

    t2 = sin(m * phi / 4) / b;
    t2 = abs(t2);
    t2 = pow(t2,n3);

    r = pow(t1+t2,1/n1);
    if (abs(r) == 0) {
      xx = 0;
      yy = 0;
    } 
    else {
      r = 1 / r;
      xx = r * cos(phi);
      yy = r * sin(phi);
    }
    puntos[i][0] = xx*escala;
    puntos[i][1] = yy*escala;

  }
}

void display(){

  beginShape();
  for (int i=0;i<=npuntos;i++) {
    vertex( puntos[i][0] , puntos[i][1]);
  }

  endShape(CLOSE);
}




