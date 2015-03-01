
//****************************************--Audio Links--********************************************************

//hopefully these will work for longer term than dropbox.

sound1 = new Audio("http://thetoastisburning.site50.net/sounds/notes/a.wav");

sound2 = new Audio("http://thetoastisburning.site50.net/sounds/notes/c.wav");

sound3 = new Audio("http://thetoastisburning.site50.net/sounds/notes/d.wav");

sound4 = new Audio("http://thetoastisburning.site50.net/sounds/notes/e.wav");

sound5 = new Audio("http://thetoastisburning.site50.net/sounds/notes/g.wav");

//sound6 = new Audio("http://thetoastisburning.site50.net/sounds/bass.wav");



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
                //text("over: " + i, 5,300);
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
            if (iV > 0) {line(Vectors.get(iV-1).x, Vectors.get(iV-1).y, Vectors.get(iV).x, Vectors.get(iV).y);
                         ellipse(Vectors.get(iV).x, Vectors.get(iV).y, 2, 2);
            }
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
    int type;
    color colour;
    
    
    Cloud(int x, int y, int r, int t, color c){
        position = new PVector(x, y);
        radius = r;
        type = t;
        colour = c;
        textDisplayed = t;
    }
    
    void display(){
        
        setColor(colour);
        stroke (blackColor);
        strokeWeight(2);
        ellipse(position.x, position.y, radius, radius);
        setColor(whiteColor);
        //ellipse(position.x, position.y, 2,2);
        strokeWeight(1);
        setColor(blackColor);
        textFont(font, radius);
        text(menu.get(type).itemName, position.x-radius/4, position.y+radius/4);
    
    }
    
    void blink() {
        setColor(whiteColor);
        textFont(font, radius);
        text(menu.get(type).itemName, position.x-radius/4, position.y+radius/4);
    
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
        setColor(whiteColor);
        text(itemName, xPos-radius/2, yPos-radius/2);
         
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
color cloudMenuColor = color (200,200,0,25);
color hairColor = color (100,100,100,10);
color cloudColor = color (200,200,0,25);

color aColor = color (256,0,126,25);
color cColor = color (0,200,200,25);
color dColor = color (66,256,66,25);
color eColor = color (250,200,0,25);
color gColor = color (256,0,0,25);
 
 String menuText = "...";
 
smooth();
 
void setup() { 
  size(width, height);
  colorMode(RGB, 100);
   
  
   
  menuSetup();

  cords = new ArrayList<Cord>();
  Cord t = new Cord(0,0);
  cords.add(t);
  
  clouds = new ArrayList<Cloud>();
  Cloud c = new Cloud(0,0,10,0,whiteColor);
  clouds.add(c);
   
 
   
}
 
void draw() { 
 
  //info();
  
   
  mouseObject.tick();
   
 
  
 if (counter % 5 == 0) {
 
      background(0,0,0);
      areaDisplay();
      menuDisplay();
      
       for(i = 0; i < clouds.size(); i++){
          clouds.get(i).tick();
      }
      
      
           for(i = 0; i < cords.size(); i++){
              cords.get(i).tick(i);
      }
       
        doLines();
        if (clouds.size() > 1 && cords.size() > 1) {playSound();}
 
   }
   
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
                    Cloud newCloud = new Cloud(mouseX, mouseY, 20, 1, aColor);
                    newCloud.position.set(mouseX,mouseY);
                    clouds.add(newCloud);
               }
       } else if (mouseObject.action == 2) {
               
             if (isInArea(mouseX, mouseY)){
                  Cloud newCloud = new Cloud(mouseX, mouseY, 20, 2, cColor);
                  newCloud.position.set(mouseX,mouseY);
                  clouds.add(newCloud);
             }
       } else if (mouseObject.action == 3) {
               
             if (isInArea(mouseX, mouseY)){
                  Cloud newCloud = new Cloud(mouseX, mouseY, 20, 3, dColor);
                  newCloud.position.set(mouseX,mouseY);
                  clouds.add(newCloud);
             }
       } else if (mouseObject.action == 4) {
               
             if (isInArea(mouseX, mouseY)){
                  Cloud newCloud = new Cloud(mouseX, mouseY, 20, 4, eColor);
                  newCloud.position.set(mouseX,mouseY);
                  clouds.add(newCloud);
             }
       } else if (mouseObject.action == 5) {
               
             if (isInArea(mouseX, mouseY)){
                  Cloud newCloud = new Cloud(mouseX, mouseY, 20, 5, gColor);
                  newCloud.position.set(mouseX,mouseY);
                  clouds.add(newCloud);
             }
       } else if (mouseObject.action == 6) {} 
       
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
            } else if (mouseObject.action == 2){
                 if (isInArea(mouseX, mouseY)){
                    clouds.get(clouds.size() - 1).radius = dist(mouseX, mouseY, clouds.get(clouds.size()-1).position.x, clouds.get(clouds.size()-1).position.y);
                    }
              } else if (mouseObject.action == 3){
                 if (isInArea(mouseX, mouseY)){
                    clouds.get(clouds.size() - 1).radius = dist(mouseX, mouseY, clouds.get(clouds.size()-1).position.x, clouds.get(clouds.size()-1).position.y);
                    }
            } else if (mouseObject.action == 4){
                 if (isInArea(mouseX, mouseY)){
                    clouds.get(clouds.size() - 1).radius = dist(mouseX, mouseY, clouds.get(clouds.size()-1).position.x, clouds.get(clouds.size()-1).position.y);
                    }
              } else if (mouseObject.action == 5){
                 if (isInArea(mouseX, mouseY)){
                    clouds.get(clouds.size() - 1).radius = dist(mouseX, mouseY, clouds.get(clouds.size()-1).position.x, clouds.get(clouds.size()-1).position.y);
                    }
            } else if (mouseObject.action == 6){}
             

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
      MenuItem cordMenuItem0 = new MenuItem("cord", 925, 50, 0, cordMenuColor);
      menu.add(cordMenuItem0);
      MenuItem cordMenuItem1 = new MenuItem("a", 925, 100, 1, aColor);
      menu.add(cordMenuItem1);
      MenuItem cordMenuItem2 = new MenuItem("c", 925, 150, 2, cColor);
      menu.add(cordMenuItem2);
      MenuItem cordMenuItem3 = new MenuItem("d", 925, 200, 3, dColor);
      menu.add(cordMenuItem3);
      MenuItem cordMenuItem4 = new MenuItem("e", 925, 250, 4, eColor);
      menu.add(cordMenuItem4);
      MenuItem cordMenuItem5 = new MenuItem("g", 925, 300, 5, gColor);
      menu.add(cordMenuItem5);
      //MenuItem cordMenuItem6 = new MenuItem("perc", 925, 350, 6, cloudMenuColor);
      //menu.add(cordMenuItem6);
      
     
  
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
        
        
        if (mouseObject.isOverMenuItem) {
             menuText = menu.get(mouseObject.overItem).itemName;
         }
        text("is: " + menuText, 5, 360);
        //text(clouds.size(), 5, 380);
 
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
          //text("cords, clouds: " + cords.size() + ", "+ clouds.size(), 200,200);
          for(j = 0; j < cords.size(); j++){
                for(k = 0; k < clouds.size(); k++){
                        if (j > 0 && k > 0){
                            x0 = cords.get(j).Vectors.get(cords.get(j).indexPos).x;
                            y0 = cords.get(j).Vectors.get(cords.get(j).indexPos).y;
                            x1 = clouds.get(k).position.x;
                            y1 = clouds.get(k).position.y;
                            
                            if (dist(x0,y0,x1,y1) < clouds.get(k).radius/2){
                                clouds.get(k).blink();
                                loud = clouds.get(k).radius;
                                switch(clouds.get(k).type){
                                    case 0:
                                    break;
                                    
                                    case 1:
                                    sound1.currentTime = 0;
                                    
                                    sound1.play();
                                    break;
                                    
                                    case 2:
                                    sound2.currentTime = 0;
                                    
                                    sound2.play();   
                                    break;
                                    
                                    case 3:
                                    sound3.currentTime = 0;
                                    sound3.play();
                                    break;
                                    
                                    case 4:
                                    sound4.currentTime = 0;
                                    sound4.play();   
                                    break;
                                    
                                    case 5:
                                    sound5.currentTime = 0;
                                    sound5.play();
                                    break;
                                    
                                    case 6:
                                    sound6.currentTime = 0;
                                    sound6.play();   
                                    break;
                                    
                                }
                            }
                        }
                }
            }
  }
