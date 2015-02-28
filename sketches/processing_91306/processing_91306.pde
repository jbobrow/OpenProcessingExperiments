
PImage mouseCursor;
PImage b;

void setup() {
  size(640, 480);
  mouseCursor = loadImage("ship.gif");
}

void draw() 
{  
   PImage b = loadImage("space.jpg");
image(b, 0, 0);


//background(#FF006F);
//fill (#FF0842,20);
//rect (0,0,width,height);

  if(mouseX < 100) {
    cursor(mouseCursor, 0, 0);
  } else {
    cursor();
  }
}



