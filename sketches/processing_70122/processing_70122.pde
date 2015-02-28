
//Dominique A., Animation, CP1, Mod 16-17

int diameter= 0;
void setup()
{
 size(350,400);
 background(0);
 smooth();
 stroke(0);
 }
void draw ()
{
  fill(0,0,0,8);
  rect(0,0,350,400);
  fill(255);
  rect(100,diameter,50,100);
  rect(200,diameter,50,100);
  fill(255,235,5);
  ellipse(175,diameter,diameter,diameter);
  fill(88,90,0);
  ellipse(175,diameter,diameter,70);
  fill(random(255),78,190);
  ellipse(175,diameter,50,50);
  diameter= diameter + 4;
  if(diameter>800)
 {
   background(0);
   diameter= 0;
 }
}
