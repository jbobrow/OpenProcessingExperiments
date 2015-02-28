
int yPos = 0


void setup() {  //setup function called initially, only once
  size(400,400);
  smooth();
  background(126);
}
void draw() {  //draw function loops 
  yPos = mouseY;
  if (yPos > 200){
    background(0);
  }
else
    backgroun(255);
  }
}
