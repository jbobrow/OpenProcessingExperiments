
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer relax;
AudioPlayer jump;
AudioPlayer thud;
AudioPlayer bleep;
AudioPlayer alarm;

boolean r = true;
Ball ball;
Room room;
MouseCursor mCursor;
boolean flash = true;
int count = 0;
boolean alarmLoop = false;

color border = color(191, 0, 6);

void setup() {
  m = new Minim(this);
  relax = m.loadFile("Relax.wav");
  jump = m.loadFile("Jump.wav");
  thud = m.loadFile("Thud.wav");
  bleep = m.loadFile("Bleep2.wav");
  alarm = m.loadFile("Alarm2.wav");

  if (r=true) {
    relax.loop();
  }

  size(700, 400);
  smooth();

  room = new Room();
  ball = new Ball();
  mCursor = new MouseCursor();
}

void draw() {
  background(0);

  stroke(0);
  if (ball.pos.dist(mCursor.pos) < ball.rad + mCursor.rad) {
    bounce(ball, mCursor);
    jump.loop(0);
  }

  mCursor.update();
  mCursor.display();

  room.display();
  stroke(border);
  noFill();
  rect(175, 100, 350, 200);

  ball.update();
  ball.display();
}

class Room {
  PVector vel = new PVector();
  float roomWidth;
  float roomHeight;

  Room() {
    roomWidth = 280;
    roomHeight = 160;
    vel.x = random(0, 5);
    vel.y = random(0, 5);
  }

  void display() {
    //color(255);
    fill(255);
    strokeWeight(3);
    rect(350-(roomWidth/2), 200-(roomHeight/2), roomWidth, roomHeight);
  }

  void update() {
    roomWidth = roomWidth + 21;
    roomHeight = roomHeight + 12;
  }

  void update2() {
    if (roomWidth < 350) {
      border = color(255);
      fill(255);
      roomWidth = roomWidth - 0.35;
      roomHeight = roomHeight - 0.20;

      rect(350-(roomWidth/2), 200-(roomHeight/2), roomWidth, roomHeight);
      stroke(border);
      noFill();
      rect(175, 100, 350, 200);
      thud.setGain(100);
      bleep.setGain(100);
      jump.setGain(100);
    }
    else if (roomWidth > 280) {
      border = color(191, 0, 6);
      roomWidth = roomWidth - 0.35;
      roomHeight = roomHeight - 0.20;
      thud.setGain(-20);
      bleep.setGain(-20);
      jump.setGain(-20);
    }
  }

  void update3() {
    if (alarmLoop == true) { 
      alarm.loop(1);
    }
    else {
      //alarm.pause();
    }

    if (roomWidth < 350) {
      
      if (count > 10) {
        if (flash == true) {
          alarmLoop = true;
          background(191, 0, 6);
          count = 0;
          flash = false;
        }
        else {
          background(0);
          count = 0;
          flash = true;
          alarmLoop = false;
        }
      }
      else {
        
        count++;
      }
    }
  }
}

class Ball {
  PVector pos = new PVector();
  PVector vel = new PVector();
  float rad = 50;
  color c = 0;

  Ball() {
    pos.x = 350;
    pos.y = 200;
    vel.x = random(0, 5);
    vel.y = random(0, 5);
  }

  void update() {
    room.update3();
    if (pos.y + rad > 200+(room.roomHeight/2)) {
      vel.y = abs(vel.y) * -1;
      room.update();
      bleep.loop(0);
      thud.loop(0);
    }
    else {
      room.update2();
    }
    if (pos.y - rad < 200-(room.roomHeight/2)) {
      vel.y = abs(vel.y);
      bleep.loop(0);
      room.update();
      thud.loop(0);
    }
    else {
      room.update2();
    }
    if (pos.x + rad > 350+(room.roomWidth/2)) {
      vel.x = abs(vel.x) * -1;
      room.update();
      bleep.loop(0);
      thud.loop(0);
    }
    else {
      room.update2();
    }
    if (pos.x - rad < 350-(room.roomWidth/2)) {
      vel.x = abs(vel.x);
      room.update();
      bleep.loop(0);
      thud.loop(0);
    }
    else {
      room.update2();
    }
    pos.add(vel);
  }

  void display() {
    fill(c);
    ellipseMode(RADIUS);
    stroke(0);
    ellipse(pos.x, pos.y, rad, rad);
  }
}

class MouseCursor extends Ball {
  MouseCursor() {
    vel.set(0, 0, 0);
    pos.x = mouseX;
    pos.y = mouseY;
    rad = 0;
  }

  void update() {
    pos.x = mouseX;
    pos.y = mouseY;
  }
}

void bounce(Ball ball, Ball mouse) {
  PVector ab = new PVector();
  ab.set(ball.pos);
  ab.sub(mouse.pos);
  ab.normalize();
  while (ball.pos.dist (mouse.pos) < ball.rad + mouse.rad) {
    ball.pos.add(ab);
  }

  PVector impact = new PVector();
  PVector impulse = new PVector();
  float impactSpeed;

  impact.set(ball.pos);
  impact.sub(mouse.pos);

  impulse.set(ab);

  impactSpeed = impulse.dot(impact);

  impulse.mult(sqrt(impactSpeed));

  ball.vel.add(impulse);
  mouse.vel.sub(impulse);
}


