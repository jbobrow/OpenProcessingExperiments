
petale[] petales;
float angle;
int next=0;

void setup() {
  size(500, 500);
  background(255);
  smooth();
  petales = new petale[0];
  angle=0;
}

void draw() {
  if (keyPressed) {
    if (key==32) {
      if (petales.length< 6 && next< millis()) { 
        new petale(width/2, height/2);
        next=millis()+800;
      }
      petale[] petales2 = new petale[0];

     // petale[] petales3 = new petale[0];
      for (int a=0;a<petales.length;a++) {
        petales[a].dessine();
        if (petales[a].alive) {
          petales2 = (petale[]) append (petales2, petales[a]);
        }
      }
      petales = petales2;
      //angle+=random(0.09,0.12);
    }
  }
}

class petale {
  float x, y, r, rl, a, m, av, l;
  boolean alive;
  color c;
  petale(float _x, float _y) {
    a = angle;
    angle+=random(TWO_PI*0.25, TWO_PI*0.35);
    angle%=TWO_PI;
    r=0;
    m=random(60, 400);
    l=random(10, 40);
    petales=(petale[]) append(petales, this);
    x=_x;
    y=_y;
    av=0;
    alive=true;
    c = color(random(20, 50), random(20, 50), random(10), 20);
    if (random(10)< 1)c=color(random(220, 255), random(220, 255), random(200, 210), 20);
  }
  void dessine() {
    stroke(c);
    r+=0.5;
    av+=random(-0.00005, 0.00005);
    av*=1.001;
    a+=av;
    float pc =PI/ (m/r);
    rl=sin(pc)*l;
    float nx=x+cos(a)*r;
    float ny=y+sin(a)*r;
    float p1x = nx+cos(a-PI*0.4)*rl;
    float p1y = ny+sin(a-PI*0.4)*rl;
    float p2x = nx+cos(a+PI*0.4)*rl;
    float p2y = ny+sin(a+PI*0.4)*rl;
    line(nx, ny, p1x, p1y);
    line(nx, ny, p2x, p2y); 
    if (r>m || nx<-10 || ny<-10 || nx>(width+10) || ny>(height+10))alive=false;
  }
}


