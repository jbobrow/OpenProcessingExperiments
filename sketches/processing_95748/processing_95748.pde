
color[] whynot= {#06261D, #14A697, #64ABA0, #F2D0A7, #F27141};
color[] palette= whynot;

float x, y;
float radiusCircle = 100;

size(400,400);
translate (width/2, height/2);
background(palette[0]);
smooth();

ellipseMode(RADIUS);
stroke(palette[1]);
noFill();
ellipse( 0,0,radiusCircle,radiusCircle);

float px = -999;
float py = -999;
float radiusSpiralLine = 10;
stroke(palette[3]);
strokeWeight(5);
for(float angle = 0; angle <8 * PI; angle += .1){
  radiusSpiralLine += 0.25;
  x = cos (angle) * radiusSpiralLine;
  y = sin (angle) * radiusSpiralLine;
  if( px>-999){
    line(x,y,px,py);
  }
  px=x;
  py=y;
}
