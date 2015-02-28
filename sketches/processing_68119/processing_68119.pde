
// ===================OBJECT   
class Circle { 
  PVector pos;  //position
  float stepSizeX;
  float stepSizeY;
  //float[] colorRGB = new float[3];    //float array stored colour info
  
  
//==================== Constructor, initialize the variables  
  Circle(){
    
    // create new vector storing information about position, moving direction & speed and colour
    pos = new PVector(random(width),random(height));    // assign x,y
    stepSizeX = pow(-1,round(random(1,2))) * random(stepSizeMin,stepSizeMax); //random number +/- stepSizeMin-Max
    stepSizeY = pow(-1,round(random(1,2))) * random(stepSizeMin,stepSizeMax); //random number +/- stepSizeMin-Max
    //for (int i = 0; i < 3; i++) {
    //  colorRGB[i] = round(random(0,255));    //generate color RGB value
    //}
  }
//==================== Methods and Functions   

void run(){
  update();
  display();
}
  //update the location of circle, moving according to the angle cotrolled by the perlin noise
  void update() {
    float angle = noise(pos.x/noiseScale,pos.y/noiseScale) * noiseStrength;
    pos.x += cos(angle) * stepSizeX;
    pos.y += sin(angle) * stepSizeY;
    // reverse direction if touching boundaries
    if (pos.x < 0 || pos.x > width) stepSizeX *= -1;  
    if (pos.y < 0 || pos.y > height) stepSizeY *= -1;
  }
    
  // draw circles
  void display (){ 
     //stroke(colorRGB[0],colorRGB[1],colorRGB[2],50);
     stroke(150,50);
     point(pos.x, pos.y);
  }
}

