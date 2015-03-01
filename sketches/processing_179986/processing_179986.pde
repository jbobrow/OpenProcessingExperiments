
ArrayList ring = new ArrayList();
float G;
Body saturn;
Body titan;
Body rhea;
Body iapetus;

void setup(){
  size(1200,900);
  saturn = new Body(new PVector(width/2,height/2),new PVector(0,0),10000,100,true,color(255,255,0));
  titan = new Body(new PVector(100,height/2),new PVector(0,-1),10,5,false,color(255,255,0));
  rhea = new Body(new PVector(950,height/2),new PVector(0,1.1),5,5,false,color(255,0,0));
  iapetus = new Body(new PVector(400,height/2),new PVector(0,-1.6),8,5,false,color(0,255,0));
  G = 0.05;
  background(0);
  for(int i=0; i<5000; i++){
    ring.add(new Particle());
  }
  smooth();
  frameRate(80);
}

void draw(){
  background(0);
  //histogram();
  fill(255,255,0,50);
  //titan.run();
  //saturn.run();
  //rhea.run();
  //iapetus.run();
  for(int i=0; i<ring.size(); i++){
    Particle p = (Particle) ring.get(i);
    p.run();
    if(p.hit(saturn) || p.hit(titan) || p.hit(rhea) || p.hit(iapetus) || PVector.dist(p.loc,saturn.loc)>999){
      ring.remove(i);
    }
  }
  print(ring.size()+"\n");
}






void histogram(){
  int[] hist = new int[1010];
  for(int i=0; i<ring.size(); i++){
    Particle p = (Particle) ring.get(i);
    float distance = PVector.dist(p.loc,saturn.loc);
    int index = round(distance);
    hist[index]++;
  }
  
  //find lowest 4 numbers
  int low1 = 1000;
  int low2 = 1000;
  int low3 = 1000;
  int low4 = 1000;
  for(int i=0; i<hist.length; i++){
    if(hist[i]<low1 && hist[i]>0){
      low1 = i;  
    }
    else if(hist[i]<low2 && hist[i]>0){
      low2 = i;  
    }
    else if(hist[i]<low3 && hist[i]>0){
      low3 = i;  
    }
    else if(hist[i]<low4 && hist[i]>0){
      low4 = i;  
    }
  }
  print(low1+"\n");
  
  noFill();
  stroke(255,0,0);
  ellipse(width/2,height/2,low4,low4);
  stroke(0,255,0);
  ellipse(width/2,height/2,low3,low3);
  stroke(255,0,255);
  ellipse(width/2,height/2,low2,low2);
  stroke(0,0,255);
  ellipse(width/2,height/2,low1,low1);
}






class Particle{
  
  PVector loc;
  PVector vel;
  PVector acc;
  PVector r;
  color c;
  
  Particle(){
    loc = new PVector(random(3*width/14,7*width/14),height/2);
    loc = new PVector(300,height/2);
    //find quadrant
    float randX;
    float randY;
    randX = random(0,0.5);
    randY = random(-4,0);
    vel = new PVector(randX,randY);
    acc = new PVector(0,0);
    r = new PVector(0,0);
  }
  
  void run(){
    acc.mult(0);
    acc.add(grav(saturn));
    acc.add(grav(titan));
    acc.add(grav(rhea));
    acc.add(grav(iapetus));
    vel.limit(50);
    vel.add(acc);
    loc.add(vel);
    render();
  }
  
  PVector grav(Body body){
    r = PVector.sub(loc,body.loc);
    float rMag = PVector.dist(loc,body.loc);
    if(rMag<1.0) rMag = 1.0;
    float coef = (-1)*G*body.M/(rMag*rMag);
    r.normalize();
    return PVector.mult(r,coef);
  }
  
  boolean hit(Body body){
    float distance = PVector.dist(loc,body.loc);
    if(distance<body.rad/2){
      return true;
    }
    else{
      return false;
    }
  }
  
  void render(){
    float distance = PVector.dist(loc,saturn.loc);
    color c;
    if(distance>0 && distance<=100){
      c = color(255,100,100);
    }
    else if(distance>100 && distance<=200){
      c = color(100,255,100);
    }
    else if(distance>200 && distance<=300){
      c = color(100,100,255);
    }
    else if(distance>300 && distance<=400){
      c = color(255,100,255);
    }
    else if(distance>400 && distance<=500){
      c = color(100,255,255);
    }
    else{
      c = color(255,255,255);
    }
    stroke(c);
    point(loc.x,loc.y);
  }
}









class Body{
  PVector loc;
  PVector vel;
  PVector acc;
  PVector r;
  int rad;
  float M;
  boolean isSaturn;
  color c;
  
  Body(PVector l, PVector v, float mass, int R, boolean who, color colour){
    loc = l;
    vel = v;
    acc = new PVector(0,0);
    M = mass;
    rad = R;
    isSaturn = who;
    c = colour;
  }
  
  void run(){
    if(!isSaturn){
      acc.mult(0);
      r = PVector.sub(loc,saturn.loc);
      float rMag = PVector.dist(loc,saturn.loc);
      float coef = (-1)*G*saturn.M/(rMag*rMag);
      r.normalize();
      acc = PVector.mult(r,coef);
      vel.add(acc);
      loc.add(vel);
    }
      stroke(c);
      ellipse(loc.x,loc.y,rad,rad);
  }
}

