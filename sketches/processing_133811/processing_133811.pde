
/* @pjs preload= "Deb_Volume_02.png", "Deb_Volume_01.png", "Deb_Glitched_03.png", "Deb_Glitched_01.png", "Edge2.jpg"; */

// TODO: put all your variable declarations here

void setup() {

  // size() goes inside setup() here. Like this:
  size(670, 873);
  background(loadImage("Edge2.jpg"));
 
}

void draw() {

  // TODO: assign each variable a random value here. For example:
  //    x = int(random(0,100));
  // Do this for each variable.
  // see http://processing.org/reference/random_.html for more details

  PImage img;
  //Volume_02
  int xPosition1 = round( random(0, 500) );
  int yPosition1 = round( random(10, 700) );
  int ellipseRadius1 = round( random(10, 500) );
  //Volume_01
  int xPosition2 = round( random(10, 300) );
  int yPosition2 = round( random(5, 900) );
  int ellipseRadius2 = round( random(30, 900) );
  //Glitched_03
  int xPosition3 = round( random(10, 300) );
  int yPosition3 = round( random(5, 900) );
  int ellipseRadius3 = round( random(30, 900) );
  //Glitched_01
  int xPosition4 = round( random(10, 300) );
  int yPosition4 = round( random(5, 900) );
  int ellipseRadius4 = round( random(30, 900) );

  // TODO: paste all your draw code here (ie, the code that uses those variables)  

  

  // ellipses
  noStroke ();
  fill (255, 210, 173, 10);
  ellipse(xPosition1, yPosition1, ellipseRadius1, ellipseRadius1) ;
  ellipse(xPosition2, yPosition2, ellipseRadius2, ellipseRadius2) ;
  ellipse(xPosition3, yPosition3, ellipseRadius3, ellipseRadius3) ;
  ellipse(xPosition4, yPosition4, ellipseRadius4, ellipseRadius4) ;

  //ellipse(140, 400, 200, 200) ;
  //ellipse(400, 500, 500, 500) ;
  //ellipse(470, 730, 230, 230) ;

  //Volume shapes
  img = loadImage("Deb_Volume_02.png");
  image(img, xPosition1, yPosition1);
  img = loadImage("Deb_Volume_01.png");
  image(img, xPosition2, yPosition2);
  img = loadImage("Deb_Glitched_03.png");
  image(img, xPosition3, yPosition3);
  img = loadImage("Deb_Glitched_01.png");
  image(img, xPosition4, yPosition4);

  // TODO: If you are using background(), remove it for now.

  // TODO: Add transparency to all your colors. For example, if you have:
  //   fill(255,0,0);
  // in your code, replace it with:
  //   fill(255,0,0,10);

  // TODO: run your sketch and see what happens!

  // The idea here is that if you do the above, you should hopefully
  // get something that looks like the Idris Khan image compositions.
  // Do you?
}



