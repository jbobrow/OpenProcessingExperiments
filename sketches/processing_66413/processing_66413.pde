
class Body {
 
 int bodyShape = 0; 
 float mutate = -0.8; 
 
 int numLegs = 1;
 float x, y;
 float vx, vy;
 float ax, ay;
 float damping = 0.2;
 float vr = 0;
 int cellSize = 20;
 float bodyLegProportion = 3;
 
 ArrayList bodyLegs = new ArrayList(); 
// float orientation = random(0, 2*PI);
 float orientation = 0;
 boolean autoKick = true;
 int kickPeriod = (int) random(10, 30);
 int timer = kickPeriod;
 boolean hasFocus = true;
 // for body shape
 int bodyNodes = 5;
 float live = 0.4; 
 int paletteIndex = 0;
 color[] bodyPalette = (color[]) palettes.get(paletteIndex); 
 
 Body(int _x, int _y, int _numLegs, int _kickPeriod){
   x = (float) _x;
   y = (float) _y;
   numLegs = _numLegs;
   kickPeriod = _kickPeriod;
   for (int i = 0; i < numLegs; i++){
     bodyLegs.add(new Leg(0));
   } 
 }
 
 void setPalette(int _paletteIndex){
   if (paletteIndex != _paletteIndex){
     bodyPalette = (color[]) palettes.get(_paletteIndex);  
     paletteIndex = _paletteIndex;
   }
 }
 
 // 
 void set_numLegs(int _numLegs){
   if ((_numLegs > 0) && (_numLegs != numLegs)) {
    Leg oneleg = (Leg) newCell.bodyLegs.get(0);
    int curLegShape =  oneleg.legShape;
    int curLegPalette =  oneleg.paletteIndex;
     
    if (_numLegs > numLegs){
      int toAdd = _numLegs - numLegs;
       numLegs = _numLegs;
      //println("adding " + toAdd + " legs");
      for (int i = 0; i < toAdd; i++){
        Leg addedLeg = new Leg(curLegShape);
        addedLeg.setPalette(curLegPalette);
        
        bodyLegs.add(addedLeg);
        
        
        println("adding leg with palette nb " + curLegPalette);
      }
    } else {
      int toRemove = numLegs - _numLegs;
      // println("amputating " + toRemove + " legs");
      numLegs = _numLegs;
      for (int i = 0; i < toRemove; i++){
        bodyLegs.remove(bodyLegs.size() - 1);
      }
    }
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
 
 // forces kick on one of the legs
  void oneKick(){
    int i = floor(random(0, numLegs));
    float speed = random(5, 30);
    vr += random(-0.05, 0.05);
    Leg leg = (Leg) bodyLegs.get(i);
    leg.kick(speed);
    this.legPropel(leg, speed);
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
   
   this.vx *= (1-damping);
   this.vy *= (1-damping);
   
   this.vr *= 0.98;
   
   // autokick   
   timer --;
   if ( (timer < 0) && (autoKick)){
     this.kick();
     timer = kickPeriod;
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
      leg.segmentSize = (int) bodyLegProportion * cellSize;
      leg.draw(i);
      popMatrix();
    }
    
    switch(bodyShape){
      case 0:
        drawPotatoid();
        break;
      case 1:
        drawTriangleRing();
        break;   
      case 2:
        drawClam();
        break;      
    }
        
    // draw center
    ellipse(0,0,10,10);

    popMatrix();
 }
 
 // ------------------------------- potatoe shape
 void drawPotatoid(){
    // draw body
    float curAngle = 0;
    float rotAngle = 2*PI/bodyNodes;
    PVector[] nodes = new PVector[bodyNodes];

    for (int i = 0; i < bodyNodes; i++){
      nodes[i] = new PVector (cos(curAngle) * cellSize + random(-1, 1), sin(curAngle) * cellSize + random(-1, 1));
      curAngle += rotAngle;
    }
    curveTightness(mutate);
    
    if (hasFocus){
      stroke (255); 
      fill(bodyPalette[0]);}
    else {
      stroke(bodyPalette[3]);
      fill(bodyPalette[0], 200);}
    
    // draw membrane
    beginShape();
    int curveIndex = 0;
    for (int i=0; i < bodyNodes + 3 ; i++){
      curveIndex = i % bodyNodes;
      curveVertex(nodes[curveIndex].x, nodes[curveIndex].y);
    }
    endShape(CLOSE);
    
    // draw nucleus
    fill(bodyPalette[2], 140);
    beginShape();
    for (int i=0; i < bodyNodes + 3 ; i++){
       curveIndex = i % bodyNodes;
      PVector temp = new PVector(nodes[curveIndex].x, nodes[curveIndex].y);
      temp.mult(live);
      curveVertex(temp.x, temp.y);
    }
    endShape(CLOSE);
 }
 // ------------------------------- diaphragm
 void drawTriangleRing(){
    // draw body
    float curAngle = 0;
    float rotAngle = 2*PI/bodyNodes;
    PVector[] nodes = new PVector[bodyNodes];

    for (int i = 0; i < bodyNodes; i++){
      nodes[i] = new PVector (cos(curAngle) * cellSize + random(-1, 1), sin(curAngle) * cellSize + random(-1, 1));
      curAngle += rotAngle;
    }
    curveTightness(mutate);
    
    if (hasFocus){
      stroke (255); 
      fill(255,0, 0);}
    else {
      stroke(255,0,0);
      fill(255, 200);}
    
    // draw membrane
    beginShape(TRIANGLE_STRIP);
    int curveIndex = 0;
    for (int i=0; i < bodyNodes + 3 ; i++){
      curveIndex = i % bodyNodes;
      vertex(nodes[curveIndex].x, nodes[curveIndex].y);
    }
    endShape(CLOSE);
    
        fill(0,100,0, 140);
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i < bodyNodes + 3 ; i++){
       curveIndex = i % bodyNodes;
      PVector temp = new PVector(nodes[curveIndex].x, nodes[curveIndex].y);
      temp.mult(live);
      vertex(temp.x, temp.y);
    }
    endShape(CLOSE);
 } 
 
 
 
// ------------------------------- clam 
  void drawClam(){
    // draw body
    float curAngle = 0;
    
    PVector[] nodes = new PVector[4];

    nodes[0] = new PVector (0, -cellSize*2);
    nodes[1] = new PVector (-cellSize/2 + random(-1, 1), random(-1, 1));
    nodes[2] = new PVector (0, cellSize + random(-1, 1));
    nodes[3] = new PVector (cellSize/2 + random(-1, 1), random(-1, 1));

    
    curveTightness(mutate);
    
    if (hasFocus){
      stroke (255); 
      fill(255,0, 0);}
    else {
     // noStroke();
     stroke(255,0,0);
      fill(255, 200);}
    
    // draw membrane
    fill(bodyPalette[0],200);
    beginShape();
    int curveIndex = 0;
    for (int i=0; i < 7 ; i++){
      curveIndex = i % 4;
      curveVertex(nodes[curveIndex].x, nodes[curveIndex].y);
    }
    endShape(CLOSE);
    
    
    for (int k = 0; k < 4; k++){
      nodes[0].mult(live);
      fill(bodyPalette[k],200);
      beginShape();
       curveIndex = 0;
      for (int i=0; i < 7 ; i++){
        curveIndex = i % 4;
        curveVertex(nodes[curveIndex].x, nodes[curveIndex].y);
      }
      endShape(CLOSE);
    }

 } 
 
}

