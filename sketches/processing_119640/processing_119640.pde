
float posX, posY, velX, velY;
float sz = 30;
int rectX;
int rectY;
int t1 = 50;
int t2 = 50;
float hola; 

void setup() {
  size(600, 400);
  posX = random(width/2 + sz/2, width -sz/2);
  posY = random(height/2 + sz/2, height -sz/2);
  velX = 30;
  velY = 30;
}

void draw() { 
  background (0);
  noStroke();
  fill(255, 0, 0);
  rect(450, 250, 100, 100);
  fill (255); 
  ellipse(posX, posY, sz, sz);
  noFill();
  stroke(255, 0, 0);
  strokeWeight(2);

  rectX = mouseX - 25;
  rectY = mouseY - 25;
  rect(rectX, rectY, t1, t2);


  if ((posX + sz/2>= width)||(posX - sz/2<=0 )) {
    velX = -velX;
  }

  if ((posY + sz/2>= height)||(posY - sz/2<=0 )) {
    velY = -velY;
  }
  if ((posX + sz/2 >= mouseX && posX -sz/2 <= mouseX +t1) && (posY + sz/2 >= mouseY && posY-sz/2 <=mouseY + t2)) {
    posX = mouseX;
    posY = mouseY;
  }
  else {
    posX = posX + velX;
    posY = posY + velY;
  }

  if ((posX == mouseX && posY== mouseY) && (posX >= 450 && posX <= 550 && posY >= 250 && posY <= 350)) {
    noStroke();
    fill(0, 255, 0);
    rect(450, 250, 100, 100);
    noStroke();
    fill(255);
    ellipse(posX, posY, sz, sz);
    noFill();
    stroke(255, 0, 0);
    strokeWeight(2);
    rect(rectX, rectY, t1, t2);
    noFill();
    strokeWeight(2);
    stroke(0,255,0);
    rect(50, 270, 350, 50);
    text ("WINNA! Acabas de ganar 50€. SIGUE JUGANDO", 80,300);
    
  }
}
