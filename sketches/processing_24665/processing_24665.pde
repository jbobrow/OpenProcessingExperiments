
import ddf.minim.*;

Minim minim;
AudioInput in;

PImage[] images = new PImage[7];
int counter = 0;

int timer; //kid
int threshold = 200; //kid

void setup() {
  size(360,220, P2D);
  smooth();

  images[0] = loadImage( "dd_1.png" );
  images[1] = loadImage( "dd_2.png" );
  images[2] = loadImage( "dd_3.png" );
  images[3] = loadImage( "dd_4.png" );
  images[4] = loadImage( "dd_5.png" );
  images[5] = loadImage( "dd_6.png" );
  images[6] = loadImage( "dd_7.png" );

  minim = new Minim(this);
  minim.debugOn();

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {
  background(255);
  imageMode(CENTER);
  float micV =  in.right.level();
  micV= micV*20;    // sensativity of mic value


  if (millis() - timer  > threshold) { //kid

      if (micV > 0.5) {        // if micV greater than 1 (someone blows to the mic)  ! You have to play with the number in order to get the better result
      timer = millis(); //kid
      counter ++;          // counter plus 1
      if (counter > 6) counter = 0;   // if counter greater than 4, set the counter = 0 (image plays to the end, go back to image 1
      println (counter+micV);
    }
  }

  image(images[counter], width/2, height/2);
}


