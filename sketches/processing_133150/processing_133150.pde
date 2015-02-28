
/* @pjs preload= "photo.PNG"; */

// TODO: put all your variable declarations here

void setup() {
  size(800,800);
frameRate (10);  
}

void draw() {
PImage img;
img = loadImage("photo.PNG");
image(img, 300, 300);
fill (248, 214, 167, 20) ;
noStroke();


// Declaring variables

int x;
int y;
int thickness;

x= round( random(10,600) );
y= round( random(15,500) );
thickness= round( random(8, 200) );

rect(x, y, thickness, 180);
fill (248, 214, 167, 55) ;
rect(x + 20, y + 20, thickness, 150);
fill (255, 246, 206, 40) ;
rect(x + 40, y + 40, thickness, 120);
fill (248, 214, 167, 35) ;
rect(x + 60, y + 60, thickness, 90);





rect(y, x, 180, thickness);
fill (255, 246, 206, 15) ;
rect(y + 20, x + 20, 150, thickness);
fill (248, 214, 167, 15) ;
rect(y + 40, x + 40, 120, thickness);
fill (255, 246, 206, 30) ;
rect(y + 60, x + 60, 90, thickness);

    
  // TODO: assign each variable a random value here. For example:
  //    x = int(random(0,100));
  // Do this for each variable.
  // see http://processing.org/reference/random_.html for more details

  // TODO: paste all your draw code here (ie, the code that uses those variables)  

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



