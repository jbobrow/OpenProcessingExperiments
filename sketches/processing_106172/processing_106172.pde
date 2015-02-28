
//Joshua Kingsbury
//Build/Interpretation of sketch as seen on this website:
//http://p5lyon.tumblr.com/ProcessingJSTumblrEn

//Translated from version written in python for processing.py

ArrayList points;
int pointNum;
float lineRad;

int strobeRate;
boolean strobe;

boolean altCol;

color pC, mC;
float pH, mH;

PVector a, b, m;

void setup(){
  size(500,500);
  background(0);
  
  points = new ArrayList();
  pointNum = 30;
  lineRad = 80;
  
  //Time per second
  strobeRate = 10
  
  pC = color(0,0,255);
  mC = color(255,0,0);
  
  a = new PVector();
  b = new PVector();
  m = new PVector();
  
  strobe = false;
  
  if(random(0,10) < 5){
      altCol = true;
  } else altCol = false;
  
  
  for(int i = 0; i < pointNum; i++){
    PVector randPos = new PVector(random(1,width-1), random(1,height-1));
    PVector randVel = new PVector(random(-3,3), random(-3,3));
    points.add(new Vertex(randPos, randVel));
  }

}

void draw(){
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  
  if(strobe){
      //strobeTimer = (int)(frameCount%strobeRate);
      if((int)(frameCount%strobeRate) == 0){
          background(0);
          //background(255);
      }
  }
  
  m = new PVector(mouseX, mouseY);

  
  for(int i = 0; i < points.size(); i++){
    Vertex a = (Vertex) points.get(i);
    
    if(PVector.dist(a.pos, m) < lineRad){
        a.weight += 1;
        if(altCol){
            mH = hue(mC) + noise(frameCount + i);
            colorMode(HSB,255);
            stroke(mH, 255, 210);
        } else stroke(255,0,0);
        strokeWeight(1);
        line(a.pos.x, a.pos.y, m.x, m.y);
        colorMode(RGB,255);
    }  

    for(int j = 0; j < points.size(); j++){

      Vertex b = (Vertex) points.get(j);

      if(i != j){
        if(PVector.dist(a.pos, b.pos) < lineRad){
          b.weight += 1;
          if(altCol){
              pH = hue(pC)- i + noise(frameCount)*i+j;
//          stroke(0,255,0);
              colorMode(HSB,255);
              stroke(pH, 200, 200);
          } else stroke(0,255,0);
          strokeWeight(1);
          line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
          colorMode(RGB,255);
        }
      }
    }

    a.update();
    a.weight = 1;
  }
}


class Vertex{
  PVector pos, vel;
  float borderRad, weight;

  Vertex(PVector vPos, PVector vVel){
    pos = vPos;
    vel = vVel;
    borderRad = 200;
    weight = 1;
  }

  void circleBorder(){
    if(dist(width/2, height/2, pos.x, pos.y) > borderRad){
      float angle = atan2(height/2 - pos.y, width/2 - pos.x);
      PVector target = new PVector(width/2 + cos(angle)*borderRad-1,
        height/2 + sin(angle)*borderRad-1);
      pos = target;
    }
  }

  void update(){
    circleBorder();
    pos.add(vel);
    stroke(255);
    strokeWeight(weight);
    point(pos.x, pos.y);
  }

  
}

void mouseClicked(){
    //background(0);
    if(strobe){
        strobe = false;
    } else {strobe = true;}
}


