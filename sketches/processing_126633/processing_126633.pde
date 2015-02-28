
int nbr_circles = 1;
color ccc = 0;  
color bkg = 255;

void setup()
{
  size(400,400);
  smooth();
  frameRate(48);
  ccc = color(random(255),random(255),random(255));
  nbr_circles = 0;
  bkg = color(random(255),random(255),random(255));
}

void draw()
{
  background(bkg);
  stroke(ccc);
  
  nbr_circles = 1 + nbr_circles;

  float lg_diam = width * .85;
  float lg_rad = lg_diam / 2;
  float lg_circ = PI * lg_diam;
  float sm_diam = (lg_circ / nbr_circles);
  float cx = width/2.0;
  float cy = height/2.0;
  
  for (int i = 1; i <= nbr_circles; ++i) {
    fill(random(255), random (255), random(255));
    //fill(random(255));
    float angle = i * TWO_PI / nbr_circles;
    float x = cx + cos(angle) * lg_rad;
    float y = cy + sin(angle) * lg_rad;
    ellipse(x, y, sm_diam, sm_diam);
    //stroke(random(255), random (255), random(255));
    //stroke(random(255));
    line(x,y, cx, cy);
  }
    
 // println(nbr_circles);

  if(nbr_circles > 1000)
  {
    ccc = color(random(255),random(255),random(255));
    nbr_circles = 0;
    bkg = color(random(255),random(255),random(255));
  }
}
// END

