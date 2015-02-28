
int[] als = {10,40,60,80,90,140 };
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
for (int x = largo/2; x < width; x+= width/10-largo/2) 
{
      
  for (int y = largo/2; y < height; y+= width/10-largo/2)
  {
    noStroke();    
   fill (0,als[ int( random (6) ) ] ) ;

    ellipse(x,y,largo,largo);
   
    
}
 
} 

}


