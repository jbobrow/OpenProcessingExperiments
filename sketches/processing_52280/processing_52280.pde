
// Oh what a tangled web we weave...

import java.awt.Point;

String script[] = {"Spiders weave webs.","Why don't we?","Oh what a tangled web we weave..."};
Point web[] = new Point[20];
int web_i;
int frame_offset;

PFont web_font;

class Spider {
  Point loc;
  float rot, d;
  
  Spider() {
    this.loc = new Point(floor(random(width)),floor(random(height)));
    this.rot = 0;
    this.d = 20;
  }
  
  void drawSelf() {
    pushMatrix();
    translate(this.loc.x, this.loc.y);
    rotate(this.rot);
    // body
    noStroke();
    fill(0);
    ellipse(0,0,this.d,(2.0/3.0)*this.d);
    // legs
    stroke(0);
    noFill();
    arc(-this.d/2,0,8,this.d,-HALF_PI,HALF_PI);
    arc(-this.d/2 + 4,0,8,this.d,-HALF_PI,HALF_PI);
    arc(-this.d/2 + 8,0,8,this.d,-HALF_PI,HALF_PI);
    arc(-this.d/2 + 12,0,8,this.d,-HALF_PI,HALF_PI);
    // eyes
    noStroke();
    fill(255);
    ellipse(this.d/6.0,this.d/8.0,4,4);
    ellipse(this.d/6.0,-this.d/8.0,4,4);
    popMatrix();
  }
}


Spider s;
int state;

//SETUP
void setup() {
  size(600,600);
  smooth();
  
  web_i = 1;
  s = new Spider();
  web[0] = new Point(s.loc.x,s.loc.y);
  
  state = 0;
  
  web_font = loadFont("ARBERKLEY-30.vlw");
  textFont(web_font);
  
  frame_offset = 0;
  frameRate(60);
}


//DRAW
void draw() {
  if(state == 0) {
    background(255);
    
    // text
    fill(max(0,255-(frameCount-frame_offset)));
    text("Spiders weave webs.",100,height/2 - 60);
    fill(max(0,min(255,555-(frameCount-frame_offset))));
    text("Why don't we?",100,height/2 - 20);
  
    // web
    if(web_i >= 1) {
      for(int i=0; i < web_i-1; i++) {
        strokeWeight(1);
        stroke(0);
        line(web[i].x, web[i].y, web[i+1].x, web[i+1].y);
      }
    }
  
    // spider
    s.rot = -atan2((s.loc.y - mouseY),(mouseX - s.loc.x));
    s.drawSelf();
  } else if(state == 1) {
    fill(0,10);
    rect(0,0,width,height);
    
    fill(255);
    text("Oh what a tangled web we weave...", 30, height/2);
    strokeWeight(1);
    stroke(255);
    line(30, height/2 + 10, min(430,30 + frameCount - frame_offset),height/2 + 10);
  }
}




// interaction
void mousePressed() {
  if(state == 0) {
    s.loc.x = mouseX;
    s.loc.y = mouseY;
    web[web_i] = new Point(s.loc.x,s.loc.y);
    web_i++;
    if(web_i >= web.length) {
      state = 1;
      web_i = 0;
      frame_offset = frameCount;
    }
  } else if(state == 1) {
    state = 0;
    frame_offset = frameCount;
  }
}

