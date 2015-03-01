
// Kyle K
// Jun 6 2014
ArrayList<Particle> particles;
color[] cols ;
int lightness;
int xoff;

void setup() {
  size(850, 850, P2D);
  smooth();
  lightness=5;
  xoff=65; yoff=-46;
  cols = new color[6];
  cols[0] = color(#8FD2D2);
  cols[1] = color(#CCFFCC);
  cols[2] = color(#334C4C);
  cols[3] = color(#FFD6AD);
  cols[4] = color(#333333);
  frameRate(30);
  particles = new ArrayList<Particle>();
  drawBack();
  drawBranches(60);
}

void drawBack(){
  background(255);
  stroke(100,30);
  fill(255);
  ellipse(width/2,height/2,width/2+400,height/2+400); 
  ellipse(width/2,height/2,width/2+200,height/2+200); 
  noStroke();
  fill(cols[round(random(4))]);
  ellipse(width/2,height/2,width/2+100,height/2+100); 
}
 
void draw() {
  for (int i=0; i<particles.size(); i++) {
    Particle p = particles.get(i);
    p.update();
    p.display();
  }
 
  for (int i=particles.size()-1; i>-1; i--) {
    Particle p = particles.get(i);
    if (p.dead) {
      particles.remove(i);
    }
  }
}
 
void mousePressed() {
  drawBack();
  drawBranches(round(random(20,50)));
}

void keyPressed(){
  
  if(keyCode==UP){
    lightness++;
  } 
  
  if(keyCode==DOWN){
    if(lightness<=1){
      lightness=1;
    } else {
      lightness--;
    }
  }
  
   drawBack();
   drawBranches(40); 
  
  
}


 
void drawBranches(int w){
 for (int i=0;i<150;i++) {
      Particle newP = new Particle(width/2-xoff+w, height/2-yoff, i+particles.size(), i+particles.size());
      particles.add(newP);
  }
 for (int i=0;i<150;i++) {
      Particle newP = new Particle(width/2-xoff-w-(w/2), height/2-yoff, i+particles.size(), i+particles.size());
      particles.add(newP);
  }
 for (int i=0;i<150;i++) {
      Particle newP = new Particle(width/2-xoff, height/2-yoff+w+(w/2), i+particles.size(), i+particles.size());
      particles.add(newP);
  }
 for (int i=0;i<150;i++) {
      Particle newP = new Particle(width/2-xoff, height/2-yoff-w, i+particles.size(), i+particles.size());
      particles.add(newP);
  } 
}

 
class Particle{
  PVector loc, vel, acc;
  int lifeSpan, passedLife;
  boolean dead;
  float alpha, weight, weightRange, decay, xOffset, yOffset;


  Particle(float x, float y, float xOffset, float yOffset){
    loc = new PVector(x,y);
    acc = new PVector(0,0);
    float randDegrees = random(360);
    vel = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    vel.mult(3);
    lifeSpan = int(random(20, 65));
    decay = random(0.75, 0.9);
    weightRange = random(3,50);
     
    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }
   
  void update(){
    if(passedLife>=lifeSpan){
      dead = true;
    }else{
      passedLife++;
    }
     
    alpha = float(lifeSpan-passedLife)/lifeSpan * 70+50;
    weight = float(lifeSpan-passedLife)/lifeSpan * weightRange;

    float rn = (noise((loc.x+frameCount+xOffset)*0.01, (loc.y+frameCount+yOffset)*0.01)-0.5)*4*PI;
    float mag = noise((loc.y+frameCount)*0.01, (loc.x+frameCount)*0.01);
    PVector dir = new PVector(cos(rn),sin(rn));
    acc.add(dir);
    acc.mult(mag);
     
    float randDegrees = random(360);
    PVector randV = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    randV.mult(0.5);
    acc.add(randV);
    vel.add(acc);
    vel.mult(decay);
    vel.limit(4);
    loc.add(vel);
  }
   
  void display(){
    strokeWeight(weight+1.5);
    stroke(0, alpha/lightness);
    point(loc.x, loc.y);
     
   strokeWeight(weight/1.9);
    stroke(255);
    point(loc.x, loc.y);
    point(loc.x, loc.y);
  }
}



