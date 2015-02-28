
// The Modulo Experiment
int mainCounter;
ArrayList cubeList, pickUpList;
int score = 0;
PFont font;

void setup(){
  frameRate(60);
  size(800, 600);
  background(#FFFFFF);
  cubeList = new ArrayList();
  pickUpList = new ArrayList();
  font = loadFont("Arial.vlw"); 
  textFont(font, 12); 
}


void draw(){
  background(#FFFFFF);
  fill(0);
  text("score: " + score, width - 100, 10);
  println(score);
  mainCounter++;
  
  
  if ((mainCounter % 20) == 0){
    if (cubeList.size() < 100){
    cubeList.add(new Cube());
    }
  }
  
  if ((mainCounter % 1) == 0 && pickUpList.size() < 3){
    pickUpList.add(new PickUp());
  }
  
  for (int i = 0; i < cubeList.size(); i++){
    Cube cubeTemp = (Cube) cubeList.get(i);
    cubeTemp.Update(i);
    cubeTemp.Display();    
    float distance = dist(mouseX, mouseY, cubeTemp.positionX, cubeTemp.positionY); 
   if (distance < cubeTemp.size / 2){
     cubeList.remove(i);
     if(score > 0){
     score--;
     }
   }
  }
  
  for (int i = 0; i < pickUpList.size(); i++){
    PickUp puTemp = (PickUp) pickUpList.get(i);
    puTemp.Update();
    puTemp.Display();   
   float distance = dist(mouseX, mouseY, puTemp.positionX, puTemp.positionY); 
   if (distance < puTemp.size / 2){
     pickUpList.remove(i);
     score++;
   }
  }
  
  
}
class Cube {
  public float positionX = 0;
  public float positionY = 0;
  float speedX;
  float speedY;
  public float size;

  public Cube() {
    speedX = mainCounter % 5.1;
    speedY = mainCounter % 5.1;
    size = mainCounter % 20.1;
    if (size < 5){
     size = 5; 
    }
  }

  void Update(int myID) {
    if (myID > 0) {
      speedX = speedX + (mainCounter % myID);
    }
    speedX = speedX % 1.1;
    positionX = (positionX + speedX) % width;
    positionY = (positionY + speedY) % height;
  }

  void Display() {
    rectMode(CENTER);
    fill(#F26730);
    rect(positionX, positionY, size, size);
  }
}

class PickUp{
  
  public float positionX;
  public float positionY;
  public int size = 10;
  
  PickUp(){    
        positionX = random(0, width) % width;
     positionY =  random(0, height)% height;
     
  }
  
  void Update(){
  }
  
  void Display(){
    ellipseMode(CENTER);
    fill(#4FE296);
    ellipse(positionX, positionY, size, size);
  }
  
  
}


