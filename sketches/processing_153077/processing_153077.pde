
sound = new Audio("https://dl-web.dropbox.com/get/sounds/beep.wav?_subject_uid=305829285&w=AABOzQUJElonPnC0XGn35kbhB8nKCL4spqhHinTCjgZNbQ");

//****************************************--Classes--************************************************************
     
class MouseJob {
     
     
     
    boolean isMakingCord;
    boolean isOverMenuItem;
    int overItem;
    int action;
    boolean isHovering;
    boolean isHoveringCordHead;
    boolean isHoveringCordEnd;
    int hoverCord;
    boolean isDraggingCord;
    int nearestCord;
    int nearestDistance;
 
    MouseJob(){
        
        isOverMenuItem = false;
        overItem = 0;
        action = -1;
        isHovering = false;
        isHoveringCordHead = false;
        isHoveringCordEnd = false;
        hoverCord = -1;
        nearestCord = -1;
        nearestDistance = 1000;
        isDraggingCord = false;
    }
     
 
    void findState() {
    //search for distances of menu items
    isMakingCord = false;
        isOverMenuItem = false;
        overItem = 0;
        for(i = 0; i < menu.size(); i++){
            if (dist(mouseX, mouseY, menu.get(i).xPos, menu.get(i).yPos) < menu.get(i).radius/2) {
                text("over: " + i, 5,300);
                isOverMenuItem = true;
                overItem = i;
            }
        }
         
        if (nearestDistance < 10){
            isHovering = true;
            } else {
            isHovering = false;
            }
         
    }
     
    void findNearest(){
            distance = 1000;
            cIndex = -1;
            newDistance = 1000;
             
            for(i = 0;i < cords.size();i++){
                newDistance = dist(mouseX, mouseY, cords.get(i).head.x, cords.get(i).head.y);
                if (newDistance < distance){distance = newDistance; cIndex = i;}
                newDistance = dist(mouseX, mouseY, cords.get(i).end.x, cords.get(i).end.y);
                if (newDistance < distance){distance = newDistance; cIndex = i;}
            }
            nearestCord = cIndex;
            nearestDistance = distance;
    }
     
    void hover(){
        setColor(hoverColor);
         
        if(mouseObject.isNearHead(mouseObject.nearestCord)){
            ellipse(cords.get(mouseObject.nearestCord).head.x, cords.get(mouseObject.nearestCord).head.y, 10,10);
            } else {
            ellipse(cords.get(mouseObject.nearestCord).end.x, cords.get(mouseObject.nearestCord).end.y, 10,10);
            }
        }   
     
     
    boolean isNearHead(int ci) {
         
        if (dist(mouseX, mouseY, cords.get(ci).head.x, cords.get(ci).head.y) > dist(mouseX,             mouseY,cords.get(ci).end.x, cords.get(ci).end.y)) {return false;} else { return true;}
         
    }
     
    void tick() {                    //TICK
        findNearest();
        findState();
         
        if(isHovering){hover();}
    }
 
}
     
class Cord {     
    PVector head;   
    PVector end;    
    ArrayList<PVector> Vectors;
    int sizeVectors;
    int indexPos;             // which index of ArrayLists is the Bead at?  
    int indexDir;             // Direction. + is going up in index, - is going down
     
     
    Cord(int x, int y){
        head = new PVector(x,y);
        end = new PVector(x,y);
         
        Vectors = new ArrayList<PVector>();
        sizeVectors = 0;
        indexPos = 0;
        indexDir = 1;
    }
 
    void addVector(int x, int y) {
        Vectors.add(new PVector(x, y));
        sizeVectors++;
    }
 
    void display() {
        setColor(cordColor);
        ellipse(head.x, head.y, 5, 5);
        ellipse(end.x, end.y, 5, 5);
         
        for (iV = 0; iV < sizeVectors; iV++){
            if (iV > 0) {line(Vectors.get(iV-1).x, Vectors.get(iV-1).y, Vectors.get(iV).x, Vectors.get(iV).y);}
        }
      }
       
    void doIndex(int doIndexI){
        if ((indexPos + indexDir < sizeVectors)) {indexPos = indexPos + indexDir;} else {indexDir = -indexDir;}
        if (indexPos < 0){indexPos = 0; indexDir = -indexDir}
        setColor(indexColor);
        if (indexPos < sizeVectors){ellipse(Vectors.get(indexPos).x, Vectors.get(indexPos).y,5,5);}
        setColor(cordColor);
         
         
    }
     
     
     
