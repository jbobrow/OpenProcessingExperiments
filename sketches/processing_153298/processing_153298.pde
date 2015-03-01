
float x1=500,y1=500,r=25,dx1=17,dy1=13,x2=100,y2=100,dx2=13,dy2=17,cont,cont2,d;
void setup(){
  size(750,750);
  x1=random(60,700);
  y1=random(60,700);
  x2=random(60,700);
  y2=random(60,700);
}
void draw(){
  background(255);
  fill(0,255,0);
  ellipse(x1,y1,50,50);
  fill(255,0,0);
  ellipse(x2,y2,50,50);
  x1=x1+dx1;
  y1=y1+dy1;
  x2=x2+dx2;
  y2=y2+dy2;
  if(x1>width-r){
    dx1=-dx1;
  }
   if(x1<r){
    dx1=-dx1;
     }
     d=sqrt(((x2-x1)*(x2-x1))+((y2-y1)*(y2-y1)));
     if(y1>height-r)
     {
       dy1=-dy1;
     }
     if(y1<r)
     {
       dy1=-dy1;
     }
     if(x2>width-r){
       dx2=-dx2;
     }
     if(x2<r){
       dx2=-dx2;
     }
     if(y2>height-r)
     {
       dy2=-dy2;
     }
     if(y2<r)
     {
       dy2=-dy2;
     }
     
   if(dy1>0 && dy2>0 || dy1<0 && dy2<0){
     cont=1;
   }
   if(dy1<0 && dy2>0 || dy1>0 && dy2<0){
     cont=2;
   }
   if(dx1>0 && dx2>0 || dx1<0 && dx2<0){
     cont2=1;
   }
   if(dx1<0 && dx2>0 || dx1>0 && dx2<0){
     cont2=2;
   }
   if(d<50 && cont==1 && cont2==1){
     dx1=-dx1;dx2=dx2;dy1=-dy1;dy2=dy2;
   }
   if(d<50 && cont==2 && cont2==2 ){
     dx1=-dx1;dx2=-dx2;dy1=-dy1;dy2=-dy2;
   }
   if(d<50 && cont2==1 && cont==2){
     dx1=dx1;dx2=dx2;dy1=-dy1;dy2=-dy2;
   }
   if(d<50 && cont==1 && cont2==2){
     dx1=-dx1;dx2=-dx2;dy1=dy1;dy2=dy2;
   }
}
