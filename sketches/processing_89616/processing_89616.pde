
import controlP5.*;
ControlP5 cp5;

boolean tog1 = false;
float circleColor = 255;
float circleSize = 20;
int count = 137;  
int rad = 3;

void setup() {  
  size(800,800,P3D);   
  //cursor(CROSS);  
  smooth();  
  frameRate(100);
  
  cp5 = new ControlP5(this);
  cp5.addToggle("tog1").linebreak();
  cp5.addSlider("circleColor", 0, 255).linebreak();
  cp5.addSlider("circleSize", 0, 30).linebreak();
  cp5.addSlider("count", 0, 400).linebreak();
  cp5.addSlider("rad", 0, 150).linebreak();
}  

void draw() {  
  background(0);  
  noStroke();  
  float faderX = (float)mouseX/(width-20);  

  float angle = radians(count);  
  for (int i=0; i<count; i++){  
    for (int j = 0; j < 400; j = j+50) {

    // positions  
    float randomX = random(0,width);    
    float randomY = random(0,height);  
    float circleX = width/2 + cos(angle*i)*(rad+j);  
   // float circleX2 = width/2 + cos(angle*i)*(rad-50);  
    float circleY = height/2 + sin(angle*i)*(rad+j);  
   // float circleY2 = height/2 + sin(angle*i)*(rad-50);  

    float x = lerp(randomX,circleX, faderX);  
    float y = lerp(randomY,circleY, faderX);  


    fill(circleColor,i,j,random(30,100));  
     if(tog1) ellipse(x,y,circleSize,circleSize);  
     if(tog1) ellipse(x,y,circleSize,circleSize);  
   // stroke(250,random(50));
   // strokeWeight(0.2);
   // if(tog1)  line(x,y,width/2,height/2);
    }
  }  

}   




