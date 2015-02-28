
int x, pos;
int y, posy;
int w, h, distance;
float posf, posfy, limite2;
int limite, r,g,b;
color colo,c;
int cx1,cy1,cx2,cy2;
void setup() {
   size(300,300); 
   frameRate(20);
   background(0);
 }
void draw() {
  
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
        colo = int(random(255));
       organisme(x,y,w,h,colo);
      }
     }
  noFill();
  stroke(255);
  strokeWeight(6);
  cx1 = int(random(200));
  cy1 = int(random(200));
  cx2 = int(random(200));
  cy2 = int(random(200));
  c = int(random(255));
  stroke(c);
  bezier(0,0,mouseX-cx1,mouseY+cy1,mouseX+cx2,mouseY-cy2,600,600);
  bezier(600,0,mouseX+cx1,mouseY-cy1,mouseX-cx2,mouseY+cy2,0,600);
}
void organisme(int x1,int y1,int w1, int h1,color col1) {
  int x,y,w,h;
  color c;
  x = x1;
  y = y1;
  w = w1;
  h = h1;
  c = col1;
  noStroke();
  fill(c);
  rect(x,y,w,h);
}


