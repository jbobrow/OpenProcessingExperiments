
import java.util.Iterator;

int windowSize = 1024;
private static final int NUM_LIGHTNINGS = 20;

private ArrayList<Lightning> lightnings;


void setup(){
  size(windowSize, windowSize);
  background(0);
  
  lightnings = new ArrayList<Lightning>();
  for(int i= 0; i< NUM_LIGHTNINGS; i++){
    lightnings.add(new Lightning(new PVector(windowSize/2, windowSize/2)));
  }
  
}

void draw(){
    background(0);
    
    ArrayList<Lightning> toRemove = new ArrayList<Lightning>();   
    Iterator<Lightning> itl = lightnings.iterator();
    
    while (itl.hasNext()) {  
       Lightning currLightning = itl.next();       
       if(!currLightning.isAlive()){
           toRemove.add(currLightning);
       }
       else{
          //currLightning.setEnd(new PVector(mouseX+random(-10,10), mouseY+random(-10,10)));
         currLightning.draw();
       }
    }
    
    //remove ended      
    Iterator<Lightning> iRemove = toRemove.iterator();
    while (iRemove.hasNext()) {
        lightnings.remove(iRemove.next());
        lightnings.add(new Lightning(new PVector(windowSize/2, windowSize/2)));
    }
    toRemove.clear();
    
    text("total: "+lightnings.size(), 10,10);
}
