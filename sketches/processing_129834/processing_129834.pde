
int shapeselect;
int r;
int g;
int b;
int inc;
int x = 500;
int y = 500;
int ptstroke = 1;
int x2 = 700;
int y2 = 700;
int linestroke = 1;
int rad1 = 1;
int rad2 = 1;
int x3 = 900;
int y3 = 900;
int widthr = 1;
int heightr = 1;
int ballx = 450;
int trans = 255;
boolean disableball = true;
ArrayList<Integer> shapesave;
void setup()
{
  background(255);
  size(1200,1000);
  int shapeselect = 0;
  shapesave = new ArrayList<Integer>(); 
  shapesave.add(0,500); //x pt
  shapesave.add(1,500); //y pt
  shapesave.add(2,300); //x lin
  shapesave.add(3,300); //y lin
  shapesave.add(4,700); //x2 lin
  shapesave.add(5,700); //y2 lin
  shapesave.add(6,500); //x ellipse
  shapesave.add(7,500); //y ellipse
  shapesave.add(8,500); //x tri
  shapesave.add(9,500); //y tri
  shapesave.add(10,700); //x2 tri
  shapesave.add(11,700); //y2 tri
  shapesave.add(12,900); //x3 tri
  shapesave.add(13,900); //y3 tri
  shapesave.add(14,500); //x rect
  shapesave.add(15,500); //y rect
  inc = 1;
}

void draw()
{
  noCursor();
  background(255);
  drawshape();
  rectMode(CORNER);
  textAlign(LEFT);
  textSize(12);
  fill(155,0,0); //Text color red
  text("Red value(R to change):",0,25); //Red text
  text(r,150,25); //Red value
  if (inc == 0)
  {
    textSize(14);
    fill(255,0,0);
    text("You are currently adding nothing to values, therefore nothing will change.",320,125);
    textSize(12);
  }
  fill(0,155,0); //Text color green
  text("Green value(G to change):",0,50); //Green text
  text(g,150,50); //Green value
  fill(0,0,155); //Text color blue
  text("Blue value(B to change):",0,75); //Blue text
  text(b,150,75); //Blue value
  fill(0); //Text color black
  text("Adding to values(T to increase, Y to decrease):",0,100); //Value add text
  text(inc,275,100); //Add value
  text("Current shape(Number keys to change):",0,125); //Shape text
  text("Press ~ key to randomize options.",450,25);
  text("(To reset everything to default settings, press 0)",410,50);
  text("Transparency(Change with E)",0,150);
  text(trans,180,150);
  fill(150,150,150);
  text("Enable ball with J, turn off with H",450,80);
  if (disableball == false) //Disables ball
  {
    ball();
  }
  if (shapeselect == 0) //Point info
  {
    fill(0);
    stroke(0);
    strokeWeight(1);
    text("Point",235,125);
    text("POINT INFORMATION BOX",900,25);
    line(900,27,1047,27);
    text("X Coordinate(Change with k):",900,50);
    text(x,1075,50);
    text("Y Coordinate(Change with l):",900,75);
    text(y,1075,75);
    text("Size(Change with s):",900,100);
    text(ptstroke,1075,100);
    fill(255,255,255,0);
    rect(850,0,1000,175);
  }
  if (shapeselect == 1) // Line info
  {
    fill(0);
    stroke(0);
    strokeWeight(1);
    text("Line",235,125);
    text("LINE INFORMATION BOX",900,25);
    line(900,27,1037,27);
    text("First X Coordinate(Change with k):",900,50);
    text(x,1125,50);
    text("First Y Coordinate(Change with l):",900,75);
    text(y,1125,75);
    text("Second X Coordinate(Change with n):",900,100);
    text(x2,1125,100);
    text("Second Y Coordinate(Change with m):",900,125);
    text(y2,1125,125);
    text("Size(Change with s):",900,150);
    text(linestroke,1125,150);
    fill(255,255,255,0);
    rect(850,0,1000,175);
  }
  if (shapeselect == 2) // Ellipse info
  {
    fill(0);
    stroke(0);
    strokeWeight(1);
    text("Ellipse",235,125);
    text("ELLIPSE INFORMATION BOX",900,25);
    line(900,27,1055,27);
    text("First X Coordinate(Change with k):",900,50);
    text(x,1125,50);
    text("First Y Coordinate(Change with l):",900,75);
    text(y,1125,75);
    text("Radius 1(Change with s):",900,100);
    text(rad1,1125,100);
    text("Radius 2(Change with a):",900,125);
    text(rad2,1125,125);
    fill(255,255,255,0);
    rect(850,0,1000,150);
  }
  if (shapeselect == 3) // Tri info
  {
    fill(0);
    stroke(0);
    strokeWeight(1);
    text("Triangle",235,125);
    text("TRIANGLE INFORMATION BOX",900,25);
    line(900,27,1071,27);
    text("First X Coordinate(Change with k):",900,50);
    text(x,1125,50);
    text("First Y Coordinate(Change with l):",900,75);
    text(y,1125,75);
    text("Second X Coordinate(Change with n):",900,100);
    text(x2,1125,100);
    text("Second Y Coordinate(Change with m):",900,125);
    text(y2,1125,125);
    text("Third X Coordinate(Change with o):",900,150);
    text(x3,1125,150);
    text("Third Y Coordinate(Change with p):",900,175);
    text(y3,1125,175);
    fill(255,255,255,0);
    rect(850,0,1000,225);
  }
  if (shapeselect == 4) // Rect info
  {
    fill(0);
    stroke(0);
    strokeWeight(1);
    text("Rectangle",235,125);
    text("RECTANGLE INFORMATION BOX",900,25);
    line(900,27,1083,27);
    text("First X Coordinate(Change with k):",900,50);
    text(x,1125,50);
    text("First Y Coordinate(Change with l):",900,75);
    text(y,1125,75);
    text("Width(Change with s):",900,100);
    text(widthr,1125,100);
    text("Height(Change with a):",900,125);
    text(heightr,1125,125);
    fill(255,255,255,0);
    rect(850,0,1000,150);
  }
  fill(255,255,255,0);
  stroke(0);
  strokeWeight(1);
  rect(0,0,310,155);
}

