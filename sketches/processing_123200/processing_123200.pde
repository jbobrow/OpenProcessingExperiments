
BackgroundLayer backgroundLayer;
Razor razor;
HairManager hairManager;

void setup(){
  frameRate(60);
  size(800, 600);
  backgroundLayer = new BackgroundLayer();
  hairManager = new HairManager();
  razor = new Razor();
  noCursor();
}


void draw(){
  backgroundLayer.Display(); 
  hairManager.Update();
  hairManager.Display();
  razor.Update();
  razor.Display();
}
class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int animationSpeed;
  float randomTimer = random(5 - 8);
  Boolean telbaar = true;
  int counter = 0;
  float positionX;
  float positionY;

  Animation(String imagePrefix, int imageCount, float animateSpeed, float positionX, float positionY) {
    this.positionX = positionX;
    this.positionY = positionY;
    this.imageCount = imageCount;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + i + ".png";
      images[i] = loadImage("/animations/" + filename);
      animationSpeed = int(frameRate / animateSpeed);
    }
  }
  
  void SetPosition(float positionX, float positionY){
    this.positionX = positionX;
    this.positionY = positionY;
  }
  
  void Display(){
    counter++;
    if (counter == animationSpeed) {
      frame = (frame+1) % imageCount;
      counter = 0;
    }
    imageMode(CENTER);
    image(images[frame], positionX, positionY);
  }
}

class BackgroundLayer{
  
  PImage face;
  
  
 public BackgroundLayer(){
   face = loadImage("data/face.png");
 }
 
 void Display(){
   imageMode(CORNER);
   image(face, 0, 0);
 }
  
}
class Hair{
  
 Animation hairPiece;
 float positionX;
 float positionY;
 
 public Hair(float positionX, float positionY){
  this.positionX = positionX;
  this.positionY = positionY;
   
   hairPiece = new Animation("hair", 3, 2, positionX, positionY);
  
 }

  void Update(int MyID){
    
    float distance = dist(positionX, positionY, mouseX, mouseY);
    
    if (abs(distance) < 40){
      hairList.remove(MyID);
    }
   
  }
 
 void Display(){
   hairPiece.Display();
  
 } 
  
}
ArrayList hairList;


class HairManager {

  public HairManager() {
    hairList = new ArrayList();
    PImage mask = loadImage("data/mask.png");
    color maskColor = color(0, 0, 0);
    int step = 40;
    int chanceToSpawn = 100;

    mask.loadPixels();
    for (int x = 0; x < mask.width; x++) {
      for (int y = 0; y < mask.height; y++) {
         if (mask.pixels[y*width+x] == maskColor){
           int rnd = (int)random(0, chanceToSpawn);
           if (rnd == 0){
           AddHair(x, y);
           } 
         }
      }
    }
    mask.updatePixels();
    println(hairList.size());
  }

  void Update() {

    for (int i = 0; i < hairList.size(); i++) {
      Hair hairTemp = (Hair) hairList.get(i);
      hairTemp.Update(i);
    }
  }

  void Display() {

    for (int i = 0; i < hairList.size(); i++) {
      Hair hairTemp = (Hair) hairList.get(i);
      hairTemp.Display();
    }
  }

  void AddHair(float posX, float posY) {
    hairList.add(new Hair(posX, posY));
  }
}

class Razor {

  Animation mousePointer;
  float positionX;
  float positionY;

  public Razor() {
    mousePointer = new Animation("razor", 3, 4, positionX, positionY);
  }

  void Update() {
    positionX = mouseX;
    positionY = mouseY;
    mousePointer.SetPosition(positionX, positionY);
  }

  void Display() {
    mousePointer.Display();
  }
}



