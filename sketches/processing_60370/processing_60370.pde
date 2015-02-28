
float AABBxmin = 0;
float AABBxmax = 0;
float AABBymin = 0;
float AABBymax = 0;

void AABBoxUpdate() {
  PVector sommeta = (PVector) sommets.get(0);
  AABBxmin = sommeta.x;
  AABBxmax = sommeta.x;
  AABBymin = sommeta.y;
  AABBymax = sommeta.y;
  if(sommets.size()>1){
    for(int i=0; i<sommets.size(); i++) {
      PVector sommeti = (PVector) sommets.get(i);
      if(sommeti.x<AABBxmin){AABBxmin = sommeti.x;}
      if(sommeti.x>AABBxmax){AABBxmax = sommeti.x;}
      if(sommeti.y<AABBymin){AABBymin = sommeti.y;}
      if(sommeti.y>AABBymax){AABBymax = sommeti.y;}
    }
  }
}

void AABBoxDisplay() {
  pushStyle();
  noStroke();
  fill(255,50);
  rectMode(CORNERS);
  rect(AABBxmin,AABBymin,AABBxmax,AABBymax);
  popStyle();
}

