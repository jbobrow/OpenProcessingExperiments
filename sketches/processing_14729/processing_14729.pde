

class Fish{
 
  float swimSpeed;
  float swimDirection;
  float sz;
  float x;
  float y;
  PVector loc = new PVector();
  PVector start = new PVector();
  float xdirec = 1;  
  boolean test;
  Fish(){
   init(); 
  }
  
   Fish (float xStartPos1, float yStartPos1, float swimSpeed1, float swimDirection1, float sizeFactor1){
    start.x = xStartPos1;
    start.y = yStartPos1;
    swimSpeed = swimSpeed1;
    swimDirection = swimDirection1;
    sz = sizeFactor1;
   }
   
  
   void init(){
    
    
   
  }
  
  
  
    void move (){
    loc.x = start.x;
    loc.y = start.y;
    //start.x = loc.x;
    start.x +=  abs(swimSpeed) * xdirec;
    //start.y = loc.y;
    start.y += (swimSpeed * sin(swimDirection));
     
     
    if (loc.y > height ){
      start.y = height ;
     swimSpeed *= -1;
    }
   if (loc.y < 200){
     start.y = 200;
    swimSpeed *= -1;
    swimDirection *= PI/4;
   } 
   
  if(loc.x > width  ){
    start.x = width ;
    xdirec *= -1; 
  
 
 }
   else if (loc.x < 0){
   start.x = 0;
   xdirec *= -1;
   
   }
   } 
  
  
  
  
  void display (){
    
    pushMatrix();
 
   translate (loc.x, loc.y );
  
   beginShape();
   //texture(a);
      if(xdirec < 0){
    rotate (PI); 
   }
  fill (234, 114, 14);
  //texture (img2);

   quad( 0,0, sz * 50, sz * 50, 0, sz * 100, sz * 15, sz * 50);
   bezier( sz * 50, sz * 50, sz * 190, sz * 10, sz * 210,sz *  10 ,sz * 250, sz * 50);
    bezier( sz * 50, sz * 50, sz * 190, sz * 90, sz * 210, sz * 90 ,sz * 250, sz * 50);
    triangle( sz * 150, sz * 25, sz * 175,sz *  21,sz *  140,sz *  -20); 
    triangle( sz * 150,sz *  75, sz * 175, sz * 79,sz *  140, sz * 120); 
    fill(0);
    ellipse (sz * 225, sz * 50,sz *  7,sz *  7);
   endShape();
   popMatrix();
    
  }
 
 void setSwimSpeed(float swimSpeed){
 this.swimSpeed = swimSpeed;
 }
 
 float getSwimSpeed(){
  return swimSpeed; 
 }
 
 void setSwimDirection (float swimDirection){
   this.swimDirection = swimDirection;
 }
 
 float getSwimDirection(){
   return swimDirection;
 }
 
 void setLoc(PVector loc){
  this.loc = loc; 
 }
 PVector getLoc(){
  return loc; 
 }

void setStart (PVector start){
 this.start = start; 
}

PVector getStart(){
  return start;
}
  
}

