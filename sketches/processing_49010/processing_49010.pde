
import java.util.ArrayList;

int APP_WIDTH;
int APP_HEIGHT;
int NUM_WIDTH;
int NUM_HEIGHT;
int posCount;
int cycleAmount;
int frameCounter;

ArrayList<PVector> VectorList  = new ArrayList<PVector>();
ArrayList<CRect> cRectList  = new ArrayList<CRect>();
ArrayList<CRect> cRectPushList = new ArrayList<CRect>();
ArrayList<CRect> cRectRestList = new ArrayList<CRect>();


void quickInits(){
  posCount = 0;
  NUM_WIDTH = 60;
  NUM_HEIGHT = 60;
  APP_WIDTH = 300;
  APP_HEIGHT = 600;
  cycleAmount = APP_HEIGHT/NUM_HEIGHT;
}

void setup(){
  quickInits();
  size(300,600); 
  // noLoop(); 
  frameRate(4);
  fillVectorList();
  fillCRectList();
}


void draw(){
  for(int posIndex = 0; posIndex < posCount; posIndex+=1){
    cRectList.get(posIndex).pos = VectorList.get(posIndex);
    cRectList.get(posIndex).display();
  }
  cycleArrayList(cycleAmount);  
  
  // if (frameCounter < 4) frameCounter+=1;
  // else noLoop();
}


void fillCRectList(){
  for(int posIndex = 0; posIndex < posCount; posIndex+=1){
    cRectList.add(new CRect());
  } 
}


void fillVectorList(){
  for(int i = 0; i<APP_WIDTH; i+=NUM_WIDTH){
    for(int j = 0; j<APP_HEIGHT; j+=NUM_HEIGHT){
      VectorList.add(new PVector(i, j));
      posCount += 1;
    } 
  }  
}


void cycleArrayList(int cycleNumber){
  // reset temporary storage
  cRectPushList.clear();
  cRectRestList.clear();
  
  for( int i = 0; i< posCount; i++){
    if (i < cycleNumber) cRectPushList.add( cRectList.get(i));
    if (i >= cycleNumber) cRectRestList.add( cRectList.get(i));
  }

  int cycleRest = posCount-cycleNumber;
  for( int j = 0; j< posCount; j++){
    if (j < cycleRest) cRectList.set(j, cRectRestList.get(j));
    if (j >= cycleRest) cRectList.set(j, cRectPushList.get(j-cycleRest));
  }
    
}


// second tab


class CRect{
  PVector pos = new PVector(0,0);
  color CRectColor;  
    
  CRect(){
    color col1 = color(55, 134, 240, 234);
    color col2 = color(23, 34 , 170, 65);
    float amt = random(1);
    CRectColor = lerpColor(col1, col2, amt);
  }
        
  void display(){
    fill(CRectColor);
    noStroke();
    int ranX = int(random(8)) - 4;
    int ranY = int(random(8)) - 4;
    float ranMagnify = random(1.0, 17.6);
    float rectSize = ranMagnify * 20;
    rect(pos.x + ranX, pos.y + ranY, rectSize, rectSize);
  }
  
  
  
}

