
void setup() {
  
  size(200,200);
  background(255);
}

void draw(){
 fill(0,255,0);
 ellipse(width/2, height/2, 150, 150);
 fill(255);
 ellipse(width/2-random(24,26), height/2-random(24,26), 20, 20);
 ellipse(width/2+random(24,26), height/2-random(24,26), 20, 20);
 fill(0);
 ellipse(width/2, (height/2+5), 5, 5);
 strokeWeight(4);
 noFill();
 arc(width/2, height/2+35, 60, 35, 0, PI);
  
    
}


