


void setup (){
  size (600, 700);
  background (255,255,255);
  
}

void draw (){
 line(300,350, mouseX,mouseY);
 line(300, 350, width/2+((width/2)-mouseX), mouseY);
 float red = map(mouseX, 0, width, 0, 255);
 float green = map(mouseY, 0, width, 0, 255);
 float blue = (random(0,150));
 stroke (red, green, blue);
}


