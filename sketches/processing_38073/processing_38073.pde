
int x = 0;
int y = 0;
int distance =25;
   
void setup() {
  size (500, 500);


}


void draw() {
  background(0);
  strokeWeight(1);
  stroke(0, 255, 255);
  smooth();

  for (int i=0; i<21; i++)
  { 
    line(i*distance, 0, mouseX, mouseY);
  }
  for (int j=x; j<21; j++)
  {
    line(mouseX,mouseY, (j*distance),500);
  }
}
                
