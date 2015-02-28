
//yi-ting sie
//Homework: Season’s Greetings
//透過碎形的衍生方式，讓畫面中的圓圈不斷循環，形成夜黑星空的感覺，營造聖誕夜晚的美景。。
//Sheng-Fen Nik Chien (2011), Complexity - fractals, 數位學習平台─數位資訊創作 http://moodle.ncku.edu.tw/course/view.php?id=43022。  
//dotlassie (2008), Spiral Galaxy mutation, http://www.openprocessing.org/visuals/?visualID=700.


FractalRoot pentagon;   
float _strutFactor = 0.1;  
float _strutNoise;  
int _maxLevels = 4;  


// ====================== main program ===================  
float gauss(float x){ return exp(-x*x/2.0) / sqrt(2*PI); }  
float gaussI(float z){ // integrated gauss [0..1]  
  if(z<-8.0) return 0.0;  
  if(z> 8.0) return 1.0;  
  float sum=0.0, term=z;  
  for (int i=3; sum+term!=sum; i+=2){  
    sum =sum+term;  
    term=term*z*z/i;  
  }  
  return 0.5+sum*gauss(z);  
}  

float gaussE(float z){ return gaussI(z)*2-1; }// gauss error func==> [-1..0..1]  
float randomGauss(){  
 float x=0,y=0,r,c;  
  do{ x=random(-1.0,1.0);  
      y=random(-1.0,1.0);  
      r=x*x+y*y;  
  }while(r==0 || r>1);  
  c=sqrt(-2.0*log(r)/r);  
  return x*c; //return [x*c, y*c];  
}  

float randomGaussIn(float L, float H, float mul){ return constrain( randomGauss()*(H-L)*mul + (L+H)/2.0  ,L,H);  }  
float randomGaussAt(float L, float H, float mul){ return            randomGauss()*(H-L)*mul + (L+H)/2.0;  }  

float pi=4*atan(1);  
int stars=10000; // only ...  
int Rmax=200; // galaxy radius  
float speed=0.02;  // rotation speed  
// stars follow elliptic orbits around the center  
float eratio=.85; // ellipse ratio  
float etwist=8.0/Rmax; // twisting factor (orbit axes depend on radius)  
float []angle=new float[stars];  
float []radius=new float[stars];    
float cx; float cy; //center  
PImage img;  

void setup(){  
  size(550,550);  
  background(0); // back to black  
  speed=speed/frameRate;  
  // begin in the center  

  cx = width/2;  
  cy = height/2;  
  // itit stars  

  for (int i=0; i< stars; i++){  
    angle[i]= random(0,2*pi);  
    //radius[i]=random(1,Rmax);  
    radius[i]=((abs(randomGauss())))*Rmax*0.6+0.0;  
  }  
  // gifExport = new gifAnimation.GifMaker(this, "galaxy.gif");  
  // gifExport.setRepeat(0);  
}   

void draw(){  
  //smooth();  
  noSmooth();  
  img=get();  
  img.resize(round(width*0.5),round(height*0.5));  
  img.resize(width-2,height-2);  
  tint(255,245,255,150);  
  image(img,0,0);  

  //fill(0,8); rect(0,0,width,height);  
  noStroke();  
  float r,a,x,y,b,s,c,xx,yy,dd;  
  for (int i=0; i< stars; i++){  

    r=radius[i];  
    a=angle[i]+speed*(Rmax/r)*3.0; // increment angle  
    angle[i]=a;  
    x=r*sin(a);  
    y=r*eratio*cos(a);  
    b=r*etwist;  
    s=sin(b);  
    c=cos(b);  
    xx=cx + s*x + c*y*3;
    yy=cy + c*x - s*y;  
    dd=40000.0/r;  
    fill(color(dd,dd,dd*0.9,32));  
    rect(xx-1.5,yy-1.5,3.0,3.0);  
  }  
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
    float centX = random(width/2);                  
    float centY = random(height/2);                  
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
    strokeWeight(random(2.5));     
    stroke(255,50);     
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
saveFrame("Homework Season's Greetings-####.png");
}

