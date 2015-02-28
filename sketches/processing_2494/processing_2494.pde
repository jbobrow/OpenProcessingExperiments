
class butterfly {
  
  float x;
  float y;
  

butterfly() {
  
};

void butterflyDraw() {
  
  
  

  stroke(random(0,255), 0, 0);
  fill(random(0,255), 0, 0);
  strokeWeight(random(1,10));
  bezier(x, y, random(0,200), random(0,200), random(200,600), random(100,500), x, y);
  bezier(x, y, random(0,200), random(0,200), random(200,600), random(100,500), x, y);
  
};

};


