
float p1x = 0;
float p1y = 0;
float p2x = 0;
float p2y = 0;
float q1 = 0;
int t = 0;

int r = 70;

int fmax = 60*6;

float[][] point;

void setup() {
  size(800, 400); 
  background(255);  
  point = new float[fmax][2];
  for (int i = 0; i <= fmax-1; i ++) {    
    point[i][0] = 0;   
    point[i][1] = 0;
  }
}

void draw() {
  background(255);
  p1x = 2*(t-fmax/2);
  q1 = 4*r*r/(p1x*p1x);
  p2x = q1*p1x/(q1+1);
  p2y = 2*r*p2x/p1x;

  point(width/2 + p1x, 300);
  ellipse(width/2, 300 - r, 2*r, 2*r); 
  line(width/2 - 2*60*3, 300, width/2 + fmax, 300);
  line(width/2 + p1x, 300, width/2 + p1x, 300 - 2*r);
  line(width/2, 300, width/2 + p1x, 300 - 2*r);
  line(p2x + width/2, -p2y + 300, width/2 + p1x, -p2y + 300);
  ellipse(p2x + width/2, -p2y + 300, 10, 10); 
  ellipse(width/2 + p1x, -p2y + 300, 10, 10);
  if (t <= fmax-1) {
    point[t][0] = p1x;
    point[t][1] = p2y;
    for (int i = 1; i <= t; i ++) {
      line(width/2 + point[i][0], 300 - point[i][1], width/2 + point[i-1][0], 300 - point[i-1][1]);
      ellipse(width/2 + point[i][0], 300 - point[i][1], 1, 1);
    }
  }
  else {
    for (int i = 1; i <= fmax-1; i ++) {
      line(width/2 + point[i][0], 300 - point[i][1], width/2 + point[i-1][0], 300 - point[i-1][1]);
      ellipse(width/2 + point[i][0], 300 - point[i][1], 1, 1);
    }
     }


  if (t <= fmax) {
    t++;
  }
}

