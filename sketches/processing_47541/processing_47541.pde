
//Homework 13
//copyright Christina Lee December 2011 Pittsburgh, PA 15289

int MAX = 15;
int [] x = { 
  586, 691, 495, 600, 484, 563, 555, 453, 626, 636, 385, 615, 581, 375, 493
};
int [] y = { 
  314, 595, 584, 553, 473, 449, 427, 520, 469, 574, 319, 431, 490, 561, 465
};
String [] name = { 
  "Bimbo's 365", "Bottom of the Hill", "Café du Nord", "DNA Lounge", "The Fillmore", "Great American Music Hall", "Hemlock Tavern", "The Independent", "Mezzanine", "Mighty", "Palace of Fine Arts", "Ruby Skye", "Bill Graham Civic Auditorium", "Amoeba Music", "Yoshi's San Francisco"
};
String [] address = {
  "1025 Columbus Ave", "1233 17th Street", "2170 Market Street", "375 11th Street", "1805 Geary Blvd", "859 O'Farrell Street", "1131 Polk Street", "628 Divisadero Street", "444 Jessie Street", "119 Utah Street", "3301 Lyon Street", "420 Mason Street", "99 Grove Street", "1855 Haight Street", "1330 Fillmore Street"
};
String [] website = {
  "www.bimbos365club.com", "www.bottomofthehill.com", "www.cafedunord.com", "www.dnalounge.com", "www.thefillmore.com", "www.slimspresents.com", "www.hemlocktavern.com", "www.theindependentsf.com", "www.mezzaninesf.com", "www.mighty119.com", "www.palaceoffinearts.org", "www.rubyskye.com", "www.apeconcerts.com", "www.amoeba.com", "www.yoshis.com"
};
String [] acts = {
  "Yael Naim, Grouplove, Tinariwen", "Youth Lagoon, Cymbals Eat Guitars, Blackbird Blackbird", "Sharon Robinson, Glen Phillips, Dominant Legs", "Tenderlions, Chromatics, Designer Drugs", "The Kooks, Dinosaur Jr., Infected Mushroom", "Toro y Moi, Girls, Cass McCombs", "Japanther, King Khan and BBQ Show, Shannon and the Clams", "Gang Gang Dance, The Drums, The Weakerthans", "Dam Funk, M83, Boys Noize", "Madlib, Crookers, Pete Rock", "The Books, Chris Cornell, Amanda Palmer", "Nero, Diplo, Bart B More", "The National, deadmau5, Wiz Khalifa", "Blitzen Trapper, Portugal. The Man", "Blockhead, Chali 2na, Ladytron"
};

void setup()
{ 

  size(800, 815);
  noStroke();
}

void draw()
{ 
  setting();
  drawLocations();
  drawInfo();
}

void setting()
{   
  PImage sf;
  sf = loadImage("map.png");
  image(sf, 0, 0, width, height);
}

void drawLocations()
{

  for (int i = 0; i < MAX; i++)
  {
    if (mouseX >= x[i] - 5 && mouseX <= x[i] + 5 && mouseY >= y[i] - 5 && mouseY <= y[i] + 5)
    { 
      fill(129, 189, 164);
      noCursor();
    }
    else
    {
      fill(185, 211, 176);
      cursor();
    }
    ellipse(x[i], y[i], 10, 10);
  }
}

void drawInfo()
{


  for (int i = 0; i < MAX; i++)
  {
    if (mouseX >= x[i] - 5 && mouseX <= x[i] + 5 && mouseY >= y[i] - 5 && mouseY <= y[i] + 5)
    {
      noCursor();
      PFont bold, font;
      bold = loadFont("HelveticaNeue-Bold-16.vlw");
      font = loadFont("HelveticaNeue-Light-16.vlw");
      textFont(bold, 14);
      textAlign(RIGHT);
      fill(138, 95, 76);
      text(name[i], x[i] - 10, y[i] + 5);
      textFont(font, 14);
      text(address[i] + "\n" + website[i] + "\n" + "Recent acts:" + " " + acts[i], x[i] - 10, y[i] + 24);
    }
  }
}


