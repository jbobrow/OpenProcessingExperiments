
void setup() {
  size(400,400);
  makeBuilding();
      
}

  float corniceWidth = 105;
  float cornice = 10;
    float buildingHeight = 200;
  float buildingBase = 105;
float baseProportion = 0.75;
  float buildingWidth = buildingBase * baseProportion;
    float doorHeight = 40;
  float doorWidth = 10 * 1/2 * baseProportion;
  
  
  void draw()  {
}
void mouseDragged () {
  if (mouseButton == LEFT) {
    
    buildingHeight = buildingHeight + (mouseY-pmouseY);
    buildingWidth = buildingWidth + (mouseX-pmouseX);
    corniceWidth = corniceWidth + (mouseX-pmouseX);
     doorWidth = doorWidth + (mouseX-pmouseX);
    doorHeight = doorHeight + (mouseY-pmouseY);
      buildingBase = buildingBase + (mouseX-pmouseX);
    makeBuilding();
   
  }
  else if (mouseButton == RIGHT) {
    
    buildingHeight = buildingHeight + (mouseY-pmouseY);
    buildingBase = buildingBase + (mouseX-pmouseX);
   buildingWidth = buildingWidth + (mouseX-pmouseX);
    
    makeBuilding();
    

  }
  
}
void makeBuilding () {
  background(200);
  
  beginShape();
  vertex(width/2 - buildingBase, height - 25);
  vertex(width/2 - buildingBase, height - 50);
  vertex(width/2 + buildingBase, height - 50);
  vertex(width/2 + buildingBase, height - 25);
  vertex(width/2 - buildingBase, height - 25);
  endShape();
  beginShape();
  vertex(width/2 - buildingBase, height - 50);
  vertex(width/2 - buildingBase, height - 50 - buildingHeight);
  vertex(width/2 + buildingBase, height - 50 - buildingHeight);
  vertex(width/2 + buildingBase, height - 50);
  vertex(width/2 - buildingBase, height - 50);
  endShape();
  beginShape();
  vertex(width/2 - corniceWidth, height - 50 - buildingHeight);
  vertex(width/2 - corniceWidth, height - 50 - buildingHeight - 50);
  vertex(width/2 + corniceWidth, height - 50 - buildingHeight - 50);
  vertex(width/2 + corniceWidth, height - 50 - buildingHeight); 
  vertex(width/2 - corniceWidth, height - 50 - buildingHeight);
  endShape();
  beginShape();
  vertex(width/2 - doorWidth, height - 50);
  vertex(width/2 - doorWidth, height - 70); 
  vertex(width/2 + doorWidth, height - 70);
 vertex(width/2 + doorWidth, height - 50);
  vertex(width/2 - doorWidth, height - 50);
  endShape();

  
}



