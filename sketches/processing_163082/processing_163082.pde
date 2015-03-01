
void setup()
{
  size(1000,1000);
frameRate(3);
}

void draw()
{
  background(0);
  strokeWeight(10);
  stroke(255,250,95);
  
if (mousePressed) {
  
   background(255);
  
  line(mouseX, mouseY+200,mouseX+100, Y);
   line(mouseX, mouseY+200,mouseX+100,mouseY+400);
   line(mouseX-200, mouseY+900,mouseX+100,mouseY+400);
   
     line(mouseX, mouseY+200,mouseX+100, Y);
   line(mouseX, mouseY+200,mouseX+100,mouseY+400);
   line(mouseX+100, mouseY+900,mouseX+100,mouseY+400);
   
       line(mouseX, mouseY+200,mouseX+100, Y);
   line(mouseX, mouseY+200,mouseX+100,mouseY+400);
   line(mouseX+100, mouseY+500,mouseX+100,mouseY+400);
   line(mouseX+100, mouseY+500,mouseX+300,mouseY+900);
   
      line(mouseX+500, mouseY+300,mouseX+600, Y);
  line(mouseX+500, mouseY+300,mouseX+200,mouseY+500);
   line(mouseX+200, mouseY+600,mouseX+200,mouseY+500);
  line(mouseX+200, mouseY+600,mouseX+400,mouseY+1000);
     // line(mouseX+250, mouseY+1000,mouseX+100,mouseY);
 
}



strokeWeight(2);
 stroke(255,255,255);

for (float y=10; y<height; y+=100) {
  float snowX = random(0, width);
  //float snowSz = random(5, 15);
 // line(snowX, y+600, snowX, y);
   line(snowX, y, snowX, y+30);
//ellipse ( snowX, y, snowSz, snowSz);

}
}
