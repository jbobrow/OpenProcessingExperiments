
PImage cara1;
PImage cara2;
PImage cara3;
PImage cara4;

int x = 60;
int y = 60;
int diameter = 100;
int diameter2 = 101;
int diameter3 = 102;
int diameter4 = 103;
int time1 = 5000;

void setup() {
  size(600,600);
frameRate(70);
  cara1 = loadImage("cara1.png");
  cara2 = loadImage("cara2.png");
  cara3 = loadImage("cara3.png");
  cara4 = loadImage ("cara4.png");
}




void draw(){  background(25);
    
  int currentTime = millis();
   
  if (currentTime > time1) {
    image(cara1, x-30, y-50, 20,20); // luego de 2 segundos aparece una cara.
  }
  
  
  float d = dist(mouseX, mouseY, x, y);
  if (d < diameter) {
    diameter--;
     }
 
  if (d > diameter) {
    diameter++; }
 
  tint(255,128);   // imagen mantiene su color y %50 transparencia.
  image(cara1, x,y, diameter,diameter);
  
  float d2 = dist(mouseX, mouseY, x+280, y-1);
  if (d2 < diameter2) {
    diameter2--;
  }
    
  if (d2 > diameter2) {
    diameter2++;
  }
  image(cara2,x+280,y-1, diameter2,diameter2);
  
  float d3 = dist(mouseX, mouseY, x+280, y+250);
  if(d3 < diameter3) {
    diameter3--;
  }
  if (d3 > diameter3) {
    diameter3++;
  }
  
 image(cara3,x+280, y+250, diameter3, diameter3);
 
 float d4 = dist(mouseX, mouseY, x-1,+250);
 if (d4 < diameter4) {
  diameter4--;
 }
 if (d4 > diameter4) {
   diameter4++;
 }
 
 image(cara4,x-1,y+250, diameter4, diameter4); 


}

