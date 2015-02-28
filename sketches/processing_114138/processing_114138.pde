
//////////////////////////////////////////////////////////////////////////////
// Cookie Spider
// 1. spray some lovely rainbow sweets on the cookie
// 2. pick choco beans and decorate the cookie
// 3. if feeling tired of dropping beans, feel free to activate Auto function
// 4. enjoy!
//////////////////////////////////////////////////////////////////////////////

ArrayList spiders;
ArrayList sweets;

PImage cookie, pickUp, choco, autoT;

boolean pressStatus, pre_pressStatus;
boolean pick, drop, newChoco;
boolean spray, pre_pressStatusSweet;

boolean chooseChoco;
boolean auto, pre_auto;
boolean stopBirth = false;

Shining pointer;

int count = 0;
int birthRange;

color g = color(0, 255, 0);
color r = color(255, 0, 0);






void setup() {
  size(600, 600);
  smooth();

  spiders = new ArrayList();
  sweets = new ArrayList();
  cookie = loadImage("cookie.png");
  pickUp = loadImage("pickUpS.png");
  choco = loadImage("choco.png");
  autoT = loadImage("auto.png");

  pressStatus = false;
  pre_pressStatus = false;
  pick = false;
  drop = false;
  newChoco = false;
  spray = false;
  pre_pressStatusSweet = false;
  chooseChoco = false;
  auto = false;
  pre_auto = false;

  pointer = new Shining(width/2+230, height/2+205);

}





void draw() {

  background(255);
  
  // items:
  // auto function
  pushMatrix();
  translate(53, 25);
  image(autoT, -autoT.width/2, -autoT.height/2);
  popMatrix();
  
  pushStyle();
  stroke(255);
  strokeWeight(2);
  if (auto == false) {
    fill(r);
  } else {
    fill(g);
  }
  ellipse(50, 50, 30, 30);
  ellipse(50, 50, 20, 20);
  popStyle();

  // cookie
  pushMatrix();
  translate(width/2, height/2);
  image(cookie, -cookie.width/2, -cookie.height/2);

  // text:"PickUp"
  translate(230, 160);
  image(pickUp, -pickUp.width/2, -pickUp.height/2);
  popMatrix();

  // bling arrow
  pointer.bling(129, 79, 13);
  pointer.displayArrow();

  // cookie box
  pushMatrix();
  pushStyle();
  noStroke();
  fill(255, 177, 75);
  rectMode(CENTER);
  rect(width-70, height-50, 50, 50);

  // choco
  translate(width-70, height-50);
  image(choco, -choco.width/2, -choco.height/2);
  popMatrix();
  popStyle();



  // activities
  // sweets
  for (int j=0; j<sweets.size(); j++) {
    Sweet sw = (Sweet) sweets.get(j);
    sw.display();

    if (sw.shake == true) {
      sw.update(3);
    }
  }

  if (sweets.size() > 500) {
    sweets.remove(0);
  }




  // choco spider
  for (int i=0; i<spiders.size(); i++) {

    Spider s = (Spider) spiders.get(i);
    s.grow();

    if (s.activate == false) {
      s.pauseDisplay();

      if (count % 5 == 0) {
        s.activate = true;
      }
    }

    if (s.activate == true) {
      for (int j=0; j<sweets.size(); j++) {
        Sweet sw = (Sweet) sweets.get(j);
        if (sw.x < s.location.x+10 && sw.x > s.location.x-10 
          && sw.y < s.location.y+10 && sw.y > s.location.y-10) {
          sw.shake = !sw.shake;
        }
      }
      s.leaveTrace();
      s.activeDisplay();
      s.update();
    }

    // if collide!!!!!!!!!!!!!!!!!!!!!!! o_O
    for (int j=0; j<spiders.size(); j++) {
      Spider ss = (Spider) spiders.get(j);

      PVector dis =  PVector.sub(ss.location, s.location);

      if (dis.mag() < 25) {
        dis.normalize();
        dis.x *= random(-0.2);
        dis.y *= random(-0.2);
        ss.velocity.add(dis);
        ss.collide = true;
      } else {
        ss.collide = false;
      }
    }
  }

  if (spiders.size() > 25) {
    spiders.remove(0);
  }





  // auto!!!
  birthRange = int(random(80,100));
  if (auto == true && stopBirth == false) {
    spiders.add(new Spider( random(width/2-100, width/2+100), random(height/2-100, height/2+100)));
    count ++;
  }
  if (count == 5) {
    stopBirth = true;
    count = 0;
  }
  if (frameCount % birthRange == 0) {
    stopBirth = false;
  }  
//   println(auto + ", " + pre_auto + ", " + stopBirth);
}




//////////////////////
//                  //
// mouse function!! //
//                  //
//////////////////////

