
                                                                
class MouseJob{
    int nearestPath;
    int nearestDistance;
    boolean isDraggingHead;
    boolean isDraggingEnd;
    boolean isHovering;
    
        MouseJob(){
            isDraggingHead = false;
            isDraggingEnd = false;
            isDragging = false;
            isHovering = false;
            nearestPath = 0;
            nearestDistance = 1000;
            
        }
        
        void findNearest(){
            distance = 1000;
            pathsIndex = -1;
            newDistance = 1000;
            
            for(i = 0;i < paths.size();i++){
                newDistance = dist(mouseX, mouseY, paths.get(i).xPos, paths.get(i).yPos);
                if (newDistance < distance){distance = newDistance; pathsIndex = i;} 
                newDistance = dist(mouseX, mouseY, paths.get(i).xEnd, paths.get(i).yEnd);
                if (newDistance < distance){distance = newDistance; pathsIndex = i;} 
            }
            nearestPath = pathsIndex;
            nearestDistance = distance;
            
          
        }
        
        
        void findState() {
            if (nearestDistance < 10){
                isHovering = true;
                } else {
                isHovering = false;
                }
            
            
            
        
        }
        
        void Hover(){
           
                 setColor(hoverColor);
                 
                 if(mouseJob.isNearHead(mouseJob.nearestPath)){
                     ellipse(paths.get(mouseJob.nearestPath).xPos, paths.get(mouseJob.nearestPath).yPos, 10,10);
                 } else {
                     ellipse(paths.get(mouseJob.nearestPath).xEnd, paths.get(mouseJob.nearestPath).yEnd, 10,10);
                 }
         
       }
        
        boolean isNearHead(int pathsIndex){
            if (dist(paths.get(pathsIndex).xPos, paths.get(pathsIndex).yPos, mouseX, mouseY) >                 dist(paths.get(pathsIndex).xEnd, paths.get(pathsIndex).yEnd, mouseX, mouseY)) {return false;} else { return true;}
        }
        
        void tick(){
              findNearest();
              findState();
              
              if (isHovering){Hover();}
              
              setColor(blackColor);
              text("nearest: " + nearestPath, 5,240);  
              text("is Head: " + isNearHead(nearestPath), 5,260);
              text("Dist: " + int(nearestDistance), 5,280);
              text("Hover: " + isHovering, 5,300);
        
        }
   
}

class Path{
      boolean isOn = false;
      int xPos;
      int yPos;
      int xEnd;
      int yEnd;
      int size;
      ArrayList<int> xSegs;
      ArrayList<int> ySegs;
      int indexPos;
      int indexDir;

      Path (int x, int y){
          xPos = x;
          yPos = y;
          size = 0;
          
          xSegs = new ArrayList<int>();
          ySegs = new ArrayList<int>();
          xSegs.add(x);
          ySegs.add(y);
          size++;
          indexPos = size;
          indexDir = 1;
      }

    
       void addSeg (int x1, int y1) {
        xSegs.add(x1); 
        ySegs.add(y1);
        size++;
        //text(paths.size(), 200, 100);
        
       }
    
        void addEnd(int xE, int yE) {
            xEnd = xE;
            yEnd = yE;
        }
    
       void displayHead(){
           ellipse(xPos, yPos, 5,5);
          
       }
       
       void displayEnd(){
           ellipse(xEnd, yEnd, 5,5);
          
       }
        
       void displaySegs() {
            for (i = 0; i < size;i++){
                if(i>0){line(xSegs.get(i-1), ySegs.get(i-1), xSegs.get(i), ySegs.get(i));}
            }
       }
       
       void displayIndex(){
           setColor(indexColor);
           ellipse(xSegs.get(indexPos),ySegs.get(indexPos),5,5);
           setColor(pathColor);
       }
       
       
       
       void tick(counter){
             this.displayHead();
             this.displayEnd();
             this.displayIndex();
             
            
             
                 if ((indexPos + indexDir < size)) {indexPos = indexPos + indexDir;} else {indexDir = -indexDir;}
                 if (indexPos < 0){indexPos = 0; indexDir = -indexDir}
                
       }

}



width = 800;
height = 500;

PFont font;
font = loadFont("FFScala.ttf"); 
textFont(font, 15); 

colorMode(RGB, 100);
ArrayList<Path> paths;
Path tempPath;
int counter;
color pathColor = color (20,50,100);
color rectColor = color (20,20,20);
color whiteColor = color (255,255,255);
color blackColor = color (0,0,0);
color indexColor = color (100,50,50);
color hoverColor = color (50,100,50,50);

MouseJob mouseJob = new MouseJob();

void setup() {  
  colorMode(RGB, 100);
  size(width, height);
  paths = new ArrayList<Path>();
  tempPath = new Path(0,0);
  tempPath.isOn = false;
  paths.add(tempPath);
  counter = 0;
  
  
}

void draw() {
      clear();
      info();
      setColor(pathColor);
       
      mouseJob.tick();
      
          for (int i=0;i<paths.size();i++) {
              paths.get(i).tick(counter);
              
          }
          
          for (int i=0;i<paths.size();i++) {
              paths.get(i).displaySegs();
              
          }
      counter++;
      if (counter > 1000) {counter = 0;}
      
      
  
}

void mouseOver() {  
         
}

void mousePressed() {
        //if (isHovering){
            
        //}else{
            paths.add(new Path(mouseX, mouseY));
        //}
        
    
    }

void mouseDragged() {
   
    paths.get(paths.size()-1).addSeg(pmouseX, pmouseY);
    paths.get(paths.size()-1).addSeg(mouseX, mouseY);
  
   
}

void mouseReleased() {

    paths.get(paths.size()-1).xEnd = mouseX;
    paths.get(paths.size()-1).yEnd = mouseY;
    
}


void info () {
    setColor(whiteColor);
    rect(0,0,100,400);
    setColor(blackColor);
    
        text("# paths: " +paths.size(), 5,20);
        text("last size: " +paths.get(paths.size()-1).size, 5,35);
        
        text("px: " + pmouseX, 5,60);
        text("py: " + pmouseY, 5,80);
        text("x: " + mouseX, 5,100);
        text("y: " + mouseY, 5,120);
        
        text("c: " + counter, 5,220);
    
}

void setColor(color c){
    fill(c);
    stroke(c);

}

void clear() {
    setColor(rectColor);
    rect(0,0,width,height);
}
