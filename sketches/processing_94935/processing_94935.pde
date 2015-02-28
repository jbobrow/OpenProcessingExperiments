
int i;

void setup(){
    size (500, 500);
    background(255);
    frameRate(2);
    strokeWeight(2);
    
}

void draw (){
  if (random(0, 1) <0.5){
    fill (8,2,2);
    ellipse (200, 250, 100, 100);
    ellipse (300, 250, 100, 100);
    triangle (153, 270, 348, 270, 250, 400);
    rect (240, 250, 20, 20); 
    stroke (255,255,0);
  } else {
    fill (245, 131, 224);
    ellipse (200, 250, 100, 100);
    ellipse (300, 250, 100, 100);
    triangle (153, 270, 348, 270, 250, 400);
    rect (240, 250, 20, 20);
    stroke (0,255,255);
  }
  for (i = 0; i < 10; i++) {
    line(random(1,499), random(1, 499), random(1, 499), random (1, 499));
  }
}

