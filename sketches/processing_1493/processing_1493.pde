
void setup()
{ 
  size( 800 , 400 );
  smooth(); // Yumoş gibi bişi
  background( 255 );
}

void draw()
{
}

void mousePressed()
{
  fill(random (65),random(105),random(19)); 
  ellipse (      random(0,800) , random(0,400) , 50 , 50      );  
}

void keyPressed()
{  
  fill(random (165),random(10),random(90)); 
  rect(random(800),random(400),50,50);    
}




