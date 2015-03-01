
int numFrames = 4; // the number of frames in the animation
int currentFrame = 0;

PImage[] myImageArray = new PImage [numFrames];

void setup() {
  size(300, 400);
  
  myImageArray[0] = loadImage("TheHiker-draft2-R.png");
  myImageArray[1] = loadImage("TheHiker-draft2-mid.png");
  myImageArray[2] = loadImage("TheHiker-draft2-L.png");
  myImageArray[3] = loadImage("TheHiker-draft2-mid.png");
  
  frameRate(2);
}

void draw() {
  background(0);
  currentFrame = (currentFrame+1 % numFrames);  // Use % to cycle through frames
  int offset = 0;
  for (int x = 0; x < width; x += myImageArray[0].width) {
    image(myImageArray[(currentFrame+offset) % numFrames],0,0,300,400);
    //image(myImageArray[(currentFrame+offset) % numFrames],300,0); 
 }
println(currentFrame);

translate(mouseX, mouseY);
noStroke();
ellipse(0,0,15,15);
}

//if mouseX += 175 {
  //loadImage("TheHiker-draft1-R.png");
  //}
//if mouseX -= 175 OR += 125 {
  //loadImage("TheHiker-draft1-mid.png");
  //}
//if mouseX -= 125 {
  //loadImage("TheHiker-draft1-L.png");
  //}



