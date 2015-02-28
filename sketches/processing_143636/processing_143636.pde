
Fuzzy_Ball[] balls;

void setup(){
  size(800,600);
  frameRate(20);
  strokeWeight(.5);
  balls = new Fuzzy_Ball[20];
  
  for (int i = 0; i < balls.length; i++){
    float R = random(15,50);
    PVector col_max = new PVector(0,0,0);
    
    if(i % 3 == 0) col_max.set(1,0,0);
    if(i % 3 == 1) col_max.set(0,1,0);
    if(i % 3 == 2) col_max.set(0,0,1);
    
    Fuzzy_Ball z = new Fuzzy_Ball();
    z.Count = int(random(50,150));
    z.Or = new PVector(random(R,width-R),random(R,height-R));
    z.R = R;
    z.s = new PVector(random(-1.5,1.5),random(-1.5,1.5));
    z.rot_s = random(-PI/60, PI/60);
    z.col_max = col_max;
    z.col = random(0.0, 1.0);
    z.col_s = 0.2;
    z.c_mult = 1;
    
    z.initPts();
    balls[i] = z;
  }
  
}

void draw(){
  for(int i = 0; i < balls.length; i++){
    balls[i].update();
  }
  background(0);
  
  for(int i = 0; i < balls.length; i++){
    balls[i].display();
  }
}

class Fuzzy_Ball{
  
  Rad_Pt[] radPts;
  
  int Count = 100;
  float R;
  PVector Or;
  PVector s;
  float rot_ang;
  float rot_s;
  float col;
  PVector col_max;
  float col_s;
  float c_mult;
  
  void initPts(){
   radPts = new Rad_Pt[Count];
   float r_min = .50*R;
   float s = 5;
   
   for(int i = 0; i < Count; i++){
     float ang = random(0,2*PI);
     float r = random(r_min,R);
     float c = random(0,1);

     radPts[i] = new Rad_Pt(ang,r,s,r_min,R,c);
   }
   
  }
  
  void checkEdges(){
    if(Or.x < R || Or.x > width-R){
      s.set(-s.x,s.y);
    }
    if(Or.y < R || Or.y > height-R){
      s.set(s.x,-s.y);
    }
  }
  
  void update(){
    checkEdges();
    Or.add(s);
    rot_ang += rot_s;
    for(int i = 0; i < radPts.length; i++){
      radPts[i].update();
    }
    
    col += col_s;
    if(col > 1.0)
    {
      col = 1.0;
      col_s *= -1/c_mult;
    }
    if(col < 0.0)
    {
      col = 0.0;
      col_s *= -c_mult;
    }    
  }
  
  void display(){
    for(int i = 0; i < radPts.length; i++){
      PVector Pt = new PVector(Or.x,Or.y);
      float r = radPts[i].r;
      float ang = rot_ang + radPts[i].ang;
      Pt.add(r*cos(ang),r*sin(ang),0);
      
      float rr = col * col_max.x;
      float gg = col * col_max.y;
      float bb = col * col_max.z;
      
      float c = radPts[i].c;
      rr = c * 1.0 + (1-c) * rr;
      gg = c * 1.0 + (1-c) * gg;
      bb = c * 1.0 + (1-c) * bb;
      
      stroke(int(255.0 * rr), int(255.0*gg), int(255.0*bb));
      //fill(int(255.0 * rr), int(255.0*gg), int(255.0*bb));
      line(Or.x,Or.y,Pt.x,Pt.y);
      ellipse(Pt.x,Pt.y,2,2);
    }
  }
  
}

class Rad_Pt{
  
  float ang;
  float r;
  float s;
  float r_min;
  float r_max;
  float c;
  float mult;
  
  
  Rad_Pt(float _ang, float _r, float _s, float _r_min, float _r_max, float _c){
    ang = _ang;
    r = _r;
    s = _s;
    r_min = _r_min;
    r_max = _r_max;
    c = _c;
    mult = 5;
 
  }
  
  void update(){
    r += s;
    if (r > r_max){
      r = r_max;
      s *= -1 / mult;
    }
    
    if (r < r_min){
      r = r_min;
      s *= -mult;
      
    }
  }
}
