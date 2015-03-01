
int x;
int y;
float growSpeed;
float budSize;
float budGrow;
 
void setup() {
  //background & Info
 
  size(600,600);
  background(200,250,200);
  x = 300;
  y = 400;
  growSpeed = -0.5f;
  budSize = .5f;
  budGrow = 5.5f;

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
  ellipse(x,y-50,15,15);
  }
  
  //EndGrowth
  if( y<=250) {
    growSpeed=-1000;
    
    if(mousePressed== true) {
     budSize+=budGrow*2;
   }
   
    fill(75,200,80);
    noStroke();
    
    ellipse(x,y-75,budSize+10,budSize+10);
    
    ellipse(x,y-110,budSize,budSize-50);
    
    ellipse(x-40,y-75,budSize+15,budSize);
    
    ellipse(x+40,y-75,budSize+15,budSize);


  

   
  
   
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




