
class Body {
  
 int numLegs = ceil(random(0,3));
 float x, y;
 float vx, vy;
 float ax, ay;
 float vr = 0;
 int cellSize = 20;
 ArrayList bodyLegs = new ArrayList(); 
// float orientation = random(0, 2*PI);
 float orientation = 0;
 boolean autoKick = true;
 int cycleLen = (int) random(10, 30);
 int timer = cycleLen;
 boolean hasFocus = true;
 
 // for body shape
 int bodyNodes = 5;
 float[]nodeX = new float[bodyNodes];
 float[]nodeY = new float[bodyNodes];
 float[]angle = new float[bodyNodes]; 
 float[]frequency = new float[bodyNodes];
 float rotAngle = 2*PI/bodyNodes;
 float tightness = -0.8; 
 
 
 Body(int _x, int _y){
   x = (float) _x;
   y = (float) _y;
   for (int i = 0; i < numLegs; i++){
     bodyLegs.add(new Leg());
   } 
 }
 
 void kick(){
    for (int i = 0; i < numLegs; i++){
      
      float doKick = random(0,1);
      
      if (doKick > 0.5){
        float speed = random(5, 30);
        vr += random(-0.05, 0.05);
        Leg leg = (Leg) bodyLegs.get(i);
        leg.kick(speed);
        this.legPropel(leg, speed);
      }
  }
 }
 
 // leg action upon body motion
 void legPropel(Leg leg, float speed){
   speed *= 0.1;
   ax += speed * cos ( leg.orientation );
   ay += speed * sin ( leg.orientation );
 }
 
 void update(){
   
   // physics
   this.vx -= this.ax;
   this.vy -= this.ay;
   
   this.x += this.vx;
   this.y += this.vy;
   
   this.ax *= 0.8;
   this.ay *= 0.8;
   
   this.vx *= 0.9;
   this.vy *= 0.9;
   
   this.vr *= 0.98;
   
   // autokick   
   timer --;
   if ( (timer < 0) && (autoKick)){
     this.kick();
     timer = cycleLen;
   }
 } 
 
 boolean isOnScreen(){
   if ((x > width) || ( x < 0 ) || (y > height) || (y < 0) ) {
     return false;
   }
   else { return true;}
 }
 
  void draw(){
    orientation += vr;
    update();
    pushMatrix();
    translate(this.x, this.y);
    rotate(this.orientation);
    
    //draw legs
    for (int i = 0; i < numLegs; i++){
      Leg leg = (Leg) bodyLegs.get(i);    
      pushMatrix();
      rotate(leg.orientation);
      leg.segmentScale = 3*cellSize;
      leg.draw(i);
      popMatrix();
    }
    
    // draw body
    float curAngle = 0;
   
    for (int i = 0; i < bodyNodes; i++){
      nodeX[i] =  cos(curAngle) * cellSize + random(-1, 1);
      nodeY[i] =  sin(curAngle) * cellSize + random(-1, 1);
      curAngle += rotAngle;
    }
    
    curveTightness(tightness);
    
    if (hasFocus){
      stroke (255); 
      fill(255,0, 0);}
    else {
      stroke(255,0,0);
      fill(255, 200);}
    
    beginShape();
    for (int i=0; i < bodyNodes; i++){
      curveVertex(nodeX[i], nodeY[i]);
    }
    for (int i=0; i < bodyNodes-1; i++){
      curveVertex(nodeX[i], nodeY[i]);
    }
    endShape(CLOSE);

    ellipse(0,0,10,10);

    popMatrix();
 }
 
}

