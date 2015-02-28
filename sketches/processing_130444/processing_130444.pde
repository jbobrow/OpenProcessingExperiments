
void setup() {
  size(500, 500);
  background(255);
  noLoop();
}

void draw() {

  int triangleHeight=20;
  int triangleWidth=20;


  for (int y=0;y<500;y=y+triangleHeight)
  {
    for (int x=0;x<500;x=x+triangleWidth)
    {

      int selector=int(random(4));
      switch(selector)
      {
      case 0: 
        fill(0);
        triangle(x, y, x+20, y, x, y+20);
        break;
      case 1: 
        fill(0);
        triangle(x, y, x+20, y, x+20, y+20);
        break;
      case 2: 
        fill(0);
        triangle(x, y+20, x+20, y, x+20, y+20);
        break;
      case 3: 
        fill(0);
        triangle(x, y, x, y+20, x+20, y+20);
        break;
      }
    }
  }
}
void keyPressed () {
  for (int q = 0; q > 1; q = q) {
    loop();
    int triangleHeight=20;
    int triangleWidth=20;

    if (key == 'm' || key == 'M') {
      for (int y=0;y<500;y=y+triangleHeight)
      {
        for (int x=0;x<500;x=x+triangleWidth)
        {
          q++;
          int selector=int(random(4));
          switch(selector)
          {
          case 0: 
            fill(0);
            triangle(x, y, x+20, y, x, y+20);
            break;
          case 1: 
            fill(0);
            triangle(x, y, x+20, y, x+20, y+20);
            break;
          case 2: 
            fill(0);
            triangle(x, y+20, x+20, y, x+20, y+20);
            break;
          case 3: 
            fill(0);
            triangle(x, y, x, y+20, x+20, y+20);
            break;
          }
        }
      }
    }
  }
}



