
// Composite Radial Relationships
// 06.06.2010

float var01, var02, var03, speed;

void setup () {
  size(480, 640);
  smooth();
}

void draw() {
  var01 += .01;
  var02 += .0033;
  var03 += .05;
  speed += 10;
  background(200); 
  noFill();
  for (float i = 0; i <= 360; i += 6) {
    float begin = radians(noise(i) * speed);
    float end = begin + atan(var01);
    float WeightArc = abs((sin(var02)) * tan(i) * 0.5);
    float WeightEllipse = abs(noise(cos(var03)));
    strokeWeight(WeightEllipse);
    stroke(150);
    ellipse(width/2, height/2, i/2, i/2);
    ellipseMode(RADIUS);
    strokeCap(BEVEL);
    strokeWeight(WeightArc);
    stroke(125);
    arc(width/2, height/2, i/2, i/2, begin, end);
  }
}

