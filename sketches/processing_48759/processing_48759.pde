
//yi-ting sie
//課程練習：fractals
//透過碎形的衍生方式，讓點與點相互連接，並產生分支。並且讓它可在畫面上自行旋轉，並且隨著滑鼠移動時，而變更顏色。
//Sheng-Fen Nik Chien (2011), Complexity - fractals, 數位學習平台─數位資訊創作 http://moodle.ncku.edu.tw/course/view.php?id=43022。  

FractalRoot pentagon;   
float _strutFactor = 0.4;  
float _strutNoise;  
int _maxLevels = 5;  


// ====================== main program ===================  

void setup() {   
  size(600, 600);   
  smooth();   
  _strutNoise = random(5);  
}    

void draw() {  
  background(0);  
  _strutNoise += 0.01;  
  _strutFactor = (noise(_strutNoise)*2)-1;  
  pentagon = new FractalRoot(frameCount);                               
  pentagon.drawShape();  
}   


// ======================= objects ======================  

class PointObj {                                              
  float x, y;                                                
  PointObj(float ex, float why) {                            
    x = ex;   
    y = why;  
  }  
}    

class FractalRoot {                          
  PointObj[] pointArr = new PointObj[5];              
  Branch rootBranch;                      

  FractalRoot(float startAngle) {                          
    float centX = width/2;                  
    float centY = height/2;                  
    int count = 0;                      
    for (int i = 0; i<360; i+=72) {              
      float x = centX + (200 * cos(radians(startAngle+i)));      
      float y = centY + (200 * sin(radians(startAngle+i)));      
      pointArr[count] = new PointObj(x, y);          
      count++;  
    }                              
    rootBranch = new Branch(0, 0, pointArr);  
  }                                  


  void drawShape() {                      
    rootBranch.drawMe();  
  }  
}  


class Branch {                                              
  int level, num;                                           
  PointObj[] outerPoints = {  
  };    
  PointObj[] midPoints = {  
  };    
  PointObj[] projPoints = {  
  };  
  Branch[] myBranches = {  
  };  


  Branch(int lev, int n, PointObj[] points) {               
    level = lev;                                            
    num = n;                                                
    outerPoints = points;  
    midPoints = calcMidPoints();  
    projPoints = calcStrutPoints();  
    if (level < _maxLevels) {  
      // central polygon  

      Branch childBranch = new Branch(level+1, 0, projPoints);  
      myBranches = (Branch[])append(myBranches, childBranch);  
      // surrounding polygons  

      for (int k=0; k<outerPoints.length; k++) {  
        int nextk = (k+4)%outerPoints.length;  
        PointObj[] newPoints = {  
          outerPoints[k], midPoints[k], projPoints[k], projPoints[nextk], midPoints[nextk]  
        };  
        childBranch = new Branch(level+1, k+1, newPoints);  
        myBranches = (Branch[])append(myBranches, childBranch);  
      }  
    }  
  }                                                         


  void drawMe() {   
    strokeWeight(1.2);     
    stroke(mouseX,100,mouseY,50);     
    // draw outer shape   
    
    for (int i = 0; i < outerPoints.length; i++) {           
      int nexti = i+1;                                        
      if (nexti == outerPoints.length) {   
        nexti = 0;  
      }         
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);  
    }  
    // draw substructure  
    for(int k=0; k<myBranches.length; k++) {  
      myBranches[k].drawMe();  
    }  
  }  
   

  PointObj[] calcMidPoints() {                          
    PointObj[] mpArray = new PointObj[outerPoints.length];          
    for (int i = 0; i < outerPoints.length; i++) {              
      int nexti = i+1;                              
      if (nexti == outerPoints.length) {   
        nexti = 0;  
      }          
      PointObj thisMP = calcMidPoint(outerPoints[i], outerPoints[nexti]);          
      mpArray[i] = thisMP;  
    }                                       
    return mpArray;  
  }  
   

  PointObj calcMidPoint(PointObj end1, PointObj end2) {  
    float mx, my;  
    mx = (end1.x + end2.x)/2;  
    my = (end1.y + end2.y)/2;  
    return new PointObj(mx, my);  
  }  
   

  PointObj[] calcStrutPoints() {  
    PointObj[] strutArray = new PointObj[midPoints.length];  
    for(int i=0; i<midPoints.length; i++) {  
      int nexti = (i+3)%midPoints.length;  
      PointObj thisSP = calcProjPoint(midPoints[i], outerPoints[nexti]);  
      strutArray[i] = thisSP;  
    }  
    return strutArray;  
  }  
   

  PointObj calcProjPoint(PointObj mp, PointObj op) {  
    float px, py;  
    px = mp.x + ((op.x - mp.x) * _strutFactor);  
    py = mp.y + ((op.y - mp.y) * _strutFactor);  
    return new PointObj(px, py);  
  }  
} 


void keyPressed(){
saveFrame("fractals003-####.png");
}

