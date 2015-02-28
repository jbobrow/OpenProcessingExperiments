
float focalDist = 0;
float blurFactor = 2;
ArrayList<depthPixel> myPixels;

void setup(){
  size(600, 600);
  noStroke();
  smooth();
  
  ellipseMode(CENTER);
  background(0);
  
  myPixels = new ArrayList<depthPixel>();
}

class depthPixel{
  float x, y, layer;
  
  depthPixel(float xIn, float yIn, float layerIn){
    x = xIn;
    y = yIn;
    
    layer = layerIn;
  }
  
  void drawPixel(){
    float tempX = x, tempY = y;
    float layerDist = abs(layer - focalDist) / 2;
    
    float xOffset = ((width/2) - mouseX) * ((24 - layer) / 24);
    float yOffset = ((height/2) - mouseY) * ((24 - layer) / 24);
    
    xOffset += (x - (width/2)) * ((focalDist - layer) / 64);
    yOffset += (y - (height/2)) * ((focalDist - layer) / 64);
    
    tempX += xOffset;
    tempY += yOffset;
    
    if(layer < focalDist){
      layerDist *= 2;
    }
    
    float diam = (layerDist * blurFactor) + 4;
    int alph = int(255 / (layerDist * 4));
    
    if(layerDist == 0){
      diam = 4;
      alph = 230;
    }
    
    if(alph < 1){
      return;
    }
    
    fill(255, alph);
    ellipse(tempX, tempY, diam, diam);
    
  }
}

void makePixel(float x, float y){
  depthPixel p = new depthPixel(x, y, focalDist);
  myPixels.add(p);
}

void drawAllPixels(){
  for(depthPixel p : myPixels){
    p.drawPixel();
  }
}

void keyTyped(){
  if((key == 'w' || key == 'W') && focalDist < 20){
    focalDist += 0.5;
  } else if((key == 's' || key == 'S') && focalDist > 0){
    focalDist -= 0.5;
  } else if(key == 'c' || key == 'C'){
    resetPixels();
  }
}

void resetPixels(){
  myPixels.clear();
}

float prevMouseX = 0, prevMouseY = 0;

void draw(){
  background(0);
  
  if(mousePressed){
    if(mouseButton == RIGHT){
      resetPixels();
      return;
    } else {
      float x = ((width/2) - mouseX) * ((24 - focalDist) / 24);
      float y = ((height/2) - mouseY) * ((24 - focalDist) / 24);
      
      makePixel(mouseX - x, mouseY - y);
    }
  }
  
  textSize(20);
  
  drawAllPixels();
  
  fill(255);
  text("Focal Distance: " + focalDist, 10, 20);
  text("Number of Points: " + myPixels.size(), 10, 45);
  noStroke();
}
  
  
  


