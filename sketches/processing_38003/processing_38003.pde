
void setup (){
  size(400, 400);
}


void draw (){
  background (245, 143, 243);
  fill (255, 248, 10); // fill must go before object to be filled
  ellipse (100, 200, 100, 100); // (x, y, width, height)
  fill (10, 255, 163);
  ellipse (250, 200, mouseY, mouseX);
  fill (255, 158, 10);
  rect (300, 150, 50, 200); // (x, y, width, height)
  fill (10, 192, 255);
  triangle (10, 250, 70, 270, mouseY, mouseX);
  
}

