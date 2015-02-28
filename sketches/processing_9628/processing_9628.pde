

ArrayList positions = new ArrayList();
ArrayList velocities = new ArrayList();
ArrayList particleColors = new ArrayList();
ArrayList strokeSizes = new ArrayList();
color[] colors;
int clickCoordIndex = 0;
boolean initializing = true;

void setup(){

  size(400, 400);
  smooth();
  background(0);
  noiseDetail(14);
  
  colors = new color[6];
  colors[0] = color(3, 150, 166);
  colors[1] = color(94, 64, 98);
  colors[2] = color(212, 53, 31);
  colors[3] = color(255, 91, 25);
  colors[4] = color(241, 187, 55);
  colors[5] = color(0, 0, 0);
  
  for(int x = 0; x < width; x+=50) {
    for(int y = 0; y < height; y+=50) { 
      positions.add(new PVector(x, y));
      velocities.add(new PVector(0, 0));
      particleColors.add(int(random(0,5)));
    }
  }

  initializing = false;  
}

void draw(){
  //background(0);
 smooth();
 // draw middle point
  strokeWeight(8);
 
   if(mousePressed){
      for(int x=-100 + clickCoordIndex; x<=100 + clickCoordIndex; x+=50){
        for(int y=-100 + clickCoordIndex; y<=100 + clickCoordIndex; y+=50){
          stroke(#000000);
          positions.add(new PVector(mouseX + x, mouseY + y));
          velocities.add(new PVector(0, 0));
          particleColors.add(int(random(0,6)));
          strokeSizes.add(5);
        } 
      }
      clickCoordIndex++;
      
      if(clickCoordIndex == 50) clickCoordIndex = 0;
   }
   
 for(int i=0; i<positions.size(); i++){
  PVector curPos = (PVector) positions.get(i);
  PVector curVel = (PVector) velocities.get(i);
  int c = (Integer) particleColors.get(i);
  
  stroke(colors[c], 100);
  strokeWeight(1);
  point(curPos.x, curPos.y);

  curVel.x = 8*noise(200+curPos.x*random(0.001, 0.010), 200+curPos.y*.007, .007*2)*cos(6*PI*noise(curPos.x*.007, curPos.y*.007, .007*.5));
  curVel.y = 8*noise(200+curPos.x*random(0.001, 0.010), 200+curPos.y*.007, .007*2)*sin(6*PI*noise(curPos.x*.007, curPos.y*.007, .007*.5));
  curPos.add(curVel);
  
  if((curPos.x > width) || (curPos.x < 0) || (curPos.y > height) || (curPos.y < 0)){
   positions.remove(i);
   velocities.remove(i);
   particleColors.remove(i);
   
   if(positions.size() < 1200){
     positions.add(new PVector((int)random(0,width), (int)random(0,height)));
     velocities.add(new PVector(0, 0));
     particleColors.add(int(random(0,5)));
   }
  }
  
  //remove overlapping points
  if(i>1){
    PVector lastPos = (PVector) positions.get(i-1);
    if(lastPos.dist(curPos) == 0) positions.remove(i);
    
    int possibleDuplicate = positions.indexOf(curPos);
    
    while(possibleDuplicate != -1){
      if(possibleDuplicate == i){
       possibleDuplicate = positions.lastIndexOf(curPos);
       if((i == possibleDuplicate) || (i == -1)) break;
       else{
         positions.remove(possibleDuplicate);
         particleColors.remove(possibleDuplicate);
         velocities.remove(possibleDuplicate);
         strokeSizes.remove(possibleDuplicate);
         print("removed");
         //increment stroke size for removed particle
         int strokeSize = (Integer) strokeSizes.get(i);
         strokeSize++;        
       }
      } 
      else {
         positions.remove(possibleDuplicate);
         particleColors.remove(possibleDuplicate);
         velocities.remove(possibleDuplicate);
         strokeSizes.remove(possibleDuplicate);
         print("removed");
         //increment stroke size for removed particle
         int strokeSize = (Integer) strokeSizes.get(i);
         strokeSize++;
      }    
    }
  }
 }
}


