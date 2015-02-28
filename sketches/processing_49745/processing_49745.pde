
import fisica.*;

FBox boxButton;
FCircle circleButton;
FPoly polyButton;


FWorld world;

color buttonColor = #155AAD;
color hoverColor = #55AA11;
color bodyColor = #6E0595;

int circleCount = 20;
float hole = 100;
float topMargin = 50;
float bottomMargin = 300;
float sideMargin = 100;
float xPos = 0;


FBox caja;
FBox obstacle;

FBox[] block = new FBox[18];


void setup(){
  size(900,1150);
  background(255);
  smooth();
  
  Fisica.init(this);

  world = new FWorld();
  
  world.setGravity(0, 300);
  
  world.setEdges();
  world.remove(world.left);
  world.remove(world.right);
  world.remove(world.top);

  boxButton = new FBox(18,18);
  boxButton.setPosition(648,9);
  boxButton.setStatic(true);
  boxButton.setFillColor(buttonColor);
  boxButton.setNoStroke();
  world.add(boxButton);

  circleButton = new FCircle(18);
  circleButton.setPosition(747, 9);
  circleButton.setStatic(true);
  circleButton.setFillColor(buttonColor);
  circleButton.setNoStroke();
  world.add(circleButton);

  polyButton = new FPoly();
  polyButton.vertex(9, 9);
  polyButton.vertex(-9, 9);
  polyButton.vertex(0, -9);
  polyButton.setPosition(846, 9);
  polyButton.setStatic(true);
  polyButton.setFillColor(buttonColor);
  polyButton.setNoStroke();
  world.add(polyButton);
  
  
 
  FPoly a = new FPoly();
  a.vertex(621,27);
  a.vertex(621,153);
  a.vertex(637,153);
  a.vertex(637,225);
  a.vertex(0,225);
  a.vertex(0,27);
  a.setStatic(true);
  a.setFill(0);
  a.setFriction(1);
  world.add(a);

  FPoly b = new FPoly();
  b.vertex(675, 27);
  b.vertex(675, 153);
  b.vertex(659, 153);
  b.vertex(659, 225);
  b.vertex(738, 225);
  b.vertex(738, 153);
  b.vertex(717, 153);
  b.vertex(717, 27);
  b.setStatic(true);
  b.setFill(0);
  b.setFriction(1);
  world.add(b);
  
  FPoly c = new FPoly();
  c.vertex(774, 27);
  c.vertex(774, 153);
  c.vertex(756, 153);
  c.vertex(756, 225);
  c.vertex(835, 225);
  c.vertex(835, 153);
  c.vertex(819, 153);
  c.vertex(819, 27);
  c.setStatic(true);
  c.setFill(0);
  c.setFriction(1);
  world.add(c);

  FPoly d = new FPoly();
  d.vertex(873, 27);
  d.vertex(873, 153);
  d.vertex(857, 153);
  d.vertex(857, 225);
  d.vertex(900, 225);
  d.vertex(900, 27);
  d.setStatic(true);
  d.setFill(0);
  d.setFriction(1);
  world.add(d);
  
  FPoly e = new FPoly();
  e.vertex(0,460);  
  e.vertex(25,460);
  e.vertex(25,532);
  e.vertex(9,532);
  e.vertex(9,658);
  e.vertex(0,658);
  e.setStatic(true);
  e.setFill(0);
  e.setFriction(1);
  world.add(e);
  
  FPoly f = new FPoly();
  f.vertex(47,460);
  f.vertex(47, 532);
  f.vertex(63, 532);
  f.vertex(63, 658);
  f.vertex(108,658);
  f.vertex(108, 532);
  f.vertex(126, 532);
  f.vertex(126, 460);
  f.setStatic(true);
  f.setFill(0);
  f.setFriction(1);
  world.add(f);
  
   FPoly g = new FPoly();
  g.vertex(144,460);
  g.vertex(144, 532);
  g.vertex(162, 532);
  g.vertex(162, 658);
  g.vertex(207, 658);
  g.vertex(207, 532);
  g.vertex(223, 532);
  g.vertex(223, 460);
  g.setStatic(true);
  g.setFill(0);
  g.setFriction(1);
  world.add(g);
  
  FPoly h = new FPoly();
  h.vertex(245,460);
  h.vertex(245, 532);
  h.vertex(261, 532);
  h.vertex(261, 658);
  h.vertex(900, 658);
  h.vertex(900, 460);
  h.setStatic(true);
  h.setFill(0);
  h.setFriction(1);
  world.add(h);
  
 // FPoly i = new FPoly();
 // i.vertex(0,0);
 //i.vertex(0,27);
 // i.vertex(900, 27);
 // i.vertex(900, 0);
  //i.vertex(540, 0);
  //i.vertex(540, 18);
  //i.vertex(522, 18);
  //i.vertex(522, 0);
  //i.vertex(441, 0);
  //i.vertex(441, 18);
  //i.vertex(423, 18);
  //i.vertex(423, 0);
  //i.vertex(342, 0);
  //i.vertex(342, 18);
  //i.vertex(324, 18);
  //i.vertex(324, 0);
  //i.setStatic(true);
  //i.setFill(0);
  //i.setFriction(1);
  //world.add(i);
  
  // Random route for going..
  FPoly j = new FPoly();
  j.vertex(0,225);
  j.vertex(637,225);
  j.vertex(637,234);
  j.vertex(189,306);
  j.vertex(90, 315);
  j.vertex(9,324);
  j.vertex(27, 460);
  j.vertex(0, 460);
  j.vertex(0, 495);
  j.setStatic(true);
  j.setFill(225);
  j.setFriction(1);
  world.add(j);
  
  FPoly k = new FPoly();
  k.vertex(659,225);
  k.vertex(659,252);
  k.vertex(207,324);
 
  k.vertex(99,342);
  k.vertex(45, 351);
  k.vertex(45, 460);
  k.vertex(126,460);
  k.vertex(99, 387);
  k.vertex(162,342);
  k.vertex(288, 333);
  k.vertex(432,306);
  k.vertex(576, 288);
  k.vertex(666,261);
  k.vertex(738,225);
  k.setStatic(true);
  k.setFill(225);
  k.setFriction(1);
  world.add(k);
  
  FPoly l = new FPoly();
  l.vertex(756,225);
  l.vertex(729,261);
  l.vertex(576,306);
  l.vertex(432,324);
  l.vertex(288,351);
  l.vertex(162, 360);
  l.vertex(126, 387);
  l.vertex(144, 460);
  l.vertex(223, 460);
  l.vertex(234,405);
  l.vertex(432, 387);
  l.vertex(576,360);
  l.vertex(745,315);
  l.vertex(783,252);
  l.vertex(835,225);
  l.setStatic(true);
  l.setFill(225);
  l.setFriction(1);
  world.add(l);
  
  FPoly m = new FPoly();
  m.vertex(857,225);
  m.vertex(857,254);
  m.vertex(810,280);
  m.vertex(792,324);
  m.vertex(576,387);
  m.vertex(432,405);
  m.vertex(252,432 );
  m.vertex(245,460);
  m.vertex(900,460);
  m.vertex(900,225);
  m.setStatic(true);
  m.setFill(225);
  m.setFriction(1);
  world.add(m);
  
  obstacle = new FBox(144,18);
  obstacle.setRotation(0.1);
  obstacle.setPosition(292,794);
  obstacle.setStatic(true);
  obstacle.setFill(0);
  obstacle.setRestitution(0);
  world.add(obstacle);
  
  obstacle = new FBox(144,18);
  obstacle.setRotation(0);
  obstacle.setPosition(0,754);
  obstacle.setStatic(true);
  obstacle.setFill(0);
  obstacle.setRestitution(0);
  world.add(obstacle);
  
  obstacle = new FBox(9,85);
  obstacle.setRotation(0);
  obstacle.setPosition(740,976);
  obstacle.setStatic(true);
  obstacle.setFill(0);
  obstacle.setRestitution(0);
  world.add(obstacle);
  
  obstacle = new FBox(9,85);
  obstacle.setRotation(0);
  obstacle.setPosition(780,976);
  obstacle.setStatic(true);
  obstacle.setFill(0);
  obstacle.setRestitution(0);
  world.add(obstacle);
  
  obstacle = new FBox(9,155);
  obstacle.setRotation(1);
  obstacle.setPosition(675,1049);
  obstacle.setStatic(true);
  obstacle.setFill(0);
  obstacle.setRestitution(0);
  world.add(obstacle);
  
  obstacle = new FBox(9,155);
  obstacle.setRotation(-1);
  obstacle.setPosition(845,1049);
  obstacle.setStatic(true);
  obstacle.setFill(0);
  obstacle.setRestitution(0);
  world.add(obstacle);
  
  obstacle = new FBox(9,55);
  obstacle.setRotation(0);
  obstacle.setPosition(610,1116);
  obstacle.setStatic(true);
  obstacle.setFill(0);
  obstacle.setRestitution(0);
  world.add(obstacle);
  
  obstacle = new FBox(290,9);
  obstacle.setRotation(0);
  obstacle.setPosition(750,1130);
  obstacle.setStatic(true);
  obstacle.setFill(0);
  obstacle.setRestitution(0);
  world.add(obstacle);
  
  obstacle = new FBox(9,55);
  obstacle.setRotation(0);
  obstacle.setPosition(900,1116);
  obstacle.setStatic(true);
  obstacle.setFill(0);
  obstacle.setRestitution(0);
  world.add(obstacle);
  
  obstacle = new FBox(365,18);
  obstacle.setRotation(0.2);
  obstacle.setPosition(537,867);
  obstacle.setStatic(true);
  obstacle.setFill(0);
  obstacle.setRestitution(0);
  world.add(obstacle);
  
for (int i=0; i < 18; i++){
  int he = i/2;
  block[i] = new FBox(90, 60);
  block[i].setPosition(150+i%1*200,height-25*he);
  block[i].setFill(0);
  block[i].setStroke(255);
  world.add(block[i]);

 }
  FBox vbox = new FBox(300, 20);
  vbox.setPosition(150,600);
  vbox.setFill(0);
  vbox.setStroke(255);
  world.add(vbox);


 
  
}

