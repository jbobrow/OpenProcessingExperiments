
ArrayList fTrails = new ArrayList();
ArrayList dTrails = new ArrayList();
ArrayList fExplosions = new ArrayList();
ArrayList dExplosions = new ArrayList();

//ArrayList stars = new ArrayList();
//ArrayList deadStars = new ArrayList();

float grav = 1;

boolean clicked = false;

PImage back, star;
PFont arial;
PVector[] msk;
float sample = 20;

void setup(){
  size(1024, 576);
  
  back = loadImage("back.jpg");
  star = loadImage("star.png");
  arial = loadFont("Arial-BoldMT-24.vlw");
  msk = new PVector[0];
  
  for(int x=0; x<width; x+=sample){
    for(int y=0; y<height; y+=sample){
      msk = (PVector[]) append(msk, new PVector(x, y, 255));
    }
  }
}

void draw(){
  background(0);
  
  if(clicked){
    imageMode(CORNER);
    image(back, 0, 0, width, height);
  }
  
  // Falling Stars
  /*if(frameCount % 10 == 0){
    if(deadStars.size() > 0){
      Star s = (Star) deadStars.get(0);
        s.siz = (int)random(4, 10);
        s.pos = new PVector(random(width), -10);
        s.vel = new PVector(0, 0);
        s.enabled = true;
      stars.add(s);
      deadStars.remove(0);
    } else {
      stars.add(new Star());
    }
  }
  
  for(int s=0; s<stars.size(); s++){
    Star star = (Star) stars.get(s);
    star.move();
    star.display();
    
    if(!star.enabled){
      deadStars.add(star);
      stars.remove(s);
    }
  }*/
  
  // Overall mask transparency
  float trans = 0;
  
  for(int m=0; m<msk.length; m+=1){
    trans -= msk[m].z;
    noStroke();
    fill(0, msk[m].z);
    rect(msk[m].x, msk[m].y, sample, sample);
  }
  
  if(trans > -25000){
    for(int i=0; i<msk.length; i++){
      msk[i].z -= 1;
    }
  }
  
  for(int t=0; t<fTrails.size(); t++){
    Trail trail = (Trail) fTrails.get(t);
    
    trail.move();
    trail.display();
    
    if(!trail.enabled){
      dTrails.add(trail);
      fTrails.remove(t);
    }
  }
  
  for(int i=0; i<fExplosions.size(); i++){
    Explosion e = (Explosion) fExplosions.get(i);
    
    e.move();
    e.display();
    
    if(!e.enabled){
      dExplosions.add(e);
      fExplosions.remove(i);
    }
  }
  
  if(!clicked){
    colorMode(RGB);
    textAlign(CENTER);
    textFont(arial);
    textSize(24);
    fill(0, 2550, 255);
    text("It's almost 2013", width/2, height/2 - 24);
    textSize(12);
    fill(255);
    text("Click here to begin the celebrations!", width/2, height/2);
  }
}

void mousePressed(){
  if(!clicked){
    clicked = true;
  }
  if(fTrails.size() <= 10 && fExplosions.size() <= 10){
    fTrails.add(new Trail());
  }
}
class Explosion{
  // Color;
  int c;
  boolean enabled;
  // Number of Lines
  int num;
  // Velocity
  float vel;
  // Distance from Explosion
  float dis;
  // Size of Explosion
  float siz;
  // Points to Draw
  ArrayList<Float> points;
  // Center Point
  PVector strt;
  
  Explosion(PVector origin){
    c = (int) random(255);
    enabled = true;
    strt = origin;
    num = (int) random(1, 5);
    vel = 0;
    dis = 0;
    siz = 100 + random(0, 155);
    points = new ArrayList<Float>();
  }
  
  void move(){
    if(points.size() > 20){
      points.remove(0);
    } else {
      points.add(dis);
    }
    
    vel = (siz-dis)*0.1;
    
    dis += vel;
    
    for(int m=0; m<msk.length; m+=1){
      float space = dist(msk[m].x, msk[m].y, strt.x, strt.y);
      if(space <= dis){
        msk[m].z -= (255 - space)*0.01;
      }
    }
  }
  
  void display(){
    for(int i=0; i<points.size(); i++){
      noStroke();
      colorMode(HSB);
      fill(c, 255, 255, i*20);
      
      float p = (float)(points.get(i));
      float END = siz-dis;
      
      for(int r=0; r<360; r+=num*10){
        float xPos = (float) (p*Math.cos(radians(r)));
        float yPos = (float) (p*Math.sin(radians(r)));
        ellipse(strt.x + xPos, strt.y + yPos, vel + END*0.1, vel + END*0.1);
      }
      
      if(END < 1){
        enabled = false;
      }
    }
  }
  
}
class Star{
  boolean enabled;
  PVector pos;
  PVector vel;
  int siz;
  
  Star(){
    enabled = true;
    siz = (int)random(4, 10);
    pos = new PVector(random(width), -10);
    vel = new PVector(0, 0);
  }
  
  void move(){
    pos.y += grav;
    //vel.y += grav;
    
    //pos.add(vel);
    
    if(pos.y > height+10){
      enabled = false;
    }
  }
  
  void display(){
    imageMode(CENTER);
    image(star, pos.x, pos.y, siz, siz);
  }
  
}
class Trail{
  // Is Enabled
  boolean enabled;
  // Start Position
  PVector sPos;
  // Current Position
  PVector cPos;
  // End Position
  PVector ePos;
  // Velocity
  PVector vel;
  
  // List of positions
  ArrayList pos;
  ArrayList deadPos;
  
  Trail(){
    enabled = true;
    
    sPos = new PVector(mouseX, mouseY);
    cPos = new PVector(mouseX, mouseY);
    ePos = new PVector(sPos.x + random(-50, 50), sPos.y - 100 - random(200));
    vel = new PVector(0, 0);
    
    pos = new ArrayList();
    deadPos = new ArrayList();
  }
  
  void move(){    
    // Calculate Velocity
    vel = new PVector(ePos.x - cPos.x, ePos.y - cPos.y);
    vel.mult(0.05);
    // Add Velocity to Current Position
    cPos.add(vel);
    
    if(pos.size() > 20){
      pos.remove(0);
    } else {
      // Add Position to List of Positions
      pos.add(new PVector(cPos.x, cPos.y));
    }
    
    if(dist(cPos.x, cPos.y, ePos.x, ePos.y) < 1){
      fExplosions.add(new Explosion(cPos));
    }
  }
  
  void display(){
  colorMode(RGB);
  
    for(int i=0; i<pos.size() - 1; i++){
      PVector p1 = (PVector) pos.get(i);
      PVector p2 = (PVector) pos.get(i+1);
      
      stroke(255, abs(vel.y)*20);
      strokeWeight(abs(vel.y)*0.5);//i*0.1);
      line(p1.x, p1.y, p2.x, p2.y);
      
      stroke(255, abs(vel.y)*10);
      strokeWeight(abs(vel.y)*0.5);//i*0.3);
      line(p1.x, p1.y, p2.x, p2.y);
      
      if(i == 19 && dist(p2.x, p2.y, ePos.x, ePos.y) < 1){
        enabled = false;
      }
    }
  }
  
}

