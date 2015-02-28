
size( 200,200 );

float x, y, ax, ay;

x = ax = 0;
y = ay = 100;

for( float i = 0; i < 100; i++ ) {
  x = i;
  y =
  (sin(radians(i*10)) 
    + sin(radians(i*15)))*30+100;
  line( x, y, ax, ay);
  ax = x;
  ay = y;
}
for( float i = 100; i < 200; i++ ) {
  x = i;
  y =
  (sin(radians(i*10)) 
    + sin(radians(i*15)))*30+50;
  line( x, y, ax, ay);
  ax = x;
  ay = y;
}              
                
