
import controlP5.*;


int k=0,numNode=5,dim=500;
boolean reset=true,initial=true;
float interval=dim/numNode*0.5;
int[][] input = new int[numNode*numNode][5];
ArrayList pNodeList=new ArrayList();
PVector p1,p2,p3,p4,p5,pa,pb,pc,pd,pe;

myBool myB=new myBool();
ControlP5 cp5;

void setup(){
  size(500,500);
  frameRate(10);
  cp5 = new ControlP5(this);
  cp5.addSlider("sliderValue")
  .setPosition(dim-165,dim-15)
  .setRange(0,50)
  .setDecimalPrecision(0)
  .setCaptionLabel("node number")
  .setColorCaptionLabel(0)
  ;
}

void draw(){ 
  myB.initialize();
  myB.changeNodeState();
  myB.addInputs(); 
  myB.stateUpdate();  
}

void mouseReleased(){
 if(!cp5.isMouseOver()){
  
  k=(k+1)%5;
  if(k==0){
    background(200);
    //numNode=(int)cp5.getValue(); 
    input = new int[0][0];//clear
    input = new int[numNode*numNode][5];
    pNodeList.clear();
    initial=true;
  }  
  reset=true;
  println();  
  print("k= "+k);
 }
}

