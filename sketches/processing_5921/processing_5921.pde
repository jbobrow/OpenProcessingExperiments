
abstract public class BaseController {
  // PROPERTIES
  ArrayList allTargets;
  ArrayList allDraggers;
  BaseDragger selected;
  boolean allTargetsCovered = false;
  int numberCorrect = 0;

  // CONSTRUCTORS
  BaseController() {
    allTargets = new ArrayList();
    allDraggers = new ArrayList();
  }
  
  // METHODS
  void registerDragger(BaseDragger dragger) {
    allDraggers.add(dragger);
  }
  
  void registerTarget(BaseTarget target) {
    allTargets.add(target);
  }
  
  // Generic event triggered by mousePressed or mouseReleased
  void update() {
    updateNumberCorrect();
    areAllTargetsCovered();
    customUpdate();
  }
  
  // Customisable event method
  void customUpdate() {
    
  }
  
  // Update the number of correct answers
  void updateNumberCorrect() {
    int numCorrect = 0;
    for(int i=0; i<allDraggers.size(); i++) {
      BaseDragger currentDragger = (BaseDragger) allDraggers.get(i);
      if(currentDragger.targetCorrect) {
        numCorrect ++;
      }
    }
    numberCorrect = numCorrect;    
  }
  
  // Check if all targets are covered
  void areAllTargetsCovered() {
    boolean allCovered = true;
    for(int i=0; i<allTargets.size(); i++) {
      BaseTarget theTarget = (BaseTarget) allTargets.get(i);
      if(theTarget.isCovered == false) {
        allCovered = false;  
      }
    }
    if(allCovered) {
      allTargetsCovered = true;
      allTargetsCovered();
    }
    else {
      allTargetsCovered = false;
    }
  }
  
  // Customisable method to be called when all targets are covered
  void allTargetsCovered() {
 
  }
  
  // additional utilities
  void makeAllDraggersLockable() {
     for(int i=0; i<allDraggers.size(); i++) {
      BaseDragger currentDragger = (BaseDragger) allDraggers.get(i);
      currentDragger.lockable = true;
     }
  }
  
  void makeAllDraggersNotLockable() {
     for(int i=0; i<allDraggers.size(); i++) {
      BaseDragger currentDragger = (BaseDragger) allDraggers.get(i);
      currentDragger.lockable = false;
     }
  }
  
  // You may want to disable all draggers - perhaps when instructions are being displayed
  void lockAllDraggers() {
    for(int i=0; i<allDraggers.size(); i++) {
      BaseDragger currentDragger = (BaseDragger) allDraggers.get(i);
      currentDragger.locked = true;
    }
  }
  
  // but you would then need to be able to enable them
  void unlockAllDraggers() {
    for(int i=0; i<allDraggers.size(); i++) {
      BaseDragger currentDragger = (BaseDragger) allDraggers.get(i);
      currentDragger.locked = false;
    }
  } 
  
}

