
int w = 600;
int h = 600;
int numPepas = 100;
float t = 0;
float dt = 0.1;
int contador = 0;
Pepa[] mipepa = new Pepa[numPepas];

void setup() {
  size(w,h);
  for( int i = 0; i < numPepas ; i++) {
    mipepa[i] = new Pepa(0,i*float(h)/(numPepas-1));
    //mipepa[i].dibujate();
  }
}

void draw() {
  //background(255);
  if(contador%3==0) {
    fill(0,1);
    rect(0,0,w,h);

    smooth();

    //mipepa[0].dibujate();
    mipepa[0].muevete();
    for( int i = 1 ; i < numPepas ; i++) {
      mipepa[i].muevete();
      stroke(random(100,150),random(150,200),random(200,255));
      line( mipepa[i].x, mipepa[i].y, mipepa[i-1].x, mipepa[i-1].y );
      //mipepa[i].dibujate();
    }
  }
  t+=dt;
  contador++;
}

class Pepa {
  float x, y, vx, vy;

  Pepa( float x_init, float y_init ) {
    x = x_init;
    y = y_init;
    vx = 0;
    vy = 0;
  }
  void dibujate() {
    ellipse(x,y,10,10);
  }
  void muevete() {
    x+=1+3*(noise(y*0.04,t)-0.5);
    //x+=noise(t);
    y+=0;//noise(t)-0.5;
  }
}



