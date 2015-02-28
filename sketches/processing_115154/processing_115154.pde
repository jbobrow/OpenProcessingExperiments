
// practice on alignment in a grid
// by chen-hsin chang



void setup() {
  size(500, 500);
  background(255);
}
void draw() {
  background(255);
  //set grid number  
  int tileCount =10;  

  //strokeCap function:ROUND/SQUARE/PROJECT
  strokeCap(PROJECT);

  //draw grid
  for (int gridY=0; gridY<height; gridY+=10) {
    for (int gridX=0; gridX<width; gridX+=10) {

      int posX= gridX;
      int posY= gridY;
      int toggle= (int) random(0, 2);      

      if (toggle==0) {
        strokeWeight(1);
        //stroke(100,100,mouseX);
        line(posX, posY, posX+10, posY+10);
      }
      if (toggle==1) {
        strokeWeight(1);
        line(posX, posY+10, posX+10, posY);
      }
      
      
    }
  }
}



