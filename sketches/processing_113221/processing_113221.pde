
//53463247 Young Hiu Ting Assignment 3

int numFrames2 = 25; //the total number of frame of flower
int frameA = 0;
PImage[] flower = new PImage[numFrames2];

int numFrames = 6; //the total number of frame of butterfly  
int frame = 0;
PImage[] bf = new PImage[numFrames]; 

PImage bg;

float ss, x;

void setup() {
  size(600, 600); //set the background size    
  imageMode(CENTER);
  frameRate(24); //set the speed of frame moving
  noStroke(); 
  
  //load the images into the program
  bg = loadImage("avatar_screenshot_024_re.jpg"); //downloaded from http://definitioncheyenne.blog.com/
  
  flower[0] = loadImage("flower0001.png");  //the images of the flower and the butterfly are from my previous work
  flower[1] = loadImage("flower0002.png");
  flower[2] = loadImage("flower0003.png");
  flower[3] = loadImage("flower0004.png");
  flower[4] = loadImage("flower0005.png");
  flower[5] = loadImage("flower0006.png");
  flower[6] = loadImage("flower0007.png");
  flower[7] = loadImage("flower0008.png");
  flower[8] = loadImage("flower0009.png");
  flower[9] = loadImage("flower0010.png");
  flower[10] = loadImage("flower0011.png");
  flower[11] = loadImage("flower0012.png");
  flower[12] = loadImage("flower0013.png");
  flower[13] = loadImage("flower0014.png");
  flower[14] = loadImage("flower0015.png");
  flower[15] = loadImage("flower0016.png");
  flower[16] = loadImage("flower0017.png");
  flower[17] = loadImage("flower0018.png");
  flower[18] = loadImage("flower0019.png");
  flower[19] = loadImage("flower0020.png");
  flower[20] = loadImage("flower0021.png");
  flower[21] = loadImage("flower0022.png");
  flower[22] = loadImage("flower0023.png");
  flower[23] = loadImage("flower0024.png");
  flower[24] = loadImage("flower0025.png"); 
  
  bf[0]  = loadImage("butterfly0001.png");
  bf[1]  = loadImage("butterfly0002.png"); 
  bf[2]  = loadImage("butterfly0003.png");
  bf[3]  = loadImage("butterfly0004.png"); 
  bf[4]  = loadImage("butterfly0005.png");
  bf[5]  = loadImage("butterfly0006.png"); 
}


void draw() {
  background(bg); //set bg to be the background image
  ss = random(30);
  fill(255, 100); //set the color of the sparkle
  ellipse(random(900), random(900), ss, ss); //set the size and the location of the sparkle with random value
    
//the animation of the flower will be played when you press any key  
if (keyPressed == true){
  frameA = (frameA+1) % numFrames2;
  image(flower[frameA % numFrames2], width/2, 550, 500, 550);
  
  } else {
    image(flower[6], width/2, 550, 500, 550);
  }
  
  frame = (frame+1) % numFrames ;  // set the frames can be looped continuously
  image(bf[frame % numFrames], mouseX, mouseY, width/3, height/3); //the butterfly will move when the mouse is moving
}



