
float t_angle = 0.0;
float p_angle = 0.0;
void setup()
{
  size(600, 400);
  background(200);
  smooth();
  strokeWeight(6);
  stroke(113, 25, 13);
  fill(245);
}

void draw()
{
  background(#EAE4D3);

  tearDrop(width/3, height/2, 110.0);
  peanut(2*width/3, height/2);
}

void peanut(float xpos, float ypos)
{
  //http://mathworld.wolfram.com/CassiniOvals.html
  pushMatrix();
  translate(xpos, ypos);
  rotate(-HALF_PI);

  float t_dist = dist(mouseX, mouseY, xpos, ypos); //Calculate dist between shape and mouse
  float mx = map(t_dist, width/3, 0, 0.05, 0.6);   //Map this distance to a range of .05 to .6
  mx = constrain(mx, 0.05, 0.6); //Make sure it doesn't go above or below these values
  
  float b = map(sin(p_angle), -1, 1, 72, 110); //I found that 72-110 works best
  float a = 70.0;

  beginShape();
  for (int i=0; i<360; i++)
  {
    float r2 = (a*a) * (cos(2*radians(i)) + sqrt(pow(b/a, 4.0)- sq(sin(2*radians(i)))));
    float r = sqrt(r2); //  ^  Polar Equation for cassini oval

    float x = cos( radians(i) ) * r;
    float y = sin( radians(i) ) * r;
    vertex(x, y);
  }
  endShape();

  popMatrix();
  ellipse(xpos-10, ypos-40, 10, 10); //eyes...
  ellipse(xpos+10, ypos-40, 10, 10);
  p_angle+=mx; // Use the calculated value above to control the "speed" of the sin calculations
}


void tearDrop(float xpos, float ypos, float r)
{
  //http://mathworld.wolfram.com/TeardropCurve.html
  pushMatrix();
  translate(xpos, ypos);
  rotate(-HALF_PI);

  float t_dist = dist(mouseX, mouseY, xpos, ypos);
  float mx = map(t_dist, width/3, 0, 0.05, 0.6);
  mx = constrain(mx, 0.05, 0.6);
  float a = map(sin(t_angle), -1, 1, 0.5, 2.5);


  beginShape();
  for (int i=0; i<360; i++)
  {
    float x = cos( radians(i) ) *r;
    //The exponent a controls the shape of the curve
    float y = sin( radians(i) ) * pow(sin(radians(i)/2), a) *r;

    vertex(x, y);
  }
  endShape();
  popMatrix();
  ellipse(xpos-30, ypos+40, 5, 5);
  ellipse(xpos+30, ypos+40, 5, 5);
  t_angle+=mx;
}


