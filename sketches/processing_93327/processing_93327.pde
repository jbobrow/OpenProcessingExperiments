
ArrayList plist = new ArrayList();
ArrayList rocklist = new ArrayList();

int MAX = 50;

void setup(){
  size(800,600);
  background(50);
}

void draw(){
  background(0);


  
  if (rocklist.size() == 0){    
    rocklist.add(new Rock((int) random(700)+50,(int) random(500)+50));
  }

     drawReticle();
  if(mousePressed && mouseButton == RIGHT) {
    background(50);
    boolean clearall = true;
    while(plist.size() > 0) {
      for(int i = 0; i < plist.size(); i++) {
        plist.remove(i);
      }
    }
  }
 
  for(int i = 0; i < plist.size(); i++) {
    Particle p = (Particle) plist.get(i);
    //makes p a particle equivalent to ith particle in ArrayList
    p.run();
    p.update();
    drawReticle();
    p.gravity();

  }
  
    for(int i = 0; i < rocklist.size(); i++) {
    Rock r = (Rock) rocklist.get(i);
    r.drawRock();
    drawReticle();

  }
  

}

void mousePressed() {
  
 if ((mouseX > ((Rock) rocklist.get(0)).getX()-30 && mouseX < ((Rock) rocklist.get(0)).getX()+30) 
 && (mouseY < ((Rock)rocklist.get(0)).getY()+30 && mouseY > ((Rock)rocklist.get(0)).getY()-30)){
  
  for (int i = 0; i < MAX; i ++) {
    plist.add(new Particle(mouseX,mouseY)); // fill ArrayList with particles
 
    if(plist.size() > 5*MAX) {
      plist.remove(0);
    }
    
 
  }
  if(rocklist.size() > 0) {

          rocklist.remove(0);
    }
 }
}
  


void drawRock(int x, int y){
  stroke(231,188,23);
//  rotate((int)(random(360)));
  beginShape();
  vertex(x-30,y);
  vertex(x-23,y+32);
  vertex(x+20,y+24);
  vertex(x+34,y);
  vertex(x-13,y-35);
  endShape();
}


void drawReticle(){
  strokeWeight(5);
  stroke(201,132,29);
  line(mouseX,mouseY-15,mouseX,mouseY+15);
  line(mouseX-15,mouseY,mouseX+15,mouseY);
}

void drawExplosion(){

}

  
class Rock {

  public int posx;
  public int posy;
  
  Rock(int x, int y){
    posx = x;
    posy = y;
  
  }
  
  int getX(){
    return posx;
  }
  
  int getY(){
    return posy;
  }
  
  void drawRock() {
    noStroke();
//  rotate((int)(random(360)));
  beginShape();
  vertex(posx-30,posy-30);
  vertex(posx-30,posy+30);
  vertex(posx+30,posy+30);
  vertex(posx+30,posy-30);
  endShape();
  
  }
}  
  
class Particle {
  float r = 5; //2
  PVector pos,speed,grav;
  ArrayList tail;
  float splash = 5; //5
  int margin = 8; //2
  int taillength = 15; //25
 
  Particle(float tempx, float tempy) {
    float startx = tempx + random(-splash,splash);
    float starty = tempy + random(-splash,splash);
    startx = constrain(startx,0,width);
    starty = constrain(starty,0,height);
    float xspeed = random(-3,3);
    float yspeed = random(-3,3);
 
    pos = new PVector(startx,starty);
    speed = new PVector(xspeed,yspeed);
    grav = new PVector(0,0.02);
     
    tail = new ArrayList();
  }
 
  void run() {
    pos.add(speed);
 
    tail.add(new PVector(pos.x,pos.y,0));
    if(tail.size() > taillength) {
      tail.remove(0);
    }
 
    float damping = random(-0.5,-0.6);
    if(pos.x > width - margin || pos.x < margin) {
      speed.x *= damping;
    }
    if(pos.y > height -margin) {
      speed.y *= damping;
    }
  }
 
  void gravity() {
    speed.add(grav);
  }
 
  void update() {
    for (int i = 0; i < tail.size(); i++) {
      PVector tempv = (PVector)tail.get(i);
      noStroke();
      fill(6*i + 50);
      ellipse(tempv.x,tempv.y,r,r);

    }
  }
}


