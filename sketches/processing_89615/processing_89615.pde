
import controlP5.*;
ControlP5 cp5;

float x = 0, y = 0;  
float stepSize = 5.0;  
PFont font;  

String str = "School of Visual Arts (SVA) is a multidisciplinary college of art and design in New York City known for its unparalleled faculty and innovative curriculum.";  
int fontSizeMin = 3;  
float angle = 0.0;  
int counter = 0;  
float alpha = 255;
ColorPicker cp;

void setup() {  
  size(800, 800);  
  background(0);  
  smooth();  
  cursor(CROSS);  
  x = mouseX;  
  y = mouseY;  

  font = createFont("American Typewriter",10);  
  textFont(font,fontSizeMin);  
  textAlign(LEFT);  
  fill(0);  
  
  cp5 = new ControlP5(this);
  
  cp5.addSlider("fontSizeMin").setPosition(20, 720).setRange(1, 20).linebreak();
  cp5.addSlider("alpha").setPosition(20, 710).setRange(0, 255).linebreak();
  cp5.addTextfield("str")
     .setPosition(20,740)
     .setSize(200,40)
     .setFont(createFont("Arial", 20, true))
     .setFocus(true)
     .setColor(color(255, 255, 255))
     .setColorBackground(color(0, 0, 0))
     .linebreak();
     ;
  cp = cp5.addColorPicker("picker").setPosition(20, 20);
}  

   
void draw() {  
  if (mousePressed) {  
    float d = dist(x,y, mouseX,mouseY);  
    textFont(font,fontSizeMin+d/2);  
    char newLetter = str.charAt(counter);  
    stepSize = textWidth(newLetter);  

    if (d > stepSize) {  
      float angle = atan2(mouseY-y, mouseX-x);   
      
      pushMatrix();  
      translate(x, y);  
      rotate(angle);  
      fill(cp.getColorValue(),alpha);
      text(newLetter, 0, 0);  
      ellipse(x,y,10,10);
      popMatrix();  

      counter++;  
      if (counter > str.length()-1) counter = 0;  

      x = x + cos(angle) * stepSize;  
      y = y + sin(angle) * stepSize;   

    }  
  }  
}