void mousePressed() {

  // choco
  if (mouseX < (width-70)+choco.width/2 && mouseX > (width-70)-choco.width/2 
    && mouseY < (height-50)+choco.height/2 && mouseY > (height-50)-choco.height/2) {

    chooseChoco = true;
  }

  if (mouseX < (width/2)+(cookie.width/2-50) && mouseX > (width/2)-(cookie.width/2-50) 
    && mouseY < (height/2)+(cookie.height/2-50) && mouseY > (height/2)-(cookie.height/2-50)) {

    if (chooseChoco == true && pre_pressStatus == false) {
      newChoco = true;
      spiders.add(new Spider(mouseX, mouseY));
      count ++;

      for (int i=0; i<spiders.size(); i++) {
        Spider s = (Spider) spiders.get(i);
        s.pick = true;
      }
    }
    pre_pressStatus = true;
    newChoco = false;

  }

  // sweet
  if (mouseX < (width/2)+(cookie.width/2-50) && mouseX > (width/2)-(cookie.width/2-50) 
    && mouseY < (height/2)+(cookie.height/2-50) && mouseY > (height/2)-(cookie.height/2-50)) {

    if (pre_pressStatusSweet == false) {
      sweets.add(new Sweet(mouseX + random(-10, 10), mouseY + random(-10, 10)));
    }
    spray = true;
    pre_pressStatusSweet = true;
  }

}

void mouseDragged() {

  // sweet
  if (mouseX < (width/2)+(cookie.width/2-50) && mouseX > (width/2)-(cookie.width/2-50) 
    && mouseY < (height/2)+(cookie.height/2-50) && mouseY > (height/2)-(cookie.height/2-50)) {

    sweets.add(new Sweet(mouseX + random(-10, 10), mouseY + random(-10, 10)));
  }
}



void mouseReleased() {

  // choco
  if (pre_pressStatus == true) {

    for (int i=0; i<spiders.size(); i++) {
      Spider s = (Spider) spiders.get(i);
      if (s.pick) {
        s.pick = false;
        s.drop = true;
      }
    }
  }
  pre_pressStatus = false;

  // sweet
  pre_pressStatusSweet = false;
  spray = false;

  // auto
  if (mouseX < 50+15 && mouseX > 50-15 
    && mouseY < 50+15 && mouseY > 50-15) {

    auto = !auto;
  }
}

class Leg{
  
  float x1, y1, x2, y2;
  PVector legLength;
  float growX, growY;
  float grow_X, grow_Y;
  float angle=0;
  
  Leg(float _x1, float _y1, float _x2, float _y2) {
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
    PVector start = new PVector(x1, y1);
    PVector end = new PVector(x2, y2);
    legLength = PVector.sub(start, end);
    
    growX = grow_X = (x2-x1)/20;
    growY = grow_Y = (y2-y1)/20;
  }
  
  void display() {
    pushStyle();
    stroke(88,45,4);
    strokeWeight(2);
    line(x1, y1, growX, growY);
    popStyle();
  }
  
  void grow() {
    
    PVector distance = new PVector(growX-x1, growY-y1);

    if (distance.mag() < legLength.mag()) {
      growX += grow_X;
      growY += grow_Y;
    }
  }
  
  void walk() {
//    growX += sin(angle)*0.5;
    growX += sin(angle)*0.5;
    angle += PI/15;
  }
  
}

class Shining {

  float degree;
  float x, y;
  float r, g, b;

  Shining(float _x, float _y) {
    degree = 0;
    x = _x;
    y = _y;
    r = g = b = 255;
  }

  void displayStar() {
    pushStyle();
    pushMatrix();
    noStroke();
    translate(x, y);
    triangle(0, 5, 5, -3, -5, -3);
    rotate(PI);
    triangle(0, 5, 5, -3, -5, -3);
    popMatrix();
    popStyle();
  }
  
  void displayArrow() {
    pushStyle();
    pushMatrix();
    noStroke();
    translate(x, y);
    rectMode(CENTER);
    scale(0.6);
    rect(0, -10, 20, 30);
    triangle(0, 20, 20, -3, -20 ,-3);
    popMatrix();
    popStyle();
  }
  
  void bling(float _r, float _g, float _b) {
    r = constrain(_r*abs(sin(radians(degree))), _r-50, 255);
    g = constrain(_g*abs(sin(radians(degree))), _g-50, 255);
    b = constrain(_b*abs(sin(radians(degree))), _b-50, 255);
    
    fill(r, g, b);
    degree += 3;
  }
}


class Spider{
  
  ArrayList legs;
  ArrayList traces;
  PImage choco;
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector dis;
  PVector disChoco;

  float angle, angleStart;
  int j;
  float topSpeed;
  float chance;
  
  float rot = 0;
  
  boolean pick;
  boolean drop;
  boolean activate;
  boolean collide = false;
  
    
  Spider(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(random(-0.08, 0.08), random(-0.08, 0.08));
    disChoco = new PVector(5, 5);
    
    angle = PI/4;
    angleStart = 0;
    j = 0;
    topSpeed = 4;
    chance = random(1);
    pick = false;
    drop = false;
    activate = false;
    
    legs = new ArrayList();
    traces = new ArrayList();
    choco = loadImage("choco.png");
  }
  
  
  
