
//Amy Zhou, Andrew ID: amyzhou
//Copyright Notice


//variable initiation
float x;
float y;
float dx; 
float dy;
float wt;
float ht;
PImage panda;
PImage movingImg;
float easingCoefficient;
boolean clicked = false;

void setup()
{
  size(800, 800); 
  rectMode (CENTER); 
  textMode (CENTER);
  x = width*.25; 
  y = height*.25;
  wt = width*.5; 
  ht = height*.5; 
  easingCoefficient = .1;
  panda = loadImage("panda cursor32.png");
  movingImg = loadImage("Chericol.jpg");
}

void draw()
{
  noStroke();
  cursor(panda);

  
  dx = mouseX - x; 
  dy = mouseY - y;
  
  background (255);
  
  stroke (0);
  //sky
  fill (73, 142, 233);
  rect (wt, ht, wt*2, ht*2);
  
  //grass
  fill (74, 164, 64);
  rect (wt, ht*1.5, wt*2, ht);
  
  if (mousePressed ==true)
  {
    x = x + easingCoefficient * dx; 
    y = y + easingCoefficient * dy;
    clicked = true;

    //wooden board background thingy
    fill (112, 81, 35);
    stroke (0);
    rect (x, y, wt*.75 , ht*.75, .025*wt);

    //triangle marks
    fill (0);
    stroke (0);
    triangle (x-.025*wt, y-.35*ht, x+.025*wt, y-.35*ht, x, y-.3*ht);

    triangle (x-.025*wt, y+.35*ht, x+.025*wt, y+.35*ht, x, y+.3*ht);

    triangle (x-.35*wt, y-.025*ht, x-.35*wt, y+.025*wt, x-.3*wt, y);

    triangle (x+.35*wt, y-.025*ht, x+.35*wt, y+.025*wt, x+.3*wt, y);

    //legs of the board
    fill (112, 81, 35);
    stroke (0); 
    quad (x-.35*wt, y+ht*.375, x-.275*wt, y+ht*.375, x-.275*wt, y+ht*.5, x-.375*wt, y+ht*.5);

    quad (x+.35*wt, y+ht*.375, x+.275*wt, y+ht*.375, x+.275*wt, y+ht*.5, x+.375*wt, y+ht*.5);

    //rings of the target
    fill (255, 0, 0);
    stroke (255, 0, 0);
    ellipse (x, y, wt*.525, ht*.525);

    fill (255);
    stroke (255, 255, 255);
    ellipse (x, y, wt*.45, ht*.45);

    fill (255, 0, 0);
    stroke (255, 0, 0);
    ellipse (x, y, wt*.375, ht*.375);

    fill (255);
    stroke (255, 255, 255);
    ellipse (x, y, wt*.3, ht*.3);

    fill (255, 0, 0);
    stroke (255, 0, 0);
    ellipse (x, y, wt*.225, ht*.225);

    fill (255);
    stroke (255, 255, 255);
    ellipse (x, y, wt*.15, ht*.15);

    fill (255, 0, 0);
    stroke (255, 0, 0);
    ellipse (x, y, wt*.075, ht*.075);
  }
  if (clicked == true)
  {
   
    //wooden board background thingy
    fill (112, 81, 35);
    stroke (0);
    rect (x, y, wt*.75 , ht*.75, .025*wt);

    //triangle marks
    fill (0);
    stroke (0);
    triangle (x-.025*wt, y-.35*ht, x+.025*wt, y-.35*ht, x, y-.3*ht);

    triangle (x-.025*wt, y+.35*ht, x+.025*wt, y+.35*ht, x, y+.3*ht);

    triangle (x-.35*wt, y-.025*ht, x-.35*wt, y+.025*wt, x-.3*wt, y);

    triangle (x+.35*wt, y-.025*ht, x+.35*wt, y+.025*wt, x+.3*wt, y);

    //legs of the board
    fill (112, 81, 35);
    stroke (0); 
    quad (x-.35*wt, y+ht*.375, x-.275*wt, y+ht*.375, x-.275*wt, y+ht*.5, x-.375*wt, y+ht*.5);

    quad (x+.35*wt, y+ht*.375, x+.275*wt, y+ht*.375, x+.275*wt, y+ht*.5, x+.375*wt, y+ht*.5);

    //rings of the target
    fill (255, 0, 0);
    stroke (255, 0, 0);
    ellipse (x, y, wt*.525, ht*.525);

    fill (255);
    stroke (255, 255, 255);
    ellipse (x, y, wt*.45, ht*.45);

    fill (255, 0, 0);
    stroke (255, 0, 0);
    ellipse (x, y, wt*.375, ht*.375);

    fill (255);
    stroke (255, 255, 255);
    ellipse (x, y, wt*.3, ht*.3);

    fill (255, 0, 0);
    stroke (255, 0, 0);
    ellipse (x, y, wt*.225, ht*.225);

    fill (255);
    stroke (255, 255, 255);
    ellipse (x, y, wt*.15, ht*.15);

    fill (255, 0, 0);
    stroke (255, 0, 0);
    ellipse (x, y, wt*.075, ht*.075);
  }

}


