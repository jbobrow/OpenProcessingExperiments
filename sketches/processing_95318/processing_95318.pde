
void setup(){
  size(800,800);
}
float x=0.0;
float y=0.0;
float a=0.0;
float c=30.0;
int i=0;
int r=0;
int g=51;
int b=255;
void draw(){
  strokeWeight(2);
while(x<1000){
  y=10;
  while(y<1000){
    if(r>255){
      r=0;
    }
    if(g>255){
      g=0;
    }
    if(b>255){
      b=0;
    }
    a=0;
    fill(r,g,b);
    stroke(r,g,b);
    while (a<(2*PI/3)){
      
      triangle(x,y,(x+c*sin(a)),(y+c*cos(a)),(x+c*sin(a+PI/3)),(y+c*cos(a+PI/3)));
      a=a+PI/3;
      
    
    }
    fill(r,g-10,b);
    stroke(r,g-10,b);
    while (a<(4*PI/3)){
      
      triangle(x,y,(x+c*sin(a)),(y+c*cos(a)),(x+c*sin(a+PI/3)),(y+c*cos(a+PI/3)));
      a=a+PI/3;
      
    
    }
    fill(r,g-20,b);
    stroke(r,g-20,b);
    while (a<(2*PI-0.1)){
      
      triangle(x,y,(x+c*sin(a)),(y+c*cos(a)),(x+c*sin(a+PI/3)),(y+c*cos(a+PI/3)));
      a=a+PI/3;
      
    
    }
    r=r+13;
    g=g+17;
    b=b+23;
    
    i=i+1;
   y=y+1.5*c;
   x=x-c*sin(PI/3)*pow(-1,i);
  }

 x=x+2*c*sin(PI/3);

}

}


