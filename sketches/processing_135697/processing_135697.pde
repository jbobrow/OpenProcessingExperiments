
PVector p0, p1, p2, p3, shift;//four vectors for the bezier and one for shifting iterations
float cx, cy, p0x, p0y, p1x, p1y, p2x, p2y, p3x, p3y;//variables used for lerp
float n;//used in bezier path calculations
float l;//lerp speed

void setup() {
  size(500, 500);
  smooth();
  p0 = rand(width/2, height/2);//four random coordinates for the bezier
  p1 = rand(width/2, height/2);
  p2 = rand(width/2, height/2);
  p3 = rand(width/2, height/2);
  shift = rand(30, 30);//a random vector to offset each iteration of the bezier
  cx = shift.x;//post-lerp x for shift
  cy = shift.y;//post-lerp y for shift
  shift = rand(20, 20);//reset shift so animation starts in motion
  p0x = p1x = p2x = p3x = p0y = p1y = p2y = p3y = 0;//post-lerp bezier coordinates
  n = 0;//at n=0 the point is at p0, as n approaches 1 the point approaches p3
  l = 0.004;//rate at which the point traces the bezier
}

void draw() {
  fill(50, 100);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  if (frameCount % 160 == 0) {//every 160 frames or ~4 seconds
    shift = rand(30, 30);      //randomize shift
  }
  p0x = lerp(p0x, p0.x, l);//move the bezier points gradually to their new positions
  p0y = lerp(p0y, p0.y, l);//I could probably lerp the PVectors directly but tried to limit
  p1x = lerp(p1x, p1.x, l);//use of PVector functions so it would work smoothly in js mode.
  p1y = lerp(p1y, p1.y, l);
  p2x = lerp(p2x, p2.x, l);
  p2y = lerp(p2y, p2.y, l);
  p3x = lerp(p3x, p3.x, l);
  p3y = lerp(p3y, p3.y, l);
  cx = lerp(cx, shift.x, l);//as well as the new shift
  cy = lerp(cy, shift.y, l);
  
  for (int i = -20; i < 20; i++) {//symnetrical(-20 to 20)iteration makes a leaf/ribbon shape
    noFill();
    stroke(200, 100);
    strokeWeight(1);
    bezier(    //draw the beziers
      p0x, p0y,   //the end point coordinates are the same
      p1x + cx*i, p1y + cy*i, // the control point coordinates get shifted
      p2x + cx*i, p2y + cy*i, 
      p3x, p3y);
    
    //B(t)=(1-t)^3 *p1 + 3*(1-t)^2 *t*p2 + 3(1-t)*t^2 *p3 + t^3 *p4  the "bezier formula" (had to google it)
    
    float xe1 = pow((1-n), 3)*p0x;//broken into four parts cause it's a huge formula
    float xe2 = 3*pow((1-n), 2)*n*(p1x + cx*i);
    float xe3 = 3*(1-n)*pow(n, 2)*(p2x + cx*i);
    float xe4 = pow(n, 3)*p3x;
    float x = xe1 + xe2 + xe3 + xe4;

    float ye1 = pow((1-n), 3)*p0y;//solve the formula for both x and y
    float ye2 = 3*pow((1-n), 2)*n*(p1y + cy*i);//add the shift in the appropriate spot
    float ye3 = 3*(1-n)*pow(n, 2)*(p2y + cy*i);
    float ye4 = pow(n, 3)*p3y;
    float y = ye1 + ye2 + ye3 + ye4;
    
    stroke(200, 200);
    strokeWeight(5);
    point(x, y);//draw the points
  }
  if (n > 1) {//randomize bezier points when trace is complete
    p0 = rand(width/2, height/2);
    p1 = rand(width/2, height/2);
    p2 = rand(width/2, height/2);
    p3 = rand(width/2, height/2);
    n = 0;
  }

  n += 0.005;
}

PVector rand(float _x, float _y) {//a function to make random vectors easier
  float x = random(-_x, _x);
  float y = random(-_y, _y);
  PVector r = new PVector(x, y);
  return r;
}

