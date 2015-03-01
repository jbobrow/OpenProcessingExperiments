
void setup(){
  size(1000, 1000);
  colorMode(HSB);
  background(0);
}

void draw(){
  noStroke();
  int x = 0;
  int y = 0;
  
  while(x < 1000){
   while(y < 1000){
      fill(250 - mouseX/4 + x/4, mouseY + y/8, mouseX/8 + mouseY/8);
      rect(x, y, 50, 50, 0, 25, 0, 25);
      y = y + 50;
    }
    x = x + 50;
    y = 0;
  }
  
  x = 0;
  y = 0;
  
    while(x < 1000){
   while(y < 1000){
      fill(250 - mouseY/4 + y/4, mouseX + x/8, mouseX/8 + mouseY/8, 100);
      rect(x, y, 50, 50, 25, 0, 25, 0);
      y = y + 50;
    }
    x = x + 50;
    y = 0;
  }
}


