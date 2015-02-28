

//import processing.pdf.*;
void setup() 
{
//  size(600, 600,PDF,"pattern.pdf");
  size(600, 600);
  noStroke();
  smooth();
  noLoop();
}

void draw() 
{
  drawRect(0,0,35,35,35,35,0); 
}

//int num = 0;
void drawRect(int x,int y,int maxh, int maxw,int levelh,int levelw,int nth) 
{  
  int minh = maxh/levelh;
  int minw = maxw/levelw;

for(int i = 0; i < levelh; i = i+1)
{
  for(int j = 0; j < levelw; j = j+1){
      if(nth%2 == 1){fill(255);}        //black
        else{fill(0);}                 //white
   rect(x,y,minh*i,minw*j);
   y = y + minw*j;
 nth = nth +1;
}
y = 0;
  x = x + minh*i;
} 
}

