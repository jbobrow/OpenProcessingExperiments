
int x, pos;
int y, posy;
int w, h, distance;
float posf, posfy, limite2;
int limite, r,g,b;
color colo;
void setup() {
   size(300,300); 
   frameRate(15);
 }
void draw() {
     background(0);
  limite = int(random(300));
    posf= random(0,limite);
    pos = int(posf);
    posfy= random(0,limite);
    posy = int(posfy);
    distance = int(random(5,50));
    for(x=pos;x<limite;x=x+distance) {
      for(y=posy;y<limite;y=y+distance) {
        w = int(random(75));
        h = int(random(75));
        r = int(random(255));
        g = int(random(255));
        b = int(random(255));
        colo = color(r,g,b);
       organisme(x,y,w,h,colo);
      }
     }
}
void organisme(int x1,int y1,int w1, int h1,color col1) {
  int x,y,w,h;
  color c;
  x = x1;
  y = y1;
  w = w1;
  h = h1;
  c = col1;
  fill(c);
  rect(x,y,w,h);
}


