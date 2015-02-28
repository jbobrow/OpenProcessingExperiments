
Guy1[] lilJoeys;
Guy2[] lilMoes;
Guy3[] lilKaylas;

void setup() {
  size(1024, 768);
  background(0);
  stroke(255, 130);
  randomSeed(101);   // Force the same random values

  lilJoeys = new Guy1[100];
  lilMoes = new Guy2[300];
  lilKaylas = new Guy3[500];

  for (int i = 0; i < lilJoeys.length; i++) {
    lilJoeys[i] = new Guy1();
  }
  for (int i = 0; i < lilMoes.length; i++) {
    lilMoes[i] = new Guy2();
  }
  for (int i = 0; i < lilKaylas.length; i++) {
    lilKaylas[i] = new Guy3();
  }
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);
  for (int i=0; i < lilJoeys.length; i++) {
    lilJoeys[i].update(); // Move each object
    lilJoeys[i].display(width/2, height/2); // Display each object
    
  }

  for (int i=0; i < lilMoes.length; i++) {
    lilMoes[i].update(); // Move each object
    lilMoes[i].display(width/2, height/2); // Display each object
  }

  for (int i=0; i < lilKaylas.length; i++) {
    lilKaylas[i].update(); // Move each object
    lilKaylas[i].display(width/2, height/2); // Display each object
  }
  
  
}

class Guy1 {
  float x = 0.0;       // X-coordinate
  float y = 0.0;      // Y-coordinate
  float startX = 0;
  float startY = 0;
  float angle = 0.0;   // Direction of motion
  float speed = 0.5;   // Speed of motion

  void update() {
   
    angle += random(-0.3, 0.3);
    x += (sin(angle)) * speed;  // Update x-coordinate
    y += (cos(angle)) * speed;  // Update y-coordinate
  }

  void display(float xPos, float yPos) {
    startX = xPos;
    startY = yPos;
    pushMatrix();
    translate(x+startX, y+startY);
    rotate(angle);
    fill(255, 100);
    ellipse(0, 0, 15, 15);
    popMatrix();
  }
}



class Guy2 {
  float x = 0.0;       // X-coordinate
  float y = 0.0;      // Y-coordinate
  float startX = 0;
  float startY = 0;
  float angle = 0.0;   // Direction of motion
  float speed = .7;   // Speed of motion

  void update() {
   
    angle += random(-0.3, 0.3);
    x += (cos(angle)) * speed;  // Update x-coordinate
    y += (sin(angle)) * speed;  // Update y-coordinate
  }

  void display(float xPos, float yPos) {
    startX = xPos;
    startY = yPos;
    pushMatrix();
    translate(x+startX, y+startY);
    rotate(angle);
    fill(255, 100);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
}

class Guy3 {
  float x = 0.0;       // X-coordinate
  float y = 0.0;      // Y-coordinate
  float startX = 0;
  float startY = 0;
  float angle = 0.0;   // Direction of motion
  float speed = 1;   // Speed of motion

  void update() {
   
    angle += random(-0.3, 0.03);
    x += (sin(angle)+(sin(3*angle)/3)+(sin(5*angle)/5)) * speed;  // Update x-coordinate
    y += (cos(angle)+(cos(3*angle)/3)+(sin(5*angle)/5)) * speed;  // Update y-coordinate
  }

  void display(float xPos, float yPos) {
    startX = xPos;
    startY = yPos;
    pushMatrix();
    translate(x+startX, y+startY);
    rotate(angle);
    fill(255, 100);
    ellipse(0, 0, 8, 8);
    popMatrix();
  }
}



