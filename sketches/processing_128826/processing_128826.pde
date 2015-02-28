
// excitement:use balls to create a feeling of excitment
// Chang Kuo Ping from Industrial Design
int numChildren=5; //how many branches within a level //orig=3
int maxLevels=4;  // how many levels  //orig=3
Branch trunk;

void setup() {
  size(750, 500);
  background(0);
  noFill();
  newTree();
  
}

void draw() {
  background(0);
  trunk.updateMe(width/2,height/2);
  trunk.drawMe();
}
void newTree() {
  trunk=new Branch(1, 0, width/2, 50);
  trunk.drawMe();
}


class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  
  float strokeW,alph;
  float len,lenChange;
  float rot,rotChange;
  
  color fillcol; //new
  
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float ey) {
    level=lev;
    index=ind;
    
    strokeW=(1/level)*10; //original number=100
    alph=255/level;
    len=(1/level)*random(100);
    lenChange=random(10)-5;
    rotChange=random(10)-5;
    
    fillcol=color(random(255),random(255),random(255));  //new
    
    updateMe(ex, ey);
    
    if (level<maxLevels){
      children= new Branch[numChildren]; //to check how many sub-objects within this array   
      for(int x=0;x<numChildren;x++){
       children[x]=new Branch(level+1,x,endx,endy);  //each object means a new branch item
    }
   }
  }

  void updateMe(float nx, float ny) {
    x=nx;
    y=ny;
    rot+=rotChange;
    len-=lenChange;
    if(len<0||len>200){
      lenChange*=-1;
    }
    float radian=radians(rot);
    endx=x+random(len*cos(radian)/2);
    endy=y+random(len*sin(radian)/2);
    
    /*
    endx=x+(level*(random(100)-50));
    endy=y+50+(level*random(50));
    */
    for(int i=0;i<children.length;i++){  // change each branch's end position as variation
      children[i].updateMe(endx,endy);
    }
  }
  void drawMe() {
    
    strokeWeight(strokeW);
    stroke(0,alph);
    fill(225);  //original(255,alph)
    //line(x,y , endx, endy);
    ellipse(endx,endy,len/12,len/12);
    for(int i=0;i<children.length;i++)
    {
     children[i].drawMe();
    }
  }
}



