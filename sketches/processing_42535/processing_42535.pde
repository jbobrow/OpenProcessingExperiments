
PImage achtergrond;
String message = "O";
float hr, vr;  // horizontal and vertical radius of the text

void setup() 
{
  size(290,321);
  achtergrond = loadImage("nederland.JPG");
  textAlign(CENTER, CENTER);
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();  
}

void draw() 
{
  background(achtergrond); 
  fill(204, 120);
  rect(0, 0, width, height);
  fill(0);
  text("Bevolkingsdichtheid in Nederland (CBS)", 150, 20);


  fill (#0000FF);  
  if (abs(mouseX - 100) < hr &&
  abs(mouseY - 120) < vr) {
  text("Noord-Holland", 100, 70);
  text("Tussen 750 en 100 inw/km^2", 100, 90);
  }
  ellipse(100, 120, 40, 40);  



  fill (#FF00FF);  
  if (abs(mouseX - 90) < hr &&
  abs(mouseY - 180) < vr) {
  text("Zuid-Holland", 100, 220);
  text("Meer dan 1000 inw/km^2", 100, 240);
  }
  ellipse(90, 180, 50, 50);



  fill (#800080);  
  if (abs(mouseX - 130) < hr &&
  abs(mouseY - 160) < vr) {
  text("Utrecht", 150, 200);
  text("Tussen 500 en 750 inw/km^2", 150, 220);
  }
  ellipse(130, 160, 30, 30);
   
   
 
  fill (#4E9258);  
  if (abs(mouseX - 180) < hr &&
  abs(mouseY - 250) < vr) {
  text("Limburg", 200, 280);
  text("Tussen 250 en 500 inw/km^2", 200, 300);
  }
  ellipse(180, 250 , 20, 20);
   
   
   
  fill (#F87217);  
  if (abs(mouseX - 260) < hr &&
  abs(mouseY - 55) < vr) {
  text("Drenthe", 210, 80);
  text("Minder dan 250 inw/km^2", 210, 100);
  }
  ellipse(260, 55 , 10, 10);
}

