
int rows = 20;
int cols = 15;


rectangle[] rects = new rectangle[rows*cols];

int rectNumber=0;


class rectangle {

  
int r_w = 30;
int g_b = 0;

int maxWidth=r_w;

boolean mouseOver;
boolean increase=false;

int flipTick=0;

int redColor=255;

  
rectangle(){
 mouseOver = false;
  }



 void drawRectangle(int i, int j){
   
  fill(redColor, g_b, g_b);
  rectMode(CENTER);
  rect(i*30 + 15, j*40 + 20, r_w, 40);
  
  if(mouseX< (i*30)+r_w/2 && mouseX > (i*30)-(r_w)/2 && mouseY > (j*40)-(40/2) && mouseY < (j*40)+(40/2) && mouseOver==false)
  {
    mouseOver=true;
  }
  
  if(mouseOver)
  {
    redColor=(int)((float)r_w/maxWidth*255);
    
    
    if(increase) r_w++;
    else r_w--;
    
    if(increase && r_w > maxWidth) increase=false;
    if(!increase && r_w< 0) increase=true;
     flipTick++; 
    if(flipTick>1 && r_w == maxWidth)
    {
      flipTick=0;
     increase=false;
      mouseOver=false; 
     }
    
  }
  
  
  
 }
 
}

void setup(){
  size (600, 600);
  frameRate(80);
  background (255);
  
  for(int k = 0; k<rows*cols; k++){
    rects[k] = new rectangle();
 }
}

void draw(){
  background (255);
  for (int i=0; i<rows; i++ ){
    for (int j=0; j<cols; j++ ){

       rects[rectNumber].drawRectangle(i, j);
       rectNumber++;
      }
    }
    
    if(rectNumber==rows*cols) rectNumber=0;
    
  }




