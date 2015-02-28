
int maxImages = 5;  // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first
int savedTime;
int totalTime = 3000;
PImage[] images = new PImage [maxImages]; // The image array
String[] filenames = {"Rome_1.JPG", "Rome_2.JPG", "Rome_3.JPG", "Rome_4.JPG", "Rome_5.JPG"};
PFont f; // Global font variable 
float x; // Horizontal location 
int index = 0; 

//text 
String[] headlines = {"Rome 2008"};

void setup() {
 size (800,600);
 for (int i = 0; i< filenames.length; i++) {
   images[i] = loadImage(filenames[i]);
 }
 f = loadFont("TrajanPro-Regular-20.vlw"); // Load the fond
}

void draw() {
 image(images[imageIndex],0,0);  // Display one image  
 int passedTime = millis() - savedTime; // Calculate how much time has passed
 if (passedTime > totalTime) {
  imageIndex++;
  savedTime = millis(); // Save the current time to restart the timer
  if(imageIndex>filenames.length-1) {
    imageIndex = 0;  
   }
  }
  
   //text 
   // Display headline at x location 
  fill (0); 
  textFont(f,48); 
  textAlign (LEFT ); 
  text(headlines[index],x,450); 
   
  // Decrement x 
  x = x - 3; 
  
  // If x is less than the negative width, 
  // then it is off the screen 
  float w = textWidth(headlines[index]); 
  if (x < -w) { 
      x = width; 
      index = (index + 1) % headlines.length; 
  }
}


