
PImage cat1;
PImage cat2;
PImage boy1;
PImage boy2;
PImage man1;
PImage man2;
int counter=0;
int fade = -100;

void setup()
{
  size(800, 450);
  background(5, 25, 165);
  smooth();
  textSize(24);
  textAlign(CENTER);


  noStroke();
  fill(0, 125, 10);
  rect(0, height-35, width, 35);
  fill(255, 255, 0);
  ellipse(width, 0, 150, 150);

  cat1 = loadImage("black cat.png");
  cat2 = loadImage("gray cat.png");
  boy1 = loadImage("Boy1.png");
  boy2 = loadImage("Boy2.png");
  man1 = loadImage("Man1.png");
  man2 = loadImage("Man2.png");
}


void draw()
{
  if (counter < 3)
  {
    page1();
  }
  
  if (counter < 5)
  {
    page2(); 
  }
  
  if (counter == 5)
  {
   reset();
   text("THE END",width/2,height/2);
   noLoop();
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    counter++;
    reset();
  }
}

void page1()
{
  if (counter == 0)
  {
    fill(255);
    text("HAVE YOU SEEN MY CAT?\nInspired by Eric Carle's Book\n\nPress Spacebar to continue",width/2,height/2);
  }
  
  if (counter == 1)
  {
    image(man1, 0, height-man1.height/1.5, man1.width/1.5, man1.height/1.5);
    image(boy1, width/2-boy1.width/4, height-boy1.height/2, boy1.width/2, boy1.height/2);
    fill(255, fade);
    text("Have you seen\nmy cat?", width/2, 200);
    fade++;
  }

  if (counter == 2)
  {
    tint(255);
    image(man1, 0, height-man1.height/1.5, man1.width/1.5, man1.height/1.5);
    image(boy2, width/2-boy2.width/4, height-boy2.height/2, boy2.width/2, boy2.height/2);
    tint(255, fade+100);
    image(cat1, width-cat1.width/4, height-cat1.height/4, cat1.width/4, cat1.height/4);
    fill(255, fade);
    text("That's not\nmy cat.", width/2, 200);
    fade++;
  }
}

void page2()
{
  if (counter == 3)
  {
    image(man2, 0, height-man2.height/1.5, man2.width/1.5, man2.height/1.5);
    image(boy1, width/2-boy1.width/4, height-boy1.height/2, boy1.width/2, boy1.height/2);
    fill(255, fade);
    text("Have you seen\nmy cat?", width/2, 200);
    fade++;
  }

  if (counter == 4)
  {
    tint(255);
    image(man2, 0, height-man2.height/1.5, man2.width/1.5, man2.height/1.5);
    image(boy2, width/2-boy2.width/4, height-boy2.height/2, boy2.width/2, boy2.height/2);
    tint(255, fade+100);
    image(cat2, width-cat2.width/4, height-cat2.height/4, cat2.width/4, cat2.height/4);
    fill(255, fade);
    text("That's not\nmy cat.", width/2, 200);
    fade++;
  }
  
}


void reset()
{
  background(5, 25, 165);
  noStroke();
  fill(0, 125, 10);
  rect(0, height-35, width, 35);
  fill(255, 255, 0);
  ellipse(width, 0, 150, 150);
  fade = -50;
}



