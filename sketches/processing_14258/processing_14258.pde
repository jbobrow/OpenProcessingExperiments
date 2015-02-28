
class Squid {
  // visual 
  PVector body;
  // dynamics
  PVector spot;
  float swimX;
  float swimY;
  float w, h;
  
  // constructors: default 
  Squid(){
    init();
  }
  
  Squid(float w, float h){
    body = new PVector(w, h);
    init();
  }
  
  Squid(PVector body){
    this.body = body;
    init();
  }
  
  // additional initialization
  void init(){
    spot = new PVector();
    swimX = .50;
    swimY = .25;
   if (spot.y < 200){
     spot.y = 200;
    swimY *= -1;
   }
  }  
  // declare instance methods
  void move(){
    spot.x += swimX;
    spot.y += swimY;
  }
  

  
  void display(){
    
    pushMatrix();
    translate(spot.x,spot.y);
    smooth();
    
    fill(216, 151, 213);
    stroke(250, 3, 11); 
    curveTightness(-2.75);
    beginShape(); 
    curveVertex(10, 26);
    curveVertex(10, 26);
    curveVertex(83, 24);
    curveVertex(83, 55);
    curveVertex(25, 65); 
    curveVertex(25, 65);
    ellipse (0, 32, 46, 5);
    ellipse (0, 38, 52, 5);
    ellipse (0, 48, 58, 5);
    ellipse (0, 54, 59, 5);
    ellipse (0, 60, 60, 5);
    endShape();
    stroke(0);
    fill(255, 100);
    ellipse (85, 30, 15, 15);
    fill(0);
    ellipse (85, 30, 9, 9);
    popMatrix();
    
   
    }
  
  // setters/getters
  void setBody(PVector body){
    this.body = body;
  }
  
  PVector getBody(){
    return body;
  }
    void setSwimX(float swimX){
    this.swimX = swimX;
  }
    float getSwimX(){
    return swimX;
  }
  void setSwimY(float swimY){
    this.swimY = swimY;
  }
    float getSwimY(){
    return swimY;
  }
  void setSpot(PVector spot){
    this.spot = spot;
  }
  PVector getSpot(){
    return spot;
  }
}  





