
// Drawing programme


int alpha = 255;
color c0 = color(255);
color c1 = color(255, 0, 0);
color c2 = color(0, 255, 0);
color c3 = color(0, 0, 255);
color activeColor;
int resolution = 64;
float radius = 100;
float offset;

float angleOffset = 0;

// Interaction & color change with keyPressed

void setup() {
  size(800, 800);
  rectMode(CENTER);
  background(255);
  offset++;
  activeColor = c1;
}

float size = 10;

void draw() {

  fill(activeColor, alpha);
 
  
  if (mousePressed == true && key == 'z') {
    activeColor = color( random(0,255), random(0,255),random(0,255) );
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(angleOffset);
    beginShape();
    for ( int i=0; i<resolution; i=i+1) {

      float myPerlin = noise(millis()*0.001+float(i)*100) * 100;

      float angle = map(i, 0, resolution, 0, TWO_PI*20);
      float circleOffX = cos(angle+offset) * (myPerlin+radius);
      float circleOffY = sin(angle+offset) * (myPerlin+radius);

      float x =  circleOffX;
      float y =  circleOffY;

      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();

    if (mousePressed == true && key == 'c') {

      pushMatrix();
      translate(mouseX, mouseY);
      rotate(angleOffset);
    
      beginShape();
      for ( int i=0; i<resolution; i=i+1) {

        float myPerlin = noise(millis()*0.01+float(i)*100) * 100;

        float angle = map(i, 0, resolution, 0, TWO_PI*20);
        float circleOffX = cos(angle+offset) * (myPerlin+radius);
        float circleOffY = sin(angle+offset) * (myPerlin+radius);

        float x =  circleOffX;
        float y =  circleOffY;

        vertex(x, y);
      }
      endShape(CLOSE);
      popMatrix();
    }
  }
 if (mousePressed == true && key == 'z') {
    activeColor = color( random(0,255), random(0,255),random(0,255) );
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(angleOffset);
    beginShape();
    for ( int i=0; i<resolution; i=i+1) {

      float myPerlin = noise(millis()*0.001+float(i)*100) * 100;

      float angle = map(i, 0, resolution, 0, TWO_PI*20);
      float circleOffX = cos(angle+offset) * (myPerlin+radius);
      float circleOffY = sin(angle+offset) * (myPerlin+radius);

      float x =  circleOffX;
      float y =  circleOffY;

      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  angleOffset = angleOffset + radians(1);
  ellipse(mouseX, mouseY, size, size);
}
void mouseClicked() {
  size = size + 10;
}

void keyPressed() {
  
   if (key == '-') radius = radius - 5;
   if (key == '+') radius = radius + 5;

  float circleX = width/2;
  float circleY = height/2;

  // Color Mode
  if (key == 'w') {
    activeColor = c0;
  }
  if (key == 'r') {
    activeColor = c1;
  }
  if (key == 'g') {
    activeColor = c2;
  }
  if (key == 'b') {
    activeColor = c3;
  }

  // Erase everything
  if (key == ' ') background(c0);

  // Resize
  if (key == 's') size = 10;

  // Oppacity
  if (key == '1') alpha = 100;
  if (key == '2') alpha = 255;

  // Star shape
  if (key == 'p') {
    if (mouseX<200) {
      activeColor = c3;
      println("option1");
    }

    else if (mouseX > 200 && mouseX < 400) {
      activeColor = c2;
      println("option2");
    }

    else if (mouseX > 400 && mouseY < 100) {
      activeColor = c1;
      println("option3");
      
    }
   
  }
}