void draw(){
  
 
  //build static devices
  noFill();
  background(255);
  
  
  //button
  
  //rect(324,0,20,20);
  //rect(423,0,20,20);
  //rect(522,0,20,20);

  //making bottles
  beginShape();
  
  endShape(CLOSE);

  beginShape();
  vertex(621,27);
  vertex(675,27);
  vertex(675,153);
  vertex(659,153);
  vertex(659,225);
  vertex(637,225);
  vertex(637,153);
  vertex(621,153);
  endShape(CLOSE);
  
  beginShape();
  vertex(718,27);
  vertex(774,27);
  vertex(774,153);
  vertex(756,153);
  vertex(756,225);
  vertex(738,225);
  vertex(738,153);
  vertex(718,153);
  endShape(CLOSE);
  
  
 beginShape();
  vertex(819,27);
  vertex(873,27);
  vertex(873,153);
  vertex(857,153);
  vertex(857,225);
  vertex(835,225);
  vertex(835,153);
  vertex(819,153);
  endShape(CLOSE);
  
  beginShape();
  vertex(25,460);
  vertex(47,460);
  vertex(47,532);
  vertex(63,532);
  vertex(63,658);
  vertex(8,658);
  vertex(9,532);
  vertex(25,532);
  endShape(CLOSE);
  
  beginShape();
  vertex(126,460);
  vertex(144,460);
  vertex(144,532);
  vertex(162,532);
  vertex(162,658);
  vertex(108,658);
  vertex(108,532);
  vertex(126,532);
  endShape(CLOSE);

  beginShape();
  vertex(223,460);
  vertex(245,460);
  vertex(245,532);
  vertex(261,532);
  vertex(261,658);
  vertex(207,658);
  vertex(207,532);
  vertex(223,532);
  endShape(CLOSE);
  
    println(frameCount);
    if (frameCount<1250){
    if (frameCount % 30 == 0) {
    FCircle b = new FCircle(12);
    b.setPosition(648 + random(-10,10), 40);
    b.setVelocity(0, 200);
    b.setRestitution(0);
    b.setNoStroke();
    b.setFill(200, 30, 90);
    world.add(b);
    }
    if (frameCount % 80 == 0) {
    FCircle c = new FCircle(12);
    c.setPosition(747 + random(-10,10), 40);
    c.setVelocity(0, 200);
    c.setRestitution(0);
    c.setNoStroke();
    c.setFill(48, 133, 216);
    world.add(c);
    }
    
    if (frameCount % 13 == 0) {
    FCircle d = new FCircle(12);
    d.setPosition(846 + random(-10,10), 40);
    d.setVelocity(0, 200);
    d.setRestitution(0);
    d.setNoStroke();
    d.setFill(250, 217, 30);
    world.add(d);
    }
    
    
    }
  world.step();
  world.draw();
  
  strokeWeight(1);
  stroke(255);
  ArrayList contacts = obstacle.getContacts();
  for (int i=0; i<contacts.size(); i++) {
    FContact c = (FContact)contacts.get(i);
    line(c.getBody1().getX(), c.getBody1().getY(), c.getBody2().getX(), c.getBody2().getY());
  }
}
  
  
void mousePressed() {
  FBody pressed = world.getBody(mouseX, mouseY);
   if (pressed ==  boxButton) {
    FCircle myCircle = new FCircle(14);
    myCircle.setPosition(648, 9);
    myCircle.setRotation(random(TWO_PI));
    myCircle.setVelocity(0, 200);
    myCircle.setFillColor(bodyColor);
    myCircle.setNoStroke();
    world.add(myCircle);
    } 
  else if (pressed == circleButton) {
    FCircle myCircle = new FCircle(14);
    myCircle.setPosition(747, 9);
    myCircle.setRotation(random(TWO_PI));
    myCircle.setVelocity(0, 200);
    myCircle.setFillColor(bodyColor);
    myCircle.setNoStroke();
    world.add(myCircle);
  } 
  else if (pressed == polyButton) {
   FCircle myCircle = new FCircle(14);
    myCircle.setPosition(846, 9);
    myCircle.setRotation(random(TWO_PI));
    myCircle.setVelocity(0, 200);
    myCircle.setFillColor(bodyColor);
    myCircle.setNoStroke();
    world.add(myCircle);
  }
}

