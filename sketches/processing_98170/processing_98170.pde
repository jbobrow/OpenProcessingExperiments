
PImage crowd; 
PImage lights;
PImage windmill;
PImage shopping;


void setup () { 
  crowd= loadImage("crowd.jpg");
  lights = loadImage("christmaslights.jpeg");
  windmill=loadImage("windmill.jpg");
  shopping=loadImage("shopping.jpg");
 
  size(800,500);
}

void draw() { 
  image (crowd,0,0);
  image (lights, 400,0);
  image(windmill,0,200);
  image(shopping,300,200);
  
}

//mouse click, images animate to centre 


