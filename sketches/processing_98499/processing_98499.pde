
int c;
float r;
final int maxdeg = 1080;
final int spd = 2;
void draw(){
   translate( width/2, height/2);
   for( int i = c; i >= c; i -= spd){
       r = width * pow(i , 2) / pow(maxdeg, 2);
       float rad = radians(i);
       pushMatrix();
         translate( r * cos(rad), r * sin(rad) );
         ellipse( 0, 0, r/1.5, r/1.5 );
       popMatrix();
   }

   c -= spd;
   if( c == 0 ){
       c = maxdeg;
       background(0);
   }
}
 
 void setup (){ 
size(800,600);
stroke(15,23,240);
strokeWeight(4);
griglia (0,0,10,10);
}
void griglia (int xs, int ys, int dx, int dy)
{ 
  for (int i=xs; i<width; i+=dx){
    line(i,ys,i,height); 
}
    for (int i=ys; i<height; i+=dy){
    line(xs,i,width,i);
  }
}


