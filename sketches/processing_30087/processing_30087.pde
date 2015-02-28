
//NESTED FOR LOOPS
//with IF STATEMENTS

size(500, 500);

//Outer loop
for (int x = 20; x< width-20; x+=10)
{
  //Inner loop
  for (int y = 20; y<height-20; y+=10)
  {
    //Conditional Statement
    if (x<=width/2) {
      line(x, y, x-5, y-5);
    }
    else {
      line(x, y, x+5, y-5);
    }
  }
}



