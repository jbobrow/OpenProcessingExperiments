
import processing.video.*;
//declare Capture object
Capture video;

//siempre cambiar el nombre de boolean pq aplica en todo, q no se repita con las demas variables
boolean imagesdirection = false;

PImage[] images = new PImage[5];
PImage[] images2 = new PImage[5];



int counter =0;

//FONDOS
void setup () {

  size (900,600);

  //load images into the array LIBELULA
  for (int i=0; i<images.length; i++) {
    images[i] = loadImage(i+1+".png");
  }

  for (int i=0; i<images2.length; i++) {
    images2[i] = loadImage(5+i+1+".png");
  }

  //velocidad
  frameRate (12);

  //initialize the Capture object
  video= new Capture (this, 800, 600, 20);
}



//LIBELULA
void draw () {

  //check to see if new frame is available
  if (video.available()) {
    //if so, read it
    video.read();
  }
  //display the video
//use a for loop to rotate the video and place it
for (int i =0; i<16; i++) {
pushMatrix ();
translate (width/2, height/2);
rotate (2*PI/16*i);
image (video, 0, 0);
popMatrix();
}



  imageMode(CENTER);


  //Los parentesis significan ..if imagedirection is true
  if (imagesdirection) {
    image(images[counter], mouseX, mouseY);
  }

  else {

    image(images2[counter], mouseX, mouseY);
  }
  counter ++;

  if (counter>4) {

    counter = 0;
  }
}

void mousePressed () {
  imagesdirection = !imagesdirection ;
}



