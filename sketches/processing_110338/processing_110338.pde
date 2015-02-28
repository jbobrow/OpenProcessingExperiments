
PImage img;

Ribbon[] ribbons = new Ribbon[10];

int top, left;
color color1, color2, color3;
float ppmouseX, ppmouseY; //previous-previous mouseX
 
 
void setup() {
   
  size(1500, 800, P2D);
  background(240);
  frameRate(60);
  img = loadImage("http://vectorcinco.com/wp-content/uploads/2013/09/colorParty3.jpg");
  noStroke();
  smooth();   
  
  //center image
  left = (width - img.width) / 2;
  top = (height - img.height) / 2;
  
  for (int i = 0; i < ribbons.length; i++) {
    
    ribbons[i] = new Ribbon(random(width/2-200, width/2+200), random(height/2-200, height/2+200));

    ribbons[i].positioning();  
  }
  
   
}



void draw(){
 
  
  for (int i = 0; i < ribbons.length; i++) {
    ribbons[i].positioning();
    ribbons[i].show(img);
  }

  
}


class Ribbon {
  
  float posX, posY, PposX, PposY, PpposX, PpposY;
  float pnoiseX, pnoiseY;
  float incX = 0.01;
  float incY = 0.01;
  
  Ribbon(float tempX, float tempY){
    pnoiseX = tempX;
    pnoiseY = tempY;

  }
  
  void positioning(){

    
    PpposX = PposX;
    PpposY = PposY;
    PposX = posX;
    PposY = posY;
    
    //noiseDetail(2,0.5);
        
    posX = noise(pnoiseX)*width*4-width*1.3;
    posY = noise(pnoiseY)*height*4-height*1.3;
    
    pnoiseX = pnoiseX + incX;
    pnoiseY = pnoiseY + incY;
  }
  
  void show(PImage what){
    
    
    float d = dist(posX, posY, PposX, PposY);
    float pd = dist(PposX, PposY, PpposX, PpposY);
    float startd = dist(posX, posY, PpposX, PpposY);
        
    float deltaX = posX - PposX;
    float deltaY = posY - PposY;
    float pdeltaX = PposX - PpposX;
    float pdeltaY = PposY - PpposY;
    
    if(PpposX != 0) {
       
    float midPointx = posX-deltaX/2;
    float midPointy = posY-deltaY/2;
    float pmidPointx = PposX-pdeltaX/2;
    float pmidPointy = PposY-pdeltaY/2;
    
    float directionAngle = atan2(deltaY, deltaX);
    float pdirectionAngle = atan2(pdeltaY, pdeltaX);
    
    float x = d * cos(radians(90) + directionAngle);
    float y = d * sin(radians(90) + directionAngle);
    float px = pd * cos(radians(90) + pdirectionAngle);
    float py = pd * sin(radians(90) + pdirectionAngle);
    
    // Color picking
    color1 = what.get(int(posX),int(posY));
    color2 = what.get(int(PposX),int(PposY)); 
    color3 = what.get(int(PpposX),int(PpposY)); 
    
    stroke(0);
    strokeWeight(0);
    
    beginShape();
    fill(color2);
    vertex(left + PposX, top + PposY);
    vertex(left + midPointx+x, top + midPointy+y);
    vertex(left + posX, top + posY);
    
    endShape(CLOSE);
    
    
    beginShape();
    fill(color1);
    vertex(left + PposX, top + PposY);
    vertex(left + midPointx-x, top + midPointy-y);
    vertex(left + posX, top + posY);
    
    endShape(CLOSE);
    
    
    beginShape();
    fill(color3);
    vertex(left + PposX, top + PposY);
    vertex(left + midPointx+x, top + midPointy+y);
    vertex(left + pmidPointx+px, top + pmidPointy+py);  
    
    endShape(CLOSE);
    
    beginShape();
    fill(color3);
    vertex(left + PposX, top + PposY);
    vertex(left + midPointx-x, top + midPointy-y);
    vertex(left + pmidPointx-px, top + pmidPointy-py);
    
    endShape(CLOSE);
    
    
    
    
    }
   
        
  }
  
  
}
