

void setup(){
  size(600,600);
  background( 180,180,100)
}

void draw(){
  float x= random(width);
   float y= random(width);
   float distancia = (dist(width/2, height/2, x, y));
   if ( distancia< 100){
   fill(0);
   } 
   else {
   fill (150,180,200);
 ellipse( x, y,10 ,10);
}
}
