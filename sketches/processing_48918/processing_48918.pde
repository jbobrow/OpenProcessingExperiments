
void setup ()
{
  size(400, 600);
  background(71, 147, 18);
  smooth();
  textAlign( CENTER );
  noLoop ();     //run draw() only ONCE

}

void draw()
{
 
  textSize(45 );
  fill (147,18,18);
  
  text( "Merry Christmas!",width/2, height/2);
}

void keyPressed ()
{
  save ("snapshot.jpg");
}               
