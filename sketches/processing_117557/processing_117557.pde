
//Jeff Guo
//Interactive Prototyping 3
//Oct 17
//Refrigerator Generator
//All Rights Reserved



void setup() {
  size(800, 200);
  noLoop();
}

void draw() {
  background(255);
  for (int i = 5; i<width; i+=80) {
    refrigerator(i,random(20,35),random(30,60),random(85,105),random(255),random(255),random(255) );
  }
}

void refrigerator(float p, float x, float y, float y0, float r, float g, float b)
{

  //refrigerator body
  fill(r, g, b);
  rect(p, 50, 70, 100, 5);
  
  
  //vertical door crack
  fill(0);
  rect(p+x, 50, 2, 100);
 
  //horizontal door crack
  rect(p+x,y+50, 70-x, 2);
  
  fill(255);
  
  //horizontal handle
  rect(p+5,y0, x-10,3,1);
  
  //vertical handle
  rect(p+x+8, y/2 +40, 3, 20);
  
  rect(p+x+8, y/2+90, 3, 20);
   
}
void mouseClicked() {
redraw();
}


