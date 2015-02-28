
ParticleSystem ps;

ArrayList<ParticleEmitter> e = new ArrayList<ParticleEmitter>();

PVector pressLoc, releaseLoc; //mouse positions

boolean drawing = false;

PGraphics pg;
PGraphics pgBlur;

void setup() {
  size(800,700,P2D);
  ps = new ParticleSystem(0,0);
  frameRate(24);
  background(0,0,0);
  pg = createGraphics(800,700,JAVA2D);
  pgBlur = createGraphics(800,700,P2D);
  pg.smooth();
  pgBlur.smooth();
  pgBlur.beginDraw();    
}

void draw() {

  pg.beginDraw();
   pg.background(0,0,0,0); 
  //println(frameRate);
  
  pgBlur.pushStyle();
  pgBlur.fill(0,0,0,255/15);
  //pgBlur.background(0,0,0); 
  pgBlur.noStroke();
  pgBlur.rect(0,0,width,height);
  pgBlur.popStyle();

  if(ps != null) {
    ps.step();
    ps.draw(pgBlur);
    ps.cleanUp();
  }
  
  ParticleEmitter em;
  for(int i = 0; i<e.size(); i++){
    em = e.get(i);
    if(em.dead()){
      e.remove(i);
    }
    em.step();
  }
    
  if(drawing == true){
    drawVec(pressLoc, new PVector(mouseX,mouseY),pg);
  }

  pg.pushStyle();
  pg.noFill();
  pg.stroke(0,255,0);
  pg.ellipse(width/2,height/2,500,500);
  pg.popStyle();
  pg.endDraw();

  pgBlur.endDraw();

  //draw stuff on screen
  image(pgBlur,0,0);
  image(pg,0,0);

}

void mousePressed(){
  drawing = true;
  pressLoc = new PVector(mouseX,mouseY);
}

void mouseReleased() {
  pg.background(0,0,0,0);
  drawing = false;
  releaseLoc = new PVector(mouseX,mouseY);
  PVector vel = PVector.sub(releaseLoc,pressLoc);
  float m = vel.mag();
  if(m > 0){
    //minimum vel
    vel.normalize();
    vel.mult(max(m,5));
    vel.limit(50);
    m = vel.mag();
    //float freq = map(m,5,50,2,10);
    e.add(new ParticleEmitter(pressLoc,vel,2,100,ps));
  }
}

void drawVec(PVector start, PVector end, PGraphics myPg){
  PVector vec = PVector.sub(end,start);
  float m = vec.mag();
  float theta = atan2(vec.y,vec.x);
  myPg.pushStyle();
    myPg.strokeWeight(1);
    myPg.stroke(0,255,0);
    myPg.pushMatrix();
      myPg.translate(start.x,start.y);
      myPg.rotate(theta);
      myPg.beginShape(LINES);
      myPg.vertex(0,0);
      myPg.vertex(m,0);  
      myPg.endShape();    
    myPg.popMatrix();
  myPg.popStyle();
}

