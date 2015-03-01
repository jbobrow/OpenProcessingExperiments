

void setup (){
  size (550,550);
  background  (255);
}


int a;
int b;
int d;

void draw(){
a=0;
b=0;
d=50;
  stroke (0);
 for (a=50; a<500; a=a+100){
   for (b=50; b<500; b=b+100){
   fill ( random (255),random (255), random (55));
    // fill(255,255,50);
     rect(a,b,d,d );
   }
 }


  for( a=50;a<550;a=a+50){
    for ( b=50;b<550; b=b+50){
      fill (255);
      ellipse( a,b,10,10);
    }
  }
  for( a=50;a<550;a=a+50){
    for ( b=50;b<550; b=b+50){
      strokeWeight (5);
      fill (255);
      point( a+25,b+25);
    }
  }
  
 }


