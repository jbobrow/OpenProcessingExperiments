
// comments
// comments

Mover[] movers = new Mover[20];

int max = 1;
float sweat_y = 180;
float wormstart_x = 130;
float wormstart_y = 200;
float wormlength = 40;
int wormmove = 1;

void setup() {
  size(400, 400);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {

  if (mousePressed)
    background(mouseX, mouseY, mouseX+mouseY-200);
  else
    background(200);

  noStroke();
//  stroke(1, 1, 1);
  fill(185, 230, 32); 
  rect(105, 90, 190, 220, 15); //face
  

  noStroke();
  fill(140, 200, 190, 355 - sweat_y*1.1);    //color of sweat
  bezier(274, sweat_y - 20, 275, sweat_y, 280, sweat_y, 285, sweat_y - 20); //sweatdrop shape

  strokeWeight(5);
  stroke(1, 1, 1);
  fill(175, 250, 22);
  curve (170, 160, 210, 200, 210, 220, 190, 280); //nose
  bezier(200, 100, 180, 80, 220, 100, 180, 75); //hair 

  stroke(140, 20, 30);
  fill(190, 180, 25);
  rect(175, 250, 50, 20, 10, 10, 5, 5); //mouth
  
  sweat_y = sweat_y + max/1.5; //sweatdrop falls faster
    if (sweat_y > 330) //reset sweatdrop when it came down
      sweat_y = 180;

  if (mousePressed)
  {

    fill(190, 180, 25);
    rect(175, 250, 50, 40, 10, 10, 5, 5); //mouth
    fill(140, 20, 30);
    strokeWeight(0.1);
    arc(200, 260, 30, 90, 0, PI); //tongue
    strokeWeight(5);
  }
  else
  {
  
    stroke(140, 20, 30);
    fill(190, 180, 25);
    rect(175, 250, 50, 20, 10, 10, 5, 5); //mouth
  }

  stroke(1, 1, 1);
  fill(180, 190, 124);
  ellipse(155, 150, 30, 30); //left eye
  fill(1);
  ellipse(155 + (movers[max-1].wormlocation.x - 200) / 20, 150 + (movers[max-1].wormlocation.y - 200)/20, 10, 10); //left eyeball

  //  if (mousePressed == false) {  //default
  fill(180, 190, 124);
  ellipse(245, 150, 30, 30); //right eye
  fill(1);
  //ellipse(245 + (mouseX-200) / 20, 150 + (mouseY - 200)/20, 10, 10); //right eyeball
  ellipse(245 + (movers[max-1].wormlocation.x - 200) / 20, 150 + (movers[max-1].wormlocation.y - 200)/20, 10, 10); //right eyeball
  //  }
  //  else {  //when mouse is Pressed
  //    line(260, 160, 240, 140);
  //    line(240, 160, 260, 140);  // trace of eyeball
  //    fill(180, 190, 124);
  //    ellipse(mouseX, mouseY, 30, 30); //right eye
  //    fill(1);
  //    ellipse(mouseX, mouseY, 10, 10); //right eyeball
  //  }

  // line(wormstart_x + wormmove, wormstart_y, wormstart_x + wormlength + wormmove, wormstart_y);
  //  wormmove += 1;


  for (int i = 0; i < max; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}

void mouseClicked() {
  if (max < 20)
    max++;
}
class Mover {

  PVector wormlocation;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    wormlocation = new PVector (random(width), random(height));
    velocity = new PVector (0, 0);
    topspeed = 4;
  }
  void update() {

    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, wormlocation);
    dir.normalize();
    dir.mult(0.3);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    wormlocation.add(velocity);
  }
  void display() {
    noStroke();
    fill(1);
    pushMatrix();
    translate(random(-3, 3), random (-3, 3));
    
    ellipse(wormlocation.x, wormlocation.y, 3, 3);
    popMatrix();
  }
  
//  void checkEdges() {
//
//    if (wormlocation.x > 290) {
//      wormlocation.x = 290;
//    } 
//    else if (wormlocation.x < 110) {
//      wormlocation.x = 110;
//    }
//
//    if (wormlocation.y > 305) {
//      wormlocation.y = 305;
//    }  
//    else if (wormlocation.y < 95) {
//      wormlocation.y = 95;
//    }
//  }
//}

  void checkEdges() {

    if (wormlocation.x > width) {
      wormlocation.x = 0;
    } 
    else if (wormlocation.x < 0) {
      wormlocation.x = width;
    }

    if (wormlocation.y > height) {
      wormlocation.y = 0;
    }  
    else if (wormlocation.y < 0) {
      wormlocation.y = height;
    }
  }
}

