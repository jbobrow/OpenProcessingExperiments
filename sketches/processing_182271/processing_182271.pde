
float angolo;
float due;
void setup() 
{
  size (800, 600);
  background (255);
  angolo = 0;
  due = 0;
}
void draw()
{
  background(190, 245, 237);
  translate(width/2, height/2);
  stroke (255,254,0);
  fill (255,254,0);
  ellipse(0, 0, 100, 100);

  for (int i=0; i<8; i=i+1)
  { 
   
    rotate(angolo);
    angolo = PI/4;
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(0, 150, 100, 200);
  }

}
