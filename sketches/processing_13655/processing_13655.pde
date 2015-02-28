

/**
 * Vertices 
 * by Simon Greenwold.
 * 
 * Draw a cylinder centered on the y-axis, going down 
 * from y=0 to y=height. The radius at the top can be 
 * different from the radius at the bottom, and the 
 * number of sides drawn is variable.
 */

PImage eye,smile;

void setup() {
  background(0);
  size(640, 360, P3D);
  eye = loadImage("pupil.png");
  smile = loadImage("smile.jpg");
  textureMode(NORMALIZED);
}

void draw() {
  background(0);
  lights();
  translate(width / 2, height / 4, -400);
  rotateY(map(sin(radians(frameCount)),-1,1,-QUARTER_PI,QUARTER_PI));
  rotateX(-HALF_PI/2);
  //rotateY(map(mouseX, 0, width, -PI, PI));
  //rotateZ(map(mouseY, 0, height, PI, -PI));
  noStroke();
  fill(255, 255, 255);
  pushMatrix();
  translate(-200, -40, 100);
  //drawCylinder(10, 180, 200, 16); // Draw a mix between a cylinder and a cone
  //drawCylinder(70, 70, 120, 64); // Draw a cylinder
  //drawCylinder(0, 180, 200, 4); // Draw a pyramid
  drawCrab(map(mouseX,0,width,-90, 90),map(mouseX,0,width,-90, 90),map(mouseX,0,width,-180, 90),map(mouseY,0,height,-90, 90));
  popMatrix();
  
}

