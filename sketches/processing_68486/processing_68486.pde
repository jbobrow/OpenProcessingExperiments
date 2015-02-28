
int a;
int b;
int c=0;
int d=0;
int e=0;
int f=0;
int g=0;

void setup(){
   smooth();
   background(255);
   size(800,600);
   noFill();
   strokeWeight(15);
   
}
   

 
 
 void draw(){
     a=int(random(800));
    b=int(random(600));
   background(255);
   
   stroke(#00bfff);
   if((a!=200) && (b!=350) && c!=1){
   ellipse (a,b,150,150);
 }
   else
   {
     ellipse(200,250,150,150);
     c=1;
   }
  stroke(0);
  if((a!=365) && (b!=250) && d!=1){
    ellipse(a,b,150,150);
  }
  else
  {
   ellipse(365,250,150,150);
   d=1;
  }
   stroke(#ff0000);
   if((a!=530) && (b!=250) && e!=1){
   ellipse(a,b,150,150);
    }
  else
  {
   ellipse(530,250,150,150);
   e=1;
   
   stroke(#facc2e);
   if((a!=280) && (b!=350) && f!=1){
     ellipse(a,b,150,150);
   }
     else
  {
   ellipse(280,350,150,150);
   f=1;
   stroke(#088a29);
   if((a!=450) && (b!=350) && g!=1){
     ellipse(a,b,150,150);
}
     else
  {
   ellipse(450,350,150,150);
    g=1;
  
 }
 }
 }
 }

