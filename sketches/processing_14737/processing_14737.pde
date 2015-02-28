
class Squid {
  // visual 
  PVector body;
  // dynamics
  PVector spot;
  float swimX;
  float swimY;
  float w, h;
  
  float a1 = 0.012;
  float a2 = 0.001;
  float a3 = 0.002;
  float a4 = 0.003;
  float rot1, rot2, rot3, rot4;
  //float easing=0.5;
  float incr = 0.0;
  

  
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
  }  
  // declare instance methods
  void move(){

  spot.x += swimX;
  spot.y += swimY; 
  }
  
  void display(){
   translate(width/2, height/2); 
   
   pushMatrix();
      
    float angle1 = sin(incr)/10.0 + sin (incr*4.5)/70.0;
    float angle2 = cos(incr)/12.0 + cos (incr*4.5)/80.0;
    incr += 0.006;
    
    //tentacles
    tenta(0, 24, angle1*4);
    rotate(sin(rot1)+PI*0.25);
    tenta(0, 21, angle2*2.7);
    rotate(cos(rot2)+PI*0.25);
    tenta(0, 18, angle2*5.5);
    rotate(rot3+PI*0.25);
    tenta(0, 17, angle1*3);
    rotate(sin(rot4+PI*0.25));
    rot1+=a1;
    rot2+=a2;
    rot3+=a3;
    rot4+=a4;
    smooth();
    curveTightness(-2.75);
    fill(98, 22, 116);
    stroke(250, 3, 11);
    
   beginShape();
    //head
    translate(0,-50);
    curveVertex(10, 26);
    curveVertex(10, 26);
    curveVertex(83, 24);
    curveVertex(83, 55);
    curveVertex(25, 65); 
    curveVertex(25, 65);
   endShape(CLOSE);
    //eye balls
    stroke(0);
    fill(255, 100);
    ellipse (55, 25, 15, 15);
    ellipse (55, 55, 15, 15);
    fill(0);
    ellipse (55, 25, 8, 8);
    ellipse (55, 55, 8, 8);

   popMatrix();
    }
    
    void tenta(int x, int tenta, float angle) {
      pushMatrix();
      translate (x,0);
      for (int t = tenta; t > 0; t--) {
      fill(250, 3, 11); 
      stroke(98, 22, 116);
      translate(0, -10);
      ellipse(-t,0,3,3);
      ellipse(t,0,3,3);
      strokeWeight(t/1.7);
      line(0,0,0,-8);
      rotate(angle);
  }
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