void keyPressed()
{
  if (key == 't' || key == 'T') // Increase add by var
  {
    inc = inc + 1;
    if (inc > 255)
    {
      inc = 255;
    }
  }
  if (key == 'y' || key == 'Y') // Decrease add by var
  {
    inc = inc - 1;
    if (inc < -255)
    {
      inc = -255;
    }
  }
  if (key == 'r' || key == 'R') // Red
  {
    r = r + inc;
    if (r < 0)
    {
      r = 0;
    }
    if (r > 255)
    {
      r = 255;
    }
  }
  if (key == 'g' || key == 'G') // Green
  {
    g = g + inc;
    if (g < 0)
    {
      g = 0;
    }
    if (g > 255)
    {
      g = 255;
    }
  }
  if (key == 'b' || key == 'B') // blue
  {
    b = b + inc;
    if (b < 0)
    {
      b = 0;
    }
    if (b > 255)
    {
      b = 255;
    }
  }
  if (key == '1') // Switch to point
  {
    shapeselect = 0;
    x = shapesave.get(0);
    y = shapesave.get(1);
  }
  if (key == '2') // Switch to line
  {
    shapeselect = 1;
    x = shapesave.get(2);
    y = shapesave.get(3);
    x2 = shapesave.get(4);
    y2 = shapesave.get(5);
  }
  if (key == '3') // Switch to ellipse
  {
    shapeselect = 2;
    x = shapesave.get(6);
    y = shapesave.get(7);
  }
  if (key == '4') // Switch to tri
  {
    shapeselect = 3;
    x = shapesave.get(8);
    y = shapesave.get(9);
    x2 = shapesave.get(10);
    y2 = shapesave.get(11);
    x3 = shapesave.get(12);
    y3 = shapesave.get(13);
  }
  if (key == '5') // Switch to rect
  {
    shapeselect = 4;
    x = shapesave.get(14);
    y = shapesave.get(15);
  }
  if (key == 's') // Size1 increase
  {
    if (shapeselect == 0)
    {
      ptstroke = ptstroke + inc;
      if (ptstroke < 0)
      {
        ptstroke = 0;
      }
    }
    if (shapeselect == 1)
    {
      linestroke = linestroke + inc;
      if (linestroke < 0)
      {
        linestroke = 0;
      }
    }
    if (shapeselect == 2)
    {
      rad1 = rad1 + inc;
      if (rad1 < 0)
      {
        rad1 = 0;
      }
    }
    if (shapeselect == 4)
    {
      widthr = widthr + inc;
      if (widthr < 0)
      {
        widthr = 0;
      }
    }
  }
  if (key == 'a') //Size 2 increase
  {
    if (shapeselect == 2)
    {
      rad2 = rad2 + inc;
      if (rad2 < 0)
      {
        rad2 = 0;
      }
    }
    if (shapeselect == 4)
    {
      heightr = heightr + inc;
      if (heightr < 0)
      {
        heightr = 0;
      }
    }
  }
  if (key == 'k') // x
  {
    x = x + inc;
    if (x < 0)
    {
      x = 0;
    }
    if (x > 1200)
    {
      x = 1200;
    }
  }
  if (key == 'l') // y
  {
    y = y + inc;
    if (y < 0)
    {
      y = 0;
    }
    if (y > 1000)
    {
      y = 1000;
    }
  }
  if (key == 'n') // x2
  {
    x2 = x2 + inc;
    if (x2 < 0)
    {
      x2 = 0;
    }
    if (x2 > 1200)
    {
      x2 = 1200;
    }
  }
  if (key == 'm') // y2 
  {
    y2 = y2 + inc;
    if (y2 < 0)
    {
      y2 = 0;
    }
    if (y2 > 1000)
    {
      y2 = 1000;
    }
  }
  if (key == 'o') // x3
  {
    x3 = x3 + inc;
    if (x3 < 0)
    {
      x3 = 0;
    }
    if (x3 > 1200)
    {
      x3 = 1200;
    }
  }
  if (key == 'p') // y3
  {
    y3 = y3 + inc;
    if (y3 < 0)
    {
      y3 = 0;
    }
    if (y3 > 1000)
    {
      y3 = 1000;
    }
  }
  if (key == '~' || key == '`') //randomizer
  {
    shapesave.set(0,int(random(0,1200))); //x pt
    shapesave.set(1,int(random(0,1000))); //y pt
    shapesave.set(2,int(random(0,1200))); //x lin
    shapesave.set(3,int(random(0,1000))); //y lin
    shapesave.set(4,int(random(0,1200))); //x2 lin
    shapesave.set(5,int(random(0,1000))); //y2 lin
    shapesave.set(6,int(random(0,1200))); //x ellipse
    shapesave.set(7,int(random(0,1000))); //y ellipse
    shapesave.set(8,int(random(0,1200))); //x tri
    shapesave.set(9,int(random(0,1000))); //y tri
    shapesave.set(10,int(random(0,1200))); //x2 tri
    shapesave.set(11,int(random(0,1000))); //y2 tri
    shapesave.set(12,int(random(0,1200))); //x3 tri
    shapesave.set(13,int(random(0,1000))); //y3 tri
    shapesave.set(14,int(random(0,1200))); //x rect
    shapesave.set(15,int(random(0,1000))); //y rect
    r = int(random(0,255));
    g = int(random(0,255));
    b = int(random(0,255));
    ptstroke = int(random(0,200));
    linestroke = int(random(0,200));
    rad1 = int(random(0,200));
    rad2 = int(random(0,200));
    heightr = int(random(0,200));
    widthr = int(random(0,200));
    trans = int(random(0,255));
    if (shapeselect == 0)
    {
      x = shapesave.get(0);
      y = shapesave.get(1);
    }
    if (shapeselect == 1)
    {
      x = shapesave.get(2);
      y = shapesave.get(3);
      x2 = shapesave.get(4);
      y2 = shapesave.get(5);
    }
    if (shapeselect == 2)
    {
      x = shapesave.get(6);
      y = shapesave.get(7); 
    }
    if (shapeselect == 3)
    {
      x = shapesave.get(8);
      y = shapesave.get(9);
      x2 = shapesave.get(10);
      y2 = shapesave.get(11);
      x3 = shapesave.get(12);
      y3 = shapesave.get(13); 
    }
    if (shapeselect == 4)
    {
      x = shapesave.get(14);
      y = shapesave.get(15);
    }
    
  }
  if (key == 'h' || key == 'H') 
  {
    disableball = true;
  }
  if (key == 'j' || key == 'J')
  {
    disableball = false;
  }
  if (key == 'e' || key == 'E') //transparency
  {
    trans = trans + inc;
    if (trans > 255)
    {
      trans = 255;
    }
    if (trans < 0)
    {
      trans = 0;
    }
  }
  if (key == '0') // Clear
  {
    shapesave.set(0,500); //x pt
    shapesave.set(1,500); //y pt
    shapesave.set(2,300); //x lin
    shapesave.set(3,300); //y lin
    shapesave.set(4,700); //x2 lin
    shapesave.set(5,700); //y2 lin
    shapesave.set(6,500); //x ellipse
    shapesave.set(7,500); //y ellipse
    shapesave.set(8,500); //x tri
    shapesave.set(9,500); //y tri
    shapesave.set(10,700); //x2 tri
    shapesave.set(11,700); //y2 tri
    shapesave.set(12,900); //x3 tri
    shapesave.set(13,900); //y3 tri
    shapesave.set(14,500); //x rect
    shapesave.set(15,500); //y rect
    r = 0;
    g = 0;
    b = 0;
    ptstroke = 1;
    linestroke = 1;
    rad1 = 1;
    rad2 = 1;
    heightr = 1;
    widthr = 1;
    inc = 1;
    trans = 255;
    if (shapeselect == 0)
    {
      x = shapesave.get(0);
      y = shapesave.get(1);
    }
    if (shapeselect == 1)
    {
      x = shapesave.get(2);
      y = shapesave.get(3);
      x2 = shapesave.get(4);
      y2 = shapesave.get(5);
    }
    if (shapeselect == 2)
    {
      x = shapesave.get(6);
      y = shapesave.get(7); 
    }
    if (shapeselect == 3)
    {
      x = shapesave.get(8);
      y = shapesave.get(9);
      x2 = shapesave.get(10);
      y2 = shapesave.get(11);
      x3 = shapesave.get(12);
      y3 = shapesave.get(13); 
    }
    if (shapeselect == 4)
    {
      x = shapesave.get(14);
      y = shapesave.get(15);
    }
  }
}