void drawCrab(float leftEye, float rightEye, float shoulder, float elbow){
  int crabSize = 400;
  int armLength = crabSize/2;
  int craniumX = crabSize;
  int craniumY = crabSize/5;
  int craniumZ = -crabSize/2;
  int origin = 0;
  int thigh = crabSize/2;
  int shin = crabSize/6;
  int legOffset = crabSize/20;
  
  beginShape(QUAD_STRIP);//Sides
  vertex(origin,origin,origin);
  vertex(origin,craniumY,origin);
  vertex(craniumX,origin,origin);
  vertex(craniumX,craniumY,origin);
  vertex(craniumX,origin,craniumZ);
  vertex(craniumX,craniumY,craniumZ);
  vertex(0,origin,craniumZ);
  vertex(0,craniumY,craniumZ);
  vertex(origin,origin,origin);
  vertex(origin,craniumY,origin);
  endShape(CLOSE);
  
  beginShape(QUAD_STRIP);//Bottom
  vertex(origin,craniumY,origin);
  vertex(origin,craniumY,craniumZ);
  vertex(craniumX/3,craniumY*2,origin);
  vertex(craniumX/3,craniumY*2,craniumZ);
  vertex((craniumX/3)*2,craniumY*2,origin);
  vertex((craniumX/3)*2,craniumY*2,craniumZ);
  vertex(craniumX,craniumY,origin);
  vertex(craniumX,craniumY,craniumZ);
  endShape(CLOSE);
  
  beginShape(QUADS);
  //Face
  //Front Panel
  texture(smile);
  vertex(craniumX/3,craniumY,origin,0,0);
  vertex(craniumX/3,craniumY*2,origin,0,1);
  vertex((craniumX/3)*2,craniumY*2,origin,1,1);
  vertex((craniumX/3)*2,craniumY,origin,1,0);
  endShape();
  
  beginShape(QUADS);
  //Flat Top
  vertex(origin,origin,craniumZ);
  vertex(craniumX,origin,craniumZ);
  vertex(craniumX,origin,origin);
  vertex(origin,origin,origin);
  
  
  
  //Back Panel
  vertex(craniumX/3,craniumY,craniumZ);
  vertex(craniumX/3,craniumY*2,craniumZ);
  vertex((craniumX/3)*2,craniumY*2,craniumZ);
  vertex((craniumX/3)*2,craniumY,craniumZ);
  endShape();
  
  beginShape(TRIANGLES);
  //Triangle body panel
  vertex(origin,craniumY,origin);
  vertex(craniumX/3,craniumY,origin);
  vertex(craniumX/3,craniumY*2,origin);

  //Triangle body panel
  vertex((craniumX/3)*2,craniumY,origin);
  vertex((craniumX/3)*2,craniumY*2,origin);
  vertex(craniumX,craniumY,origin);
  
  //Triangle body panel
  vertex(origin,craniumY,craniumZ);
  vertex(craniumX/3,craniumY,craniumZ);
  vertex(craniumX/3,craniumY*2,craniumZ);
  
  //Triangle body panel
  vertex((craniumX/3)*2,craniumY,craniumZ);
  vertex((craniumX/3)*2,craniumY*2,craniumZ);
  vertex(craniumX,craniumY,craniumZ);
  endShape();
  
  //Eyes
  pushMatrix();
  translate((craniumX/10)*2,0,0);
  sphere(craniumX/10);
  pushMatrix();
  rotateY(radians(leftEye));
  beginShape();
  texture(eye);
  vertex(-(craniumX/10),-(craniumX/10),(craniumX/10),0,0);
  vertex(-(craniumX/10),(craniumX/10),(craniumX/10),0,1);
  vertex((craniumX/10),(craniumX/10),(craniumX/10),1,1);
  vertex((craniumX/10),-(craniumX/10),(craniumX/10),1,0);
  endShape();
  popMatrix();
  translate((craniumX/10)*6,0,0);
  sphere(craniumX/10);
  pushMatrix();
  rotateY(radians(rightEye));
  beginShape();
  texture(eye);
  vertex(-(craniumX/10),-(craniumX/10),(craniumX/10),0,0);
  vertex(-(craniumX/10),(craniumX/10),(craniumX/10),0,1);
  vertex((craniumX/10),(craniumX/10),(craniumX/10),1,1);
  vertex((craniumX/10),-(craniumX/10),(craniumX/10),1,0);
  endShape();
  popMatrix();
  popMatrix();
  
  //Arm Ball Joint
  pushMatrix();
  translate(craniumX/2,craniumY*2,origin);
  sphere(craniumX/20);
  rotateY(radians(shoulder));
  beginShape(QUAD_STRIP);
  vertex(-craniumX/40,-craniumX/40,0);
  vertex(-craniumX/40,-craniumX/40,armLength);
  vertex(craniumX/40,-craniumX/40,0);
  vertex(craniumX/40,-craniumX/40,armLength);
  vertex(craniumX/40,craniumX/40,0);
  vertex(craniumX/40,craniumX/40,armLength);
  vertex(-craniumX/40,craniumX/40,0);  
  vertex(-craniumX/40,craniumX/40,armLength);
  vertex(-craniumX/40,-craniumX/40,0);
  vertex(-craniumX/40,-craniumX/40,armLength); 
  endShape();
  translate(0,0,armLength);
  sphere(craniumX/20);
  rotateY(radians(90+elbow));
  beginShape(QUAD_STRIP);
  vertex(-craniumX/40,-craniumX/40,0);
  vertex(-craniumX/40,-craniumX/40,armLength);
  vertex(craniumX/40,-craniumX/40,0);
  vertex(craniumX/40,-craniumX/40,armLength);
  vertex(craniumX/40,craniumX/40,0);
  vertex(craniumX/40,craniumX/40,armLength);
  vertex(-craniumX/40,craniumX/40,0);  
  vertex(-craniumX/40,craniumX/40,armLength);
  vertex(-craniumX/40,-craniumX/40,0);
  vertex(-craniumX/40,-craniumX/40,armLength); 
  endShape();
  translate(0,0,armLength);
  sphere(craniumX/20);
  beginShape(TRIANGLES);
  vertex(-craniumX/20,0,0);
  vertex(craniumX/20,0,0);
  vertex(craniumX/20,0,craniumX/10);
  vertex(craniumX/20,0,0);
  vertex(-craniumX/20,0,0);
  vertex(-craniumX/20,0,craniumX/10);
  endShape();
  popMatrix();
  
  //Legs
  stroke(255);
  noFill();
  
  pushMatrix();
  translate(craniumX/3,craniumY*2,craniumZ/4);
  pushMatrix();
  for(int i = 0; i < 3; i++){
    beginShape();
    vertex(0,0,0);
    vertex(-thigh,-legOffset,0);
    vertex(-thigh-legOffset,-legOffset+shin,0);
    endShape();
    translate(0,0,craniumZ/4);
  }
  popMatrix();
  translate(craniumX/3,0,0);
  pushMatrix();
  for(int i = 0; i < 3; i++){
    beginShape();
    vertex(0,0,0);
    vertex(+thigh,-3,0);
    vertex(+thigh+3,-3+shin,0);
    endShape();
    translate(0,0,craniumZ/4);
  }
  popMatrix();
  popMatrix();
  noStroke();
  
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
  
  // If it is not a cone, draw the circular top cap
  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    
    // Center point
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }

  // If it is not a cone, draw the circular bottom cap
  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);

    // Center point
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
}

