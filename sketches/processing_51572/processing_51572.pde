
//Pointallism Engine (http://en.wikipedia.org/wiki/Pointillism)
PImage pearl;

void setup()
{
   pearl = loadImage("pearl.jpg");
   size(380, 445); 
   noStroke(); smooth();
   background(255);
}

void draw()
{
  if(mousePressed)
  {
     //Calculate some random values that we'll use as mouse offsets.
     float xoff = random(-10,10);
     float yoff = random(-10,10);
     float d    = random(2, 15);
     
     //Get the corresponding color on the image...
     //First we have to convert the numbers to ints using the int() function...
     //                get     mouseX + offset       mouseY + offset
     color tmp = pearl.get(   int(mouseX+xoff),   int(mouseY+yoff)    );
     fill( tmp, 150 );
     ellipse(mouseX + xoff, mouseY + yoff, d,d);
  } 
}

