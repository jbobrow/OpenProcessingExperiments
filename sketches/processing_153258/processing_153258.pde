
// setup function -- called once when the program begins
void setup() {

  // set the display window to size 500 x 500 pixels
  size(500, 500);

  // set the background colour to white
  background(255);
  noLoop();
}

void draw(){
  
  float averageTreeSize = 10;
    float sdTreeSize = 2;

for (int i = 0; i < 500; i++)
 {
    //float treeSize = averageTreeSize + (randomGaussian() * sdTreeSize);
      float treeSize = (10);      
    drawTree( random(5,495), random(5,470), treeSize);
}
}
  void drawTree(float treeX, float treeY, float tSize){
   
    fill(42, 155, 41);       
    ellipse (treeX, treeY, tSize, tSize);
    fill(124, 97, 21);
    rect(treeX-1.5, treeY+(tSize/2), tSize/3, tSize*2);
    
  }
