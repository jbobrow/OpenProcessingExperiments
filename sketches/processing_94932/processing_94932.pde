
int i;

void setup(){
  size(500,305);
  frameRate(2);
  smooth();
  noFill();
  noStroke();
  background(3,3,3);
}

void draw(){
  if (random(0,1) <0.5){
    fill(226, 240, 77);
    rect(50, 235, 50, 65);
    rect(0, 170, 50, 130);
    rect(100,250,50,50);
    rect(150,180, 50, 120);
    rect(200,220, 50, 80);
    rect(250, 150, 50, 150);
    rect(300, 200, 50, 100);
    rect(350, 250, 50, 50);
    rect(400, 220, 50, 80);
    rect (450, 170, 50, 130);
    fill (245, 235, 235);
    ellipse (10, 10, 50, 50);
    fill (243, 245, 136);
  } else {
    fill(3,3,3);
    rect(50, 235, 50, 65);
    rect(0, 170, 50, 130);
    rect(100,250,50,50);
    rect(150,180, 50, 120);
    rect(200,220, 50, 80);
    rect(250, 150, 50, 150);
    rect(300, 200, 50, 100);
    rect(350, 250, 50, 50);
    rect(400, 220, 50, 80);
    rect (450, 170, 50, 130);
    fill (245, 235, 235);
    ellipse (10, 10, 50, 50);
    fill (243, 245, 136);
  }
  for (i = 0; i < 10; i++) {
    ellipse(random(1, 500), random(1, 250), random(5, 5), random (5, 5));
  }
}

