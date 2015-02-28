

void setup(){
 size(600,400);
 background(255); 
}

void draw(){
 
 if (mousePressed){
    for(int i = 0; i < 100; i++){
      int num = int(random(255));
      strokeWeight(random(1,4));
        if (i%2 == 0){
          fill(255,255,255);
          rect(random(600), random(400), random(80), random(80));
        } else {
          fill(random(0,255),random(0,255),random(0,255));
          ellipse(random(600), random(400), i%80, i%80);
        }
    }
  
 } 
  
}


