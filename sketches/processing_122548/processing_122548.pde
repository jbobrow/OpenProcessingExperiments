
//Abby Frankola
//copyright Abby Frankola 2013
//afrankola
//image created by self
//data found on general internet

//click any key to cycle through coffee types
//click to go backwards

int phase;
PFont font;
PImage p; 

void setup ()
{
  size (400, 400); 
  p= loadImage("bg10.png");
  image (p,0,0); 
  rectMode(CENTER);
  textSize (11);
  textAlign (CENTER, CENTER); 
  phase= 0;
  
}

void draw ()
{
  image (p, 0, 0 ); 
 
  if      (phase == 1 ) 
  {
    noStroke();
    fill(82, 42, 0);
    rect(199, 285, 130, 60);
    fill(0); 
    text("expresso", 200, 350); 
    
  }
  else if (phase == 2 ) 
   {
    noStroke();
    fill(82, 42, 0);
    rect(199, 285, 130, 60);
    fill(245);
    rect(199, 250, 130, 60);
    fill(255);
    rect(199, 210, 130, 60);
    fill(0);
    text("cappuccino", 200, 350); 
    
  }
  else if (phase == 3 ) 
   {
    noStroke();
    fill(82, 42, 0);
    rect(199, 285, 131, 60);
    fill(168, 226, 230);
    rect(199, 210, 131, 100);
    fill(0);
    text("americano", 200, 350); 
  }
  else if (phase == 4 ) 
   {
    noStroke();
    fill(82, 42, 0);
    rect(199, 285, 130, 60);
    fill(245);
    rect(199, 240, 130, 80);
    fill(255);
    rect(199, 200, 130, 40);
    fill(0);
    text("latte", 200, 350, 250); 
  }
  else if (phase == 5 ) 
   {
    noStroke();
    fill(82, 42, 0);
    rect(199, 245, 131, 140);
    fill(0);
    text("carnegie mellon triple shot", 200, 350); 
  }
}


  
  void keyPressed( )
{
  phase++;
}

void mousePressed( )
{
   phase--; 
}


