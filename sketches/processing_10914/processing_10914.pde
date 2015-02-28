
final int X = 100;
final int Y = 100;
final int E = 5;
Point points[] = new Point[X*Y];

void setup(){
  size(X*E,Y*E);
  
  background(0);
  
  colorMode(HSB, 100);
  
  for(int i=0; i<X; i++){
    for(int j=0; j<Y; j++){
      Point p = new Point();
      p.x = i*E; p.y = j*E;
      points[X*i + j] = p;
    }
  }
  
  noStroke();
}

void draw(){
  for(int i=0; i<3; i++){
    points[int(random(X*Y))].p = 50;
    points[int(random(X*Y))].q = 50;
    points[int(random(X*Y))].r = 50;
  }
  
  for(int i=0; i<X*Y; i++){
    Point p = points[i];
    
    fill(p.p,p.q,p.r);
    rect(p.x, p.y, 3,3);
    
    if(i>0){
      points[i].p = (0.5*points[(i-1)%(X*Y)].p-1.00001)%100.0 + (0.5*points[(i+1)%(X*Y)].p+1.00001)%100.0;
      points[i].q = (0.5*points[(i-1)%(X*Y)].q-1.00001)%100.0 + (0.5*points[(i+1)%(X*Y)].q+1.00001)%100.0;
      points[i].r = (0.5*points[(i-1)%(X*Y)].r-1.00001)%100.0 + (0.5*points[(i+1)%(X*Y)].r+1.00001)%100.0;
     }  
   }
  
   
}

class Point{
  int x;
  int y;
  float p;
  float q;
  float r;
}

