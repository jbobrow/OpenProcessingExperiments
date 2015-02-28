
int numberOfLights = 10;
Light [] lights;
int count =0;

void setup() {
  size(500, 350);
  smooth();
  frameRate(10);
  lights = new Light[numberOfLights];
  lights[0] = new Light(random(10, 490), random(10, 340));
  lights[0].lightStatus = lights[0].lighting;
  for (int i = 1; i< lights.length; i++) {
    lights[i] = new Light(random(10, 490), random(10, 340));
  }
}

void draw(){
}
/*
void draw() {
  background(0);
  //countLights();

  if (count < numberOfLights) {
    for (int i=0; i< lights.length; i++) {

  //    lights[i].drawLights();

      if ((dist(mouseX, mouseY, lights[i].lightPosX, lights[i].lightPosY) < lights[i].lightSize) && mousePressed) {
        lights[i].lighting();
      }
    }
  }
  else {
//    drawFinalLights();
  }
}
/*
void countLights() {

  count = 0;


  for (int i=0; i < lights.length; i++)
    if (lights[i].lighted == true) {
      count++;
   }
}
*/
/*public void drawFinalLights() {
  noStroke();

  for (int i=0; i < lights.length; i++) {
    fill(200, 50);
    ellipse(lights[i].lightPosX, lights[i].lightPosY, lights[i].lightSize++, lights[i].lightSize++);
    fill(lights[i].lightStatus);
    ellipse(lights[i].lightPosX, lights[i].lightPosY, lights[i].lightSize, lights[i].lightSize);
  }
}
*/
class Light{

  float lightSize;
  boolean lighted = false;
  float light_prevSize = 80;
  float light_afterSize = 80;
  color lightStatus;
  float lightPosX;
  float lightPosY;
  color dark = color(0,random(13,100),150);
  color lighting = color(255,255,240);
  
  public Light(float posX, float posY){
    lightPosX = posX;
    lightPosY = posY;
    lightStatus = dark;
    lightSize = light_prevSize;
  }
  
  public void drawLights(){
    noStroke();
    
      fill(lightStatus, 95);
      ellipse(lightPosX, lightPosY, lightSize + random(-8,8), lightSize + random(-8,8));
      fill(lightStatus);
      ellipse(lightPosX, lightPosY, lightSize-20 + random(-5,5), lightSize-20 + random(-5,5));
  
  }

  public void lighting(){
    lightStatus = lighting;
    lightSize = light_afterSize;
    lighted = true;
  }
  
  public void drawFinalLights(){
    noStroke();
    
    fill(lightStatus, 95);
      ellipse(lightPosX, lightPosY, lightSize+15, lightSize+15);
      fill(lightStatus);
      ellipse(lightPosX, lightPosY, lightSize, lightSize);
  }
  
}


