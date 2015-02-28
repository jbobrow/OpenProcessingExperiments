
class Worm{
  
  int indexPos, pos, sN = 10;
  int modeMove, modeLook, dirW;
  int[] x = new int[sN];
  int[] y = new int[sN];
  
  float x1, y1;
  float spaceX, modX, modY, offsetAngle, cRange;
  float offsetX, offsetY;
  float radius, radius1, radius2, r, randomness, rad, cSpeed;
  
  PImage imgSkin = loadImage("heart_left.png");
  PShape shapeSkin = loadShape("wormShape00.svg");
  
  Worm(int directionW, float offX, float offY, float radiusBase, int crawlRange, float crawlSpeed, float jitterRandom, int move, int look){
    dirW = directionW;
    offsetX = offX;
    offsetY = offY;
    radius = radiusBase;
    cRange = crawlRange;
    cSpeed = crawlSpeed;
    randomness = jitterRandom;
    modeMove = move;
    modeLook = look;
  }
  
  void update(){

    x[indexPos] = mouseX;
    y[indexPos] = mouseY;
    indexPos = (indexPos + 1) % sN;
    
    if(mousePressed) {
      mousePressed();
      r += randomness;
    }else{
      mouseReleased();
      r = 0;
    }
  }
  
  void display(){

    rad += cSpeed;
    
    pushMatrix();
    for (int i=sN - 1; i >= 0; i--) {
       
    pos = (indexPos + i) % sN;
    offsetAngle = (TWO_PI/sN*1.5)*i;
    modX = sin(rad + offsetAngle)*cRange;
    modY = cos(rad + offsetAngle)*cRange;
    
    radius1 = radius*(1+random(-r, r)/5);
    radius2 = radius*(1+random(-r, r)/5);
   
   if(dirW == 0){
     spaceX = radius * 2 / 3;
   }else if(dirW == 1){
     spaceX = -radius * 2 / 3;
   }

    translate(spaceX, 0);
    
    if(i < 2 || i > sN - 3 || modeMove == 0){
      modY = 0;
    }else if(modeMove == 1){
      modX = 0;
    }
    
    x1 = x[pos]+modX+random(-r, r)+offsetX;
    y1 = y[pos]+modY+random(-r, r)+offsetY;



    
    if(modeLook == 0){
      tint(0, 255, 0);
      image(imgSkin, x1, y1, radius1, radius2);
    }else if(modeLook == 1){
      shape(shapeSkin, x1, y1, radius1, radius2);
      }
      
}
popMatrix();
}

}




