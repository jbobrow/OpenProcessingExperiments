
int score;
ArrayList<Asteroid> rocks;
ArrayList<Laser> pewpew;
ArrayList<JesusChrist> helpme;
ArrayList<Explosions> boom;
//float[] gridx, gridy;
boolean[] bigFuckingGuns;
SpaceShip mercury;
int thanksObama;

boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
boolean keyshoot = false;
void setup() {
  size(768, 512);
  fill(0);
  frameRate(30);
  colorMode(HSB);
  thanksObama = 1;

  rocks = new ArrayList<Asteroid>();
  pewpew = new ArrayList<Laser>();
  helpme = new ArrayList<JesusChrist>();
  boom = new ArrayList<Explosions>();
  //gridx = new float[(width+32)*(height+32)/1024];
  //gridy = new float[(width+32)*(height+32)/1024];
  bigFuckingGuns = new boolean[10];
  mercury = new SpaceShip();
  mercury.launch();
  //helpme.add(new JesusChrist(256, 128, -8));
  /*for(int i = 0; i < (height+32)/32; i++){
   for(int j = 0; j < (width+32)/32; j++){
   gridx[i*width/32+j] = j*32+16;
   }
   }
   for(int i = 0; i < (height+32)/32; i++){
   for(int j = 0; j < (width+32)/32; j++){
   gridy[i*width/32+j] = i*32+16;
   }
   }*/
}

void draw() {

  background(0);
  /*stroke(80, 128, 128);
   strokeWeight(1);
   for(int i = 0; i < height/32-1; i++){
   for(int j = 0; j < width/32; j++){
   line(gridx[i*width/32+j], gridy[i*width/32+j], 
   gridx[(i+1)*width/32+j], gridy[(i+1)*width/32+j]);
   }
   }
   for(int i = 0; i < height/32; i++){
   for(int j = 0; j < width/32-1; j++){
   line(gridx[i*width/32+j], gridy[i*width/32+j], 
   gridx[i*width/32+j+1], gridy[i*width/32+j+1]);
   }
   }
   */
  mercury.display();
  mercury.tick();

  for (int i = 0; i < rocks.size(); i++) {
    Asteroid rock = rocks.get(i);
    rock.display();
    rock.tick();

    if (dist(rock.x, rock.y, mercury.x, mercury.y) < rock.s+mercury.s) {
      rocks.remove(i);
      if (mercury.l == 0) {
        textSize(64);
        fill(255);
        text("YOU SUCK", width/2-160, height/2);
        textSize(32);
        text("'R' to retry, idiot...", width/2-160, height/2+32);
        thanksObama = 3;
        noLoop();
      }
      else {
        mercury.l--;
      }
    }

    for (int j = 0; j < pewpew.size(); j++) {
      Laser pew = pewpew.get(j);
      rock.collision(pew, i, j);
    }
  }

  for (int j = 0; j < pewpew.size(); j++) {
    Laser pew = pewpew.get(j);
    pew.offScreen(j);
    pew.display();
    pew.tick();
  }

  for (int i = 0; i < helpme.size(); i++) {
    JesusChrist omfg = helpme.get(i);
    omfg.display();
    omfg.tick();
    omfg.collision(mercury, i);
  }

  textSize(32);
  fill(150, 255, 255);
  text("Score:" + score, 8, 32);

  for (int i = 1; i < 10; i++) {
    if (bigFuckingGuns[i] == true) {
      textSize(24);
      fill(224, 255, 192);
      text(i, 16, 64+32*i);
      JesusChrist temp = new JesusChrist(40, 52+32*i, -1);
      switch(i) {
      case 1:
        temp.c = -1;
        temp.display();
        break;
      case 2:
        temp.c = -2;
        temp.display();
        break;
      case 3:
        temp.c = -3;
        temp.display();
        break;
      case 4:
        temp.c = -5;
        temp.display();
        break;
      case 5:
        temp.c = -6;
        temp.display();
        break;
      case 6:
        temp.c = -7;
        temp.display();
        break;
      case 7:
        temp.c = -9;
        temp.display();
        break;
      }
    }
  }


  if (keyup == true) mercury.accelerate();
  if (keyleft == true) mercury.r -= 0.1;
  if (keyright == true) mercury.r += 0.1;
  if (keyshoot == true) mercury.shoot();
  mercury.v*=0.98;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) keyup = true;
    if (keyCode == LEFT) keyleft = true;
    if (keyCode == RIGHT) keyright = true;
  }
  if (key == ' ') keyshoot = true;
  if (key == 'r') {
    mercury.launch();
    thanksObama = 1;
    loop();
  }
  if (key == 'p') {
    if (thanksObama == 1) {
      textSize(64);
      fill(255);
      text("QQ MOAR", width/2-160, height/2-64);
      thanksObama = 2;
      noLoop();
    }
    else {
      if(thanksObama == 2){
        thanksObama = 1;
        loop();
      }
    }
  }
  if (key == 'e') {
    //helpme.add(new JesusChrist(mercury.x, mercury.y, int(random(-10, -1))));
  }
  int temp = key-48;
  switch(key) {
  case '1': 
    if (bigFuckingGuns[temp] == true) {
      mercury.c = -1; 
      mercury.f = 10;
    } 
    break;
  case '2': 
    if (bigFuckingGuns[temp] == true) {
      mercury.c = -2;
      mercury.f = 6;
    }
    break;
  case '3': 
    if (bigFuckingGuns[temp] == true) {
      mercury.c = -3;
      mercury.f = 12;
    }
    break;
  case '4': 
    if (bigFuckingGuns[temp] == true) {
      mercury.c = -5;
      mercury.f = 8;
    }
    break;
  case '5': 
    if (bigFuckingGuns[temp] == true) {
      mercury.c = -6;
      mercury.f = 20;
    }
    break;
  case '6': 
    if (bigFuckingGuns[temp] == true) {
      mercury.c = -7;
      mercury.f = 15;
    }
    break;
  case '7': 
    if (bigFuckingGuns[temp] == true) {
      mercury.c = -9;
      mercury.f = 10;
    }
    break;
    /*case '1': 
     mercury.c = -1; 
     mercury.f = 10; 
     break;
     case '2': 
     helpme.add(new JesusChrist(mercury.x, mercury.y, -2)); 
     break;
     case '3': 
     helpme.add(new JesusChrist(mercury.x, mercury.y, -3)); 
     break;
     case '4': 
     helpme.add(new JesusChrist(mercury.x, mercury.y, -4)); 
     break;
     case '5': 
     helpme.add(new JesusChrist(mercury.x, mercury.y, -5)); 
     break;
     case '6': 
     helpme.add(new JesusChrist(mercury.x, mercury.y, -6)); 
     break;
     case '7': 
     helpme.add(new JesusChrist(mercury.x, mercury.y, -7)); 
     break;
     case '8': 
     helpme.add(new JesusChrist(mercury.x, mercury.y, -8)); 
     break;
     case '9': 
     helpme.add(new JesusChrist(mercury.x, mercury.y, -9)); 
     break;*/
  }
}
/**/

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) keyup = false;
    if (keyCode == LEFT) keyleft = false;
    if (keyCode == RIGHT) keyright = false;
  }
  if (key == ' ') keyshoot = false;
}

