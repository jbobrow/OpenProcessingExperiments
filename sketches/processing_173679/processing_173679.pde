
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
   fill (0,152,25);
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
  for( a=50;a<450;a=a+100){
    for ( b=50;b<550; b=b+50){

      strokeWeight (5);
      fill (255);
      line( a+75,b, a+75,450);
    }
  }
  for( a=50;a<550;a=a+50){
    for ( b=50;b<450; b=b+100){

      strokeWeight (5);
      fill (255);
      line( a,b+75, 450,b+75);
    }
  }
 }

