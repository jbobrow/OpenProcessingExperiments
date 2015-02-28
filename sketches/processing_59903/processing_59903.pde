
int tileSize; //tile size
int halfTileSize, quarterTileSize; //half and quarter tile size pre-calc
int mapWidth, mapHeight; //map size (width and height)
int mapHoverX, mapHoverY; //current position of mouse over map
int mapOffsetX, mapOffsetY; //amount map is shifted around by scroll wheel
boolean flagOffsetChanged; //time to refresh flag

//================================================================

void setup() {
  size(600, 400);
  smooth();
  stroke(60);
  
  //initialize our variables
  tileSize = 64;
  halfTileSize = tileSize/2;
  quarterTileSize = tileSize/4;
  mapWidth = 15;
  mapHeight = 20;
  mapOffsetX = 1 - mapHeight; //starting x-axis offset (all the way to the left of map)
  mapOffsetY = 0; //starting y-axis offset (top of map)
  flagOffsetChanged = true; //make sure our map is drawn right away
  
  //add a wheel listener to play with the map offset
  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) {
      if (keyPressed && keyCode == keyEvent.VK_SHIFT) 
        mapOffsetX = constrain(mapOffsetX + evt.getWheelRotation(), 1 - mapHeight, 1 - width/halfTileSize + mapWidth);
      else
        mapOffsetY = constrain(mapOffsetY + evt.getWheelRotation(), 0, 1 - height/quarterTileSize + mapWidth + mapHeight);
      flagOffsetChanged = true;
    }
  });
}

//================================================================

void draw() {
  
  //convert the mouse coordinates to map coordinates
  int mx = int((float)mouseX/ tileSize + (float)mouseY/halfTileSize + (float)( mapOffsetX + mapOffsetY - 1)*0.5);
  int my = int((float)mouseX/-tileSize + (float)mouseY/halfTileSize + (float)(-mapOffsetX + mapOffsetY + 1)*0.5);
  
  //refresh the display if needed
  if (mx != mapHoverX || my != mapHoverY || flagOffsetChanged) {
    mapHoverX = mx;
    mapHoverY = my;
    background(150);
    //draw each tile (this draws offscreen - we should probably have some boundry checking)
    for (int y=0; y<mapHeight; y++)
      for(int x=0; x<mapWidth; x++) {
        if (mapHoverX == x && mapHoverY == y) fill(128, 128, 200); //pretty blue color if it's our tile
        else noFill(); //otehrwise, meh
        int dispX = (x - y - mapOffsetX)*halfTileSize; //get actual x screen position for this tile
        int dispY = (x + y - mapOffsetY)*quarterTileSize; //and our y position
        beginShape();  // draw our "tile" - we could use a tile from a tile sheet if we were so inclined
          vertex(dispX, dispY + quarterTileSize); //left vertex
          vertex(dispX + halfTileSize, dispY); //top vertext
          vertex(dispX + tileSize, dispY + quarterTileSize); //right vertex
          vertex(dispX + halfTileSize, dispY + halfTileSize); //bottom vertex
        endShape(CLOSE);
      }
    fill(255);
    //finally show some values on screen
    text("mouse:  " + mouseX + ", " + mouseY, 5, 15);
    text("offset: " + mapOffsetX + ", " + mapOffsetY, 5, 30);
    text("pos:    " + mapHoverX + ", " + mapHoverY, 5, 45);
    text("use scroll wheel (and <shift> + scroll wheel) to change offset", 5, height - 5);
    flagOffsetChanged = false;
  }
}

