
PVector loc;
float timer;
final float ellipse_size = 20;
final int n = -7;
final int k = -10;
final float amplitude = 10;

void setup() {
  size(500, 500);
  loc = new PVector();
  loc.x = 0;
  loc.y = 0;
  timer = 0;
}

void draw() {
  //background(255);
  loc.x = ((n*2*k)/(2*n))*(cos(k*timer) - cos((n-k)*timer));
  loc.y = ((n*2*k)/(2*n))*(sin(k*timer) - sin((n-k)*timer));
  
  //println("x- " + loc.x + " y- " + loc.y);
  //println(frameRate);
  ellipse(amplitude*loc.x * (+1) + width/2, amplitude*loc.y * (+1) + height/2, ellipse_size, ellipse_size);
  //ellipse(amplitude*loc.x * (-1) + width/2, amplitude*loc.y * (-1) + height/2, ellipse_size, ellipse_size);
  //ellipse(amplitude*loc.x * (-1) + width/2, amplitude*loc.y * (+1) + height/2, ellipse_size, ellipse_size);
  //ellipse(amplitude*loc.x * (+1) + width/2, amplitude*loc.y * (-1) + height/2, ellipse_size, ellipse_size);
  timer = timer + .005
  frameRate(150);
  ellipseMode(CENTER);
 // ellipse(width/2, height/2, 200, 200);
}
