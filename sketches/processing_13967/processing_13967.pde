
// Project 3 "photoCOLLAGE"
// Zach Spitulski 10/19/10
// DMA 28 INTERACTIVITY, UCLA
// Version 0.3


//CURRENT BUGS
// * Random function needs work. Isn't always "Random"
// * More anti-aliasing needed

// Using Array to declare photos. Declares font(s)
PImage[] images = new PImage[6];
PImage bg;
PFont trendex;
int s, m, h; 

void setup() {
   bg = loadImage("bg.jpg");  
   trendex = loadFont("TrendexLightSSi-48.vlw");  
  size(800,800);
  smooth();
  frameRate(2);
  noStroke();
  image(bg,0,0);

// Use Array to load all images that were declared above.
   for ( int i = 0; i< images.length; i++ )
   {
    images[i] = loadImage( i + ".png" ); 
  }
}

void draw() {  
  // Randomly Pick Image + Properties
  float imageRotation = random(-90,90);
  float imageX = random(0,800);
  float imageY = random(0,700);
  float imageScaleWidth = random(60,250);
  float imageScaleHeight = imageScaleWidth*1.08;

  
  // Draw, Rotate + Scale Image
  imageMode(CENTER);
  pushMatrix();
  translate(imageX, imageY);
  rotate(radians(imageRotation));
  filter(BLUR,.6);
  image(images[int(random(6))], 0, 0, imageScaleWidth, imageScaleHeight);
  popMatrix();
  
  // Draw current time (Draw Hour/Minute/AM or PM)
 s = second();
 m = minute();
 h = hour();
 
 fill(70,100);
 rect(0,740,84,60); 
 fill(50,100);
 rect(84,740,60,60);
  
 textFont(trendex);
 fill(255);

// Define AM or PM (Fixed switch bug - 
 if (h < 12 || h == 24) {
   text("AM",155,785);
 } 
 else {
   text("PM",155,785); 
 }
 // Define Hour + add "0" if hour is singular
 if (h < 10) {
  text("0"+h%12,30,785);
 }
 else if (h == 12 || h == 24) {
  text("12",30,785);
 }
 else {
   text(h%12,30,785);
 }
 
 // Define Minute (fixes 10 minute bug)
 if (m<10) {
   fill(178,85,56);
   text("0"+m,90,785);
 }
   else {
     fill(178,85,56);
     text(m,90,785);
   }
}


