


// Random Flag Generator
// By Traditum

// Define variables, most of these are images and I probably should put them in an array/array list but I couldn't get it to work
PImage ima; //images
PImage imb;
PImage imc;
PImage imd;
PImage ime;
PImage imf;
PImage img;
PImage imh;
PImage imi;
PImage imj;
PImage imk;
PImage iml;
PImage imm;
PImage imn;
PImage imo;
PImage imp;
PImage imq;
PImage imr;
PImage ims;
PImage imt;
PImage imu;
PImage imv;
PImage imw;
PImage imx;
PImage imy;
PImage imz;// end of images
int ixpos; //xposition of the image
int iypos; //yposition of the image
float imgseed; //random number from 1 to 13 that decides which image to use
PImage activeimage; //the image that will actually be used on the flag
float imgscale; //size that the image is scaled to, varies depending on flag type

Back myBack; // Defines the variable myBack as a member of the 'Back' class

void setup(){ //Setup process is run at the start of the program
  size(500,300,P2D); //Set window size as 500px x 300px, use the Processing 2D rendering engine (the default Java 2D one seems to crash with this sketch)
  background(#FF0000); //Set starting background colour as red, I am using the hexadecimal encoding because it is easier for me to understand but you could use RGB or HSB if you prefer
  noStroke(); // Disables the stroke around shapes
  smooth(); // Smooths edges of shapes and text
  PFont kremlin; //Defines a font variable called 'kremlin'
  kremlin = loadFont("Kremlin-32.vlw"); //Load an external file containing the font
  textFont(kremlin, 32); //Set kremlin as the active font
  fill(#FFFF00); // Set fill colour as yellow
  text("Click to generate flag", 25,155); //text, xpos, ypos
  //text("Press a key to save flag", 25, 175); //text, xpos, ypos // Coming in the next version!
  rectMode(CENTER); // Rectangles are positioned by their center rather than their top left corner
  imageMode(CENTER); // Images are positioned by their center rather than their top left corner
  imageload(); // run the imageload subprocess
  ixpos = 250; // xposition of center of image
  iypos = 150; // yposition of center of image
  imgscale = 100; // size of image in pxls
}

void draw(){ // The draw routine runs once for every frame

}

void mousePressed(){ // When the mouse is pressed...
  ixpos = 0; // zero variables (not strictly necessary but just to be safe)
  iypos = 0;
  imgscale = 0;
  myBack = new Back(); //create a new object of the 'Back' class called myBack
  myBack.run(); // Run the subprocess called "run", this process is located in the 'Back' class on the second tab
  imageSelect(); // Run the image select subprocess
  activeimage.resize(0,int(imgscale)); // resize the active image based on the imgscale variable (usually passed from the background type)
  image(activeimage,ixpos,iypos); // display the active image with its center at ixpos,iypos
  
}

void imageload(){ // Load all the images (yes... I know there are 26 of them, and that I should have used an arraylist)
  ima = loadImage("crosscross.png");
  imb = loadImage("crosscross_i.png");
  imc = loadImage("crosscurved.png");
  imd = loadImage("crosscurved_i.png");
  ime = loadImage("crosses.png");
  imf = loadImage("crosses_i.png");
  img = loadImage("crossfloral.png");
  imh = loadImage("crossfloral_i.png");
  imi = loadImage("crosspointed.png");
  imj = loadImage("crosspointed_i.png");
  imk = loadImage("eagle.png");
  iml = loadImage("eagle_i.png");
  imm = loadImage("keys.png");
  imn = loadImage("keys_i.png");
  imo = loadImage("lion.png");
  imp = loadImage("lion_i.png");
  imq = loadImage("soviet.png");
  imr = loadImage("soviet_i.png");
  ims = loadImage("stag.png");
  imt = loadImage("stag_i.png");
  imu = loadImage("star5pt.png");
  imv = loadImage("star5pt_i.png");
  imw = loadImage("stardavid.png");
  imx = loadImage("stardavid_i.png");
  imy = loadImage("templar.png");
  imz = loadImage("templar_i.png");
}

void imageSelect(){ // imageSelect subprocess, select the image to display
  imgseed = 0; // set variable imgseed to 0
  imgseed = random(13); // set variable imgseed to a random value between 0 and 13
  
  if (imgseed<1){ //again should have used a for loop and an array for this, in the revised version I will. Basically this huge wall of text here takes the random seed and decides which image to make active based upon its value. Next version I may try to make it make a more informed decision based upon the background colors
    activeimage = ima;
  } else if (imgseed<1.5){
    activeimage = imb;
  } else if (imgseed<2){
    activeimage = imc;
  } else if (imgseed<2.5){
    activeimage = imd;
  } else if (imgseed<3){
    activeimage = ime;
  } else if (imgseed<3.5){
    activeimage = imf;
  } else if (imgseed<4){
    activeimage = img;
  } else if (imgseed<4.5){
    activeimage = imh;
  } else if (imgseed<5){
    activeimage = imi;
  } else if (imgseed<5.5){
    activeimage = imj;
  } else if (imgseed<6){
    activeimage = imk;
  } else if (imgseed<6.5){
    activeimage = iml;
  } else if (imgseed<7){
    activeimage = imm;
  } else if (imgseed<7.5){
    activeimage = imn;
  } else if (imgseed<8){
    activeimage = imo;
  } else if (imgseed<8.5){
    activeimage = imp;
  } else if (imgseed<9){
    activeimage = imq;
  } else if (imgseed<9.5){
    activeimage = imr;
  } else if (imgseed<10){
    activeimage = ims;
  } else if (imgseed<10.5){
    activeimage = imt;
  } else if (imgseed<11){
    activeimage = imu;
  } else if (imgseed<11.5){
    activeimage = imv;
  } else if (imgseed<12){
    activeimage = imw;
  } else if (imgseed<12.5){
    activeimage = imx;
  } else if (imgseed<13){
    activeimage = imy;
  } else {
    activeimage = imz;
  }
}





