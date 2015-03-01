
int counter;

void setup() {  //setup function called initially, only once
  size(200, 200);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  addScreen("level", new MarioLevel(width, height)); 
    
     }


class MarioLevel extends Level {
  MarioLevel(float levelWidth, float levelHeight) {
      super(levelWidth, levelHeight);
      addLevelLayer("layer", new MarioLayer(this));
  }
}


class MarioLayer extends LevelLayer {
 MarioLayer(Level owner) {
    super(owner);
    setBackgroundColor(color(0, 100, 190));
    addBoundary(new Boundary(0,height-48,width,height-48));
    showBoundaries = true;
  }
}


void draw() {  //draw function loops 
  
}
