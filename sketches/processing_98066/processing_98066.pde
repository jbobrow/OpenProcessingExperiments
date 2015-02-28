


int nbr_circles = 100;
float deviation = 5/9.0;

float phi = (sqrt(5)+1)/2 - 1;       
float golden_angle = phi * TWO_PI;    

void setup()
{
  size(500, 700);

  colorMode(HSB, 1);
  frameRate(100000);
}

void draw()
{
  background(0, 0, 0);

  fill(0);
  noStroke();

  float lg_rad = width * .45;
  float lg_area = sq(lg_rad) * PI;

  float mean_area = lg_area / nbr_circles;

  float min_area = mean_area * (1-deviation);
  float max_area = mean_area * (1+deviation);

  float cum_area = 0;

  float fudge = .87;

  float cx = width/2;
  float cy = height/2;

  float hue_incr = frameCount * .0004 + .2;
  float angle_offset = frameCount * .01;

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
    fill(hue, 0.9, 1);

    ellipse(x, y, adj_sm_dia, adj_sm_dia);
  }
}


