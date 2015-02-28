
// Processing.js example by Jim Bumgardner
 
float orbit = 6*60*1000; // 6 minute orbit (in milliseconds)
 
int nbr_circles = 333;
float deviation = 5/8.0;
 
float phi = (sqrt(5)+1)/2 - 1;            // golden ratio
float golden_angle = phi * TWO_PI;        // golden angle
 
float gRotate = 0;
float gStickiness = .3;
 
class Eye {
  float x,y,diam;
  float adj = 0;
  Eye(float x, float y, float diam)
  {
       this.x = x;
       this.y = y;
       this.diam = diam;
       this.adj = -radians(random(15));
  }
  void draw()
  {
    if (random(360) < degrees(gRotate-adj)*gStickiness) {
      adj = gRotate;
    }
    pushMatrix();
      translate(x,y);
      rotate(-adj);
      noStroke();
      fill(255);
      ellipse(0,0,diam,diam);
      fill(0);
      ellipse(0,diam*(1-phi)*.9/2,diam*phi,diam*phi);
      stroke(255);
      noFill();
      arc(0,diam*(1-phi)/2*.9,diam*phi*.8,diam*phi*.8,TWO_PI-PI/3,TWO_PI);
    popMatrix();
  }
 
};
 
Eye[] eyes = new Eye[nbr_circles];
   
   
void setup_eyes()
{
  float lg_rad = width * .47;
  float lg_area = sq(lg_rad) * PI;
   
  float mean_area = lg_area / nbr_circles;
   
  float min_area = mean_area * (1-deviation);
  float max_area = mean_area * (1+deviation);
   
  float cum_area = 0;
   
  float fudge = .87;
   
  float hue_incr = frameCount * .0002 + .1;
  float angle_offset = frameCount * .01;
   
  for (int i = 1; i <= nbr_circles; ++i) {
 
    float angle = i*golden_angle + angle_offset;
   
    float ratio = i / (float) nbr_circles;
    float sm_area = min_area + ratio * (max_area - min_area);
 
 
    float sm_dia = 2 * sqrt( sm_area / PI );
    float adj_sm_dia = sm_dia * fudge;
   
    cum_area += sm_area;
   
    float spiral_rad = sqrt( cum_area / PI );
   
    float x = cos(angle) * spiral_rad;
    float y = sin(angle) * spiral_rad;
     
    eyes[i-1] = new Eye(x,y,adj_sm_dia);
  }
}
 
void setup()
{
  size(600,600);
  smooth();
  frameRate(12);
  setup_eyes();
}
 
void draw()
{
  background(0,85,164);
 
  gRotate = millis()*TWO_PI/orbit;
 
  fill(0);
  noStroke();
  pushMatrix();
  translate(width/2,height/2);
  rotate(gRotate);
  for (int i = 0; i < eyes.length; ++i) {
    eyes[i].draw();
  }
  popMatrix();
 
}
// END