    void tick(int tickI){
        display();
        doIndex(tickI);
    }
 
}


class Cloud {
    PVector position;
    int radius;
    
    Cloud(int x, int y, int r){
        position = new PVector(x, y);
        radius = r;
    }
    
    void display(){
        
        setColor(cloudColor);
        stroke (blackColor);
        strokeWeight(2);
        ellipse(position.x, position.y, radius, radius);
        setColor(whiteColor);
        ellipse(position.x, position.y, 2,2);
        strokeWeight(1);
    
    }
    
    void tick() {
        display();
    }
}
 
 
class MenuItem {
    String itemName;
    int xPos;
    int yPos;
    inr radius;
    int mouseJobCode;
    Color col;
     
    MenuItem(String nom, int x, int y, int c, color rgbColor){
        itemName = nom;
        xPos = x;
        yPos = y;
        radius = 40;
        mouseJobCode = c;
        col = rgbColor;
         
    }
     
    void display(){
        fill(col);
        stroke(blackColor);
        ellipse(xPos, yPos, radius, radius);
         
    }
 
}
 
//****************************************--Variables--**********************************************************
width = 1000;
height = 800;
 
PFont font;
font = loadFont("FFScala.ttf");
textFont(font, 15);
 
ArrayList<Cord> cords;
Cord t;

ArrayList<Cloud> clouds;
Cloud c;
 
 
ArrayList<MenuItem> menu;
MenuItem cordMenuItem;
 
MouseJob mouseObject = new MouseJob();
 
PVector zeroVector = new PVector(0,0);
 
colorMode(RGB, 100);
int counter = 0;
background(0,0,0);
color areaColor = color (20,10,5);
color cordColor = color (90,90,45);
color rectColor = color (20,10,5);
color whiteColor = color (255,255,255);
color blackColor = color (0,0,0);
color indexColor = color (100,50,50);
color hoverColor = color (50,100,50,50);
color cordMenuColor = color (90,90,45);
color cloudMenuColor = color (30,30,40);
color hairColor = color (100,100,100,10);
color cloudColor = color (30,30,45);
 
smooth();
 
void setup() { 
  size(width, height);
  colorMode(RGB, 100);
   
  cords = new ArrayList<Cord>();
  Cord t = new Cord(0,0);
  cords.add(t);
  
  clouds = new ArrayList<Cloud>();
  Cloud c = new Cloud(0,0,10);
  clouds.add(c);
   
   
  menuSetup();
   
   
}
 
void draw() { 
  background(0,0,0);
  info();
  areaDisplay();
  menuDisplay();
   
  mouseObject.tick();
   
 
  
 
  
   for(i = 0; i < clouds.size(); i++){
      clouds.get(i).tick();
  }
  
   for(i = 0; i < cords.size(); i++){
      cords.get(i).tick(i);
  }
   
    doLines();
    if (clouds.size() > 1 && cords.size() > 1) {playSound();}
 
   
  counter++;
  if (counter > 1000){counter = 0;}
}
 
 
//****************************************--Mouse Functions--****************************************************
    //boolean isMakingCord;
    //boolean isOverMenuItem;
    //boolean isHovering;
    //boolean isHoveringCordHead;
    //boolean isHoveringCordEnd;
    //boolean isDraggingCord;
 
void mousePressed(){
        
       if (mouseObject.isOverMenuItem){
           mouseObject.action = menu.get(mouseObject.overItem).mouseJobCode;
            
       } else if (mouseObject.action == 0)  {
                isKill = false;
                if (isInArea(mouseX, mouseY)){
                    Cord newCord = new Cord(mouseX, mouseY);
                    newCord.head.set(mouseX,mouseY);
                    cords.add(newCord);
                    cords.get(cords.size()-1).addVector(mouseX, mouseY);
                    mouseObject.isMakingCord = true;
                } else {}
       } else if (mouseObject.action == 1) {
               
               if (isInArea(mouseX, mouseY)){
                    Cloud newCloud = new Cloud(mouseX, mouseY, 20);
                    newCloud.position.set(mouseX,mouseY);
                    clouds.add(newCloud);
               }
       }
         
}
 