class Asteroid extends Object {
  float[] vertx = new float[16];
  float[] verty = new float[16];
  Asteroid(float x, float y, float a, float v, float w, float s, int c) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.v = v;
    this.r = 0;
    this.w = w;
    this.s = s;
    this.c = c;
    for (int i = 0; i < 16; i++) {
      vertx[i] = sin(i*PI/8)*(s + random(-s/4, s/4));
      verty[i] = cos(i*PI/8)*(s + random(-s/4, s/4));
    }
  }

  void show() {
    fill(0);
    switch(c) {
    case 0: 
      stroke(255);
      break;
    case 1: 
      stroke(32, 255, 255);
      break;
    case 2: 
      stroke(192, 255, 255);
      break;
    }

    strokeWeight(1);
    rotate(r);
    beginShape();
    for (int i = 0; i < 16; i++) {
      vertex(vertx[i], verty[i]);
    }
    vertex(vertx[0], verty[0]);
    endShape();
    rotate(-r);
  }

  void collision(Object thing, int i, int j) {
    if (dist(this.x, this.y, thing.x, thing.y) < this.s+thing.s) {
      score++;
      if (thing.c != -6) {
        pewpew.remove(j);
      }
      if (random(0, 64) < 3) {
        if (random(0, 8) < 1) {
          helpme.add(new JesusChrist(x, y, -9));
        }
        else {
          if (random(0, 7) < 1) {
            helpme.add(new JesusChrist(x, y, -8));
          }
          else {
            if (random(0, 6) < 1) {
              helpme.add(new JesusChrist(x, y, -7));
            }
            else {
              if (random(0, 5) < 1) {
                helpme.add(new JesusChrist(x, y, -6));
              }
              else {
                if (random(0, 4) < 1) {
                  helpme.add(new JesusChrist(x, y, -5));
                }
                else {
                  if (random(0, 3) < 1) {
                    helpme.add(new JesusChrist(x, y, -4));
                  }
                  else {
                    if (random(0, 2) < 1) {
                      helpme.add(new JesusChrist(x, y, -3));
                    }
                    else {
                      helpme.add(new JesusChrist(x, y, -2));
                    }
                  }
                }
              }
            }
          }
        }
      }
      if (s>4) {
        switch(c) {
        case 0: 
          rocks.add(new Asteroid(x, y, a-PI/8, v*1.6, w*2, s/2, c));
          rocks.add(new Asteroid(x, y, a+PI/8, v*1.6, w*2, s/2, c));
          break;
        case 1: 
          rocks.add(new Asteroid(x, y, a-PI/4, v*1.3, w*2, s/2, c));
          rocks.add(new Asteroid(x, y, a+PI/4, v*1.3, w*2, s/2, c));
          break;
        case 2: 
          rocks.add(new Asteroid(x, y, w, random(1.2, 1.8), w*2, s/4, 0));
          rocks.add(new Asteroid(x, y, w+PI/2, random(1.2, 1.8), w*2, s/4, 0));
          rocks.add(new Asteroid(x, y, w+PI, random(1.2, 1.8), w*2, s/4, 0));
          rocks.add(new Asteroid(x, y, w-PI/2, random(1.2, 1.8), w*2, s/4, 0));
          rocks.add(new Asteroid(x, y, 0, 0, w*2, s/3, c));
          break;
        }
      }
      if (score%12 == 0) {
        rocks.add(new Asteroid(mercury.x+random(128, width-128), mercury.y+random(128, height-128), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
      }
      if (score%20 == 0) {
        rocks.add(new Asteroid(mercury.x+random(128, width-128), mercury.y+random(128, height-128), random(-PI, PI), random(0.6, 0.8), random(-PI/100, PI/100), 24, 1));
      }
      if (score%42 == 0) {
        rocks.add(new Asteroid(mercury.x+random(128, width-128), mercury.y+random(128, height-128), 0, 0, random(-PI/50, PI/50), 48, 2));
      }
      rocks.remove(i);
    }
  }
}

class Explosions{
  float x, y, s;
  Explosions(float x, float y, float s){
    this.x = x;
    this.y = y;
    this.x = s;
  }
  
  void tick(int i){
    s--;
    if(s == 0){
      boom.remove(i);
    }
  }
}
class JesusChrist extends Object {
  JesusChrist(float x, float y, int c) {
    this.x = x;
    this.y = y;
    this.a = random(0, 2*PI);
    this.v = 1;
    this.r = 0;
    this.w = 0;
    this.s = 8;
    this.c = c;
  }

  void show() {
    fill(0);
    switch(c) {
    case -1:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      strokeWeight(1);
      stroke(0, 255, 255);
      line(0, 8, 0, -8);
      break;
    case -2:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      strokeWeight(2);
      stroke(32, 255, 255);
      line(0, 6, -6, -6);
      line(0, 6, 6, -6);
      break;
    case -3:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      strokeWeight(2);
      stroke(64, 255, 255);
      line(0, 6, -6, -6);
      line(0, 6, 6, -6);
      line(0, 6, 0, -6);
      break;
    case -4:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      strokeWeight(1);
      stroke(128, 255, 255);
      line(0, 6, 0, -6);
      line(6, 0, -6, 0);
      line(-6, 6, 6, -6);
      line(-6, -6, 6, 6);
      break;
    case -5:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      strokeWeight(2);
      stroke(96, 255, 255);
      line(0, 6, -6, -6);
      line(0, 6, -3, -6);
      line(0, 6, 0, -6);
      line(0, 6, 3, -6);
      line(0, 6, 6, -6);
      break;
    case -6:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      strokeWeight(2);
      stroke(0, 0, 255);
      line(0, 8, 0, -8);
      break;
    case -7:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      strokeWeight(1);
      stroke(160, 255, 255);
      line(4, 0, 8, 0);
      line(-4, 0, -8, 0);
      line(0, 4, 0, 8);
      line(0, -4, 0, -8);
      break;
    case -8:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      stroke(150, 255, 255);
      ellipse(0, 0, 12, 12);
      stroke(140, 255, 255);
      ellipse(0, 0, 8, 8);
      break;
    case -9:
      stroke(160, 255, 255);
      strokeWeight(1);
      ellipse(0, 0, 16, 16);
      stroke(192, 255, 255);
      line(2, 8, 2, -8);
      line(0, 8, 0, -8);
      line(-2, 8, -2, -8);
      break;
    }
  }

  void collision(SpaceShip thing, int i) {
    if (dist(this.x, this.y, thing.x, thing.y) < this.s+thing.s) {
      helpme.remove(i);
      switch(c) {
      case -2: 
        bigFuckingGuns[2] = true;
        break;
      case -3: 
        bigFuckingGuns[3] = true;
        break;
      case -4:
        for(i = 0; i < 64; i++){
          pewpew.add(new Laser(thing.x, thing.y, PI/2+i*PI/32, 24, i*PI/32, -4, 30));
        }
        break;
      case -5: 
        bigFuckingGuns[4] = true;
        break;
      case -6: 
        bigFuckingGuns[5] = true;
        break;
      case -7: 
        bigFuckingGuns[6] = true;
        break;
      case -8: 
        thing.l = 2;
        break;
      case -9: 
        bigFuckingGuns[7] = true;
        break;
      }
    }
  }
}

class Laser extends Object {
  int e, f;
  Laser(float x, float y, float a, float v, float r, int c, int f) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.v = v;
    this.r = r;
    this.w = 0;
    this.s = 4;
    this.c = c;
    this.e = 0;
    this.f = f;
  }

  void show() {
    switch(c) {
    case -1: 
      stroke(0, 255, 255, 255 - e*5);
      break;
    case -2: 
      stroke(32, 255, 255, 255 - e*6);
      break;
    case -3: 
      stroke(64, 255, 255, 255 - e*3);
      break;
    case -4: 
      stroke(128, 255, 255, 255 - e*3);
      break;
    case -5: 
      stroke(96, 255, 255, 255 - e*10);
      break;
    case -6: 
      stroke(0, 0, 255, 255 - e*2);
      break;
    case -1001: 
      stroke(160, 255, 255, 255 - e*4);
      break;
    case -9: 
      stroke(192, 255, 255, 255);
      break;
    }
    strokeWeight(3);
    rotate(r);
    beginShape();
    vertex(0, 4);
    vertex(0, -4);
    endShape();
    rotate(-r);
  }
  
  void offScreen(int j) {
    e++;
    if (e == f) pewpew.remove(j);
  }
}

