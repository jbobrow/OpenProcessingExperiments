
//hannah schmitt
//homework 7
//copyright Hannah Schmitt, Carnegie Mellon University, 2012


//move the mouse around and attempt to swat the fly with the fly swatter.
//mouse must be somewhat close to fly swatter to get a "splat" point
//if swatter goes off the screen, continue playing but score will restart
//to increase difficulty, click and hold mouse and move back and forward
//the fly will fly faster. Then continue play. 
//play with friends. Highest score wins! 

float xspeed, yspeed, x, y, dia, d, x2, y2, score, start;
float easex, easey, inc;
PImage f, g, b;

void setup ()
{
  size (400, 400);
  f = loadImage("Fly_close2.png");
  g = loadImage("flyswatter.png");
  b = loadImage("redtablecloth2.jpg");
  x= random(width);
  y= random(height);
  x2 = random (width*0.2);
  y2 = random (height*0.2);
  xspeed = random (2, 5);
  yspeed = random (2, 5);
  dia = 20;
  score= 0;
  inc=0.06;
  easex= width/8;
  easey= height/8;
  start=0;
  
}

void draw ()
{ 
  image(b, b.width/4 -400, b.height/4 -400);
 
  time ();
  bounceImage();
  flyswatter();
  collision();
}


void flyswatter ()  //moving of flyswatter
{
  noFill();
  image(g, easex +width/4+ g.width/8, easey+ g.height/8);
  easex += (mouseX-easex)*inc;   //learned from in class demo from john
  easey += (mouseY- easey)*inc;
  if (easex +width/4+ g.width/8> width)
  {
    score= 0;
    easex -= easex +width/4+ g.width/8;
  }
  if(easey+ g.height/8 >height)
  {
    score=0; 
     easey -= easey+ g.height/8;
  }
  
}


void mouseDragged () // to increase difficulty
{
  if (mouseX> pmouseX)
  {
    xspeed = xspeed + 1;
  }
  else if (mouseX< pmouseX)
  {
    xspeed = xspeed - 1;
  }
}

void bounceImage () //bounce of the fly
{
  noFill ();
  image(f, x, y, dia, dia);
  x+= xspeed;
  if (x < dia/2 || x > width -dia/2) {
    xspeed= -xspeed;
  }
  y+= yspeed;
  if (y < dia/2 || y > height-dia/2) {
    yspeed= -yspeed;
  }
}


void time () //shows time past
{
  fill(50);
  textSize(12);
  textAlign(CENTER);
  text(millis()/1000 + " seconds", 100, 100);
  if (millis()/1000- start > 20)  //assistance from class code
  {
    endofgame();
    textSize(14);
    text("GOOD GAME!", 200, 200);
  }
}


void collision () //keeps score when flyswatter hits fly
{ 
  text("splat"+score, 130, 130);
  //  println(d);
  d = dist(easex +width/4+ g.width/8, easey+  g.height/8, x, y);   //assistance from class code
  if (d < dia)
  {
    score++;
    x= x2;
    y= y2;   //how to add score continuously and always readjust position of fly...?
    background(245, 7, 7);
  }
}

void endofgame() //end of the game, white screen 
{
  background(255, 255, 255);
  x=0;
  y=0;
  xspeed=0;
  yspeed=0;
  stroke(255, 255, 255);
}



