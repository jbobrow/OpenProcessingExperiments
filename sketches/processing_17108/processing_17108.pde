

//a whole moth
class bezierCustom{
  PVector loc;
  PVector centerLoc = new PVector(width/2,height);  
  PVector vec = new PVector(0,0);
  PVector acc ;
  PVector juggle;
  boolean dead = false;
  float PtoCenter;
  float w = 400;
  float h = 400;
  //one bezier become 8 point;
  fire[] fires = new fire[8];
  float x1;
  Float y1;
  Float cx1;
  float cy1;
  float cx2;
  Float cy2;
  Float x2;
  Float y2;
  float bezierX;
  float bezierY;
  float bezierX2;//here is another point,x
  float bezierY2;//here is another point,y
  float bezierX3;
  float bezierY3;
  float bezierX4;
  float bezierY4;
  float vx = 0;
  float vy = 0;
  float vx2 = 0;
  float vy2 = 0;
  float vx3 = 0;
  float vy3 = 0;
  float vx4 = 0;
  float vy4 = 0;
  
  Float cx1B;
  float cy1B;
  float cx2B;
  Float cy2B;
  float x1B;
  float y1B;
  float x2B;
  float y2B;
  //here use PVector instead of x,y
  
  boolean isRun = false;
  
  
bezierCustom(float a,float b,float c,float d,float e,float f,float g,float h){

  
  x1 = a;
  y1 = b;
  cx1 = c;
  cy1 = d;
  cx2 = e;
  cy2 = f;
  x2 = g;
  y2 = h;
  
    
     
     //another wing of the moth
     cx1B = cx1 - 10;
     cy1B = cy1;
     cx2B = cx2 - 10;
     cy2B = cy2;
     x1B = x1+30;
     y1B = y1;
     x2B = x2+30;
     y2B = y2 ;
     
     
     

     
    
  }
  
  public void setPos(PVector p){
    loc = p.get();
    float a = PVector.angleBetween(centerLoc,loc);
    PVector diff = PVector.sub(centerLoc,loc);
    //here not sure why it is,but now it's right;
    PtoCenter = diff.heading2D() - PI/2;
    diff.normalize();
   float factor = 0.1;  // Magnitude of Acceleration (not increasing it right now)
    diff.mult(factor);
    acc  = diff.get();
 // vec  = diff.get();
    //PtoCenter = degrees(a);
    
    
    
 //   println(" PtoCenter is "+ PtoCenter);
  }
  
  public void moveToFire(){
   
   vec.add(acc);
   loc.add(vec);
   loc.add(juggle);

  }
  
  public void getJuggle(PVector jugg){
    juggle = jugg.get();
  }
  
  public void update(){
    
   
  
  }
  
  public void getCurrentloc(){
    
     bezierX = x1+loc.x;
     bezierY = y1+loc.y;
     bezierX2 = x2+loc.x;
     bezierY2 = y2+loc.y;
     
     bezierX3 = x1B+loc.x;
     bezierY3 = y1B+loc.y;
     bezierX4 = x2B+loc.x;
     bezierY4 = y2B+loc.y;
     fires[0]=new fire( bezierX, bezierY);
     fires[1]=new fire( bezierX, bezierY);
     fires[2]=new fire( bezierX2, bezierY2);
     fires[3]=new fire( bezierX2, bezierY2);
     fires[4]=new fire( bezierX3, bezierY3);
     fires[5]=new fire( bezierX3, bezierY3);
     fires[6]=new fire( bezierX4, bezierY4);
     fires[7]=new fire( bezierX4, bezierY4);
  }
  
  public void drawbezier(){
 
  //strokeWeight( random(1,2) );  
  pushMatrix();
  translate(loc.x,loc.y);

  rotate(PtoCenter);
  stroke(255, 102, 0,255- random(0,150));
  bezier(x1,y1,cx1,cy1,cx2,cy2,x2,y2);
  bezier(x1B,y1B,cx1B,cy1B,cx2B,cy2B,x2B,y2B);
  popMatrix();   
  }
  
