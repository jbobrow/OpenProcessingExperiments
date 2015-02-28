

class Orb {
  float x, y, r;

  // Default constructor
  Orb() {
  }

  Orb(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    
  }
}
Orb orb;
PVector velocity;

void setup() {
  size(500, 500);
  smooth();
  orb = new Orb(50, 50, 10);
  velocity = new PVector(0, 0);
}
void draw() {
  // Background
  //------------
  strokeWeight(8);
  if(orb.x > -20 && orb.x < 20) {
    stroke(255,255,255);
    line(0,0,0,500);
  }
  if(orb.x > 10 && orb.x < 30) {
    stroke(255,255,255);
    line(20,0,20,500);
  }
  if(orb.x > 30&& orb.x < 50) {
    stroke(255,255,255);
    line(40,0,40,500);
  }
  if(orb.x > 50&& orb.x < 70) {
    stroke(255,255,255);
    line(60,0,60,500);
  }
  if(orb.x > 70&& orb.x < 90) {
    stroke(255,255,255);
    line(80,0,80,500);
  }
  if(orb.x > 90&& orb.x < 110) {
    stroke(255,255,255);
    line(100,0,100,500);
  }
  if(orb.x > 110 && orb.x < 130) {
    stroke(255,255,255);
    line(120,0,120,500);
  }
  if(orb.x > 130 && orb.x < 150) {
    stroke(255,255,255);
    line(140,0,140,500);
  }
  if(orb.x > 150 && orb.x < 170) {
    stroke(255,255,255);
    line(160,0,160,500);
  }
  if(orb.x > 170 && orb.x < 190) {
    stroke(255,255,255);
    line(180,0,180,500);
  }
  if(orb.x > 190 && orb.x < 210) {
    stroke(255,255,255);
    line(200,0,200,500);
  }
  if(orb.x > 210 && orb.x < 230) {
    stroke(255,255,255);
    line(220,0,220,500);
  }
  if(orb.x > 230 && orb.x < 250) {
    stroke(255,255,255);
    line(240,0,240,500);
  }
  if(orb.x > 250 && orb.x < 270) {
    stroke(255,255,255);
    line(260,0,260,500);
  }
  if(orb.x > 270 && orb.x < 290) {
    stroke(255,255,255);
    line(280,0,280,500);
  }
  if(orb.x > 290 && orb.x < 310) {
    stroke(255,255,255);
    line(300,0,300,500);
  }
  if(orb.x > 310 && orb.x < 330) {
    stroke(255,255,255);
    line(320,0,320,500);
  }
  if(orb.x > 330 && orb.x < 350) {
    stroke(255,255,255);
    line(340,0,340,500);
  }
  if(orb.x > 350 && orb.x < 370) {
    stroke(255,255,255);
    line(360,0,360,500);
  }
  if(orb.x > 370 && orb.x < 390) {
    stroke(255,255,255);
    line(380,0,380,500);
  }
  if(orb.x > 390 && orb.x < 410) {
    stroke(255,255,255);
    line(400,0,400,500);
  }
  if(orb.x > 410 && orb.x < 430) {
    stroke(255,255,255);
    line(420,0,420,500);
  }
  if(orb.x > 430 && orb.x < 450) {
    stroke(255,255,255);
    line(440,0,440,500);
  }
  if(orb.x > 450 && orb.x < 470) {
    stroke(255,255,255);
    line(460,0,460,500);
  }
  if(orb.x > 470 && orb.x < 490) {
    stroke(255,255,255);
    line(480,0,480,500);
  }
  if(orb.x > 490 && orb.x < 510) {
    stroke(255,255,255);
    line(500,0,500,500);
  }
  //|||||||||||||||
  if(orb.y > -20 && orb.y < 20) {
    stroke(255,255,255);
    line(0,0,500,0);
  }
  if(orb.y > 10 && orb.y < 30) {
    stroke(255,255,255);
    line(0,20,500,20);
  }
  if(orb.y > 30&& orb.y < 50) {
    stroke(255,255,255);
    line(0,40,500,40);
  }
  if(orb.y > 50&& orb.y < 70) {
    stroke(255,255,255);
    line(0,60,500,60);
  }
  if(orb.y > 70&& orb.y < 90) {
    stroke(255,255,255);
    line(0,80,500,80);
  }
  if(orb.y > 90&& orb.y < 110) {
    stroke(255,255,255);
    line(0,100,500,100);
  }
  if(orb.y > 110 && orb.y < 130) {
    stroke(255,255,255);
    line(0,120,500,120);
  }
  if(orb.y > 130 && orb.y < 150) {
    stroke(255,255,255);
    line(0,140,500,140);
  }
  if(orb.y > 150 && orb.y < 170) {
    stroke(255,255,255);
    line(0,160,500,160);
  }
  if(orb.y > 170 && orb.y < 190) {
    stroke(255,255,255);
    line(0,180,500,180);
  }
  if(orb.y > 190 && orb.y < 210) {
    stroke(255,255,255);
    line(0,200,500,200);
  }
  if(orb.y > 210 && orb.y < 230) {
    stroke(255,255,255);
    line(0,220,500,220);
  }
  if(orb.y > 230 && orb.y < 250) {
    stroke(255,255,255);
    line(0,240,500,240);
  }
  if(orb.y > 250 && orb.y < 270) {
    stroke(255,255,255);
    line(0,260,500,260);
  }
  if(orb.y > 270 && orb.y < 290) {
    stroke(255,255,255);
    line(0,280,500,280);
  }
  if(orb.y > 290 && orb.y < 310) {
    stroke(255,255,255);
    line(0,300,500,300);
  }
  if(orb.y > 310 && orb.y < 330) {
    stroke(255,255,255);
    line(0,320,500,320);
  }
  if(orb.y > 330 && orb.y < 350) {
    stroke(255,255,255);
    line(0,340,500,340);
  }
  if(orb.y > 350 && orb.y < 370) {
    stroke(255,255,255);
    line(0,360,500,360);
  }
  if(orb.y > 370 && orb.y < 390) {
    stroke(255,255,255);
    line(0,380,500,380);
  }
  if(orb.y > 390 && orb.y < 410) {
    stroke(255,255,255);
    line(0,400,500,400);
  }
  if(orb.y > 410 && orb.y < 430) {
    stroke(255,255,255);
    line(0,420,500,420);
  }
  if(orb.y > 430 && orb.y < 450) {
    stroke(255,255,255);
    line(0,440,500,440);
  }
   if(orb.y > 450 && orb.y < 470) {
    stroke(255,255,255);
    line(0,460,500,460);
  }
  if(orb.y > 470 && orb.y < 490) {
    stroke(255,255,255);
    line(0,480,500,480);
  }
  if(orb.y > 490 && orb.y < 510) {
    stroke(255,255,255);
    line(0,500,500,500);
  }
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);

  // Move orb
  orb.x += velocity.x;
  orb.y += velocity.y;

noStroke();
  fill(255,255,255,0);
  ellipse(orb.x, orb.y, orb.r*2, orb.r*2);
 
  

  if (mousePressed) {
     // Draw orb
    
    //orb.x = mouseX;
    //orb.y = mouseY;
    velocity.x = (mouseX-orb.x)/2;
    velocity.y = (mouseY-orb.y)/2;
  }

  if (orb.x > width-orb.r) {
    orb.x = width-orb.r;
    velocity.x *= -1;
  }
  else if (orb.x < orb.r) {
    orb.x = orb.r;
    velocity.x *= -1;
  }
  if (orb.y > height-orb.r) {
    orb.y = height-orb.r;
    velocity.y *= -1;
  }
  else if (orb.y < orb.r) {
    orb.y = orb.r;
    velocity.y *= -1;
  }
}


