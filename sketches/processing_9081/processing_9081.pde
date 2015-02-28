
int[] als = {0,10,60,80,90,140 };
//int s = second(); 
  int largo = 80;
void setup() {
  smooth();
  size(800,800);

  frameRate(2);
 
}

void draw() 
{
background (255);
for (int x = largo; x < width-largo/2; x+= width/10-largo/2) 
{
      
  for (int y = largo; y < height-largo/2; y+= width/10-largo/2)
  {
    
   
    
    noStroke();    
   fill (0,als[ int( random (6) ) ] ) ;

    ellipse(x,y,mouseX,mouseX);
   
}
 
} 

}


