

float scaler; //I added this.
PImage img1;


void setup() {
  size (700, 700);
  smooth ();
  background (255);
  img1 = loadImage ("nn_03.png");
  imageMode (CENTER);
}

void draw() {
   background(255);
//  for (int i = 50; i < 600; i = 50) {
    strokeWeight (2);
    fill(255);

    translate(250, 250);
    //You can use scale but you should use a variable as your scaler,
    //so we can reset it later (see below).
    
    scaler = scaler + 0.05; //grow it a little each frame.
    scale (scaler);
    image(img1, 50, 20);
    
    //It's simpler than you think. No need for a for-loop.
    //Just check with an if-statement to see if rect ever gets
    //bigger than the screen. If it does, reset it to 0.
    println(scaler);
    if(scaler > 15){ //why 11? remember, scale is %, not pixel size.
       scaler = 0; 
    }

 // }
}

