
void setup() {
  size (300, 300);
  background(255);
  noStroke();
  frameRate(6);
}

float count = 500;
float rndColor;

void draw() {

  if (count > 0) {  //yellow colored shapes
    rndColor = random(100);
    if (rndColor >20) {
      fill (255, 255, 0, 80);
    }
    else {  //red colored squares shapes
      fill (255, 0, 0, 80);
    }
    if (count % 2 == 0) {  //squares
      rect (random(width), random(height), 30, 30);
    } 
    else {  //horizontal rectangles
      rect (random(width), random(height), 100, 10);
    }
    if (count % 5 == 0){  //vertical rectangles
      rect (random(width), random(height), 10, 100);
    }
    if (count % 50 == 4){
      background (255);
    }
    count--;
  }
}


