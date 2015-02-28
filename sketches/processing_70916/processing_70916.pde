
size(600, 600);
PImage animal = loadImage("african-elephant_435_600x450.jpg");
tint(#FF0000);
image(animal, width/4, height/4, width/2, height/2);
tint(#00FF00);
image(animal, width/2, height/2, width/2, height/2);
noTint();
image(animal, 3*width/4, 3*height/4, width/2, height/2);


