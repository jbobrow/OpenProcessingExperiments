
// begin with drawing a circle in baby step points
// connect the points into lines
// replace the original for loop with global variables
// program for lectures on "The Wrong Way to Draw a Circle"
// schien@mail.ncku.edu.tw

float _strokeCol = 255;
float _strokeChange = -1;
float _xnoise = 0;
float _ynoise = 0;
float _ang = 0;
float _angChange = +5;

void setup() {
  size(500, 300);
}

void draw() {
  strokeWeight(0.5); 
  float radius = 200; 
  float centX = 250; 
  float centY = 150; 

  // baby steps
  //stroke(20, 50, 70); 
  float x, y, x2, y2; 
  // replace the for loop with angle varying controls
  _ang += _angChange;
  if (_ang > 360) { _angChange = -5; }
  if (_ang < 0) { _angChange = 5; }
  float ang = _ang;
  
  //for (float ang=0; ang<=360; ang+=5) {   
  _strokeCol += _strokeChange;
  // determine if strokeCol needs to increase or decrease
  if (_strokeCol > 255) {
    _strokeChange = -1;
  }
  if (_strokeCol < 0) {
    _strokeChange = 1;
  }
  stroke(_strokeCol);

  // varying the radius
  float deltaR = random(20) - 10;
  radius += deltaR;

  // varying the angle
  float deltaA = random(5) - 2.5;
  ang += deltaA;

  // varying the center
  _xnoise += 0.01;
  _ynoise += 0.01;
  centX = width/2 + (noise(_xnoise)*100) - 50;
  centY = height/2 + (noise(_ynoise)*100) - 50;

  float rad = radians(ang);                                   
  x = centX + (radius * cos(rad)); 
  y = centY + (radius * sin(rad)); 
  //point(x, y);
  float opprad = rad + PI;
  x2 = centX + (radius * cos(opprad)); 
  y2 = centY + (radius * sin(opprad)); 
  line(x, y, x2, y2);

  // trying to get fade-out effect
  fill(200, 30);
  noStroke();
  rect(0,0,width,height);
  //}
}



