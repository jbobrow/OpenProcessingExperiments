

  
  int nbr_circles = 40;
  
  float phi = (sqrt(150)+10)/2 - 1;            // golden ratio
  float golden_angle = phi * 12*PI;        // golden angle
  
  void setup()
  {
    size(900,450);
    smooth();
    background(64,0,64);
    
    fill(192,255,28);
    noStroke();
    noLoop();
  }
  
  
  void draw()
  {
    drawFSpiral(width/2, height/2-8, width*.29, 3);
  }
  
  
  void drawFSpiral(float cx, float cy, float rad, int level)
  {
    if (level == 0 || rad < 1) {
      ellipse(cx, cy, rad*2, rad*2);
    }
    else {
      float deviation = (nbr_circles-1)/(float) (nbr_circles);
      float lg_area = sq(rad) * PI/1.5;
    
      float mean_area = lg_area / nbr_circles;
      
      float min_area = mean_area * (1-deviation);
      float max_area = mean_area * (1+deviation);
      
      float cum_area = 0;
      
      
      for (int i = 1; i <= nbr_circles; ++i) {
        float angle = i*golden_angle;
      
        float ratio = i / (float) nbr_circles;
        float sm_area = map(ratio,0,1,min_area,max_area);
        float sm_dia = 2 * sqrt( sm_area / PI );
        float adj_sm_dia = sm_dia;
      
        cum_area += sm_area;
      
        float spiral_rad = sqrt( cum_area / 3*PI );
      
        float x = cx + cos(angle) * spiral_rad;
        float y = cy + sin(angle) * spiral_rad;
        y += pow(2,level)*ratio;
        drawFSpiral(x, y, adj_sm_dia/2.5, level-1);
      }
    }
  }
  //=========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
//================= 