void mouseMoved() {
  FBody hovered = world.getBody(mouseX, mouseY);
  if (hovered == boxButton 
      || hovered == circleButton
      || hovered == polyButton) {
    hovered.setFillColor(hoverColor);

  } else {
    boxButton.setFillColor(buttonColor);
    circleButton.setFillColor(buttonColor);
    polyButton.setFillColor(buttonColor);
  }
}

void contactStarted(FContact c) {
  FBody ball = null;
  if (c.getBody1() == obstacle) {
    ball = c.getBody2();
  } else if (c.getBody2() == obstacle) {
    ball = c.getBody1();
  }
  
  if (ball == null) {
    return;
  }
  
  ball.setFill(225);
}

void contactPersisted(FContact c) {
  FBody ball = null;
  if (c.getBody1() == obstacle) {
    ball = c.getBody2();
  } else if (c.getBody2() == obstacle) {
    ball = c.getBody1();
  }
  
  if (ball == null) {
    return;
  }
  
  ball.setFill(200);

  stroke(0);
  fill(255);
  ellipse(c.getX(), c.getY(), 50, 50);
}

void contactEnded(FContact c) {
  FBody ball = null;
  if (c.getBody1() == obstacle) {
    ball = c.getBody2();
  } else if (c.getBody2() == obstacle) {
    ball = c.getBody1();
  }
  
  if (ball == null) {
    return;
  }
  
  ball.setFill(255);
  ball.setStroke(0);
}

void keyPressed() {
  try {
    saveFrame("screenshot.png");
  } 
  catch (Exception e) {
  }
}



