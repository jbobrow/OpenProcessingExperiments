
float moveX = 200;
float speedX = .25;
float moveY = 200;
float speedY = .25;
float moveZ = 200;
float speedZ = .25;
float rootbeer = 0;
int x = mouseX;
int y = mouseY;


void setup() {
  size(1000, 1000, P3D);
  noStroke();
}

void draw() {
  //background(0,0,0,0);
  defineLights();

  for (int x = 0; x <= width; x += 60) {
    for (int y = 0; y <= height; y += 60) {
      pushMatrix();
      translate(x, y);
      rotateY(map(mouseX, 0, width, 0, PI));
      rotateX(map(mouseY, 0, height, 0, PI));
      //fill(199,205,167);
      box(80);
      popMatrix();



      float cameraY = height;
      float fov = mouseX/float(height) * PI/4;
      float cameraZ = cameraY/tan(fov);
      float aspect = float(width)/float(height);
      if (mousePressed) {
        //fill(random(0,800));
        translate(random(0,800),0,-50);
        rotateY(0.5);
        box(pmouseX,pmouseY,45);
        fill(random(0,800)); 
      }
      perspective(fov, aspect, cameraZ/10, cameraZ*10);
      translate(width/2+15, height/2, 0);
      rotateX(-PI/6);
      rotateY(PI/3 + mouseY/float(height) * PI);
      translate(random(0, 800), 0, -50);
      box(x, y, 45);
      box(x, y, 80);
      translate(58, 48, 0);
      rotateY(0.5);
      //fill(108,111,130);
      box(40, 20, 50);
      fill(108, 111, 130);
      box(45);
    }
  }
}

void defineLights() {
  // Orange point light on the right
  pointLight(146, 200, 100, // Color
  200, -150, 0); // Position

  // Blue directional light from the left
  directionalLight(108, 111, 130, // Color
  1, 0, 0);    // The x-, y-, z-axis direction

  // Yellow spotlight from the front
  spotLight(224, 216, 195, // Color
  0, 40, 200, // Position
  0, -0.5, -0.5, // Direction
  PI / 2, 2);     // Angle, concentration
}



