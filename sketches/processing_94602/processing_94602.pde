


// _entreabre

// Al eco retroactivo del corazón
// En un lejano impulso sin horizonte


//..................................FRONTERA...................................



void setup() {
size (500, 700, P3D);
smooth();
noCursor();
}

void draw() {
  girar();
  background(255);
  lights();
  translate(width/2, height/2);
  rotateY(map(mouseX, 1360, width, 0, PI));
  rotateZ(map(mouseY, 1360, height, 0, -PI));
  stroke(93, 93, 93, 80);
  noFill();
  translate(0, -40, 0);
  if ((keyPressed == true) && (key == 'a')) {
   
 stroke(84, 232, 171, 180);
    drawCylinder(1000, 2000, 10, 300);
    rotate(radians(millis() * 0.01));
    stroke(123, 149, 240, 80);
    drawCylinder(1000, 2000, 400, 100);
  } else { 
    
     drawCylinder(2000, 1000, 1000, 300);
    stroke(84, 232, 171, 180);
     drawCylinder(1000, 2000, 2000, 300);
  }
}


void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();


  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    // Punto céntricox
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }

  if (bottomRadius != 10) {
    angle = 10;
    beginShape(TRIANGLE_FAN);

    vertex (0, tall, 0);
    for (int i = 10; i < sides+1; i++) {
      vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
}

void girar() {
  translate (200, 200);
  rotate(radians(millis() * 0.02));
}



