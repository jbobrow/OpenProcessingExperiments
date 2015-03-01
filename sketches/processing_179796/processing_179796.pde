
PImage img; // The image
PFont size14, size18, size11; // Fonts
color y; // Colour of pixel
int display = 1, dimg = 0; // Initial display mode (Normal Vision) & image 1
float r2,g2,b2,r,g,b,rr,rg,rb,gr,gg,gb,br,bg,bb; // RGB values & their modified values
PImage [] images = new PImage[4];
/*
  Below are percentages that have been put into a multi-dimensional array,
  they are used to transform the rgb values. One, Achromatopsia, is taken
  from: http://www.colorjack.com/labs/colormatrix/ and the rest from photoshop
  channel mixer presets (http://tinyurl.com/ImageEditorFilters-zip) which can be
  found here: http://homepage.mac.com/lpetrich/ColorBlindnessSim/ColorBlindnessSim.html
*/
float[][] filters = {
  { 1,0,0,0,1,0,0,0,1 }, // 0 - Normal Vision
  { 0.43,0.72,-0.15,0.34,0.57,0.09,-0.02,0.03,1 }, // 1 - Deuteranopia (No Green)
  { 0.2,0.99,-0.19,0.16,0.79,0.04,0.01,0.01,1 }, // 2 - Protanopia (No Red)
  { 0.972,0.112,-0.084,0.022,0.818,0.160,-0.063,0.881,0.182 }, // 3 - Tritanopia (No Blue)
  { 0.299,0.587,0.114,0.299,0.587,0.114,0.299,0.587,0.114 } // 4 - Achromatopsia (No Color)
};
 
 
void setup() {
 
  // Set up the sketch's size and load fonts
  size(800,541);
  size18 = loadFont("Trebuchet MS");
  size14 = loadFont("Trebuchet MS");
  size11 = loadFont("Trebuchet MS");
  textFont(size18, 18);
  textFont(size14, 14);
  textFont(size11, 11);
 
  // Preload the images into an array
  images[0] = loadImage("http://i.imgur.com/NJt76Kp.jpg");
  images[1] = loadImage("http://i.imgur.com/pOv6TtA.jpg");
  images[2] = loadImage("http://i.imgur.com/cyZ8BgT.jpg");
  images[3] = loadImage("http://i.imgur.com/ltv9I8B.jpg");
 
  // Load the default image, unfiltered
  image(images[dimg],-1,0, width, height);
  key=='n';
 display=1;
 draw();
  noLoop();
}
 
 
void draw() {
 
  // Depending on what 'display' equals, call the changeImage function,
  // redraw the image and then update the navigation
  switch(display) {
    case 1:
      image(images[dimg],-1,0, width, height);
      drawNav(1);
    break;
    case 2:
      image(images[dimg],0,0, width, height);
      changeImage(1);
      drawNav(2);
    break;
    case 3:
      image(images[dimg],0,0, width, height);
      changeImage(2);
      drawNav(3);
    break;
    case 4:
      image(images[dimg],0,0, width, height);
      changeImage(3);
      drawNav(4);
    break;
    case 5:
      image(images[dimg],0,0, width, height);
      changeImage(4);
      drawNav(5);
    break;
   }
 
}
 
 
void keyPressed()
{
  // Check if keys were pressed and update 'display' or 'dimg' to change the image
  if (key == 'n') { display = 1; }
  if (key == 'd') { display = 2; }
  if (key == 'p') { display = 3; } if (key == 't') { display = 4; }
  if (key == 'a') { display = 5; } if (key == '1') { dimg = 0; }
  if (key == '2') { dimg = 1; } if (key == '3') { dimg = 2; }
  if (key == '4') { dimg = 3; }
  redraw();
}
 
 
/*
  Function to modify the image:
    0 = Normal Vision
    1 = Deuteranopia
    2 = Protanopia
    3 = Tritanopia
    4 = Achromatopsia
*/
void changeImage(int type) {
 
  // Cache the filter for better performance
  var this_filter = filters[type];
 
  // This is what applies the convolution matrix to each pixel
  function convolution(y){
 
    // Split the pixels RGB values
    var r = ((y >> 16) & 0xFF),
    g = ((y >> 8) & 0xFF),
    b = (y & 0xFF),
 
    // Perform transformations on each rgb channel of the pixel
    // The values for transformation are taken from the filters array
    r_mod = constrain((r*this_filter[0] + g*this_filter[1] + b*this_filter[2]), 0, 255),
    g_mod = constrain((r*this_filter[3] + g*this_filter[4] + b*this_filter[5]), 0, 255),
    b_mod = constrain((r*this_filter[6] + g*this_filter[7] + b*this_filter[8]), 0, 255);
 
    // Apply the change to the pixel
    return color(r_mod,g_mod,b_mod);
 
  }
 
  // Load the pixels into pixels[]
  loadPixels();
 
  // Using Duff's Device to loop (More about it here: http://jsperf.com/duffs-device)
  var i = 0,
  imgd = (width*height),
  n = imgd % 8;
 
  while (n--) pixels[i++] = convolution(pixels[i]);
 
  n = (imgd /8);
  while (n--) {
    pixels[i++] = convolution(pixels[i]);
    pixels[i++] = convolution(pixels[i]);
    pixels[i++] = convolution(pixels[i]);
    pixels[i++] = convolution(pixels[i]);
    pixels[i++] = convolution(pixels[i]);
    pixels[i++] = convolution(pixels[i]);
    pixels[i++] = convolution(pixels[i]);
    pixels[i++] = convolution(pixels[i]);
  }
 
  // Update the images pixels
  updatePixels();
 
}
 
 
// Function to draw the navigation box
void drawNav(int n) {
 
   noStroke();
   fill(0,0,0,140);
   rect(525, 346, 250, 170); // Background box for nav
 
   // View as:
   textFont(size18);
   fill(255,255,255);
   text("View as:", 535,370);
 
   // (Press corresponding key)
   textFont(size11);
   fill(202,202,202);
   text("(Press corresponding key)", 636,370);
 
   // Loop to create the boxes for each type of color blindness
   for(int j=1; j<6; j=j+1) {
     // If n = the current box, change the colour
    if(n==j) { fill(124,124,124,90); } else { fill(255,255,255,90); }
    // Draw the boxes 25 pixels apart from each other
    rect(541, 355+(j*25), 220, 22);
  }
 
   // Write the labels for the boxes
   textFont(size14);
   fill(255,255,255);
   text("n - Normal vision", 550,396);
   text("d - Deuteranopia (No green)", 550,420);
   text("p - Protonopia (No red)", 550,445);
   text("t - Tritanopia (No blue)", 550,471);
   text("a - Achromatopsia (No colour)", 550,496);
 
   // Draw box with information about changing image
   fill(0,0,0,140);
   rect(25, 487, 250, 30);
   textFont(size14);
   fill(255,255,255);
   text("To change the image: Press 1, 2 or 3.", 33,506);
 
}                                                                                                               
