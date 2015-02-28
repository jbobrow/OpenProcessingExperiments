
color myColor1;
color myColor2;
color myColor3;

void setup() {
  size(800, 600);
  colorMode(HSB);
  
  setSelectedColor(100, 100, 100);

  setupColorSelector(550, 0, 250, 600, 0);
  
     myColor1 = color(random(0, 255), 50, 100);
     myColor2 = color(random(0, 255), 200, 255);
     myColor3 = color(random(0, 255), 100, 200);
}

void draw() {
  
  background(0);
  
  if (mousePressed) {
    colorSelectorHandleMouse(mouseX, mouseY);  
  }
  
  drawColorSelector();
 
 bakeAPie();
 
 //smaller rectangle to the left
 fill(myColor2);
 rect(100, 225, 75, 125);

}

void bakeAPie() {
 //large left rectangle
  fill(myColor1);
   rect(0, 0, 300, 600);
   
 //large right rectangle
   fill(myColor3);
   rect(300, 0, 300, 600);
 //right rectangle (able to be changed)  
   fill(selectedColor);
   rect(400, 225, 75, 125);

}