  //flying~ 
  public void flyMove(){
    
    
  }
  public void move(){
     //translate(loc.x,loc.y);
     vx += random(-1, 1);
     vy += random(-1, 1);
     vy += .1;
     vx *= .95;
     vy *= .95;
     bezierX += vx;
     bezierY += vy;
// another point     
     vx2 += random(-1, 1);
     vy2 += random(-1, 1);
     vy2 += .1;
     vx2 *= .95;
     vy2 *= .95;
     bezierX2 += vx2;
     bezierY2 += vy2;
     
     vx3 += random(-1, 1);
     vy3 += random(-1, 1);
     vy3 += .1;
     vx3 *= .95;
     vy3 *= .95;
     bezierX3 += vx3;
     bezierY3 += vy3;
     
     
     vx4 += random(-1, 1);
     vy4 += random(-1, 1);
     vy4 += .1;
     vx4 *= .95;
     vy4 *= .95;
     bezierX4 += vx4;
     bezierY4 += vy4;
    
    if(bezierX<0)
    {
   //   bezierX3 = 0;
      vx *= -1;
    }
      if(bezierX2<0)
    {
      bezierX2 = 0;
      vx2 *= -1;
    }
     if(bezierX3<0)
    {
      bezierX3 = 0;
      vx3 *= -1;
    }
      if(bezierX4<0)
    {
      bezierX4 = 0;
      vx4 *= -1;
    }
    
    
     if(bezierX>w)
    {
      bezierX3 = w;
      vx *= -1;
    }
      if(bezierX2>w)
    {
     bezierX2 = w;
      vx2 *= -1;
    }
     if(bezierX3>w)
    {
     bezierX3 = w;
      vx3 *= -1;
    }
      if(bezierX4>w)
    {
      bezierX4 = w;
      vx4 *= -1;
    }
    
    
    if(bezierY4 > h)
    {
     bezierY4 =h;
      vy4 *= -1;
    }
    if(bezierY3 > h)
    {
     bezierY3 = h;
      vy3 *= -1;
    }
    
    if(bezierY > h)
    {
      bezierY = h;
      vy *= -1;
    }
    if(bezierY2 > h)
    {
     bezierY2 = h;
      vy2 *= -1;
    }
   
   
   if(bezierY4 <0)
    {
     bezierY4 = 0;
      vy4 *= -1;
    }
    if(bezierY3 <0)
    {
     bezierY3 = 0;
      vy3 *= -1;
    }
    
    if(bezierY <0)
    {
      bezierY = 0;
      vy *= -1;
    }
    if(bezierY2 <0)
    {
     bezierY2 = 0;
      vy2 *= -1;
    }
   
  
    
  }
  public PVector getLoc(){
    return loc;
  }
  public void display(){
    
      strokeWeight( 3 );  
      point(bezierX, bezierY);
      point(bezierX2, bezierY2);
      point(bezierX3, bezierY3);
      point(bezierX4, bezierY4);
    
  }
  
 public  void jiggle() {
    loc.x += random(-2,3);
    loc.y += random(-2,2);
  }
  
  public boolean isGetBound(){
    if(loc.y > height - 100){
      return true;
    }
   
    else {
      return false;
    }
  }
  
  public boolean getIsRun(){
    return isRun;
  }
  
  public void MothDead(){
    dead = true;
  }
  
  public boolean getIsDead(){
    return dead;
  }
  public void render(){
    
     if(isRun){
     // line(bezierX,  bezierY,  bezierX-vx,  bezierY-vy);
  //    
     //the moth get dead; 
   //  MothDead();
   for(int i = 0;i<fires.length;i++){
    fires[i].move();
    fires[i].display();}
     
    }
    else{
      moveToFire();
      drawbezier();
      isRun = isGetBound();
      //first get the current loc of moth;
      getCurrentloc();
     
    }
    
  }
}

