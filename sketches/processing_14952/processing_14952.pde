

ArrayList lines;
int maxNum;


void setup(){
  size(700,700);
  lines=new ArrayList();
//  Line branch=new Line(.1);
//  lines.add(branch);
//  branch.start();
  maxNum=500;
//  for (int i=0;i<maxNum;i++){
//    
//  }

}
void draw(){
  background(255);  
  Line newBranch=new Line(lines.size()*.01);
    lines.add(newBranch);
    newBranch.start();
  for (int i=0;i<lines.size()-1;i++){
    Line branch=(Line) lines.get(i);
    branch.draw();
  }
 if (lines.size()>=maxNum){ lines.remove(maxNum-1);}
  

//  frameRate(10);
println(lines.size());

  
}
float z(float tempZ,float tempDelt){
  tempZ=pow(tempZ,1.5)+tempDelt;  
  return tempZ;
}

class Line{
  float delt;
  float oldZx;
  float oldZy;
  float x;
  float y;
  int chg=1;
  Line(float _delt){
    delt=_delt;
  }
  void start(){
    oldZx=1;
    oldZy=1;
    x=1;
    y=1;
  }
  void draw(){

  x=z(oldZx,delt);
  y=z(oldZy,delt);
//  strokeWeight(2);
  smooth();
  line (x,y, (x+100)*sin(chg*PI/x),(y+100)*cos(chg*PI/y));  
//  delt+=1;
  chg+=1;
  oldZx+=.1;
  oldZy+=.1;
//  oldZx=z(oldZx,delt);
//  oldZy=z(oldZy,delt);
  if(x>width||y>height){
//    x=1;
//    y=1;
    oldZx=.5;
    oldZy=.5;
  }
//  println(x+" "+y);
}
}

