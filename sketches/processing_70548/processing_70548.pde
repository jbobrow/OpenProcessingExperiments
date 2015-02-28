


PFont tipo;
int a=250;
int f=50;
int fx=0;
int fy=0;
int frenof=0;
int e=0;
int ex=0;
int ey=0;
int frenoe=0;
int r=0;
int rx=0;
int ry=0;
int frenor=0;




void setup(){

  background(255);
  smooth();
size(1000,500);

tipo= createFont("ACaslonPro-Semibold",1);
textFont(tipo,50);
textAlign(CENTER);
  fill(0);
}
  
  void draw(){
    smooth();
     background(255);
if (fx!=250 && fy!=250 && frenof!=1 && f!=70) {

   text (char(f),fx,fy);
    fx=int(random(width));
  fy=int(random(height));
  f=int(random(65,122));
}
else{
 
   text (char(70),250,250);
 
 
  frenof=1;
}

  if (ex!=250 && ey!=250 && frenoe!=1 && e!=101) {
 
   text (char(e),fx,fy);
    ex=int(random(width));
  ey=int(random(height));
 e=int(random(65,122));
}
else{

   text (char(101),500,250);
 
 
  frenoe=1;
}
  if (rx!=750 && ry!=250 && frenor!=1 && r!=114) {
 
   text (char(r),rx,ry);
    rx=int(random(width));
  ry=int(random(height));
 r=int(random(65,122));
}
else{

   text (char(114),750,250);
 
 
  frenor=1;
}



  
  if (f==70 && r==114 && e==101 ){

    background(255);
   
     text (char(r),750,250);
        
         text (char(f),250,250);
    
         text (char(e),500,a);
       
        a=a+1;
    }

  }





