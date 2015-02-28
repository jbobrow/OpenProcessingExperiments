

int n = 400;


PGraphics pg;

int p[] = new int[n*n];
int p2[] = new int[n*n];

void setup(){
  size(n,n);
  pg = createGraphics(n,n,P2D);
  
  background(0);
  
  for(int i=0; i<n*n; i++){
    p[i] = 0;
  }
  noCursor();
}

void draw(){
  pg.loadPixels();
  loadPixels();
  for(int i=n+1; i<n*n-n-1; i++){
    p2[i] = int(p[i-n] + p[i+1] + p[i] + 0.5*p[i-1] + 0.5*p[i+n] + 1000*brightness(pg.pixels[i])) ;
    p2[i] /= 4.2;
  }
  
  arraycopy(p2,p);
  
  for(int i=0; i<n*n; i++){
    pixels[i] = color(p[i],255);
  }
  updatePixels();
  pg.updatePixels();
  
  //p[r(n*n-n)+n] = 3000; 
  
  pg.beginDraw();
  pg.background(0);
  pg.noFill();
  pg.stroke(128*sin(frameCount/100.) + 128);
  pg.line(pmouseX,pmouseY, mouseX, mouseY);
  pg.endDraw();
}

int r(int n){
  return int(random(n));
}


