
//using images

size(480, 480);

PImage lion;
lion = loadImage("dandelion.jpg");
image(lion, 0, 0);

tint(#00d7fc);
image(lion, 240, 0);

tint(#f0fc00);
image(lion, 0, 240);

tint(#ed42ba);
image(lion, 240, 240);

fill(255);
textSize(8);
textLeading(8);
text("Image courtesy of \nCynthia.Lou via http://www.flickr.com/photos/10832613@N03/3539077354/", 0, 470);

