



void setup() {
  size(400, 400);
  background(0);
  noFill();
  smooth();
}


void draw() {
  background(0);
  


    for ( int i = 0; i < width; i++) {
    stroke(random(255), random(255), random(42550));
    rect(20+1, 20, 150, 150+i, 20, 20); 
    
    stroke(random(100), random(255), random(100));  
    rect(100+1, 100, 50, 50+i, 20, 20);
    
    stroke(random(255), random(255), random(255));
    rect(180+1, 80, 50, 60+i, 20, 20);
    
    stroke(random(20), random(165), random(44));
    rect(230+1, 0, 100, 50+i, 40, 20);
    
    stroke(random(10), random(200), random(255));
    rect(300+1, 120, 100, 50+i, 40, 20);
    
    stroke(random(240), random(165), random(44));
    rect(300+1, 75, 150, 150+i, 20, 20); 
    
    stroke(random(255), random(255), random(255));
    rect(0+1, 300, 100, 50+i, 40, 20);
    
    stroke(random(255), random(255), random(255));
    rect(230+1, 0, 100, 50+i, 40, 20);
    
    

  }
}

