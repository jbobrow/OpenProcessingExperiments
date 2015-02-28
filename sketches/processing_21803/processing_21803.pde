

int counter = 0;
PImage[] images = new PImage[40];  // an array holding 5 images


void setup() {
  size(400, 400);
  background(200);
  frameRate(18); 
  images[0] = loadImage( "pine1.jpg" );
  images[1] = loadImage( "pine2.jpg" );
  images[2] = loadImage( "pine3.jpg" );
  images[3] = loadImage( "pine4.jpg" );
  images[4] = loadImage( "pine5.jpg" );
  images[5] = loadImage( "pine6.jpg" );
  images[6] = loadImage( "pine7.jpg" );
  images[7] = loadImage( "pine8.jpg" );
  images[8] = loadImage( "pine9.jpg" );
  images[9] = loadImage( "pine10.jpg" );
  images[10] = loadImage( "pine11.jpg" );
  images[11] = loadImage( "pine12.jpg" );
  images[12] = loadImage( "pine13.jpg" );
  images[13] = loadImage( "pine14.jpg" );
  images[14] = loadImage( "pine15.jpg" );
  images[15] = loadImage( "pine16.jpg" );
  images[16] = loadImage( "pine17.jpg" );
  images[17] = loadImage( "pine18.jpg" );
  images[18] = loadImage( "pine19.jpg" );
  images[19] = loadImage( "pine20.jpg" );
  images[20] = loadImage( "pine21.jpg" );
  images[21] = loadImage( "pine22.jpg" );
  images[22] = loadImage( "pine23.jpg" );
  images[23] = loadImage( "pine24.jpg" );
  images[24] = loadImage( "pine25.jpg" );
  images[25] = loadImage( "pine26.jpg" );
  images[26] = loadImage( "pine27.jpg" );
  images[27] = loadImage( "pine28.jpg" );
  images[28] = loadImage( "pine29.jpg" );
  images[29] = loadImage( "pine30.jpg" );
  images[30] = loadImage( "pine31.jpg" );
  images[31] = loadImage( "pine32.jpg" );
  images[32] = loadImage( "pine33.jpg" );
  images[33] = loadImage( "pine34.jpg" );
  images[34] = loadImage( "pine35.jpg" );
  images[35] = loadImage( "pine36.jpg" );
  images[36] = loadImage( "pine37.jpg" );
  images[37] = loadImage( "pine38.jpg" );
  images[38] = loadImage( "pine39.jpg" );
  images[39] = loadImage( "pine40.jpg" );
}


void draw() { 
  background(255);
  imageMode(CENTER);

  image(images[counter], 200, 200);   // make an image and place it at 300/300
  counter++;
  if (counter==32) {
    counter=12;
  }
}

void mousePressed() {
    counter=0;
  
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




