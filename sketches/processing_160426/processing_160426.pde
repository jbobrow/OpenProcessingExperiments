
int x;
int y;
float growSpeed;

 
void setup() {
  //background & Info
 
  size(600,600);
  background(200,250,200);
  x = 300;
  y = 400;
  growSpeed = -0.5f;

  /* circle = createShape(ELLIPSE,x,y-25,30,30);
  circle.setFill(color(50,50,60));
  circle.setStroke(false);*/
  
}

void draw() {
  
  //seed 
 
  fill(65,45,30);
  noStroke();
  ellipse(x,400,50,50);
  
  //stem
  if (mousePressed ==  true) {
    
   y+=growSpeed;
   fill (75,200,100);
  noStroke();
  ellipse(x,y-50,24,24);
  }
  
  //EndGrowth
  if( y<=250) {
    growSpeed=-1000;
   
    //tried to make something blossom at the end, got errors. 
   // createShape(ELLIPSE,x,y-25,30,30);
    
  }
  
  
  
  /*fill (75,200,110);
  noStroke();
  ellipse(x,y-75,18,18);
  
  fill (75,200,110);
  noStroke();
  ellipse(x,y-100,15,15);
  
  fill (75, 200, 110);
  noStroke();
  ellipse(x,y-125,12.5f,12.5f);
*/
  
}



