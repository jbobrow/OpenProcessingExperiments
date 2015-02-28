
void setup() {
  size(297,420);
  background(255);
}
void draw()
{
   for(int ix=50; ix<width; ix+=100)
    {
      for(int iy=50; iy<height; iy+=100)
        {
          int stroke = int((0));
          drawGlass(ix, iy, stroke);
        }    
    }
}
 
void drawGlass(int x, int y, int s)
{
   stroke(s);
   //NECK
   strokeWeight(5);
   line(x,y, x,y+45); 
   //TOP
   strokeWeight(4);
   fill(255,0,100);
   beginShape();
   vertex(x,y);
   vertex(x-40,y-40);
   vertex(x+40,y-40); 
   endShape(CLOSE);
   //BASE
   strokeWeight(3);
   fill(0);
   triangle(x,y+45, x+30,y+50, x-30,y+50);
}

void keyPressed(){ 
save("aaa1.png"); 
} 