abstract class Object {
  float x, y, a, v, r, w, s;
  int c;

  void tick() {
    if (x<0) {
      x += width;
      y = height-y;
    }
    if (x>width) {
      x -= width;
      y = height-y;
    }
    if (y<0) {
      y += height;
      x = width-x;
    }
    if (y>height) {
      y -= height;
      x = width-x;
    }

    r += w;
    x += cos(a)*v;
    y += sin(a)*v;

    switch(c) {
    case 0:
      break;
    case 1: 
      if (abs(atan2(mercury.y-y, mercury.x-x) - a) < PI) {
        if (atan2(mercury.y-y, mercury.x-x) > a) {
          a += 0.04;
        }
        else {
          a -= 0.04;
        }
      }
      else {
        if (atan2(mercury.y-y, mercury.x-x) > a) {
          a -= 0.04;
        }
        else {
          a += 0.04;
        }
      }
      if (a < -PI) {
        a = PI+a;
      }
      if (a > PI) {
        a = -PI+a;
      }
      break;
    case -1001: 
      r = a - PI/2;
      Asteroid track = rocks.get(0);
      for (int i = 1; i < rocks.size(); i++) {
        Asteroid rock = rocks.get(i);
        if (dist(x, y, rock.x, rock.y) < dist(x, y, track.x, track.y)) {
          track = rock;
        }
      }
      a = atan2(track.y-y, track.x-x);
      /*
      if (abs(atan2(track.y-y, track.x-x) - a) < PI) {
        if (atan2(track.y-y, track.x-x) > a) {
          a += 0.3;
        }
        else {
          a -= 0.3;
        }
      }
      else {
        if (atan2(track.y-y, track.x-x) > a) {
          a -= 0.04;
        }
        else {
          a += 0.04;
        }
      }*/
      break;
    case 2:
      break;
    }
  }

