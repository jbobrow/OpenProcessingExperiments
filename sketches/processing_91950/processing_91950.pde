
int runningTime;
int storedTime;

void setup() {
  size(500, 600);
  storedTime= 0;
}

void draw() {
  background(0);

  runningTime= millis();

  if (runningTime > 10000) {
    noStroke();
    rect(0, 0, 100, 100);
  }

  if (runningTime > 20000) {
    noStroke();
    rect(0, 100, 100, 100);
  }

  if (runningTime > 30000) {
    noStroke();
    rect(0, 200, 100, 100);
  }

  if (runningTime > 40000) {
    noStroke();
    rect(0, 300, 100, 100);
  }

  if (runningTime > 50000) {
    noStroke();
    rect(0, 400, 100, 100);
  }
  if (runningTime > 60000) {
    noStroke();
    rect(0, 500, 100, 100);
    fill(0, 255, 0);
    noStroke();
    rect(0, 0, 100, 600);
  }

  if (runningTime > 70000) {
    noStroke();
    fill(0, 255, 0);
    rect(100, 500, 100, 100);
  }

  if (runningTime > 80000) {
    noStroke();
    fill(0, 255, 0);
    rect(100, 400, 100, 100);
  }

  if (runningTime > 90000) {
    noStroke();
    fill(0, 255, 0);
    rect(100, 300, 100, 100);
  }

  if (runningTime > 100000) {
    noStroke();
    fill(0, 255, 0);
    rect(100, 200, 100, 100);
  }

  if (runningTime > 110000) {
    noStroke();
    fill(0, 255, 0);
    rect(100, 100, 100, 100);
  }

  if (runningTime > 120000) {
    noStroke();
    fill(0, 255, 0);
    rect(100, 0, 100, 100);
    fill(0, 0, 255);
    rect(0, 0, 200, 600);
  }

  if (runningTime > 130000) {
    noStroke();
    fill(0, 0, 255);
    rect(200, 0, 100, 100);
  }
  
  
  if (runningTime > 140000) {
    noStroke();
    fill(0, 0, 255);
    rect(200, 100, 100, 100);
  }
 
  if (runningTime > 150000) {
    noStroke();
    fill(0, 0, 255);
    rect(200, 200, 100, 100);
  }
  
  if (runningTime > 160000) {
    noStroke();
    fill(0, 0, 255);
    rect(200, 300, 100, 100);
  }
  if (runningTime > 170000) {
    noStroke();
    fill(0, 0, 255);
    rect(200, 400, 100, 100);
  }
  
  if (runningTime > 180000) {
    noStroke();
    fill(0, 0, 255);
    rect(200, 500, 100, 100);
    fill(255,0,0);
    rect(0,0,300,600);
  }
  
  
  
  
  
    if (runningTime > 190000) {
    noStroke();
    fill(255, 0, 0);
    rect(300, 500, 100, 100);
  }
  
  
  if (runningTime > 200000) {
    noStroke();
    fill(255, 0, 0);
    rect(300, 400, 100, 100);
  }
 
  if (runningTime > 210000) {
    noStroke();
    fill(255, 0, 0);
    rect(300, 300, 100, 100);
  }
  
  if (runningTime > 220000) {
    noStroke();
    fill(255, 0, 0);
    rect(300, 200, 100, 100);
  }
  if (runningTime > 230000) {
    noStroke();
    fill(255, 0, 0);
    rect(300, 100, 100, 100);
  }
  
  if (runningTime > 240000) {
    noStroke();
     fill(255, 0, 0);
    rect(300, 0, 100, 100);
    fill(255,255,0);
    rect(0,0,400,600);
  }
  
  
  
  
  
  
  
  
      if (runningTime > 250000) {
    noStroke();
  fill(255,255,0);
    rect(400, 0, 100, 100);
  }
  
  
  if (runningTime > 260000) {
    noStroke();
  fill(255,255,0);
    rect(400, 100, 100, 100);
  }
 
  if (runningTime > 270000) {
    noStroke();
  fill(255,255,0);
    rect(400, 200, 100, 100);
  }
  
  if (runningTime > 280000) {
    noStroke();
   fill(255,255,0);
    rect(400, 300, 100, 100);
  }
  if (runningTime > 290000) {
    noStroke();
  fill(255,255,0);
    rect(400, 400, 100, 100);
  }
  
  if (runningTime > 300000) {
    noStroke();
  fill(255,255,0);
    rect(400, 500, 100, 100);
    fill(0);
    rect(0,0,500,600);
  }
  
}
