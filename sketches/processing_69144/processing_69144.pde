
//Cristen Wong, Loops,  CP1, Mods 16/17

size(500, 500);
background(0);
stroke(105);
fill(12, 154, 167, 100);

  int h = 30;
  int x = 25;
  int w = 50;
  int y = 20;
  while (x < 500) 
  {
    bezier(x, y, 30, h, 275, w, 210, 80); 
    bezier(x, y, 200, h, 30, w, 20, 300);
    h = h + 25;
    x = x + 20;
    w = w + 10;
    y = y + 15;
  }

  int x2 = 213;
  int y2 = 80;
  while (x2 < 500)
  {
    triangle(x2, y2, 230, 444, 481, 367);
    x2 = x2 + 6;
    y2 = y2 + 6;
  }
