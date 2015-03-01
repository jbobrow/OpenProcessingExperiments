
PImage keys; //http://www.memorymaze.com/images/piano%20keys%20card%20size%20(Copy).jpg
PImage inky; //http://www.vectortemplates.com/raster/ink-splat-01.gif
PFont raleway;

keys= loadImage("keys.jpg");
raleway= createFont("Raleway-Bold.ttf",350);
inky=loadImage("inky.jpg");

size(640,480);

image(inky,0,0,width,500);
image(keys, 0, 0, width, 120);


fill(#030303);
ellipse(400,400,20,20);
ellipse(150,150,50,50);

fill(#F70A0A);
textFont(raleway,48);
text("Record as you play.. in ink!",22,455);



