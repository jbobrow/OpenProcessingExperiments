
void schlaeger()
{

 
  if (x >= schlaegerX && x <= schlaegerX+schlaegerwidth && y == height-40 || x+10 >= schlaegerX && x-10 <= schlaegerX+schlaegerwidth && y == height-40 )
  {
    addtoy--;
    
    punkte++;
    tenpoints++;
  } else if ( x >= schlaegerX-11 && x <= schlaegerX-9 && y >= height-40 && y <= height-20) 
  {
    addtoy++;
    addtox--;
  } else if ( x >= schlaegerX+schlaegerwidth+9 && x <= schlaegerX+schlaegerwidth+11 && y >= height-40 && y <= height-20 )
  {
    addtox++;
    addtoy++;
  }

  fill(0);


  image(schlaeger, schlaegerX, height-30, schlaegerwidth, 20);
  

  

  if (tenpoints >= 10 && !(schlaegerwidth <= 40))
  {
    tenpoints = 0;
    schlaegerwidth -= 20;
  }
}


