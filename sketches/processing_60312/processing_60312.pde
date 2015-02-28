
int elapsedFrames = 0;
ArrayList points = new ArrayList();
boolean drawing = false;

void setup(){
  smooth();
  size(600,600);

  background(240,161,44);
}

void draw(){
  if(drawing == true){
    PVector pos = new PVector();
    pos.x = mouseX;
    pos.y = mouseY;

    PVector vel = new PVector();
    vel.x = (0);
    vel.y = (0);
  
    Point punt = new Point(pos, vel, 1000);
    points.add(punt);
  } 
  
  
  for(int i = 0; i < points.size(); i++){
   Point localPoint = (Point) points.get(i);
   if(localPoint.isDead == true){
    points.remove(i); 
   }
   localPoint.update();
   localPoint.draw();
  }
  
  elapsedFrames++;
}


void keyPressed(){
  if(key == ' '){
    for(int i = 0; i < points.size(); i++){
       Point localPoint = (Point) points.get(i);
       localPoint.isDead = true;
    }
    noStroke();
    fill(255);
    rect(0, 0, width, height);
  }
}

void mousePressed(){
  drawing = true;
}

void mouseReleased(){
  drawing = false;
}



class Point{
  
  PVector pos, vel, noiseVec;
  float noiseFloat, lifeTime, age;
  boolean isDead;
  
  public Point(PVector _pos, PVector _vel, float _lifeTime){
    pos = _pos;
    vel = _vel;
    lifeTime = _lifeTime;
    age = 0;
    isDead = false;
    noiseVec = new PVector();
  }
  
  void update(){
    noiseFloat = noise(pos.x * 0.01, pos.y * 0.01, elapsedFrames * 0.01);
    noiseVec.x = cos(((noiseFloat -0.6) * TWO_PI) * 10);
    noiseVec.y = sin(((noiseFloat - 0.6) * TWO_PI) * 10);
    
    vel.add(noiseVec);
    vel.div(2);
    pos.add(vel);
    
    if(1.0-(age/lifeTime) == 0){
     isDead = true; 
    }
    
    if(pos.x < 10 || pos.x > width || pos.y < 10 || pos.y > height){
     isDead = true;
    }
    
    age++;    
  }
  
  void draw(){    
    fill(0,50);
    noStroke();
    ellipse(pos.x, pos.y, 1-(age/lifeTime), 1-(age/lifeTime));
  }
};

