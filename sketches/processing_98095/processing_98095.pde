
// Interpolation function demo

int x, y;

void setup(){ 
  size(500,500);
  background(0);
  x= 10;y=10;
  stroke(random(255), random(255), random(255));
  point(x,y);
}


void draw(){
   //
  
}

void mouseReleased(){
  stroke(random(255), random(255), random(255));
  point(mouseX, mouseY);
  interpole(new PVector(x,y),new PVector(mouseX, mouseY));
  x=mouseX;y=mouseY;
} 

void interpole(PVector p1, PVector p2){
  float dis = dist(p1.x, p1.y, p2.x, p2.y);
  int n = int(dis);
  PVector diff = new PVector((p2.x-p1.x)/n, (p2.y-p1.y)/n);
  color c1 = get(int(p1.x),int(p1.y));
  color c2 = get(int(p2.x),int(p2.y));
  float r1 = red(c1), g1 = green(c1), b1=blue(c1);
  float r2 = red(c2), g2 = green(c2), b2=blue(c2);
  float diffr = (r2-r1)/n;
  float diffg = (g2-g1)/n;
  float diffb = (b2-b1)/n;
  for(int i=1;i<n;i++){
    color c = color(r1+diffr*i, g1+diffg*i, b1+diffb*i) ;
    stroke(c);
    point(p1.x+diff.x*i, p1.y+diff.y*i); 
  }
}
