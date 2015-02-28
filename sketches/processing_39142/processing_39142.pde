
void setup() {
  size(400, 400);
  background(150, 150, 100);
  float z;
  float w;
}

//basic setting for drawing
void draw() { 
  for (int a=30; a<width*2; a+=100) {
    for (int b=15; b<width/2; b+=50) {
      shapes(a, b);
    }
  }
  noLoop();
}

void shapes(float a, float b) {
  //defining shapes
  float z = random(50, 100);
  float w = random(80, 120);
  strokeWeight(random(1, 5));
  stroke(0, 80);
  noFill();
  rectMode(CENTER);

  //first row of shapes
  stroke(30, 100, random(0, 150), 90); 
  rect(random(100), random(height), z, z);

  //second row of shapes
  stroke(100, random(0, 200), 30, 90);
  ellipse(random(150, 250), random(height), w, w);

  //third row of shapes
  stroke(30, 100, random(0, 150), 90); 
  rect(random(300, 400), random(height), z, z);
}


