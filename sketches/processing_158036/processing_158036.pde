
int mysize= 600;
float spacing = mysize/ 100;
float meanDiam = mysize/ 80;
  int flipFlop = 1;
float angle=1;
float radius= 1;
float speed=1;
float pixcol=100;
float dx; float dy;

void setup(){
  size(mysize,mysize);
  ellipseMode(CENTER);
  noStroke();
 colorMode(RGB, 2);
  mouseX = width/2;
  mouseY = height/2;
}
void draw(){
  background(0);
 float blowFactor= map( sq(mouseX),1,sq(width), 0.05, 500);
 speed= TWO_PI/ map(mouseY,0,height,1,100) ;
  for(float y=spacing ; y<height; y+=spacing){
    for(float x= spacing ;  x<width;  x+=spacing){ 
       dx = x - width/2; //-mouseX;
       dy = y - height/2; //-mouseY;
       radius = mag( dy *blowFactor,dx *blowFactor);
       angle = atan2(dy,dx)- frameCount* speed;
      pixcol= cos(radius+angle);
      //stroke( pixcol, 2-pixcol, 2 );
      //point(x,y);
      fill(pixcol+1 ,  2-pixcol, 2 );
     float varried = meanDiam*  pixcol;
      ellipse(x,y,varried,varried);
    }
  }
}
