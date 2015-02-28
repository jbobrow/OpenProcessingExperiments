
/*
 * --=[STRUCTURE 1]=--
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

  public Branch(float startX, float startY, float length, float angle, int size, int col){
    this.startX = startX;
    this.startY = startY;
    this.length = length;
    initLength = length;
    this.angle = angle;
    initAngle = angle;
    this.size = size;
    this.col = col;

    if(size > 1){
      float endX = startX+length*cos(angle);
      float endY = startY+length*sin(angle);
      int nuBranchesCount = int(random(maxSubBranch - 1)) + 2;
      float branchLengthDim = 0.5 + random(1)/3;
      subBranch = new Branch[nuBranchesCount];
      for (int i=0; i < nuBranchesCount; i ++ ) {
        float newLength = length * branchLengthDim ;
        float newAngle = angle + random(1) * max_sub_angle - max_sub_angle / 2 ;
        int newSize = size - 1 ;
        subBranch[i] = new Branch(endX, endY, newLength, newAngle, newSize,col);
      }

    }
  }

  public void draw(){
    stroke(col);
    fill(col);
    //float change = noise(size,millis()*noiseTimeScale);
    float endX = startX+length*cos(angle);
    float endY = startY+length*sin(angle);
    strokeWeight(size);
    /*beginShape();
    vertex(startX, startY);
    bezierVertex(startX-4+8*change, startY-3+6*change, endX-8+16*change, endY-5*change, endX, endY);
    endShape();*/
    line(startX, startY, endX, endY);
    if(subBranch == null){
      ellipse(endX, endY,8,8);
      return;
    }
    for(int i=0;i<subBranch.length;i++){
      subBranch[i].draw();
    }
  }
  
  public void update(float s){
    angle = initAngle+map(noise(size,millis()*noiseTimeScale),0,1,-2,2)*noise(size,millis()*noiseTimeScale)*PI/2;
    length = noise(size,millis()*noiseTimeScale)*initLength;
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
}


// smaller numbers (close to 0) will make adjacent points move similarly
float noiseSeparation = 0.9;

// small numbers make it move slowly
float noiseTimeScale = 0.0005;


int maxSubBranch = 2;
float max_sub_angle = 3*PI/4 ;
int max_size = 2 ;
float branch_length = 400 ;
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
  rect(0,0,width,height);
  fill(255);*/
  stroke(255);
  
  float s = 1; //map(dist(width/2,height/2,mouseX,mouseY),0,width,0,1);
  
  translate(width/2,height/2);
  for(int i=0;i<trees.length;i++){
   trees[i].draw();
   trees[i].update(s);
  }

  

}

void mouseDragged(){
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
 
  tmp[trees.length] = new Branch(0, 0, random(1)*branch_length, atan2(mouseY-height/2,mouseX-width/2), max_size,color(int(random(1)*255),int(random(1)*255),int(random(1)*255))); 
  trees = tmp;
}





