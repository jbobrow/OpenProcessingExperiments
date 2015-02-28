
float prevX = -1;
float prevY = -1;
String[] colors = {"#CF5B6F", "#FFF8C8", "#CAD99B1", "#8FB2A0", "#648991"};


void setup(){
  size(800,600);
  background(#CF5B6F);
  smooth();
}

void draw(){

  float diameter = dist(prevX, prevY, mouseX, mouseY);
  if(prevX != -1){
    fill(#648991);
    ellipse(mouseX, mouseY, diameter, diameter);
    fill(#FFF8C8);
    ellipse(mouseX, mouseY, diameter*random(0.001,0.95),diameter*random(0.001,0.95));
    
  }
  prevX = mouseX;
  prevY = mouseY;

}