void mouseDragged(){
         
        //cord drag along
            
            if (mouseObject.action == 0)  {
                if (isInArea(mouseX, mouseY)){
                   cords.get(cords.size()-1).addVector(mouseX, mouseY);
                   
           
           
           
           
           
                } else {}
            } else if (mouseObject.action == 1){
                 if (isInArea(mouseX, mouseY)){
                    clouds.get(clouds.size() - 1).radius = dist(mouseX, mouseY, clouds.get(clouds.size()-1).position.x, clouds.get(clouds.size()-1).position.y);
                    }
            }
}
 
void mouseReleased(){
         
         
         
        if (mouseObject.action == 0){
            //cord finish
            
            if (isInArea(mouseX, mouseY)){
                cords.get(cords.size()-1).end.set(mouseX, mouseY);
                isMakingCord = false;
            } else if (isKill){if (cords.size()-1 > 0){cords.remove(cords.size()-1);}}
             
            
        }
        
}
 
 
 
void mouseMove(){
 
}
 
//****************************************--Setup Functions--****************************************************
 
void menuSetup(){
  menu = new ArrayList<MenuItem>();
  MenuItem cordMenuItem = new MenuItem("cord", 925, 25, 0, cordMenuColor);
  menu.add(cordMenuItem);
  MenuItem cordMenuItem = new MenuItem("cloud", 925, 75, 1, cloudMenuColor);
  menu.add(cordMenuItem);
}
 
//****************************************--Functions--**********************************************************
 
void info () {
    setColor(whiteColor);
    rect(0,0,100,400);
    setColor(blackColor);
     
        text("c size " + cords.size(), 5,20);
        //text("hy " + cords.get(0).head.y, 5,40);
         
        text("px: " + pmouseX, 5,60);
        text("py: " + pmouseY, 5,80);
        text("x: " + mouseX, 5,100);
        text("y: " + mouseY, 5,120);
         
        text("last length: " + cords.get(cords.size()-1).sizeVectors, 5, 160);
        text("indexPos: " + cords.get(cords.size()-1).indexPos, 5, 180);
         
        text("near C: " + mouseObject.nearestCord, 5,220);
        text("near D: " + int(mouseObject.nearestDistance), 5,240);
         
         
        text("action: " + mouseObject.action, 5,320);
        
        text(clouds.size(), 5, 380);
 
}
 
 
void areaDisplay() {
    setColor(areaColor);
    rect(100,0, 800,800);
}
 
boolean isInArea(int x, int y) {
    if(x > 100 && x < 900 && y > 0 && y < 800){return true;} else {return false;}
}
 
void menuDisplay(){
    for (i = 0; i < menu.size(); i++) {
        menu.get(i).display();
    }
}
 
void setColor(color c){
    fill(c);
    stroke(c);
 
}
 
void clear() {
    setColor(rectColor);
    rect(0,0,width,height);
}
 
void doLines(){
  for(j = 0; j < cords.size(); j++){
            for(k = 0; k < cords.size(); k++){
                if (j!=k && j > 0 && k > 0){
                    x0 = cords.get(j).Vectors.get(cords.get(j).indexPos).x;
                    y0 = cords.get(j).Vectors.get(cords.get(j).indexPos).y;
                    x1 = cords.get(k).Vectors.get(cords.get(k).indexPos).x;
                    y1 = cords.get(k).Vectors.get(cords.get(k).indexPos).y;
                    setColor(hairColor);
                    line(x0, y0, x1, y1);
                }
             
            }
        }
  }
  
  void playSound(){
          text("cords, clouds: " + cords.size() + ", "+ clouds.size(), 200,200);
          for(j = 0; j < cords.size(); j++){
                for(k = 0; k < clouds.size(); k++){
                        if (j > 0 && k > 0){
                            x0 = cords.get(j).Vectors.get(cords.get(j).indexPos).x;
                            y0 = cords.get(j).Vectors.get(cords.get(j).indexPos).y;
                            x1 = clouds.get(k).position.x;
                            y1 = clouds.get(k).position.y;
                            
                            if (dist(x0,y0,x1,y1) < clouds.get(k).radius/2){
                                sound.play();   
                            }
                        }
                }
            }
  }
