
//using images
 
size(480, 360);
 
PImage lion;
lion = loadImage("dandelion.jpg");
image(lion, 0, 0);
 
tint(#00d7fc);
image(lion, 240, 0);
 
tint(#f0fc00);
image(lion, 0, 180);
 
tint(#ed42ba);
image(lion, 240, 180);
 
fill(255);
textSize(8);
textLeading(8);
text("Image courtesy of \nAstrid Photography via http://www.flickr.com/photos/astridphotography/476858473/sizes/m/in/photostream/", 0, 350);



