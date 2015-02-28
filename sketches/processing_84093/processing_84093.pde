
int maxLevel =10;
int numChildren =2;
float angle = PI/4;

Branch trunk;

void keyPressed(){
  if (key == CODED && keyCode == RIGHT){
  maxLevel = int(random(4,10));
  angle = PI/(int(random(1,15))*2);
  newTree();
  trunk.siz = random(0.5,15;
  }
  else {
    saveFrame("snowFlake-######.png");
    
  }
}

void mousePressed(){
 maxLevel = int(random(4,10));
  angle = PI/(int(random(1,15))*2);
  newTree();
  trunk.siz = random(0.5,10);
}

void setup() {
  size(500, 500);
  noFill();
  smooth();
  newTree();
  background(0);
  stroke(255);
}

void newTree() {
  pushMatrix();
  translate(width/2,height/2);
  trunk = new Branch(1, 0, 0, 0);
  trunk.drawMe();
  popMatrix();
}

void draw(){
  noStroke();
  fill(0,150);
  rect(0,0,width,height);
  //background(0);
  
  stroke(255);
  pushMatrix();
  translate(width/2,height/2);
  trunk.updateMe(0,0);
  trunk.drawMe();
  popMatrix();
  
  
  
 
}


class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  float noiseF2;
  
  float siz =100;
  
  Branch[] children = new Branch[0]; //

  Branch (float lev, float ind, float ex, float wy) {
    level =lev;
    index =ind;
    
   
    
    updateMe(ex, wy);
    
    if(level<maxLevel){ // avoid infinite loop
      children = new Branch[numChildren];
      for (int i = 0; i<numChildren;i++){
        children[i] = new Branch(level+1,i,endx,endy);
      }
    
  }
  }

  void updateMe(float ex, float wy) {
    x =ex;
    y =wy;
    
    float newsiz =map (maxLevel-level,0 ,maxLevel,1,siz);
    endx = x;
    endy = y-newsiz/3;
    //siz -=10;
    
    for (int i =0; i<children.length; i++){
      children[i].updateMe(endx,endy);

    }
  }

  void drawMe() {
    //siz-=1;
    float newsiz =map (maxLevel-level+1,0 ,maxLevel,2,siz);
    for (float i = 0 ; i < TWO_PI ; i+=angle){
    rotate(i);
    strokeWeight(map(maxLevel-level+1,0,maxLevel,0.005,0.5));
    pushMatrix();
    beginShape();
    vertex(x-newsiz,y);
    vertex(x,y+newsiz*2/3);
    vertex(x+newsiz,y);
    vertex(x,y+newsiz*1/3);
    vertex(x-newsiz,y); 
    endShape();
    popMatrix();
    
    }
    
    
    
    for (int i = 0 ; i<children.length;i++){
      //children[i].updateMe();
      children[i].drawMe();
    }
    
    
  }
}
