
ArrayList<bounceSphere> balls = new ArrayList<bounceSphere>();

int originRX, originRY;
float rotX, rotY, tempRX, tempRY;

int originPX, originPY;
int panX, panY, tempPX, tempPY;

int zoom, speed = 5;

void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(0);
  noStroke();
  lights();
  
  pushMatrix();
  translate(300, 300, zoom * -50);
  
  translate((panX + tempPX) * -1, (panY + tempPY) * -1);
  
  if (mousePressed && mouseButton == CENTER) {
    tempRY = (originRX - mouseX) * 0.01;
    tempRX = (originRY - mouseY) * 0.01;
  }
  
  rotateY(rotY + tempRY);
  rotateX(rotX + tempRX);
  
  if (mousePressed && mouseButton == RIGHT) {
    tempPX = originPX - mouseX;
    tempPY = originPY - mouseY;
  }
  
  fill(150);
  pushMatrix();
  translate(0, 0, -25);
  
    pushMatrix();
      box(600, 600, 1);
      translate(-300, 0, 50);
      box(1, 600, 100);
    popMatrix();
    
    pushMatrix();
      translate(0, -300, 50);
      box(600, 1, 100);
    popMatrix();
    
    pushMatrix();
      translate(0, 300, 50);
      box(600, 1, 100);
    popMatrix();
    
    pushMatrix();
      translate(300, 0, 50);
      box(1, 600, 100);
    popMatrix();
  
  popMatrix();
  translate(-300, -300);
  
  for (int i = 0; i < balls.size(); i++) {
    pushMatrix();
      fill(balls.get(i).red, balls.get(i).green, balls.get(i).blue);
      balls.get(i).update();
      translate(balls.get(i).x, balls.get(i).y, balls.get(i).radius - 25);
      sphere(balls.get(i).radius);
    popMatrix();
  }
  
  popMatrix();
  fill(255, 0, 0);
  text("panX: "  + panX + " panY: " + panY + " rotateX: " + rotX + " rotateY: " + rotY + " zoom: " + zoom * -50 + " speed: " + speed, 15, 15);
  
}

void mousePressed(MouseEvent ev) {
  if (mouseButton == LEFT) {
    balls.add(new bounceSphere(mouseX, mouseY, balls.size() + 1));
  }
  
  if (mouseButton == CENTER) {
    originRX = mouseX;
    originRY = mouseY;
  }
  
  if (mouseButton == RIGHT) {
    originPX = mouseX;
    originPY = mouseY;
  }
}

void mouseReleased(MouseEvent ev) {
  if (mouseButton == CENTER) {
    rotY = rotY + tempRY;
    rotX = rotX + tempRX;
    tempRX = tempRY = 0;
  }
  
  if (mouseButton == RIGHT) {
      panY = panY + tempPY;
      panX = panX + tempPX;
      tempPX = tempPY = 0;
  }
}

void mouseWheel(MouseEvent ev) {
  zoom = zoom + int(ev.getAmount());
}

void keyPressed() {
  if (key == CODED && keyCode == UP) zoom--;
  else if (key == CODED && keyCode == DOWN) zoom++;
  
  if (key == CODED && keyCode == RIGHT) speed++;
  else if (key == CODED && keyCode == LEFT) speed = (speed < 1)? 1 : speed - 1;
  
  if (key == ' ') balls.add(new bounceSphere(int(random(600)), int(random(600)), balls.size() + 1));
  
  else if (key == 'r' || key == 'R') {
    panX = panY = zoom = 0;
    rotX = rotY = 0.0;
    while (balls.size() > 0) balls.remove(0);
  }
}

class bounceSphere {
  int x, y, ref, radius = int(random(40) + 10);
  boolean subX = (random(1) > 0.5)? true : false, subY = (random(1) > 0.5)? true : false;
  float red, green, blue;
  
  bounceSphere(int mx, int my, int r) {
    x = mx;
    y = my;
    ref = r;
    red = random(255);
    green = random(255);
    blue = random(255);
  }
  
  void update() {
    if (x > (600 - radius)) subX = true;
    if (y > (600 - radius)) subY = true;
    
    if (x < radius) subX = false;
    if (y < radius) subY = false;
    
    x = (subX)? x - speed : x + speed;
    y = (subY)? y - speed : y + speed;
    
    for (int i = 0; i < balls.size(); i++) {
      if (balls.get(i).ref != ref && dist(x, y, balls.get(i).x, balls.get(i).y) < radius + balls.get(i).radius) {
        subX = balls.get(i).x > x;
        subY = balls.get(i).y > y;
        
        balls.get(i).subX = !subX;
        balls.get(i).subY = !subY;
      }
    }
    
  }
  
}



