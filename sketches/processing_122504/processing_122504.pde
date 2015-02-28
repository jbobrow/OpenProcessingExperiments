
PImage img;
PImage cityscapes;
PImage backgroundImage;
boolean menu = true;

ArrayList buildingList;

int originX = 0;
int originY = 0;
int unit = 30;
void setup(){
  frameRate(10);
  size(displayWidth, displayHeight);
  img = loadImage("brick_building_001.png");
  buildingList = new ArrayList();
  cityscapes = loadImage("cityscapes.png");
  background(75);
}

void draw() {
  if(menu == true){
    image(cityscapes, 0, 0);
  }
  else{

    background(75);
    for(int i = 0; i < buildingList.size()-1; i++){
       int randSpawn = (int)random(100);
      ((Build)(buildingList.get(i))).drawObj();
      if(randSpawn == 42 && buildingList.size() < 225){
        Build oBuild = (Build)(buildingList.get(i));
        Build building = new Build();
        building.setX(oBuild.getX()-(oBuild.getWidth()/2));
        building.setY(oBuild.getY()+(oBuild.getHeight()/2));
        buildingList.add(building);
        println("SIZE: " + buildingList.size());
      }
    }
  }
}

void mouseDragged() 
{
  if(originX == 0){
    originX = mouseX;
    originY = mouseY;
    Build building = new Build();
    building.setX(mouseX-(building.getWidth()/2));
    building.setY(mouseY-(building.getHeight()/2));
    buildingList.add(building);
  }
  else if((((mouseX-originX)>unit) || ((mouseY-originY)>unit)) || ((originX-mouseX)>unit) || ((originY-mouseY)>unit)){
    originX = mouseX;
    originY = mouseY;
    Build building = new Build();
    building.setX(mouseX-(building.getWidth()/2));
    building.setY(mouseY-(building.getHeight()/2));
    buildingList.add(building);
  }    
}

void keyPressed(){
  if(key == 32){
    menu = !menu;
  }
}
class Build
{
  //position of building
  int xPos;
  int yPos;
  //height and width of building base
  int w;
  int h;
  int frame = 0;
  int frameBuff = 0;
  int numFrames = 8;
  PImage[] images = new PImage[numFrames];
  PImage img;
  
  Build()
  {
    frame = 0;
    img = determineBuilding();
    
  }
  
  public PImage determineBuilding(){
    img = loadImage("green_brick_010.png");
    int rand = (int)random(3.4);
    if(rand == 0){
      numFrames = 10;
      images = new PImage[numFrames];
      for(int i = 0; i < images.length;i++){
        String imageName = "green_brick_" + nf(i, 3) + ".png";
        images[i] = loadImage(imageName);
      }
        w = 50;
        h = 64;
    }
    else if(rand == 1){
      numFrames = 14;
      images = new PImage[numFrames];
      for(int i = 0; i < images.length;i++){
        String imageName = "rect_building_" + nf(i, 3) + ".png";
        images[i] = loadImage(imageName);
      }      
      img = loadImage("rect_building_014.png");
      w = 75;
      h = 72;
    }
    else if(rand == 2){
      
      for(int i = 0; i < images.length;i++){
        String imageName = "green_brick_" + nf(i, 3) + ".png";
        images[i] = loadImage(imageName);
      }
      
      img = loadImage("apartment_001.png");
      w = 90;
      h = 123;
    }
    return img;
  }
      
  
  public int getX(){
    return xPos;
  }
  
  int getY(){
    return yPos;
  }
  
  int getWidth(){
    return w;
  }
  
  int getHeight(){
    return h;
  }
  
  public void setX(int xCoor){
    xPos = xCoor;
  }
  
  public void setY(int yCoor){
    yPos = yCoor;
  }
  
  void drawObj(){
    if(frame == images.length){
      image(img, xPos, yPos);
    }
    else{
     // println("length " + images.length);
      println(images[frame]);
      println("frame " + frame);
      if(images[frame] != null){
      image(images[frame], xPos, yPos);}
      if(frameBuff > 2){
        frame++;
        frameBuff = 0;
      }
      frameBuff++;
    }
   // image(img, xPos, yPos);

  }
}


