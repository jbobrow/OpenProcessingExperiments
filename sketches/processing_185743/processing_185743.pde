

void setup(){
  size(600,600);
}

void draw(){
  float x= random(width);
   float y= random(width);
   float distancia = (dist(width/2, height/2, x, y));
   if ( distancia< 100){
 ellipse( x, y,10 ,10);
}
}
