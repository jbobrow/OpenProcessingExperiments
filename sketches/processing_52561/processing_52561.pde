
  //set screen size
  size (250,250);
  //set screen background
  background (255);
  //smooth lines
  smooth();

  for(
  //create new variable a, value is 10, can't be over 125, increases 20
  int a = 10; a<=125; a+=20
  ){
  //first quadrant, always 125px from the left
  
      line (125,a,125-a,125);
  //second quadrant to the right
      line (125,a,125+a,125);
  //bottom left quadrant
      line (125,250-a,125-a,125);
  //bottom right quadrant
      line (125,250-a,125+a,125);
    }

