
float resolution;
float radius = 100;
float circleX;
float circleY;
float rotation = 0;
float circles;
float circleW;
float circleH;
float offset;

void setup() {
  size(700, 700);
  //background(255);
  circleX = 0;
  circleY = 0;
}

void draw() {
  fill(0,0,0,25);
  rect(0,0,width,height);
  //background(0);
  translate(width/2, height/2);
  fill(255);
  noStroke();
  //stroke(0);
  offset++;

  resolution = map(sin(offset*0.0005), -1, 1, 50, 200);
  //resolution = 50;
  circles = 400;
  
  //map(sin(offset*0.0005), -1, 1, 50, 200);
  
  circleW = map(sin(offset*0.05), -1, 1, 3, 8);
  circleH = map(sin(offset*0.05), -1, 1, 3, 8);

  for (int i = 0; i < resolution; i++) {

    float scale = 200;

    float waveAngle = map(i, 0, resolution, 0, TWO_PI * circles); //number of circles
    float waveOffset = sin(waveAngle) * scale;  //scale the -1 to 1 up

    float angle = map(i, 0, resolution, 0, TWO_PI * 156); //multiply for weirdness
    //float angle = map(i, 0, resolution, 0, TWO_PI * mouseX);

    float circleOffsetX = cos(angle) * (radius + waveOffset); //xposition
    float circleOffsetY = sin(angle) * (radius + waveOffset); //yposition

    float x = circleX + circleOffsetX;
    float y = circleY + circleOffsetY;
    
    ellipse(x, y, circleW, circleH);

  }
  //endShape(CLOSE);
}

