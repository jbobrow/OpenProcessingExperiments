
PImage fish;
int blum = 125;
int lastMouseY = 0;
Boolean manualControl = true;
Boolean mouseToggle = false;

void setup(){
  size(800,700);
  fish = loadImage("fish.png");
}

void draw(){
  if(abs(lastMouseY-mouseY)>5){
    manualControl=true;
  }
  if(mouseToggle){
    background(abs(255-((mouseY/700.)*255)));
  }else{
    background((mouseY/700.)*255);
  }
  image(fish,20,10);
}

void mousePressed(){
  mouseToggle = !mouseToggle;
}
  



