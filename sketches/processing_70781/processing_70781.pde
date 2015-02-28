
void setup(){
  
  size(400,500);
  
}

int valueA =0;
int valueB =0;
int valueC =0;
int valueD = 0;
void draw()
{
  background(255, 204, 0);
  fill(valueA);
  rect(50, 50, 100, 100);
   rect(250, 50, 100, 100);
  fill(0,0,valueB);
   ellipse(300, 100, 50, 50);
  ellipse(100, 100, 50, 50);
   fill(valueC,0,0);
   arc(195, 300, 160, 160, 0, PI/2);

arc(195, 300, 160, 160, PI/2, PI);
  
fill(valueD);
  triangle(175, 245, 203, 190, 231, 245);
  cursor(HAND);
  }

  
  void mousePressed() {
  if(valueD == 0) {
    valueD = 255;
    
  } else {
    valueD = 0;
 
 
 
  }
}
void mouseMoved(){
  valueA = valueA + 5;
  if (valueA > 255) {
    valueA = 0;
  }
  valueB = valueB + 10;
  if (valueB > 255) {
    valueB = 0;
  }
   valueC = valueC + 15;
  if (valueC > 255) {
    valueC = 0;
  }
}

