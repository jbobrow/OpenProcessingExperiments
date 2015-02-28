

float scaler = 0; //I added this.
float scaler2 = 10;
PImage img1;


void setup() {
  size (700, 700);
  smooth ();
  background (255);
  img1 = loadImage ("nn_03.png");
  imageMode (CENTER);
}

void draw() {
  float alph = map(scaler, 0, 10, 255, 0);
  
   background(alph);
//  for (int i = 50; i < 600; i = 50) {
    strokeWeight (2);
    fill(255);

    translate(width/2, height/2);
    //You can use scale but you should use a variable as your scaler,
    //so we can reset it later (see below).
    
    scaler = scaler + 0.075; //grow it a little each frame.
    
    
    pushMatrix();
    scale (scaler);
    tint(255, alph);
    image(img1, 0,0);
    popMatrix();
    
    pushMatrix();
    
   // scale(scaler2);
    image(img1, 0,0);
    popMatrix();
    
    //It's simpler than you think. No need for a for-loop.
    //Just check with an if-statement to see if rect ever gets
    //bigger than the screen. If it does, reset it to 0.
    println(scaler);
    if(scaler > 10){ //why 11? remember, scale is %, not pixel size.
       scaler = 0; 
    }

 // }
}

