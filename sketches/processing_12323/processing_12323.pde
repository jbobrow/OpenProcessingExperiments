
class chrome implements style {
  ArrayList hist;
  float joinThresh;
  
  chrome() {
    hist = new ArrayList();
    joinThresh = 60;
  }
  
  void clear() {
    hist.clear();
  }
  
  void mouseDragged() {
    stroke(0, 100);
    PVector d = new PVector(mouseX, mouseY, 0);
    hist.add(0,d);
    for (int p = 0; p < hist.size(); p++) {
      PVector v = (PVector) hist.get(p);
      float joinChance = p/hist.size() + 
                         d.dist(v)/joinThresh;
      if (joinChance < random(0.4)) {
        float dx = d.x - v.x;
	float dy = d.y - v.y;
	float angle = atan2(dy,dx);
	float pad = d.dist(v)/4;
	line(d.x - (pad * cos(angle)) ,
	     d.y - (pad * sin(angle)) ,
	     v.x + (pad * cos(angle)) ,
	     v.y + (pad * sin(angle)) );
      }
    }
  }
}