  void show() {
  }

  void display() {
    translate(x, y);
    show();
    translate(-x, -y);

    if (x < 1.25*s) {
      translate(x+width, height-y);
      show();
      translate(-x-width, y-height);
    }

    if (x > width-1.25*s) {
      translate(x-width, height-y);
      show();
      translate(-x+width, y-height);
    }

    if (y < 1.25*s) {
      translate(width-x, y+height);
      show();
      translate(x-width, -y-height);
    }

    if (y > height-1.25*s) {
      translate(width-x, y-height);
      show();
      translate(x-width, -y+height);
    }
  }
}

class SpaceShip extends Object {
  int d, f, n, l;
  SpaceShip() {
    this.launch();
  }

  void show() {
    if(d > 0){
      d--;
    }
    fill(0);
    stroke(75, 255, 255);
    strokeWeight(1);
    rotate(r);
    beginShape();
    vertex(0, 16);
    vertex(8, -16);
    vertex(-8, -16);
    vertex(0, 16);
    endShape();
    stroke(150, 255, 255, l*64);
    fill(150, 255, 255, l*24);
    ellipse(0, 0, 48, 48);
    rotate(-r);
  }

  void launch() {
    this.x = width/2;
    this.y = height/2;
    this.a = 0;
    this.v = 0;
    this.r = 0;
    this.w = 0;
    this.s = 12;
    this.c = -1;
    this.d = 0;
    this.f = 10;
    this.n = 0;
    this.l = 1;
    rocks.clear();
    pewpew.clear();
    helpme.clear();
    score = 0;
    for (int i = 0; i < 1; i++) {
      rocks.add(new Asteroid(random(0, width), 0, random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
      rocks.add(new Asteroid(random(0, width), height, random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
      rocks.add(new Asteroid(0, random(0, height), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
      rocks.add(new Asteroid(width, random(0, height), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
    }
    for (int i = 0; i < 10; i++){
      bigFuckingGuns[i] = false;
    }
    bigFuckingGuns[1] = true;
  }

  void accelerate() {
    float xt = cos(a)*v+cos(r+PI/2)*.1;
    float yt = sin(a)*v+sin(r+PI/2)*.1;
    v=sqrt(sq(yt)+sq(xt));
    a=atan2(yt, xt);
  }

  void shoot() {
    if (d == 0) {
      switch(c){
      case -1:
        pewpew.add(new Laser(x, y, r+PI/2, 10, r, -1, 45));
        break;
      case -2:
        pewpew.add(new Laser(x, y, r+PI/2-PI/16, 12, r-PI/16, -2, 30));
        pewpew.add(new Laser(x, y, r+PI/2+PI/16, 12, r+PI/16, -2, 30));
        break;
      case -3:
        pewpew.add(new Laser(x, y, r+PI/2-PI/32, 18, r-PI/32, -3, 60));
        pewpew.add(new Laser(x, y, r+PI/2, 18, r, -3, 60));
        pewpew.add(new Laser(x, y, r+PI/2+PI/32, 18, r+PI/32, -3, 60));
        break;
      case -5:
        pewpew.add(new Laser(x, y, r+PI/2-PI/8, 4, r-PI/8, -5, 15));
        pewpew.add(new Laser(x, y, r+PI/2-PI/16, 4, r-PI/16, -5, 15));
        pewpew.add(new Laser(x, y, r+PI/2, 4, r, -5, 15));
        pewpew.add(new Laser(x, y, r+PI/2+PI/16, 4, r+PI/16, -5, 15));
        pewpew.add(new Laser(x, y, r+PI/2+PI/8, 4, r+PI/8, -5, 15));
        break;
      case -6:
        pewpew.add(new Laser(x, y, r+PI/2, 24, r, -6, 120));
        break;
      case -7:
        pewpew.add(new Laser(x, y, r+PI/2, 16, r, -1001, 45));
        break;
      case -9:
        for(int i = 1; i < 24; i++){
          pewpew.add(new Laser(x+cos(r+PI/2)*16*i, y+sin(r+PI/2)*16*i, r+PI/2, 16, r, -9, 2));
        }
        break;
      }
      d = f;
    }
  }
}



