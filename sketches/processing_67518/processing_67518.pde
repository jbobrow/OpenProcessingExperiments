
/*To win game there must be only one image 
 that is complete and the other two that 
 are not. */

PFont title;
PImage back, large, large2, large3, large4;
boolean keyLeft = false;
boolean keyRight = false;
boolean keyA = false;
boolean keyD = false;
float[] rounds = new float[4];
float[] ndrounds = new float[4];
float value = 0; //The total needed for them to win should be 0
float ndvalue = 0;

int count = 0;
float c = 0.00; //time
String mil;
int xvalue = width/2;

boolean t = false; 



int level = 0;
int nlevel = 0;

void setup() {

  title = loadFont("Gulim-80.vlw"); 
  back = loadImage("gradient.png");
  large = loadImage("circ1.png");
  large2 = loadImage("circ2.png");
  large3 = loadImage("circ3.png");
  large4 = loadImage("circ4.png");
  size(1300, 795);
  smooth();
  Time.Initiaize(millis());
  frameRate(30);

  for (int x = 0; x < 4; x ++)
  {
    rounds[x] = round(random(0, 11));
    ndrounds[x] = round(random(0, 11));
  }
}

void draw() 
{
  background(1);

  //Timer

  mil =  "" + (c/1000);


  fill(#ffffff);
  textSize(55);
  text(mil, 650, height/1.3);


  Time.update(millis());

  if (t == true) {
    c += Time.getTimeMili();
  }


  textFont(title);
  fill(175, 11, 11);
  textAlign(CENTER);
  text("Title", width/2, height/10);

  for (int i = 0; i < 4; i ++)
  {
    value += rounds[i];
    ndvalue += ndrounds[i];
  } 

  if (value == 0) 
  {
    textAlign(CENTER);
    text("Right Winner", width/2, height/5);
    t = false;
    keyLeft = false;
    keyRight = false;
    keyA = false;
    keyD = false;
  }
  if (ndvalue == 0) 
  {
    textAlign(CENTER);
    text("Left Winner", width/2, height/5);
    t = false;
    keyLeft = false;
    keyRight = false;
    keyA = false;
    keyD = false;
  }

  // Highlight

  //Turning rings

  if (keyLeft == true) {

    rounds[level] += 1; //.52416667 

    if (rounds[level] > 11)
    {
      rounds[level] = 0;
    }

    keyLeft = false;
  }
  if (keyRight == true) {

    rounds[level] -= 1; 

    /*
    if (rounds[level] > 0 && rounds[level] < 0.4)
     {
     rounds[level] = 0.0;
     }
     */


    if (rounds[level] < 0)
    {
      rounds[level] = 11;
    }

    keyRight = false;
  }



  //Second Player

  if (keyA == true) {

    ndrounds[nlevel] += 1; 

    if (ndrounds[nlevel] > 11)
    {
      ndrounds[nlevel] = 0;
    }

    keyA = false;
  }
  if (keyD == true) {

    ndrounds[nlevel] -= 1; 

    /*  if (ndrounds[level] > 0.0 && ndrounds[level] < 0.4)
     {
     ndrounds[level] = 0.0;
     } 
     */

    if (ndrounds[nlevel] < 0.0)
    {
      ndrounds[nlevel] = 11;
    }

    keyD = false;
  }

  strokeWeight(10);
  stroke(250, 255, 185);
  noFill();
  translate(width/2, height/2);

  imageMode(CENTER);
  translate(300, 0);
if (ndvalue != 0)
{
  image(back, xvalue, 0, 390, 240);
  rotate(rounds[0]*.52416667);
  image(large, 0, 0, 390, 240);
  rotate(-(rounds[0]*.52416667));

  rotate(rounds[1]*.52416667); 
  image(large2, xvalue, 0, 390, 240);
  rotate(-(rounds[1]*.52416667));

  rotate(rounds[2]*.52416667);
  image(large3, xvalue, 0, 390, 240); 
  rotate(-(rounds[2]*.52416667));

  rotate(rounds[3]*.52416667); 
  image(large4, xvalue, 0, 390, 240);
  rotate(-(rounds[3]*.52416667));
}
  if (value != 0 && ndvalue != 0)
  {
    if ( level == 0)
    {
      ellipse(0, 0, 200, 200);
    }
    if ( level == 1)
    {

      ellipse(0, 0, 150, 150);
    }
    if ( level == 2)
    {
      ellipse(0, 0, 100, 100);
    }
    if ( level == 3)
    {

      ellipse(0, 0, 50, 50);
    }

  }

    //2nd player rings
if (value != 0 )
  {
    translate(-600, 0);
    image(back, xvalue, 0, 390, 240);
    rotate(ndrounds[0]*.52416667);
    image(large, 0, 0, 390, 240);
    rotate(-ndrounds[0]*.52416667);

    rotate(ndrounds[1]*.52416667); 
    image(large2, xvalue, 0, 390, 240);
    rotate(-ndrounds[1]*.52416667);

    rotate(ndrounds[2]*.52416667);
    image(large3, xvalue, 0, 390, 240);
    rotate(-ndrounds[2]*.52416667); 

    rotate(ndrounds[3]*.52416667); 
    image(large4, xvalue, 0, 390, 240);
    rotate(-ndrounds[3]*.52416667); 

    if (ndvalue != 0)
    {
      if ( nlevel == 0)
      {
        ellipse(0, 0, 200, 200);
      }
      if ( nlevel == 1)
      {

        ellipse(0, 0, 150, 150);
      }
      if ( nlevel == 2)
      {
        ellipse(0, 0, 100, 100);
      }
      if ( nlevel == 3)
      {

        ellipse(0, 0, 50, 50);
      }
    }
  }

  value = 0;
  ndvalue = 0;
  println(rounds[0]);
  println(rounds[1]);
  println(rounds[2]);
  println(value);
}
void keyPressed() {
  t = true;

  if (keyCode == UP) {
    if (level == 3)
    {
      level = -1;
    } 
    level += 1;
  }

  if (keyCode == DOWN) {
    if (level == 0)
    {
      level = 4;
    } 
    level -= 1;
  }


  if (keyCode == LEFT) {
    keyLeft = true;
  }
  if (keyCode == RIGHT) {
    keyRight= true;
  }


  //Player 2


  if (key == 'w' || key == 'W') {
    if (nlevel == 3)
    {
      nlevel = -1;
    } 
    nlevel += 1;
  }

  if (key == 's' || key == 'S') {
    if (nlevel == 0)
    {
      nlevel = 4;
    } 
    nlevel -= 1;
  }


  if (key == 'a' || key == 'A') {
    keyA = true;
  }
  if (key == 'd' || key == 'D') {
    keyD= true;
  }
}


