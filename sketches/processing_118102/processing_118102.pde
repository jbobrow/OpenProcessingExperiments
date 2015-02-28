
ArrayList objectList;
PFont font;

int counter = 0;
float interval = 0.1 * 60;


void setup() {  
  size(800, 600);
  background(#FFFFFF);
  font = loadFont("ArialMT-12.vlw");
  textFont(font, 10);

  objectList = new ArrayList();
}


void mouseDragged() {
  counter++;

  if (counter > interval) {
    objectList.add(new MainObject(objectList.size(), mouseX, mouseY));
    counter = 0;
  }
}

void draw() {
  background(#FFFFFF); 

  //update
  for (int i = 0; i < objectList.size(); i++) {
    MainObject object_temp = (MainObject) objectList.get(i);
    object_temp.Update();
    object_temp.Display();
  }
}

class MainObject {
  ArrayList particleList;

  int myID;
  float positionX;
  float positionY;
  int size = 20;
  float sizeDecrease = random(1, 5);
  int counter = 0;
  float interval = random(0.5, 1.5) * 60;
  
  float moveSpeed = 1;

  int particleCounter = 0;
  float particleInterval = 0.5 * 60;


  public MainObject(int myID, float positionX, float positionY) {
    this.myID = myID;
    this.positionX = positionX;
    this.positionY = positionY;

    particleList = new ArrayList();
  }

  public void Update() {
    int directionX = (int)random(2);
  int directionY = (int)random(2);
    
    for (int i = 0; i < particleList.size(); i++) {
      Particle particle_temp = (Particle) particleList.get(i);
      particle_temp.Update();
      particle_temp.Display();
    }


    counter++;

    if (counter > interval) {

      size -= sizeDecrease;
      moveSpeed -= 0.1;
      
      if (size > 1) {
        particleList.add(new Particle(positionX, positionY));
      }
      counter = 0;
      if (size < 0) {
        size = 0;
      }
    }


    if (directionX > 0) {
      positionX += moveSpeed;
    }
    else {
      positionX -= moveSpeed;
    }

    if (directionY > 0) {
      positionY += moveSpeed;
    }
    else {
      positionY -= moveSpeed;
    }
  }

  public void Display() {
    rectMode(CENTER);
    fill(#000000);
    rect(positionX, positionY, size, size);
    //fill(#FFFFFF);
    //text (myID, positionX, positionY);
  }
}

class Particle{
  float positionX;
  float positionY;
  int size = 5;
  
  int directionX = (int)random(-5, 5);
  int directionY = (int)random(-5, 5);
  
  public Particle(float positionX, float positionY){
    this.positionX = positionX;
    this.positionY = positionY;
    
  }
  
  public void Update() {
    size -= 0.1;
    if (size < 0){
      size = 0;
    }
    
    positionX += directionX;
    positionY += directionY;
  }
  
  public void Display() {
    rect(positionX, positionY, size, size);
  }
  
}



