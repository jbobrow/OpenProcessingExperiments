

int frame = 0;
int numFrames = 19;
PImage[] images = new PImage[numFrames];

//text coordinates
int textx = 20;
int texty = 30;



void setup() {
frameRate(10);
size(600,500);

//setting the first image as the background
PImage bg;
bg = loadImage("cookie00.jpg");
background(bg);

//setting text
fill(0);
  PFont font;
  font = loadFont("AmericanTypewriter-Light-12.vlw");
  textFont(font, 12);
  text("Click to eat and enjoy!", textx, texty);


for (int i = 0; i<images.length; i++){
String imageName = "cookie" + nf(i,2) + ".jpg"; //imageName is name of files
/*(i, #) represents the number of digits in the img numbering sys*/
println("imageName" + imageName);

images[i] = loadImage(imageName);

}



}

void draw() {
  
  
  
  if(mousePressed == true){
    frame++;
    

    if(frame == numFrames){
      frame=0;
    }

  image(images[frame], 0, 0);

 //setting up the text instructions
  fill(0);
  PFont font;
  font = loadFont("AmericanTypewriter-Light-12.vlw");
  textFont(font, 12);
  text("Click to eat and enjoy!", textx, texty);

  } 
    
  }


