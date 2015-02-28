
//charlotte stiles (c) 2014 
//cstiles
//HW#5


//global variables
float background;

//figure 1 golabal variables
float sx, sy, sd, sSpeed;

//figure 2 (the larger faster sparkler) variables
float sx2, sy2, sd2, sSpeed2;

void setup()
{
  size( 400, 400 );
  //sparkle speeds
  sSpeed = 2;
  sSpeed2 = 4;

  //sparkle diameters
  sd=30;
  sd2=40;

  //sparkle 1 origin
  sx=sd;
  sy=sd;

  //sparkle 2 origin
  sx2 = width-sd2;
  sy2 = height-sd2;

  background =color(0, 40) ;
} 


void draw()
{
  prepareWindow();
  moveSparkler();
  drawSparkler();
}


void prepareWindow()
{
  noStroke();
  fill(0, 40);
  rect( 0, 0, width, height );
}


void moveSparkler()
{
  //move sparkler 1

  //top edge
  if ((sx < width-sd) && (sy == sd))
  {
    sx = sx + sSpeed;
  }

  //right edge
  else if ((sx == width-sd) && (sy < height-sd))
  {
    sy = sy + sSpeed;
  }

  //bottom edge
  else if ((sx > sd) && (sy == height-sd))
  {
    sx = sx - sSpeed;
  } 

  //left edge 
  else if ((sx == sd) && ( sy > sd ))
  {
    sy = sy - sSpeed;
  }




  //move sparkler 2
  //top edge
  if ((sx2 < width-sd2) && (sy2 == sd2))
  { 
    sx2 = sx2 + sSpeed2;
  }
  //right edge
  else if ((sx2 == width-sd2) && (sy2 < height-sd2))
  { 
    sy2 = sy2 + sSpeed2;
  }
  //bottom edge
  else if ((sx2 > sd2) && (sy2 == height-sd2))
  {

    sx2 = sx2 - sSpeed2;
  } 
  //left edge 
  else if ((sx2 == sd2) && ( sy2 > sd2 ))
  {
    //left edge
    sy2 = sy2 - sSpeed2;
  }
}
void drawSparkler() {
  sparkler( sx, sy, sd); //arguments for locations of figures
  sparkler( sx2, sy2, sd2);
}


void sparkler (float x, float y, float di ) //signature function definition 
{
  stroke (125, 249, 255);
  line(x, y, (x+random(-di, di)), (y+random(-di, di)));
  line(x, y, (x+random(-(di-15), (di-15))), (y+random(-(di-15), di-15)));
  line(x, y, (x+random(-(di-20), (di-20))), (y+random(-(di+10), di+10)));
  line(x, y, (x+random(-di, di)), (y+random(-di, di)));
  line(x, y, (x+random(-(di-15), (di-15))), (y+random(-(di-15), di-15)));
  line(x, y, (x+random(-(di-20), (di-20))), (y+random(-(di+10), di+10)));
  line(x, y, (x+random(-di, di)), (y+random(-di, di)));
  line(x, y, (x+random(-(di-15), (di-15))), (y+random(-(di-15), di-15)));
  line(x, y, (x+random(-(di-20), (di-20))), (y+random(-(di+10), di+10)));
  line(x, y, (x+random(-di, di)), (y+random(-di, di)));
  line(x, y, (x+random(-(di-15), (di-15))), (y+random(-(di-15), di-15)));
  line(x, y, (x+random(-(di-20), (di-20))), (y+random(-(di+10), di+10)));
}
// Key press makes the sparkler speed change!

void keyPressed() {
  if (key=='+') {
    // Increase speed
    sSpeed++;
  }
  else if (key =='-') {
    // Decrease speed
    sSpeed--;
  }
}

