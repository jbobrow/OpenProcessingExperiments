
float angle = 0.0; 

PImage[] images = new PImage[4]; //stores 4 images

void setup() { 

  size(600, 600);  //set up the windows
  background(255); //set the background white
  frameRate(10); //make the frame rate at 10


  for ( int i = 0; i < images.length; i++ ) { // load image only once
    images[i] = loadImage( i + ".png" );
  }
} 

void draw() { 

  if (mousePressed == true) {  //run when mouse is pressed onece

    translate(mouseX, mouseY ); //transformation
    angle = random (0, TWO_PI); 
    rotate(angle); //rotate image angle from 0 to two pi
    scale(random(0.2, 1.0)); //scale the image random from 0.2 to 1.0

    int i = int(random(3.5)); //sometimes nothing happen when mouse is pressed
    image(images[i], mouseX,mouseY);
  }
}

void keyPressed() { 
  save("image.png"); //save a file when a key is pressed
}


