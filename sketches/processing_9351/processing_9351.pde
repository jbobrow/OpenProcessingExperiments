

void setup(){

  size(310, 400);
  background(255);
  fill(0);
  noStroke();
  smooth();

}


void draw () 
{  
  shapeMode (CORNER);

  int a = 0;
  int b = 1;

  for ( int i = 0; i <= 24 ; i++)
  {
    if(i <= 12)
    {
    triangle (a-i, height, 0.5, 0, b+i, height);

    translate(((b+i)-(a-i)), 0);
    }
  
    if (i > 12)
    {

    triangle (a-(24-i), height, 0.5, 0, b+(24-i), height);

    translate(((b+24-i)-(a-(24-i))), 0);
    }
  }
  
  noLoop();
  
}



