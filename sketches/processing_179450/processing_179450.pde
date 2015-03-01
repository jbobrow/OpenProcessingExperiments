
// Rose Vastola
// perlin noise math
// http://dev.horemag.net/2008/03/02/simple-terrain-generator-in-processing/

float [][] landArea;// the array that access the x and y values for perlin noise
float n = 0; // the starting point of noise
int amt = 10000; // the amount at whih the the perlin noise increases or decreases
color [][] colorArray;// the array that access the x and y values for the earth img
PImage img; // access the earth image
int mAmt = 0; //the amount at which the 


void setup() {
  img = loadImage("1.jpg");
  img.resize(400, 400);
  loadPixels();
  background(0);
  size(850, 640, P3D); 
  landArea= new float [400][400];// the size of the perlin noise in the array
  colorArray =new color [400][400]; // the size of the earth earth image in the array 
  makeLand();
}

void draw() {
  if(amt > 0)
    drawLand(); // function found below access the noise and the roatation of the plane
   else
     microView(); // the function stated below that decreases the perlin noise
     
}

void makeLand() {
  for ( int x = 0; x < 400; x++) {        // the amount at the noise is reached  for x
    for (int y = 0; y < 400; y++) {       // the amount at the noise is reached  for x
      landArea[x][y] = noise(x * .03, y * .03) * -1; // the setting for the perline noise link is above.
      //landArea[x][y] = random(0-300);
      int loc = x + y * 400;      // this is was grabed from my pervious project for the color of the pixel loc for RGB
      float r = red (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue (img.pixels[loc]);
      colorArray[x][y] = color(r, g, b); // setting these values in the color array
    }
  }
}


void drawLand() {
  background(0);


  rotateX(radians(38)); //the rotation of the plan on the x axis
  beginShape(POINTS); 
  for ( int x = 0; x < 400; x++) {// starting a 0 and loop through 400 for x
    for (int y = 0; y < 400; y++) {// starting a 0 and loop through 400 for y
      n = landArea[x][y];
      stroke(colorArray[x][y]); //// fills the stroke with the color array image
      vertex(width/2 + x - 400/2, height/2 + y - 400/2, n * amt); //the positioning of the noise array
    }
  } 
  endShape();

  if (amt <= 0) 
    noLoop();
  amt = amt - 100; // increases the amount of the perlin noise to a larger number
}


void microView() {
  background(0);
  mAmt = mAmt + 1; // increases the amount of the perlin noise to a larger number

  rotateX(radians(38));// the ration of the plane
  beginShape(POINTS);  //creating the point shape for both arrays
  for ( int x = 0; x < 400; x++) { // starting a 0 and loop through 400 for x
    for (int y = 0; y < 400; y++) {// starting a 0 and loop through 400 for y
      n = landArea[x][y]; // 
      stroke(colorArray[x][y]); // fill the stroke with the color array image
      vertex(width/2 + x - 400/2, height/2 + y - 400/2, n * mAmt);  // the potioning of the color array
    }
  } 
  endShape();

  if (mAmt > 100) // increases the amount of the perlin noise to a larger number
    noLoop();
}



