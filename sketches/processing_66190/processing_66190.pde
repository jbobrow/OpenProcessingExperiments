
void setup(){
  size(400,400);
 background(0);
  smooth();
  stroke(0);

  ellipseMode(CENTER);
  //frameRate(99999999);
}
float x=200;
float y=200;
float x1=x;
float y1=y;


void draw(){
   
float d = 15;
float D=dist(x,y,x1,y1);
float v=10;
float s=5;
float xs=random(-s,s);
float x1s=random(-s,s);
float ys=random(-s,s);
float y1s=random(-s,s);

  ellipse(x,y,30,30);
  ellipse(x1,y1,30,30);
  
   x=x+xs;
   y=y+ys;
    x1=x1+x1s;
     y1=y1+y1s;
  
  if(x<=15){
       x=x+15;
  }else if(x1<=15){
          x1=x1+d;
  }else if(x>=width-15){
             x=x-d;
  }else if( x1>=width-15){
                x1=x1-d;
  }else if(y<=15 ){
                   y=y+d;
  }else if(y1<=15 ){
                       y1=y1+d;
  }else if(y>=height-15){
                           y=y-d;
  }else if(y1>=height-15){
                             y1=y1-d;
  }else if(D<30 && x<x1 && y>y1){
     fill(255,0,0);
        x=x-v;
        y=y+v;
        x1=x1+v;
        y1=y1-v;
}else if(D<30 && x<x1 && y<y1){
   fill(255,0,0);
         x=x-v;
         y=y-v;
         x1=x1+v;
         y1=y1+v;
}else if(D<30 && x>x1 && y<y1){
   fill(255,0,0);
         x=x+v;
         y=y-v;
         x1=x1-v;
         y1=y1+v;
}else if(D<30 && x>x1 && y>y1){
       fill(255,0,0);
         x=x+v;
         x1=x1-v;
         y=y+v;
         y1=y1-v;

}else{
  fill(255);
}
}
