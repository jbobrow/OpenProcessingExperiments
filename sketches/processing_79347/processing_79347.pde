
class V {
  float t;
  float ypos;
  
  V (float t_, float ypos_) {
    t = t_;
    ypos = ypos_;
  }
  
  void display(){
    
    ypos = map(noise(t/5), 0., 1., 0., height);
  
    float noisevalue = noise(t) * 255.;
    t = t + 0.05;
    noStroke();
    fill(255,noisevalue,255-noisevalue,noisevalue);
    ellipse(width/2+sin(t)*110, ypos, noisevalue/6+10, noisevalue/6+10);
  }
 
}

