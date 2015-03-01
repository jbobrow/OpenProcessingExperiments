
void setup(){
  size(500,500);
  noStroke();
}
void draw(){

  int rows,cols;
  int cellSize=20;
  float margin=50;
  float colSpace,rowSpace;
  float greys[]={10,35,70,105,140,175,210,240,250};
  
  background(255); 

  cols=int(float(mouseX)/float(width)*20);
  rows=int(float(mouseY)/float(height)*20);

  colSpace=(width-margin*2)/cols;
  rowSpace=(height-margin*2)/rows;
  
  for(int i=0;i<cols;i++){
    for(int j=0;j<rows;j++){
      if(i*cols+j<greys.length){ //Set fill colour to RED if object number is greater than number of items in array
        fill(greys[i*cols+j]);
      } else {
        fill(255,0,0,255*(i*cols+j)/(rows*cols));
      }
      ellipse(margin+colSpace*(0.5+i),margin+rowSpace*(0.5+j),cellSize,cellSize);
    }
  }
  println(colSpace,rowSpace,cellSize,mouseX,mouseY,cols,rows);
}


