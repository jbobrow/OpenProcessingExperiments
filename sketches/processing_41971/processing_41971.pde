

PFont bobsFont;
String flee;
color coolColor;

void setup( ){
  size(600, 600);
  bobsFont = loadFont("myFont_playbill.vlw");
  flee = "Hello Bob!";
  coolColor = color(19, 232, 120);
}

void draw() {
  background(150);
  textFont(bobsFont, 40);
  
  
  
  if(mousePressed ) {
    flee = "Ack! Bob!";
  }else{ 
    flee = "Hello Bob!";
  }
  fill(coolColor);
  ellipse(300, 300, 100, 100);
  
  if(dist(mouseX, mouseY, 300, 300) < 50) {
   coolColor = color(255, 0, 0); 
  }else{ coolColor = color(19, 232, 120);}
  fill(255);
  text(flee, mouseX, mouseY);
  
}

