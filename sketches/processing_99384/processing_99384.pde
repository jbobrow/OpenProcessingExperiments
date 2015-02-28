
PImage Carter;
int first30 = 30;
int sec30 = 30;
boolean state = false;

void setup() {
  //background size
  size(1000, 800);
  Carter = loadImage("Car.png");
}
void draw() {
  //backgound color
  background(10);
  //race track size and color
  rect(100, 0, 800, 800);  
  color i = color(255,255,255); 
  fill(i);
  smooth();
  rect(200, 100, 600, 600);
  
  
  color r = color(128, 128, 128); 
  fill(r);
  float redValue = red(r);  
  fill(redValue, 0, 0);
  // the red thing...goal line
  rect(395, 0, 20, 100);  
  fill(209);
  //race car
           image(Carter, mouseX-40/2, mouseY-30/2, first30, sec30);
  //check if off track
     
      while(mouseX > 390 && mouseX<400 && mouseY > 0 && mouseY < 100){
      first30 += 10;
      sec30+=10;
      Carter.resize(first30,sec30);
      break;
    
     


  }

      



}
    

