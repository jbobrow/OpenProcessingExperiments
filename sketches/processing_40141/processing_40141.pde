
// background image: Damien Hirst's "For the Love of God"
// referring to imageSpeed CODE  
// Try to show movign crystals by using random B&W color in the loop  

int CN = 8601;                                  // CN = the number of Crystals 
float [] P = new float [CN];
float [] J = new float [CN];
PImage D;                                       // Damien's initial "D" 

void setup() {
  size (500, 336);                              // Using original image size
  D = loadImage("skull.jpg");
  ellipseMode(CENTER);
  for (int i = 255; i < CN; i++) {              // For loop for integer "i"  
    P[i] = random(width);
    J[i] = random(height);
  }
}
void draw () {
  background (D);                               // "For the Love of God" as the background image 
  fill (0, 130);                                //  Fading the background image by covering with rectangle.  
  rect (0, 0, 500, 336);

  noStroke();
  for (int i = 255; i < CN; i++) {
    color c = D.get(int(P[i]), int (J[i]));     // getting color from image
    float b = brightness(c)/255.0;               
    float s = pow(b, 10) + 0.70;                // control speed. 
    P[i] += s;

    if (P[i] > width) {
      P[i] = random (width);
      J[i] = width;
    }
    //Drawing crystals here
    fill (random (255), random(width));         //  Crystals' color 
    ellipse (P[i], J[i], 2.5, 2.5);             //  Crystals' size 
  }
}


