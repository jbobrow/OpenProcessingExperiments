
float lastSavedTime;
float timeDelaySeconds = 1;
float timeDelay;
PImage bg;
PImage neb;
float fade;
boolean startFade;

float randomRotate;
 
boolean drawCircleTrue = false;
float mouseXClicked;
float mouseYClicked;
 
void setup() {
  lastSavedTime = millis();
  timeDelay = 1000*timeDelaySeconds;
  println(lastSavedTime);
  ellipseMode(CENTER);
  size(800, 800);
  smooth();
  noStroke();
  bg = loadImage("bg.jpg");
  neb = loadImage("neb.png");
  fade = 150;
}
 
void draw() {
  tint(255, fade);
  imageMode(CENTER);
  image(bg, mouseX/2, mouseY/2);
  if (millis() - lastSavedTime > timeDelay) {
    drawCircleTrue = true;
  }
  if (drawCircleTrue) {
    image(neb, mouseXClicked, mouseYClicked);
    drawCircleTrue = false;
    startFade = true;
  }
  
  if (startFade){
     if (millis() + lastSavedTime > timeDelay){
        fade--;
     } 
     if(fade <= 0){
      startFade = false; 
     }
  }

}
 
void mouseReleased() {
  lastSavedTime = millis();
  println(lastSavedTime);
  mouseXClicked = mouseX;
  mouseYClicked = mouseY;
}


