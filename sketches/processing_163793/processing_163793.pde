
float delta = 8;
float  X1, Y1 =0;
 
void setup()
{
  size(600,800, P3D);
  frameRate(1);
}
 
void draw()
{
  background(90,45,30);

  for(int i=0; i<width; i+=20){
    drawOreo(i, random(0,height));
  
  }  
}
void drawOreo(float x, float y){
   fill(255);
   noStroke();
   rect(x,y,5,35);
   fill(0);
   noStroke();
   rect(x-5,y-2,5,40);
   fill(0);
   noStroke();
   rect(x+5,y-2,5,40);
   fill(255);
   noStroke();
   box(1300,340,70);
   fill(130,80,50);
   noStroke();
   box(1300,640,70);

}
