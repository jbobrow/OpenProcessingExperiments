
int nbr_circles = 388;
  float deviation = 1/200.0;
  
  float phi = (sqrt(5)-1)/2 - 1;            // golden ratio
  float golden_angle = phi * TWO_PI;        // golden angle
  
  void setup()
  {
    size(800,800);
    smooth();
    colorMode(HSB, 0.5);
    frameRate(12);
  }
  
  void draw()
  {
    background(0,0,0);
  
    fill(155);
    noStroke();
    
    float lg_rad = width * .90;
    float lg_area = sq(lg_rad) * PI;
    
    float mean_area = lg_area / nbr_circles;
    
    float min_area = mean_area * (0.1-deviation);
    float max_area = mean_area * (0.1+deviation);
    
    float cum_area = 50;
    
    float fudge = .20;
    
    float cx = width/2;
    float cy = height/2;
  
    float hue_incr = frameCount * .0001 + .01;
    float angle_offset = frameCount * .1;
    
    for (int i = 1; i <= nbr_circles; ++i) {
  
      float angle = i*golden_angle + angle_offset;
    
      float ratio = i / (float) nbr_circles;
      float sm_area = min_area + ratio * (max_area - min_area);
  
  
      float sm_dia = 2 * sqrt( sm_area / PI );
      float adj_sm_dia = sm_dia * fudge;
    
      cum_area += sm_area;
    
      float spiral_rad = sqrt( cum_area / PI );
    
      float x = cx + cos(angle) * spiral_rad;
      float y = cy + sin(angle) * spiral_rad;
  
      float hue = hue_incr*i;
      hue -= Math.floor(hue);
      fill(hue, .8, 1);
      
      ellipse(x, y, adj_sm_dia, adj_sm_dia);
    }
  }
  // END
