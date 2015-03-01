
Thing things[] = new Thing[200];

void setup (){
  
  size(600, 600);
  
  for (int i = 0; i<things.length; i++){
    things[i] = new Thing();
    
  }
}

void draw (){
  
  background(255);
  
  for (int i = 0; i<things.length; i++){
    things[i].drawAThing(20);
    things[i].updateMovement();
    things[i].checkBoundaries();
    println(i);
  }
  
}

void mousePressed(){

for (int i = 0; i<things.length; i++){
    things[i].setThingSpeed(10);
    things[i].setThingPosition(mouseX, mouseY);
    things[i].setColors();
}
}

class Thing {

  PVector thingPos = new PVector(0,0);
  PVector thingSpeed = new PVector(0,0);
  int thingSize;
  
  float Color1, Color2, Color3;  
  
  void setThingPosition(float posX, float posY){
    
    thingPos.x = posX;
    thingPos.y = posY;
       
  }
  
  void setThingSpeed(float speedValue){
  
    thingSpeed.x = random(-speedValue, speedValue);
    thingSpeed.y = random(-speedValue, speedValue);
    
  }
  
  void setColors(){
    
    Color1 = random(255);
    Color2 = random(255);
    Color3 = random(255);
    
  }
  
  void drawAThing(int _size){
    thingSize = _size;
    
    fill(Color1, Color2, Color3);
    ellipse (thingPos.x, thingPos.y, thingSize, thingSize);
    
  }
  
  void updateMovement(){
    thingSpeed.y = thingSpeed.y += 0.2;
    thingSpeed.x = thingSpeed.x/1.005;
    thingPos.x += thingSpeed.x;
    thingPos.y += thingSpeed.y;
    
  }  
  
  void checkBoundaries(){
  
      if (thingPos.x  + thingSize/2 > width) {
          thingPos.x = width - thingSize/2;
          thingSpeed.x = -thingSpeed.x/1.10;
      }
            
      if (thingPos.x  - thingSize/2 < 0) {
          thingPos.x = thingSize/2;
          thingSpeed.x = -thingSpeed.x/1.10;
      }

      if (thingPos.y  + thingSize/2 > height) {
          thingPos.y = height - thingSize/2;
          thingSpeed.y = -thingSpeed.y/1.35;      
      }

      if (thingPos.y  - thingSize/2 < 0) {
         thingPos.Y = thingSize/2;
         thingSpeed.y = -thingSpeed.y/1.35;     
      }
  }
  
}
