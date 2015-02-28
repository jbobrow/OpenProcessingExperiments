
ArrayList theCells = new ArrayList();
ArrayList aCells = new ArrayList();
ArrayList bCells = new ArrayList();
ArrayList growingCells = new ArrayList();

class Cell{
 PVector pos;
 float maturity = 0;
 float currentMaturity = 0;
 float radius = 0;
 CellA anchor = null;
float angleToAnchor = 0;

 
  public Cell(PVector pos){
    this.pos = pos;
  }
  
  void setAnchor(CellA anchor){
    this.anchor = anchor;
    angleToAnchor = atan2(pos.y-anchor.pos.y,pos.x-anchor.pos.x);
  }
 
 void draw(){
   if(anchor!=null)
    ellipse(anchor.pos.x+currentMaturity*(pos.x-anchor.pos.x),anchor.pos.y+currentMaturity*(pos.y-anchor.pos.y),radius*currentMaturity*2,radius*currentMaturity*2);
   else
    ellipse(pos.x,pos.y,radius*currentMaturity*2,radius*currentMaturity*2);
 } 
 
 void feed(float amount){
   maturity+=amount;
 }
}

float cellARadius = 10;

class CellA extends Cell{
  
  
  
  public CellA(PVector pos){
    super(pos);
    radius = cellARadius;
  }
  
  public CellA(PVector pos, float r){
    super(pos);
    radius = r;
  }
  

  
  
  void draw(){
    if(currentMaturity<maturity)
      currentMaturity += 0.01;
    fill(1.0,0.5,0.0);
  noStroke();
      
    if(anchor!=null){

      
      pushMatrix();
//      translate(-pos.x,-pos.y);
      
      translate(anchor.pos.x+currentMaturity*(pos.x-anchor.pos.x),anchor.pos.y+currentMaturity*(pos.y-anchor.pos.y));
      scale(radius);
      if(anchor.anchor!=null){
        float a = abs(angleToAnchor-anchor.angleToAnchor)%TWO_PI;
        if(angleToAnchor<anchor.angleToAnchor)
          a = -a;
          /*
        if(a<0 || a>=TWO_PI)
          println("!!!");
          */
        //a = a<0?TWO_PI-(abs(a)%TWO_PI):abs(a)%TWO_PI;
        rotate(anchor.angleToAnchor+currentMaturity*a);
      }else{
        rotate(angleToAnchor);
      }
      triangle(1,0, -1.3,1.3, -1.3,-1.3);
      popMatrix();
      stroke(0);
      line(pos.x,pos.y,anchor.pos.x,anchor.pos.y);
    }else{
      super.draw();
    }
  }
}

float cellBRadius = 5;

class CellB extends Cell{
  float nextOffsetAngle = 0;
  float currentAngle = 0;
  float distanceToAnchor;
  
  public CellB(PVector pos){
    super(pos);
    radius = cellBRadius;
  }
  
  void setAnchor(CellA anchor){
    super.setAnchor(anchor);
    currentAngle = angleToAnchor;
    nextOffsetAngle = angleToAnchor;
    distanceToAnchor = anchor.pos.dist(pos);
  }
  
  void draw(){
if(currentMaturity<maturity)
      currentMaturity += 0.01;
    for(int c = 0;c<creatures.size();c++){
      Creature cr = (Creature)creatures.get(c);
      if(cr.pos.dist(pos)<20){
        if(abs(currentAngle-nextOffsetAngle)<(PI/180.0f)){
          nextOffsetAngle = angleToAnchor-PI/8.0+random(PI/4.0);
        }else{
          currentAngle += nextOffsetAngle>currentAngle?(PI/540.0f):-(PI/540.0f);
        }
        break;
      }
    }
    pos.x = anchor.pos.x+cos(currentAngle)*distanceToAnchor;
    pos.y = anchor.pos.y+sin(currentAngle)*distanceToAnchor;    
    
    fill(0.0,0.0,1.0);
    stroke(0.0,0.0,1.0);
    if(currentMaturity>0.4)
      line(anchor.pos.x+currentMaturity*(pos.x-anchor.pos.x),anchor.pos.y+currentMaturity*(pos.y-anchor.pos.y),anchor.pos.x+0.4*(pos.x-anchor.pos.x),anchor.pos.y+0.4*(pos.y-anchor.pos.y));
    super.draw();
  }
}

