
void setup() 
{
  size(500, 500);

}
  
void draw() {
  
  background(255, 255, 255);
  stroke(0);
  float w=17;
  float h=20;
  for (int x = 0; x <500; x += 34)
  for (int y = 0; y <500; y+=60) 
  {
line(x,y+10,x+17,y);
line(x+17,y,x+34,y+10);
line(x,y+10,x+17,y+20); 
line(x+17,y+20,x+34,y+10);
line(x,y+10,x,y+30);
line(x+17,y+20,x+17,y+40);
line(x,y+30,x+17,y+40);
line(x+17,y+40,x+34,y+50);
line(x+34,y+30,x+17,y+40);
line(x+51,y+40,x+34,y+50);
line(x+17,y+40,x+17,y+60);
line(x+34,y+50,x+34,y+70);
fill(200);
quad(x,y+10,x+17,y+20,x+17,y+40,x,y+30);
fill(100);
quad(x+34,y+50,x+51,y+40,x+51,y+60,x+34,y+70);
fill(100);
quad(x+17,y+20,x+34,y+10,x+34,y+30,x+17,y+40);
fill(200);
quad(x+17,y+40,x+34,y+50,x+34,y+70,x+17,y+60);
}
 
  }