  void grow() {
    if (frameCount % 14 == 1 && j<4) {
      legs.add(new Leg(0, 0, 20*cos(angle), 20*sin(angle)));
      angle += PI/6;
      j++;
    }
    
    if (j==4) {
      angle += PI/3;
      j++;
    }
    
    if (j>4) {
      if (frameCount % 14 == 1 && j<9) {
        legs.add(new Leg(0, 0, 20*cos(angle), 20*sin(angle)));
        angle += PI/6;
        j++;
      }
    }
  }
  
  
  void leaveTrace() {
    
    float angleR = velocity.heading2D();
    traces.add(new Trace(location.x, location.y));
    
    for (int i=0; i<traces.size(); i++) {
      Trace t = (Trace)traces.get(i);
      
      t.angle = angleR;      
      t.display();
      
    }
    
    if (traces.size() > 30) {
      traces.remove(0);
    }
  }
  
    
  void activeDisplay() {
    float angleR = velocity.heading2D();
    
    rot = lerp(rot, angleR, 0.1);  // rot gradually changes into angleR
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(rot);
    
    for (int i=0; i<legs.size(); i++) {
      Leg l = (Leg)legs.get(i);
      l.grow();
      l.display();
      
      if (j>=9) {
        l.walk();
      }
    }
  
    image(choco, -choco.width/2, -choco.height/2);
    popMatrix();
  }
  
  void pauseDisplay() {
//    float angleR = atan2(acceleration.y, acceleration.x);
    //float angleR = atan2(acceleration.y, acceleration.x); 
    //float angleR = velocity.heading();
//    angleStart = constrain(angleStart, 0, angleR);
    pushMatrix();
    translate(location.x, location.y);
    rotate(rot);
    image(choco, -choco.width/2, -choco.height/2);
    popMatrix();
  }
  
  void update() {
    if (chance > 0.3) {
      velocity.add(acceleration);
      velocity.limit(topSpeed);
      location.add(velocity);
      
      if (location.x < (width/2)+(cookie.width/2-50) && location.x > (width/2)-(cookie.width/2-50) 
        && location.y < (height/2)+(cookie.height/2-50) && location.y > (height/2)-(cookie.height/2-50)) {

        PVector change = new PVector(random(-2, 2), random(-2, 2));
        velocity.add(change);
      }
      
//      if (random(1)>0.2){
//        PVector change = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
//        location.add(change);
//      }
    } else {
      velocity.add(acceleration);
      velocity.limit(topSpeed);
      location.add(velocity);
      
      if (location.x < (width/2)+(cookie.width/2-50) && location.x > (width/2)-(cookie.width/2-50) 
        && location.y < (height/2)+(cookie.height/2-50) && location.y > (height/2)-(cookie.height/2-50)) {

        PVector change = new PVector(random(-2, 2), random(-2, 2));
        velocity.add(change);
      }
      
      if (random(1)>0.8){
        if (frameCount % 150 == 0) {
          velocity.mult(0.8);
          acceleration.x *= (-1);
          acceleration.y *= (-2);        
        }
      } 
    }
  }  
}


class Sweet{
  float x, y, w, h;
  float r, g, b, a;
  color c;
  float angle;
  
  boolean shake;
  
  Sweet(float x_, float y_) {
    x = x_;
    y = y_;
    w = 10;
    h = 3;
    r = random(80,255);
    g = random(80,255);
    b = random(80,255);
    a = 300;
    c = color(r, g, b, a);
    angle = random(radians(360));
    
    shake = false;
  }
  
  void display() {
    pushMatrix();
    pushStyle();
    noStroke();
    fill(c);
    translate(x, y);
    rotate(angle);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popStyle();
    popMatrix();
  }
  
  void update() {
    angle += random(-0.1, 0.1);
    x += random(-0.5, 0.5);
    y += random(-0.5, 0.5);
  }
  
  void update(float f) {
    angle += random(-0.1*f, 0.1*f);
    x += random(-0.5*f, 0.5*f);
    y += random(-0.5*f, 0.5*f);
  }
}

class Trace{
  float x, y, w, h;
  float r, g, b, a;
  color c;
  float angle;
  
  Spider s;
  
  Trace(float x_, float y_) {
    x = x_;
    y = y_;
    w = 8;
    h = 3;
    
    if (frameCount % 5 == 0) {
      r = 198;
      g = 128;
      b = 62;
      a = 200;
    } else {
      r = 255;
      g = 255;
      b = 255;
      a = 0;
    }
    
    c = color(r, g, b, a);
    angle = 0;
  }
  
  void display() {
    pushMatrix();
    pushStyle();
    noStroke();
    fill(c);
    translate(x, y);
    rotate(angle);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popStyle();
    popMatrix();
  }  
}


