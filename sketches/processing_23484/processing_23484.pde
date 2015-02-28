
int numFrames = 20;
int frame = 0;
int i = 100;
int b = 9;
int c = 30;

PImage[] images = new PImage[numFrames];
PImage start;

void setup()
{
  size(640, 480);
  background(255);
  smooth();
  frameRate(9); 

  start = loadImage("s1.png"); 
  image (start,0,0);


  images[0]  = loadImage("s1.png");
  images[1]  = loadImage("s2.png");
  images[2]  = loadImage("s3.png");
  images[3]  = loadImage("s4.png");
  images[4]  = loadImage("s5.png");  
  images[5]  = loadImage("s6.png");  
  images[6]  = loadImage("s7.png");  
  images[7]  = loadImage("s8.png");  
  images[8]  = loadImage("s9.png");  
  images[9]  = loadImage("s10.png");  
  images[10]  = loadImage("s11.png");  
  images[11]  = loadImage("s12.png");  
  images[12]  = loadImage("s13.png");  
  images[13]  = loadImage("s14.png");  
  images[14]  = loadImage("s15.png");  
  images[15]  = loadImage("s16.png");  
  images[16]  = loadImage("s17.png");  
  images[17]  = loadImage("s18.png");      
  images[18]  = loadImage("s19.png");  
  images[19]  = loadImage("s20.png");
}



void draw() {
  background (255);

  float pupilXL = map(mouseX, 0, width, 120, 220);
  float pupilYL = map(mouseY-15, 0, height, 200, 250);
  float pupilXR = map(mouseX, 0, width, 440, 540);
  float pupilYR = map(mouseY+15, 0, height, 200, 250);

  fill (0,0,0,i);
  noStroke();
  ellipse(pupilXL, pupilYL, 70, 70);

  fill (0,0,0,i);
  noStroke();
  ellipse(pupilXR, pupilYR, 70, 70);

  image(start,0,0);
  

  if(mousePressed == true) { 

    if(i<255) { 
      i+=b;
    }
    if (frame <= 20) { 
      frame = (frame+1)%20;  
      image(images[frame], 0, 0);
    }

  }  else {

    if (i>100) {
      i-=c;
      
//    }
//    if (frame >= 0) {
//      frame = (frame+1)%numFrames;
//      image(devolve[frame], 0, 0);
    }
  }
}

