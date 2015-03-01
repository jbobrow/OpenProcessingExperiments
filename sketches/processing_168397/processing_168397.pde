
int numFrames = 13; // The number of animation frames
int frame = 0; // The frame to display
PImage[] images = new PImage[numFrames]; // Image array
int onTime;
void setup() {
  setupAudio();
  size(1600, 1200);
  frameRate(5); // Maximum 30 frames per second
  images[0] = loadImage("img001.jpg");
  images[1] = loadImage("img002.jpg"); 
  images[2] = loadImage("img003.jpg");
  images[3] = loadImage("img004.jpg"); 
  images[4] = loadImage("img005.jpg");
  images[5] = loadImage("img006.jpg"); 
  images[6] = loadImage("img007.jpg");
  images[7] = loadImage("img008.jpg");
  images[8] = loadImage("img009.jpg");
  images[9] = loadImage("img010.jpg"); 
  images[10] = loadImage("img011.jpg");
  images[11] = loadImage("img012.jpg");
  images[12] = loadImage("img013.jpg");
}

void draw() {
 frame++;
  if (frame == numFrames) { // If we've reached the 12th frame, start over
    frame = 0;
  }
  image(images[frame], -150, -250);



  // Draw the mouth.
  //getVolume(); // this call fetches the mic volume for the current frame.
  //float Y = map(volume, 0, 100, 2, 120);  // now we can use it for something!
 // fill(255, 200, 200);
 // ellipse(150, 200, 100, Y); 
//  println(volume);

  // Sets the timer when we get above the threshold
 if (volume > 0) {
 loadImage("img014.jpg");}
}
     // onTime = millis();
  //}
//}
  // Does something for a second
 // if (millis() - onTime < 1000) {
   // ellipse(150, 100, 80, 80);
    //fill(0);
    //textAlign(CENTER);
    //text("It got loud!", width/2, 50);
  


  // The rest of the code just draws the Eye:
  //float ex = 150;
  //float ey = 100;
  //fill(255);
  //ellipse(ex, ey, 60, 60);
  //fill(0);
  //float dx = constrain((mouseX-ex)/20, -14, 14);
  //float dy = constrain((mouseY-ey)/20, -14, 14);
  //ellipse(ex+dx, ey+dy, 20, 20);
//}

// Don't worry about understanding the stuff below!
import ddf.minim.*;
 
Minim minim;
AudioInput in;
float volume = 0;
float volumeF = 0; 
 
//-------------------------------------
void setupAudio(){
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
}
 
//-------------------------------------
void getVolume(){
  volumeF = in.right.level()*1000;
  volume = 0.8*volume + 0.2*volumeF;
}
 
//-------------------------------------
void stop(){
  in.close();
  minim.stop();
  super.stop();
}


