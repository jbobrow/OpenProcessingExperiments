
int num = 33000;
Coisa[] c = new Coisa[num];
Coisa[] c2 = new Coisa[num];
PVector[] cLoc = new PVector[num];
PVector[] cVel = new PVector[num];
PVector[] cAcc = new PVector[num];
PVector[] cCor = new PVector[num];

void setup(){
  //size(displayWidth,displayHeight,P2D);
  size(640,480,P2D);
  //oscP5 = new OscP5(this,7000);
  
 frameRate(30);
  background(255);
  for(int i = 0; i<num; i++){
  cLoc[i] = new PVector(random(width),random(height));
  //cVel[i] = new PVector(0.0, 0.0);
  cVel[i] = new PVector(0.0,0.0);
  cAcc[i] = new PVector(0.0,0.125);
  cCor[i] = new PVector(0,0,0);
  c[i] = new Coisa(cLoc[i],cVel[i],cAcc[i],cCor[i]);
  //c2[i] = new Coisa(cLoc[i],cVel[i],cAcc[i],cCor[i]);
  }
}

void draw(){
 noStroke();
 filter(DILATE);
 fill(230,15);
 rect(0,0,width,height);
  for(int i = 0; i<num; i++){
    c[i].go();
    PVector m = new PVector();
    m.set(mouseX,mouseY,0);
    PVector diff = PVector.sub(m,c[i].getLoc());
    diff.normalize();
    float f = 2.2;
    diff.div(f);
    c[i].setAcc(diff);
    
    
    
      if(mousePressed){
      //c[i].setAcc(new PVector(0,0));
      c[i].setVel(new PVector(0,0));
      } 
       
       
    
      if(keyPressed){
      c[i].setAcc(new PVector(0,0));
      //c[i].setVel(new PVector(0,0));
      }
  }
//println(frameRate);
}


/*void keyPressed(){
  save("image.png");
}*/



class Coisa{ // "Thing"
  PVector loc;
  PVector vel;
  PVector acc;
  PVector colors;
  float maxVel;
  Coisa(PVector loc_, PVector vel_, PVector acc_, PVector colors_){
    loc = loc_.get();
    vel = vel_.get();
    acc = acc_.get();
    colors = colors_.get();
    maxVel = 8;//size of geathering dynamic ball
  }
  
  void go(){
    move();
    render();
    border();
  }
  
  void move(){
    vel.add(acc);
    loc.add(vel);
    if(vel.mag() > maxVel){
      vel.normalize();
      vel.mult(maxVel);
    }
  }
  
  void border(){
    if((loc.y > height+100) || (loc.y < -100)){
      vel.y *= -0.5;
    }
    if((loc.x < -100) || (loc.x > width+100)){
      vel.x *= -0.5;
    }
  }
  
  void render(){
    color r =(int) colors.x;
    color g =(int) colors.y;
    color b =(int) colors.z;
    
    stroke(r,g,b,30);
    strokeWeight(1);
    point(loc.x,loc.y);
  }
  
  //geters e seters
  PVector getVel(){
    return vel.get();
  }
  
  PVector getLoc(){
    return loc.get();
  }
  
  PVector getAcc(){
    return acc.get();
  }
  
  float getMaxVel(){
    return maxVel;
  }
  
  PVector getColor(){
    return colors.get();
  }
  
  void setVel(PVector v){
    vel = v.get();
  }
  
  void setLoc(PVector v){
    loc = v.get();
  }
  
  void setAcc(PVector v){
    acc = v.get();
  }
  
  void setMaxVel(float f){
    maxVel = f;
  }
  
  void setColor(PVector v){
    colors = v.get();
  }
  
}
