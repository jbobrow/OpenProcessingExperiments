
float sizeA = 10;
boolean mouseMove = false;


void setup() {
  size (400, 400);
  rectMode(CENTER);
  frameRate (20);
}

void draw() {

  float r = random(255);
  float g = random(255);
  float b = random(255);
  if (mouseMove == true && mousePressed == true) {

    int resolution = 12;
    float radius = 10;
    float circleX = mouseX;
    float circleY = mouseY;

    beginShape();
    fill(r, g, b, 60);
    noStroke();
    for ( int i=0; i<resolution; i=i+1 ) {
      float angle = map( i, 0, resolution, 0, TWO_PI );   // 0 to TWO_PI is 0 to 360 degrees
      float circleOffX = cos(angle) * radius;             // x offset from circle center
      float circleOffY = sin(angle) * radius;             // y offset from circle center
      float x = circleX + circleOffX + random( -20, 20 );                     //
      float y = circleY + circleOffY + random( -20, 20 );

      vertex( x, y );
    }
    endShape(CLOSE);    
    //ellipse(mouseY, mouseX, size, size);
  }

  else {
  }
}

void mouseClicked() {
  sizeA = sizeA + 10;
}

void keyPressed() {
  if (key == '1') {
    fill(#AF9F91, 100);
    stroke(#F0E4DA);
    strokeWeight(1);
    int resolution = 12;
    float radius = 175;
    float circleX = width * 0.5;
    float circleY = height * 0.5;

    beginShape();
    for ( int i=0; i<resolution; i=i+1 ) {
      float angle = map( i, 0, resolution, 0, TWO_PI );   // 0 to TWO_PI is 0 to 360 degrees
      float circleOffX = cos(angle) * radius;             // x offset from circle center
      float circleOffY = sin(angle) * radius;             // y offset from circle center
      float x = circleX + circleOffX + random( -20, 20 );                     //
      float y = circleY + circleOffY + random( -20, 20 );

      vertex( x, y );
    }
    endShape(CLOSE);
  } 
  else if (key == '2') {
    fill(#988B81, 100);
    stroke(#AF9F91);
    strokeWeight(1);
    int resolution = 20;
    float radius = 120;
    float circleX = width * 0.5;
    float circleY = height * 0.5;

    beginShape();
    for ( int i=0; i<resolution; i=i+1 ) {
      float angle = map( i, 0, resolution, 0, TWO_PI );   // 0 to TWO_PI is 0 to 360 degrees
      float circleOffX = cos(angle) * radius;             // x offset from circle center
      float circleOffY = sin(angle) * radius;             // y offset from circle center
      float x = circleX + circleOffX + random( -10, 10 );                     //
      float y = circleY + circleOffY + random( -10, 10 );

      vertex( x, y );
    }
    endShape(CLOSE);
  } 
  else if (key == '3') {
    fill(#746D67, 70);
    stroke(#988B81);
    strokeWeight(1);
    int resolution = 30;
    float radius = 60;
    float circleX = width * 0.5;
    float circleY = height * 0.5;

    beginShape();
    for ( int i=0; i<resolution; i=i+1 ) {
      float angle = map( i, 0, resolution, 0, TWO_PI );   // 0 to TWO_PI is 0 to 360 degrees
      float circleOffX = cos(angle) * radius;             // x offset from circle center
      float circleOffY = sin(angle) * radius;             // y offset from circle center
      float x = circleX + circleOffX + random( -20, 20 );                     //
      float y = circleY + circleOffY + random( -20, 20 );

      vertex( x, y );
    }
    endShape(CLOSE);
  }
}

void mouseMoved() {
  mouseMove = true;
}

