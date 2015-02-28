
/*
 * --=[STRUCTURE 2]=--
 * by Jonsku, January 2010
 * --
 * Click or Drag the mouse to add structures
 * SPACE BAR to clean the window
 */
class Branch{

  float startX;
  float startY;
  float initLength;
  float length;
  
  float initAngle;
  float angle;
  int size;
  Branch[] subBranch;
  
  int col;
  
  Branch mother;
  
  float timeScale;

  public Branch(float startX, float startY, float length, float angle, int size, int col, Branch mother){
    this.startX = startX;
    this.startY = startY;
    this.length = length;
    initLength = length;
    this.angle = angle;
    initAngle = angle;
    this.size = size;
    this.col = col;
    this.mother = mother;
    timeScale = random(1)/1000;
    

    if(size > 1){
      float endX = startX+length*cos(angle);
      float endY = startY+length*sin(angle);
      int nuBranchesCount = int(random(maxSubBranch))+1;
      //float branchLengthDim = 0.5 + random(0)/2;
      subBranch = new Branch[nuBranchesCount];
      for (int i=0; i < nuBranchesCount; i ++ ) {
        float newLength = length; //* branchLengthDim ;
        float newAngle = angle + random(1) * max_sub_angle - max_sub_angle / 2 ;
        int newSize = size - 1 ;
        subBranch[i] = new Branch(endX, endY, newLength, newAngle, newSize,col, this);
      }

    }
  }

  public void draw(){
    if(size%4!=0){
      return;
    }
    ArrayList points = new ArrayList();
    points.add(new PVector(startX,startY));
    for(int i=0;i<subBranch.length;i++){
      subBranch[i].draw(points);
    }
    
  }
  
  public void update(float s){
    angle = map(noise(s,millis()*timeScale),0,1,initAngle-PI/2,initAngle+PI/2);//*noise(size,millis()*noiseTimeScale)*PI/2;
    length = noise(s,millis()*timeScale)*initLength;
    if(subBranch == null)
      return;
      
    float endX = startX+length*cos(angle);
    float endY = startY+length*sin(angle);
    for(int i=0;i<subBranch.length;i++){
      subBranch[i].update(endX, endY, s);
    }
  }
  
  public void update(float startX, float startY,float s){
    this.startX = startX;
    this.startY = startY;
    update(s);
  }
  
  public void draw(ArrayList points){
    
    if((size-1)%4==0){
      stroke(color(red(col),255-size*10,green(col)));
      strokeWeight(size);
      PVector p0 = (PVector)points.get(0);
      PVector p1 = (PVector)points.get(1);
      PVector p2 = (PVector)points.get(2);
      float endX = startX+length*cos(angle);
      float endY = startY+length*sin(angle);
      noFill();
      beginShape();
      vertex(p0.x, p0.y);
      bezierVertex(p1.x, p1.y, p2.x, p2.y, endX, endY);// mouseX-width/2, mouseY-height/2);
      endShape();
      //fill(col);
    }
    if(size>1){
        points.add(new PVector(startX, startY));
        for(int i=0;i<subBranch.length;i++){
          subBranch[i].draw(points);
        }
      }
  }
}


// smaller numbers (close to 0) will make adjacent points move similarly
float noiseSeparation = 0.9;

// small numbers make it move slowly
float noiseTimeScale = 0.0005;


int maxSubBranch = 1;
float max_sub_angle = 2*PI/4 ;
int max_size = 16 ;
float branch_length = 200 ;
Branch[] trees = new Branch[0];

void setup(){
  size(600,600);
  smooth();
  createTree();
  
}

void draw(){
  background(0);
  /*noStroke();
  fill(0,0,0,10);
  rect(0,0,width,height);*/
  fill(255);
  stroke(255);
 
float s = 1; //map(dist(width/2,height/2,mouseX,mouseY),0,width,0,1);
  
  translate(width/2,height/2);
  for(int i=0;i<trees.length;i++){
   trees[i].draw();
   trees[i].update(s);
  }
  

  

}

void mouseDragged(){
  //trees.remove(0);
 createTree();
}

void mouseClicked(){
  createTree();
}

void keyReleased(){
  if(key == ' ')
     trees = new Branch[0];
}

void createTree(){
  Branch[] tmp = new Branch[trees.length+1];
 System.arraycopy(trees,0,tmp,0,trees.length); 
 
  tmp[trees.length] = new Branch(0, 0, dist(mouseX,mouseY,width/2,height/2)/2, /*random(PI)*/atan2(mouseY-height/2,mouseX-width/2), max_size,/*color(255),null);*/color(int(random(1)*255),int(random(1)*255),int(random(1)*255)), null); 
  trees = tmp;
}