void drawshape()
{
  if (shapeselect == 0) // point
  {
    fill(r,g,b,trans);
    stroke(r,g,b);
    strokeWeight(ptstroke);
    point(x,y);
    shapesave.set(0,x);
    shapesave.set(1,y);
  }
  if (shapeselect == 1) // line
  {
    fill(r,g,b,trans);
    stroke(r,g,b);
    strokeWeight(linestroke);
    line(x,y,x2,y2);
    shapesave.set(2,x);
    shapesave.set(3,y);
    shapesave.set(4,x2);
    shapesave.set(5,y2);
  }
  if (shapeselect == 2) // ellipse
  {
    fill(r,g,b,trans);
    stroke(r,g,b);
    strokeWeight(1);
    ellipseMode(CENTER);
    ellipse(x,y,rad1,rad2);
    shapesave.set(6,x);
    shapesave.set(7,y);
  }
  if (shapeselect == 3) // tri
  {
    fill(r,g,b,trans);
    stroke(r,g,b);
    strokeWeight(1);
    triangle(x,y,x2,y2,x3,y3);
    shapesave.set(8,x);
    shapesave.set(9,y);
    shapesave.set(10,x2);
    shapesave.set(11,y2);
    shapesave.set(12,x3);
    shapesave.set(13,y3);
  }
  if (shapeselect == 4) // rect
  {
    fill(r,g,b,trans);
    stroke(r,g,b);
    strokeWeight(1);
    rectMode(CENTER);
    rect(x,y,widthr,heightr);
    shapesave.set(14,x);
    shapesave.set(15,y);
  }
}



void ball() // ball
{
  stroke(r,g,b);
  strokeWeight(1);
  ellipseMode(CENTER);
  fill(r,g,b);
  ellipse(ballx,55,5,5);
  ballx = ballx + 1;
  if (ballx > 1200)
  {
    ballx = 0;
  }
}

