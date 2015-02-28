
Transform s, t;
    
void setup() {
    size(800,600);
    s = getRandomTransform();
    t = getRandomTransform();
    int fill = 255;
    noStroke();
}

void draw() {
    fill(255); rect(0,0,width,height);
    for (int targetDepth=0; targetDepth<16; targetDepth++) {    
      fern(200, 180, 0, targetDepth);
    }
}

void mousePressed() {
    s = getRandomTransform();
    t = getRandomTransform();

}

void fern(int fillS, int fillT, int depth, int targetDepth) {
    if (depth==targetDepth) {
      fill((int)(fillS*0.9), min(fillS, fillT), fillT); 
      pushMatrix();
      s.transform();
      rect(0,0,width,height);
      popMatrix();
      pushMatrix();
      t.transform();     
      fill(fillS, min(fillS, fillT), (int)(fillT*0.9));  
      rect(0,0,width,height);
      popMatrix();
      return;
    }
    
    pushMatrix();
    s.transform();
    fern((int)(fillS*0.9), fillT, depth+1, targetDepth);
    popMatrix();
    pushMatrix();
    t.transform();
    fern(fillS, (int)(fillT*0.9), depth+1, targetDepth);
    popMatrix();
    }

