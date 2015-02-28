
ArrayList myBoxes;
float x=0;
PFont arial;
boolean wasClicked;

void setup(){
  size(400, 400, P3D);
  myBoxes = new ArrayList();
  arial = loadFont("ArialMT-48.vlw");
  textFont(arial, 16);
}

void draw(){
  background(50); 
  for (int i=0; i< myBoxes.size(); i++){
    myBox mb = (myBox) myBoxes.get(i);
    mb.rotate();
  }
  if (frameCount < 24*8){
    text("Multi-click to create hyper cubes.  Right click to reset.", 20, height-10);
  }
}

void mousePressed(){
  if (mouseButton == LEFT && mousePressed){
    myBoxes.add(new myBox(mouseX, mouseY, round(random(0,1)), 100, .15, .1, .05));
  }
    
  while(mouseButton == RIGHT && myBoxes.size() > 0)
    setup();
}

class myBox{
  int translateX, translateY, translateZ, boxSize;
  float spinRateX, spinRateY, spinRateZ;
  float x, y, z;
  color shapeColor;
  
  myBox(int translateX, int translateY, int translateZ, int boxSize, float spinRateX, float spinRateY, float spinRateZ){
      this.translateX = translateX;
      this.translateY = translateY;
      this.translateZ = translateZ;
      this.boxSize = boxSize;
      this.spinRateX = spinRateX;
      this.spinRateY = spinRateY;
      this.spinRateZ = spinRateZ;
      this.shapeColor = color((int)random(0,255), (int)random(0,255), (int)random(0,255));
  }
  
  void rotate(){
    fill(this.shapeColor);
    pushMatrix();
      x+=spinRateX;
      y+=spinRateY;
      z+=spinRateZ;
      translate(translateX, translateY, translateZ);
      rotateX(x);
      rotateY(y);
      rotateZ(z);
      box(x);
      if (x > 125)
        spinRateX *= -1;
      if (x < 25)
        spinRateX = abs(spinRateX);
    popMatrix();
    color(0);
  }
}

