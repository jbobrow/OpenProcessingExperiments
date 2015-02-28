


void zawijas(float x, float y, float beta, int level, boolean kierunek, color c, int szansa) {

  
  int weight = int(sqrt(level));
  strokeWeight(weight);
  stroke(c);
  
  float x1, y1;
  float gamma;
  color d;
  
  gamma = beta + 360/level;
  if(kierunek) {
    x1 = x + cos(radians(gamma)) * 4;
    y1 = y + sin(radians(gamma)) * 4;
  }
  else {
    x1 = x - cos(radians(gamma)) * 4;
    y1 = y - sin(radians(gamma)) * 4;
  }
  
  line(x, y, x1, y1);
  if(!ffw) delay(1);
  redraw();
  
  int szansa1 = szansa;
  int czy = int(random(1000));
  int level1 = int(random(10, level-5));
  if(czy < level/szansa) 
    szansa1 = szansa - 20;
  
  if(level > 1) 
    zawijas(x1, y1, gamma, (level - 1), kierunek, c, max((szansa1 - 1), 1));  
  
  if(czy < level/szansa) 
    zawijas(x1, y1, gamma, level1, !kierunek, c, szansa1);
} 

