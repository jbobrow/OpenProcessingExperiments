
void setup()
{
  size(400,400);
  background(0);
noStroke();
rectMode(CORNER);
  smooth();  
}


void draw()
{
  pushMatrix();

translate(400-mouseX,0); //mausbewegung umgekehrt.
fill(255);
rect(0,0,10,200);
fill(0);
rect(10,0,10,200);

popMatrix();

pushMatrix();
translate(mouseX-20,200);//-20-> aus dem bild (breite von 2 rect 10+10)
fill(255);
rect(0,0,10,200);
fill(0);
rect(10,0,10,200);

popMatrix();


}






