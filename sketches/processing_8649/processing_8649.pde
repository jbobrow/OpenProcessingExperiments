

World world = new World();

void setup() {
  size(640, 480);
  ellipseMode(CORNER);
  noSmooth();
  noCursor();
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  world.update(mouseX - width / 2, mouseY - height / 2); 
  world.render();
}

void mousePressed() {
  
}

class World {
  PVector isoMouse = new PVector();
  World() {

  }

  void update(int mouseX, int mouseY) {
    isoMouse = getRealPosition(new PVector(mouseX, mouseY));
  }

  PVector getScreenPosition(PVector loc) {

    PVector positionOnScreen = new PVector();

    positionOnScreen.x = (loc.x - loc.y) / 2.0;
    positionOnScreen.y = (loc.x + loc.y) / 4.0;

    return positionOnScreen;
  }

  PVector getRealPosition(PVector onScreenPoint) {
    PVector realPosition = new PVector();

    realPosition.x = onScreenPoint.x + 2.0 * onScreenPoint.y;
    realPosition.y = - onScreenPoint.x + 2.0 * onScreenPoint.y;

    return realPosition;   
  }
  static final int TILE_SIZE = 24;
  void renderTile(float x, float y) {
    line(x - (TILE_SIZE >> 1),y,x, y - (TILE_SIZE >> 2) );
    line(x + (TILE_SIZE >> 1),y,x, y - (TILE_SIZE >> 2) );
    line(x - (TILE_SIZE >> 1),y,x, y + (TILE_SIZE >> 2) );
    line(x + (TILE_SIZE >> 1),y,x, y + (TILE_SIZE >> 2) );
  }

  void render() {

    PVector brush;

    for (int i = -(TILE_SIZE * 9); i <= TILE_SIZE * 10; i += TILE_SIZE)
      for (int j = -(TILE_SIZE * 9); j <= TILE_SIZE * 10; j += TILE_SIZE) {

        PVector realTilePosition = new PVector(i, j);
        brush = getScreenPosition(realTilePosition);

        int intensity = int(realTilePosition.dist(isoMouse));

        if (intensity > 200)
          intensity = 200;
          
           brush.z = intensity;
          
        stroke(0, 128, 60, 200 - intensity);
        renderTile(brush.x, brush.y + 100 - (brush.z / 2));

       
        stroke(255, 0, 128, intensity);
       
        renderTile(brush.x, brush.y - 100 + (brush.z / 2));
      
      }
      
    PVector isoMouseTile = getScreenPosition(isoMouse);
    
    stroke(255, 255, 0, 128);
    renderTile(isoMouseTile.x, isoMouseTile.y); 
    
    
  }
}








