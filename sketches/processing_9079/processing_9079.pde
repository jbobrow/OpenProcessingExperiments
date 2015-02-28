

int largo = 80;
int r = 0;
int g = 0 ;
int b = 0;
//int unit = width/10; 
void setup() {
  smooth();
  size(800,800);
  frameRate(2);
  background (255);

}

void draw() 
{
  background (255);
 float r = random(255);
  float r2 = random(255);

for (int x = largo; x < width; x+= width/10) 
{
  for (int y = largo; y < height; y+= width/10)
  {
    
    stroke(r2);
    strokeWeight(10);
    
    fill(int( r));

    ellipse(x,y,largo,largo);
   
    
}
 
} 

}


