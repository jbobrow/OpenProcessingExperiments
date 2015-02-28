
float lightColorR[] = {0,255};
float lightColorG[] = {0,255};
float lightColorB[] = {0,255};

aLight myLight;

void setup(){
  background(100);
  frameRate(3);
  size(100,100);
}

void draw(){
  background(100);
myLight = new aLight (random(lightColorR[0], lightColorR[1]),random(lightColorG[0], lightColorG[1]),random(lightColorB[0], lightColorB[1])
  );
  myLight.run();
}
class aLight{
  float lightColorR;
  float lightColorG;
  float lightColorB;
  
  aLight(float _lightColorR, float _lightColorG, float _lightColorB){
    lightColorR = _lightColorR;
    lightColorG = _lightColorG;
    lightColorB = _lightColorB;
  }
  void run() {
    display();
  }
  void display(){
    noStroke();
    pushMatrix();
    translate(50, 50);
    
    //base
    fill(0);
    ellipse(0,0,70,70);
    
    //lightMiddleTop
    fill(lightColorB, lightColorG, lightColorR);
    ellipse(0,-20,10,10);
    
    //lightTopRight
    fill(lightColorG, lightColorB, lightColorR);
    ellipse(20,-10,10,10);
    
    //lightMiddle
    fill(lightColorR, lightColorB, lightColorG);
    ellipse(0,0,10,10);
    
    //lightBottomRight
    fill(lightColorB, lightColorG, lightColorR);
    ellipse(20,10,10,10);
    
    //lightMiddleBottom
    fill(lightColorB, lightColorR, lightColorG);
    ellipse(0,20,10,10);
    
      //lightBottomLeft
    fill(lightColorB, lightColorG, lightColorR);
    ellipse(-20,10,10,10);
  
     //lightTopLeft
    fill(lightColorR, lightColorG, lightColorB);
    ellipse(-20,-10,10,10);
    popMatrix();
    
  }
}


