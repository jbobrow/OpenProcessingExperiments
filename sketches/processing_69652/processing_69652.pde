
float rad = 100;
float angle = 10;
color pastelColor;



void setup() {
  size(500,500);
  background(0);
  noFill();
  frameRate(1.5);
}

void draw() {
  smooth();
  translate(width/2, height/2);
  rotate(rad);
  int pastel = int(random(5));
  if (pastel == 0) { 
    pastelColor = color (146, 240, 128); //green
  } 
  else if (pastel == 1) { 
    pastelColor = color (176, 128, 240); //purple
  } 
  else if (pastel == 2) { 
    pastelColor = color (225, 238, 136); //yellow
  } 
  else if (pastel == 3) { 
    pastelColor = color (234, 128, 240); //red
  } 
  else if (pastel == 4) { 
    pastelColor = color (128, 146, 240); //blue
  }

  for ( int inc=0; inc < 360; inc +=10) {
    float angle = radians(inc);
    float x = cos (angle) * rad;
    float y = sin (angle) * rad;

    stroke (pastelColor);

    triangle (x-5, y-5, x*rad,y*rad,x*rad,y*rad);

    //   arc(x, y, rad*2, rad*2, HALF_PI*rad, PI*rad);


   arc(x/2, y/2, rad, rad, PI+QUARTER_PI*rad-5, TWO_PI*rad-5);
 }
  if (angle>500) {
  } 
  else {
    rad=rad+10/rad+5;
    angle++;
  }
}
