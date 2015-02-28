
int b=10;
float x=50;
float y=50;
float v1=4;
float v2=3;

void setup(){
  size (400,400);
  noStroke ();
  smooth();
}

void draw(){

  x=x+v1;
  y=y+v2;
  translate (x,y);
  fill (x,y,x/2,y/1.5);
  ellipse(random (50),random(50),b,b);
  if(y>=height){
    v2=-((v2)*1.5);
 }
   if(y<=0){
     v2=(.8)*1.7;
 }
   if(x>=width){
     v1=(-v1)*2.3;
 }
   if(x<=0){
     v1=4*0.5;
 }

}

void keyPressed(){
  if(key=='+'){
    b+=10;
  }
  if(key=='-'){
    if (b>10){
      b-=10;
    }else{
      b=b;
    }
  }
  if(key=='/'){
    if (b>10){
      b/=2.5;
    }else{
      b=b;
    }
  }
  if(key=='*'){
    if (b<100){
      b*=1.7;
    }else{
      b=b;
    }
  }
  if(key=='s'){
    stroke(x,y,x);
  }
}

