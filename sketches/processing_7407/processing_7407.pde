
PShape wheel;
PImage reelBW;
PImage curImg;
//PImage bigImg;
PFont font;
float wheelCount;
float rem = 0;

void setup()
{
  size(640,480);
  smooth();
  
  wheel = loadShape("reel_large.svg");
  reelBW = loadImage("reel_photos_bw.png"); 
  font = loadFont("Arial-BoldMT-16.vlw");
}

void draw()
{
  background(204);

  pushMatrix();  
  rotate(radians(-wheelCount));
  
  if(wheelCount > 360)
  {
    wheelCount = wheelCount - 360;
  }
  
  if(mousePressed)
  {
    wheelCount+=2;
    println(wheelCount);
  }
  else
  {
    rem = wheelCount%22.5;
    if(rem != 0)
    {
      wheelCount = wheelCount - rem;
    }
  }
  
  image(reelBW, -480,-480);
  popMatrix();
  
  if(mouseX > 318 && mouseY > 9 && mouseX < 475 && mouseY < 148)
  {
    if(wheelCount < 22.5)
    {
      curImg = loadImage("th1.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Tony Hawk", 500,100);
      text("- Big Air McTwist", 500,118);
    } 
    else if(wheelCount < 45)
    {
      curImg = loadImage("th2.png");
      image(curImg, 324,15);
      textFont(font);
      fill(0);
      text("Tony Hawk", 500,100);
      text("- Arial Grind", 500,118);
    }
    else if(wheelCount < 67.5)
    {
      curImg = loadImage("dw1.png");
      image(curImg, 324,14);
      textFont(font);
      fill(0);
      text("Danny Way", 500,100);
      text("- Great Wall Jump", 500,118);
    }
    else if(wheelCount < 90)
    {
      curImg = loadImage("dw2.png");
      image(curImg, 324,13);
      textFont(font);
      fill(0);
      text("Danny Way", 500,100);
      text("- Melon Grab", 500,118);
    }
    else if(wheelCount < 112.5)
    {
      curImg = loadImage("ek1.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Eric Koston", 500,100);
      text("- Crooked Grind", 500,118);
    }
    else if(wheelCount < 135)
    {
      curImg = loadImage("ek2.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Eric Koston", 500,100);
      text("- Noseslide", 500,118);
    }
    else if(wheelCount < 157.5)
    {
      curImg = loadImage("rm1.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Rodney Mullen", 500,100);
      text("- Ollie", 500,118);
    }
    else if(wheelCount < 180)
    {
      curImg = loadImage("rm2.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Rodney Mullen", 500,100);
      text("- Truck Stand", 500,118);
    }
    else if(wheelCount < 202.5)
    {
      curImg = loadImage("pr1.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Paul Rodriguez", 500,100);
      text("- Gap Nollie", 500,118);
    }
    else if(wheelCount < 225)
    {
      curImg = loadImage("pr2.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Paul Rodriguez", 500,100);
      text("- Tre Flip", 500,118);
    }
    else if(wheelCount < 247.5)
    {
      curImg = loadImage("ds1.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Daewon Song", 500,100);
      text("- Nollie Flip", 500,118);
    }
    else if(wheelCount < 270)
    {
      curImg = loadImage("ds2.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Daewon Song", 500,100);
      text("- Nose Stall", 500,118);
    }
    else if(wheelCount < 292.5)
    {
      curImg = loadImage("cc1.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Chris Cole", 500,100);
      text("- Noseblunt Grind", 500,118);
    }
    else if(wheelCount < 315)
    {
      curImg = loadImage("cc2.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Chris Cole", 500,100);
      text("- Ollie North", 500,118);
    }
    else if(wheelCount < 337.5)
    {
      curImg = loadImage("bb1.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Bob Burnquist", 500,100);
      text("- Kickflip Hand Flip", 500,118);
    }
    else if(wheelCount < 360)
    {
      curImg = loadImage("bb2.png");
      image(curImg, 323,15);
      textFont(font);
      fill(0);
      text("Bob Burnquist", 500,100);
      text("- Vert Flip", 500,118);
    }
  }
  
  pushMatrix();
  rotate(radians(-wheelCount));
  if(mousePressed)
  {
    wheelCount+=2;
    println(wheelCount);
  }
  else
  {
    rem = wheelCount%22.5;
    if(rem != 0)
    {
      wheelCount = wheelCount - rem;
    }
  }
  shape(wheel, 0,0);
  popMatrix();
   
}


