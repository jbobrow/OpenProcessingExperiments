

int counter = 0;
PImage[] images = new PImage[5];  // an array holding 5 images


void setup() {
  size(800, 640);
  background(200);
  images[0] = loadImage( "Comunication.jpg" );
  images[1] = loadImage( "Cycle.jpg" );
  images[2] = loadImage( "Exercise.jpg" );
  images[3] = loadImage( "Home.jpg" );
  images[4] = loadImage( "Thoughts.jpg" );
}


void draw() { 
    background(200);
    imageMode(CENTER);
    image(images[counter], 400, 320);   // make an image and place it at 300/300
  }
  
 void mousePressed() {
  if (counter<4)
  counter++;
  else{
    counter=0;
  }
  
 }
 
 
 // if you click too much, this crashes.. why? how would you fix it?



/*
void setup() {
  size(800, 800);
  background(200);
  String[] filenames = { "cats.jpg", "jumprope.jpg", "math.jpg", "pelican.jpg", "piano.jpg" };
  
  for (int i = 0; i < filenames.length; i++ ) {
    images[i] = loadImage(filenames[i]);
  } 
}

*/






