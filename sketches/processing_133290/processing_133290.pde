
float offset;

void setup() {

  size(800, 400);
  
}

void draw() {

  background(255);
  int resolution = 64;
  float radius = 100;
  offset++;
  resolution=mouseX;
  radius=mouseY*0.5;

  rect(width/2-20, height/2+60, 30, 150);

  
  
  float circleX = width/2;
  float circleY = height/2;

  // Shape 1

  fill(57, 162, 165);
  stroke(0);

  beginShape();
  for ( int i=0; i<resolution; i=i+1) {
    float waveAngle = map(i, 0, resolution, 0, TWO_PI*8);  // * 20 is the number of waves
    float waveOffset = sin(waveAngle)*30;

    float myPerlin = noise(millis()*0.001+float(i)*100) * 100;

    float angle = map(i, 0, resolution, 0, TWO_PI);
    float circleOffX = cos(angle+offset/100) * ((radius + myPerlin) + waveOffset);
    float circleOffY = sin(angle+offset/100) * ((radius + myPerlin) + waveOffset);

    float x = circleX + circleOffX;
    float y = circleY + circleOffY;

    //ellipse(x,y,10,10);

    vertex(x, y);
  }
  endShape(CLOSE);

  // Shape 2
  radius = 50;
  fill(0, 0, 0, 90);
  stroke(255);

  beginShape();
  for ( int i=0; i<resolution; i=i+1) {

    float myPerlin = noise(millis()*0.001+float(i)*100) * 100;

    float angle = map(i, 0, resolution, 0, TWO_PI);
    float circleOffX = cos(angle+offset/100) * (myPerlin + radius);
    float circleOffY = sin(angle+offset/100) * (myPerlin + radius);

    float x = circleX + circleOffX;
    float y = circleY + circleOffY;

    //ellipse(x,y,10,10);

    vertex(x, y);
  }
  endShape(CLOSE);

  //Shape 3
  radius = 30;
  fill(0);
  stroke(255);

  beginShape();
  for ( int i=0; i<resolution; i=i+1) {
    //float waveAngle = map(i,0,resolution,0, TWO_PI*25);  // * 20 is the number of waves
    //float waveOffset = sin(waveAngle)*100;

    float myPerlin = noise(millis()*0.001+float(i)*100) * 30;

    float angle = map(i, 0, resolution, 0, TWO_PI);
    float circleOffX = cos(angle+offset/100) * (radius + myPerlin);
    float circleOffY = sin(angle+offset/100) * (radius + myPerlin);

    float x = circleX + circleOffX;
    float y = circleY + circleOffY;

    //ellipse(x,y,10,10);

    vertex(x, y);
  }
  endShape(CLOSE);
  radius=120;
  fill(0, 0, 0, 10);
  stroke(0);

  beginShape();
  for ( int i=0; i<resolution; i=i+1) {
    float waveAngle = map(i, 0, resolution, 0, TWO_PI*8);  // * 20 is the number of waves
    float waveOffset = sin(waveAngle)*30;

    float myPerlin = noise(millis()*0.001+float(i)*100) * 100;

    float angle = map(i, 0, resolution, 0, TWO_PI);
    float circleOffX = cos(angle+offset/100) * ((radius + myPerlin) + waveOffset);
    float circleOffY = sin(angle+offset/100) * ((radius + myPerlin) + waveOffset);

    float x = circleX + circleOffX;
    float y = circleY + circleOffY;

    //ellipse(x,y,10,10);

    vertex(x, y);
  }
  endShape(CLOSE);

  fill(0);
  textSize(40);
  text("PROCESSING ROCKS", width/2-180, height/2-100);
}

