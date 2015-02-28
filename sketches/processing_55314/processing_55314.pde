
float big_radius = 100;
float small_radius = 50;

int originX;
int originY;
int angle = 0;
int angle2 = 0;

void setup() {
  size(400,400);
  background( 0 );
  originX = width/2;
  originY = height/2;
}

void draw() {
  stroke( 125 );
  //move(originX, originY);
  angle ++ ;
  angle2 += 1 ;
  if( angle >= 360 ) { angle = 0; }
  if( angle2 >= 360 ) { angle2 = 0; }
  line( 
      originX + (cos(radians(angle))*small_radius), 
      originY + (sin(radians(angle) )*small_radius) , 
      originX + (cos(radians(angle2))*big_radius) , 
      originY + (sin(radians(angle2) )*big_radius) 
      ); 
}
