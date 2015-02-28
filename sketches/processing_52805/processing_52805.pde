
PImage writing;
PImage sleeponkitty;
PImage heartmask;
PImage LGM;
PImage lovers;
PImage pidou;
PImage pinkdog;
PImage rothko;
PImage rubbish;
PImage wallstreet;


void setup()
{
  size(600, 400);
  writing = loadImage("letter.jpg");
  sleeponkitty = loadImage("sleeponkitty.jpg");
  heartmask = loadImage("nohellbelowus.png");
  LGM = loadImage("LGM.jpg");
   lovers = loadImage("lovers.jpg");
 pidou = loadImage("pidou.jpg");
 pinkdog = loadImage("pinkdog.jpg");
rothko = loadImage("rothko.jpg");
rubbish = loadImage("rubbish.jpg");
wallstreet = loadImage("wallstreet.jpg");  


  smooth();
  imageMode(CENTER);
  noStroke();
  noFill();
}

void draw()
{
  if (mouseX <= 60)
  {
    image(sleeponkitty, width/2, height/2);
    heartmask.mask(sleeponkitty);
    image(heartmask, width/2, height/2);
  }
  else if ((mouseX > 60) && (mouseX <=120))
  {
    image(writing, width/2, height/2); 
    heartmask.mask(writing);
    image(heartmask, width/2, height/2);
  }
  else if ((mouseX > 120) && (mouseX <=180))
  {
     image(LGM, width/2, height/2); 
    heartmask.mask(LGM);
    image(heartmask, width/2, height/2);
}
  else if ((mouseX > 180) && (mouseX <=240))
  {
     image(lovers, width/2, height/2); 
    heartmask.mask(lovers);
    image(heartmask, width/2, height/2);
}
  else if ((mouseX > 240) && (mouseX <=300))
  {
     image(pidou, width/2, height/2); 
    heartmask.mask(pidou);
    image(heartmask, width/2, height/2);
}
  else if ((mouseX > 300) && (mouseX <=360))
  {
     image(pinkdog, width/2, height/2); 
    heartmask.mask(pinkdog);
    image(heartmask, width/2, height/2);
}
  else if ((mouseX > 360) && (mouseX <=420))
  {
     image(rothko, width/2, height/2); 
    heartmask.mask(rothko);
    image(heartmask, width/2, height/2);
}
  else if ((mouseX > 420) && (mouseX <=480))
  {
     image(rubbish, width/2, height/2); 
    heartmask.mask(rubbish);
    image(heartmask, width/2, height/2);
}
  else
  {
     image(wallstreet, width/2, height/2); 
    heartmask.mask(wallstreet);
    image(heartmask, width/2, height/2);
}
}



