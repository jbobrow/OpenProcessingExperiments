
//by maria fang
//week2 feb01 2011

int x;
int y;
int directionX;
int directionY;
int x1;
int y1;
int x2;
int y2;
int x3;
int y3;
int x4;
int y4;
int dirx1;
int diry1;
int dirx2;
int diry2;
int dirx3;
int diry3;
int dirx4;
int diry4;



void setup() {
  size (600,600);
  smooth ();
  background (0);
  
  x =60;
  y =60;
  x1 =250;
  y1 =250;
  x2 =300;
  y2 =300;
  x3 =250;
  y3 =250;
  x4 =300;
  y4 =300;
  dirx1 =50;
  diry1 =50;
  dirx2 =50;
  diry2 =50;
  dirx3 =50;
  diry3 =50;
  dirx4 =50;
  diry4 =50;

  
  
}

void draw() {
  

  //arc
  x1 +=dirx1;
  y1 +=diry1;
  x2 +=dirx2;
  y2 +=diry2;
  x3 +=dirx3;
  y3 +=diry3;
  x4 +=dirx4;
  y4 +=diry4;
  
  //arc1
  stroke (0);
  fill (194,230,252);  
  arc (300, 300, x1, y1, 0, PI/2);
  if(x1 < 0){
    fill(232,33,219);
  }
  if(x1 >200){
    dirx1 =-10;
  }
  if(x1 <0){
    dirx1 =10;
  }
  if(y1>200){
    diry1=-10;
  }
  if(y1<0){
    diry1=10;
  }
  
  //arc2
  stroke (0);
  fill (245,222,244);  
  arc (300, 300, x2, y2, PI/2, PI);
  if(dist(x1,y1,x2,y2) < 500){
    fill(232,33,219);
  }
  if(x2 >300){
    dirx2 =-10;
  }
  if(x2 <0){
    dirx2 =10;
  }
  if(y2 >300){
    diry2 =-10;
  }
  if(y2 <0){
    diry2 =10;
  } 
  
  //arc3
  stroke (0);
  fill (186,242,186);  
  arc (300, 300, x3, y3, PI, TWO_PI-PI/2);
  if(x3 >200){
    dirx3 =-10;
  }
  if(x3 <0){
    dirx3 =10;
  }
  if(y3 >200){
    diry3 =-10;
  }
  if(y3 <0){
    diry3 =10;
  }
  
  //arc4
  stroke (0);
  fill (242,238,186);  
  arc (300, 300, x4, y4, TWO_PI-PI/2, TWO_PI);
  if(x4 >100){
    dirx4 =-10;
  }
  if(x4 <0){
    dirx4 =10;
  }
  if(y4 >100){
    diry4 =-10;
  }
  if(y4 <0){
    diry4 =10;
  }
  


  
}

