
void setup() {
  size(displayWidth,displayHeight);
  background(#13808c);
  float treeXPosition = displayWidth / 2.0;
  drawTree(0,0);
  drawTree(500,100);
  drawCloud();  
  }

void drawTree(float xPosition, float yPosition){
  //Trunk//
  fill(#6a482d);
  rect(453+xPosition,600+yPosition,65,250,0,0,7,7);
  
   //treemain//
  fill(#7da649);
  triangle(200+xPosition,600+yPosition,480+xPosition,100+yPosition,760+xPosition,600+yPosition);
  }
  
void drawCloud(){
  fill(#ffffff);
  ellipse(40,250,100,100);
  
  ellipse(160,250,100,100);
  
    noStroke();

  ellipse(100,250,100,100);
}
