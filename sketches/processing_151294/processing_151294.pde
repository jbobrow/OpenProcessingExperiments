
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 */
ArrayList <Wanderer>wanderers;
int num;

void setup() {
  size(800, 800);
  frameRate(200);
  wanderers=new ArrayList<Wanderer>();
  num=8;
  for(int i=0;i<num;i++){
    //wanderers.add(new Wanderer(width/2+width*sin(i*2*PI/num)/10,height/2+height*cos(i*2*PI/num)/10,sin(i*2*PI/num),cos(i*2*PI/num),i,color(255,random(0,255),random(0,255))));
    wanderers.add(new Wanderer(width/2,height/2,sin(i*2*PI/num),cos(i*2*PI/num),i,color(255,random(0,255),random(0,255))));
  }
  background(0);
}


void draw() {
  // blend the old frames into the background
  noStroke();
  //  fill(0, 5);
  //  rect(0, 0, width, height);
  //image(pg,0,0);
  for(int i=0;i<num;i++){    
   
    wanderers.get(i).test();
     wanderers.get(i).display();
  }

}
class Wanderer {
  PVector position;      // current drawing position
  PVector speed;    // change in position at each frame
  PVector hand;
  PVector lineTip;
  float rad,radius, col;       // radius for the moving hand
  float max = 1;
  float min = .5;
  int index;

  Wanderer(float x, float y, float dx, float dy, int index,float col) {
    position=new PVector(x, y);
    speed=new PVector(dx, dy);
    lineTip=new PVector(0,0);
    this.index=index;
    this.col=col;
  }
  boolean test() {
    boolean out=false;
    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (position.x > width-100 || position.x < 100) {
      speed.x = speed.x > 0 ? -random(min, max) : random(min, max);
      out=true;
    }

    if (position.y > height-100 || position.y < 100) {
      speed.y = speed.y > 0 ? -random(min, max) : random(min, max);
      out=true;
    }
    return out;
  }
  void display() {
    rad=radians(frameCount);;
    radius=120 * sin(rad*0.5);
    // calculate new position
    position.add(speed);
    lineTip=PVector.add(position, new PVector(80 * sin(rad*2), 80 * cos(rad*2)));
    hand=PVector.add(lineTip, new PVector(radius * sin(rad*4), radius * cos(rad*4)));  
    strokeWeight(.3);
    stroke(col,(width-sqrt(dist(hand.x,hand.y,width/2,height/2)))/30);
    line(lineTip.x, lineTip.y, hand.x, hand.y);
    //ellipse(handX, handY, 2, 2);
  }
}



