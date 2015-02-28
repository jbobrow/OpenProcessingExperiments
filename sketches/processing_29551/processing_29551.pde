
PImage img;

void setup(){
  size(750, 425);
  
  // läd ein Bild in die Variable img
  //img = loadImage("Fragments-of-RGB_1.jpg");
  img = loadImage("arnold-schwarzenegger-picture-1.jpg");
  
  // färbe das Bild Rot ein
  tint(255, 0, 0);
  
  // zeigt das Bild an
  image(img, 0, 0);
  
  // färbe das Bild Rot ein
  tint(0, 255, 0);
  
  // zeigt das Bild an
  image(img, 250, 0);
  
  noTint();
  // zeigt das Bild an
  image(img, 500, 0);
}

void draw(){
  // get() liest den Farbwert an der mouseposition
  
  println(get(mouseX, mouseY));
  
  // zeschneidet die aktuelle Farbe in RGB
  float r = red(get(mouseX, mouseY));
  float g = green(get(mouseX, mouseY));
  float b = blue(get(mouseX, mouseY));
  
  // fügt RGB zusammen zu einer Füllfarbe
  color c = color(r, g, b);
  
  println(r + " " + g + " " + b);
  
  fill(c);
  rect(width/2, height/2, 30, 30);
}


