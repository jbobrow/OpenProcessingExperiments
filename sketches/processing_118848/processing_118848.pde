
ObjectManager objectManager;


void setup(){
  size(800, 600);
  background(#FFFFFF);
  
  objectManager = new ObjectManager();
  
}

void draw(){
  background(#FFFFFF);
  objectManager.Update();
  objectManager.Display();
}

void keyReleased(){
  
  
}
class Object {

  //leftside dominant!

  float firstPositionX = width / 2;
  float positionX;
  float positionY;
  int startSize = 30;
  float size;
  int myId;
  int difference;

  // turn 0 = left, turn 1 = right;
  int changeTurn = (int)random(0, 5);
  int turn = 0;


  public Object(int myId) {
    this.myId = myId;
    
    if (myId == 0) {
        positionX = firstPositionX;
        positionY = height;
        size = startSize;
      }
      else {
        if (turn == 0) {
          if (changeTurn <= 2) {
            turn = 1;
          }
        }
        else if (turn == 1) {
          if (changeTurn <= 2) {
            turn = 0;
          }
        }

        Object objectTemp = (Object) objectList.get(myId - 1);
        float lastPositionX = objectTemp.GetPositionX();
        float lastSize = objectTemp.GetSize();

        positionY = objectTemp.GetPositionY();

        if (turn == 1) {
          positionX = lastPositionX - (random (lastSize, lastSize + 10) / 2);
        }
        else if (turn == 0) {
          positionX = lastPositionX + (random (lastSize, lastSize + 10) / 2);
        }
        if (lastSize > 1) {
          size = lastSize - 0.1;
        }
      }
    
  }

  public void Update() {

      
  }

  public void Display() {




    fill(0);
    noStroke();
    rectMode(CENTER);
    rect(positionX, positionY - (size * 10), size, size);
  }


  public float GetPositionX() {
    return positionX;
  }

  public float GetPositionY() {
    return positionY;
  }

  public float GetSize() {
    return size;
  }
}

ArrayList objectList;

class ObjectManager {
  int maxSize = 100;

  public ObjectManager() {
    objectList = new ArrayList();   
    println(objectList.size());
  }

  public void Update() {
    for (int i = 0; i < objectList.size(); i++) {
      Object objectTemp = (Object) objectList.get(i);
      objectTemp.Update();
    }

    if (keyPressed) {
      delay(1);
      for (int i = 0; i < maxSize; i++) {
        AddObject();
      }
    }

    if (!keyPressed) {
      for (int i = 0; i < objectList.size(); i++) {
        objectList.remove(i);
      }
    }
  }

  public void Display() {
    for (int i = 0; i < objectList.size(); i++) {
      Object objectTemp = (Object) objectList.get(i);
      objectTemp.Display();
    }
  }

  public void AddObject() {
    objectList.add(new Object(objectList.size()));
  }
}



