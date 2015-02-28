
class Item {
  
  FBox fbox;
  PVector position;
  PImage img;                           
  boolean remove;
  boolean release;
  String name = "?";
  int scorePoint = 0;
  Item(float theW, float theH) {
    fbox = new FBox(theW, theH);
    fbox.setSensor(true);
    fbox.setAngularDamping(10);
    fbox.setNoStroke();
    world.add(fbox);
  }

    
  Item setPosition(float theX, float theY) {
    fbox.setPosition(theX, theY);
    return this;
  }
  
   
  PVector getPosition() {
    return new PVector(fbox.getX(), fbox.getY());   
  }
  
  Item setImage(PImage theImage) {
    img = theImage;
    fbox.attachImage(img);
    return this;
  }
  
  
  
  FBox getBox() {
    return fbox;                                   
  }
  
  Item setName(String theName) {
    name = theName;
    return this;
  }
  
 void release() {
  fbox.setVelocity(0,500);
  release = true;
}
    
  void remove() {
    world.remove(fbox);
    remove = true;
  }
  
  void removeWithPenalty(int thePenaltyScore) {
    remove();
    setScorePoint(thePenaltyScore);
  }
  int getScorePoint() {
    return scorePoint;                     
  }
  
  public String toString() {
    return name;
  }
  
  Item setScorePoint(int theScorePoint) {
    scorePoint = theScorePoint;
    return this;
  }
  
}



class Cart extends Item {
  
  Cart(float theX, float theY, float theW, float theH) {
    super(theW, theH);
    setPosition(theX, theY);
    getBox().setSensor(false);
    getBox().setStatic(true);
    getBox().setNoFill();
    getBox().setGrabbable(false);
  }
}


class Border extends Item {
  
  Border(float theW, float theH) {
   super(theW, theH);
   getBox().setStatic(true);
   getBox().setNoFill();
   getBox().setGrabbable(false);
  }
  
}

