
ArrayList agents;
ArrayList attrPoints;
ArrayList repPoints;

int agentsAmount=17000;
int attrAmount=7;
int repAmount=7;

void setup(){
  size(900,600,P2D);
  stroke(0);
  agents=new ArrayList();
  attrPoints=new ArrayList();
  repPoints=new ArrayList();

  for(int i=0;i<attrAmount;i++){
    attrPoints.add(new PVector(round(random(10,width-10)),round(random(10,height-10))));//create attraction points    
  }
  for(int i=0;i<repAmount;i++){
    repPoints.add(new PVector(round(random(10,width-10)),round(random(10,height-10))));//create repulsion points      
  }

  for(int i=0;i<agentsAmount;i++){
    agents.add(new Agent(round(random(10,width-10)),round(random(10,height-10))));//create agents 
  }
}

void draw(){
  background(70);
  for(int i=0;i<agents.size();i++){
    Agent a =(Agent)agents.get(i);
    a.move();
    a.display();
  }  

  for(int i=0;i<attrPoints.size();i++){//display attraction points
    PVector aPt=(PVector)attrPoints.get(i);
    fill(0,100,200);
    ellipse(aPt.x,aPt.y,10,10);
  } 

  for(int i=0;i<repPoints.size();i++){//display repulsion points
    PVector rPt=(PVector)repPoints.get(i);
    fill(200,0,100);
    ellipse(rPt.x,rPt.y,10,10);
  }  

}