CellA addCellA(){
  Cell root = (Cell)aCells.get(0);
  float maxD = root.pos.dist(new PVector(0,0));
  int counter = 0;
  
  CellA added = null;
  
  CellA anchor = (CellA)aCells.get(int(random(aCells.size()-1)));
  float a = random(TWO_PI);
  PVector pos = new PVector(anchor.pos.x+cos(a)*anchor.radius*2.0,anchor.pos.y+sin(a)*anchor.radius*2.0);
  boolean addIt = false;
  float radius = anchor.radius;
    if(aCells.size()>0){
      
      radius *= (maxD-pos.dist(root.pos))/maxD;
      pos = new PVector(anchor.pos.x+cos(a)*(anchor.radius+radius),anchor.pos.y+sin(a)*(anchor.radius+radius));
    }
  while(!addIt && counter<50){
     if(pos.x-radius<0 || pos.x+radius>width || pos.y-radius<0 || pos.y+radius>height){
      anchor = (CellA)aCells.get(int(random(aCells.size()-1)));
      a = random(TWO_PI);
      pos = new PVector(anchor.pos.x+cos(a)*anchor.radius*2.0,anchor.pos.y+sin(a)*anchor.radius*2.0);
      radius = cellARadius;
    if(aCells.size()>0){
      
      radius *= (maxD-pos.dist(root.pos))/maxD;
       pos = new PVector(anchor.pos.x+cos(a)*(anchor.radius+radius),anchor.pos.y+sin(a)*(anchor.radius+radius));
    }
      continue;
    }
    addIt = true;

    for(int i=0;i<theCells.size();i++){
      Cell toTest = (Cell)theCells.get(i);
      if(toTest == anchor)
        continue;
      if(toTest.pos.dist(pos)<(radius+toTest.radius*2.0)){
        //println((cellARadius+toTest.radius));
        addIt = false;
        break;
      }
    }
    if(addIt){
      added = new CellA(pos,radius);
      added.setAnchor(anchor);
    }else{
      anchor = (CellA)aCells.get(int(random(aCells.size()-1)));
      a = random(TWO_PI);
      pos = new PVector(anchor.pos.x+cos(a)*anchor.radius*2.0,anchor.pos.y+sin(a)*anchor.radius*2.0);
      radius = cellARadius;
    if(aCells.size()>0){
      
      radius *= (maxD-pos.dist(root.pos))/maxD;
       pos = new PVector(anchor.pos.x+cos(a)*(anchor.radius+radius),anchor.pos.y+sin(a)*(anchor.radius+radius));
    }
    }
    counter++;
  }
  if(counter >=50){
    return null;
  }
  //println(added.pos);
  return added;
}

CellB addCellB(){
  CellB added = null;
  
  CellA anchor = (CellA)aCells.get(int(random(aCells.size()-1)));
  float a = random(TWO_PI);
  float r = random(20);
  PVector pos = new PVector(anchor.pos.x+cos(a)*(cellARadius+r),anchor.pos.y+sin(a)*(cellARadius+r));
  boolean addIt = false;
  while(!addIt){
    if(pos.x-cellBRadius<0 || pos.x+cellBRadius>width || pos.y-cellBRadius<0 || pos.y+cellBRadius>height){
      anchor = (CellA)aCells.get(int(random(aCells.size()-1)));
      a = random(TWO_PI);
      r = random(50);
      pos = new PVector(anchor.pos.x+cos(a)*(cellARadius+r),anchor.pos.y+sin(a)*(cellARadius+r));
      continue;
    }
    addIt = true;
    
    for(int i=0;i<theCells.size();i++){
      Cell toTest = (Cell)theCells.get(i);
      if(toTest.pos.dist(pos)<(cellBRadius+toTest.radius)+((toTest instanceof CellB)?0:10)){ //3:7
        //println((cellARadius+toTest.radius));
        addIt = false;
        break;
      }
    }
    if(addIt){
      added = new CellB(pos);
      added.setAnchor(anchor);
    }else{
      anchor = (CellA)aCells.get(int(random(aCells.size()-1)));
      a = random(TWO_PI);
      r = random(50);
      pos = new PVector(anchor.pos.x+cos(a)*(cellARadius+r),anchor.pos.y+sin(a)*(cellARadius+r));
    }
  }
  //println(added.pos);
  return added;
}

