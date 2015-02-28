
void setup() {
 size(600,600);

 }
 
int value = #FF001E;

void draw() {
   background(#EDEDED);
  fill(value);
 
                
}

void mouseDragged() 
{
    rect(25, 250-mouseY, 50, 50);
      rect(125, 250-mouseY, 50, 50);
          rect(225, 250-mouseY, 50, 50);
              rect(325, 250-mouseY, 50, 50);
               rect(425, 250-mouseY, 50, 50);
                rect(525, 250-mouseY, 50, 50);
               
                
   rect(25, 550-mouseY, 50, 50);
      rect(125, 550-mouseY, 50, 50);
          rect(225, 550-mouseY, 50, 50);
              rect(325, 550-mouseY, 50, 50);
               rect(425, 550-mouseY, 50, 50);
                rect(525, 550-mouseY, 50, 50);
               
                  rect(25, 350-mouseY, 50, 50);
      rect(125, 350-mouseY, 50, 50);
          rect(225, 350-mouseY, 50, 50);
              rect(325, 350-mouseY, 50, 50);
               rect(425, 350-mouseY, 50, 50);
                rect(525, 350-mouseY, 50, 50);
                
                
   rect(25, 450-mouseY, 50, 50);
      rect(125, 450-mouseY, 50, 50);
          rect(225, 450-mouseY, 50, 50);
              rect(325, 450-mouseY, 50, 50);
               rect(425, 450-mouseY, 50, 50);
                rect(525, 450-mouseY, 50, 50);
               
   rect(25, 150-mouseY, 50, 50);
      rect(125, 150-mouseY, 50, 50);
          rect(225, 150-mouseY, 50, 50);
              rect(325, 150-mouseY, 50, 50);
               rect(425, 150-mouseY, 50, 50);
                rect(525, 150-mouseY, 50, 50);
                   rect(25, 150-mouseY, 50, 50);
      rect(125, 50-mouseY, 50, 50);
          rect(225, 50-mouseY, 50, 50);
              rect(325, 50-mouseY, 50, 50);
               rect(425, 50-mouseY, 50, 50);
                rect(525, 50-mouseY, 50, 50);
                   rect(25, 650-mouseY, 50, 50);
      rect(125, 650-mouseY, 50, 50);
          rect(225, 650-mouseY, 50, 50);
              rect(325, 650-mouseY, 50, 50);
               rect(425, 650-mouseY, 50, 50);
                rect(525, 650-mouseY, 50, 50);
  value = value + 1;
  if (value > 255) {
    value = 0;
  }
}


