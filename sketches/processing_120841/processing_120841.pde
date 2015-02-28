
// Connor Palatucci
// 11/14/13

// Pixel counter

PImage img;

int black, white;


void setup() {

black = 0;
white = 0;

// loades image

img = loadImage("image.PNG");
size(img.width, img.height);
image(img, 0, 0);
loadPixels();

//counts black and white pixels
//this is just a quick program and I know that I want to sort 
//the pixels into either black or white even though one 
//may be gray and another may be off-white
//so I'm just calculating the sum of their RGB values and if it's
//less than 382 I put it in black. else->white

for (int i = 0; i<width*height;i++) {
float sum = 0;

 sum = red(pixels[i])+green(pixels[i])+blue(pixels[i]);
 
 if(sum >= 382) {
 black++;
 } 
 else{
 white++;
 }

}

print("Total: ");
println(width*height);
print("White: ");
println(white);
print("Black: ");
println(black);

}


