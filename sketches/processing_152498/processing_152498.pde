
int x0 = -100;
int y0 = -100;
int z0 = 100;
int x1 = 200;
int y1 = 300;
int z1 = 100;

float l = 50;

void setup() {
  size(800, 400); 
  background(255);    
}

void draw() {
  background(255);
  x0 = 2*(mouseX-width/2);
  y0 = -2*(mouseY-height/2);
  
  dblock(x0, y0, z0, x1, y1, z1, l);
  
  
  line(width/4,height-50,width/4,50);
  line(width*3/4,height-50,width*3/4,50);
  line(width-50,height/2,width/2+50,height/2);
  line(width/2-50,height/2,50,height/2);
}

void dblock(int x0, int y0, int z0, int x1, int y1, int z1, float l){
  dline(x0, y0, z0, x0+x1, y0, z0, l);
  dline(x0+x1, y0, z0, x0+x1, y0+y1, z0, l);
  dline(x0, y0+y1, z0, x0+x1, y0+y1, z0, l);
  dline(x0, y0, z0, x0, y0+y1, z0, l);
  
  dline(x0, y0, z0, x0, y0, z0+z1, l);
  dline(x0+x1, y0, z0, x0+x1, y0, z0+z1, l);
  dline(x0, y0+y1, z0, x0, y0+y1, z0+z1, l);
  dline(x0+x1, y0+y1, z0, x0+x1, y0+y1, z0+z1, l);
    
  dline(x0, y0, z0+z1, x0+x1, y0, z0+z1, l);
  dline(x0+x1, y0, z0+z1, x0+x1, y0+y1, z0+z1, l);
  dline(x0, y0+y1, z0+z1, x0+x1, y0+y1, z0+z1, l);
  dline(x0, y0, z0+z1, x0, y0+y1, z0+z1, l);
}

void dline(int dx1, int dy1, int dz1, int dx2, int dy2, int dz2, float dl){
  int dis = 40;
  line(width/4 + (dl*(dx1 - dis)/dz1), height/2 - (dl*dy1/dz1), width/4 + (dl*(dx2 - dis)/dz2), height/2 - (dl*dy2/dz2));
  line(width*3/4 + (dl*(dx1 + dis)/dz1), height/2 - (dl*dy1/dz1), width*3/4 + (dl*(dx2 + dis)/dz2), height/2 - (dl*dy2/dz2));
}

