
void setup(){
  size(300,600);
  smooth();

}



void draw()
{
  fill(255,248,23);
  triangle(0, 100, 150, 100, 0, 200); 
  fill(255,167,3);
  triangle(0, 200, 150, 100, 0, 700);
  fill(255,41,3);
  triangle(0, 600, 150, 100, 100, 600);
  triangle(200, 600, 150, 100, 300, 600);
  fill(255,3,112);
  triangle(100,600,150,100,200,600);
  fill(255,167,3);
  triangle(300, 600, 150, 100, 500, 300);
  fill(255,248,23);
  triangle(500, 300, 150, 100, 350, 100);
  fill(0);
  rect(0, 0, 300, 25);
  fill(255);
  rect(0, 25, 300, 25);
  fill(0);
  rect(0, 50, 300, 25);
  fill(255);
  rect(0, 75, 300, 25);
  
}
