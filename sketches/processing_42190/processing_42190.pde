
int counter = 0;
PImage[] images = new PImage[5];  // an array holding 5 series images


void setup() {
  frameRate(5);
  size(700, 600);
  background(200);
  images[0] = loadImage( "scene1.jpg" );
  images[1] = loadImage( "scene2.jpg" );
  images[2] = loadImage( "scene3.jpg" );
  images[3] = loadImage( "scene4.jpg" );
  images[4] = loadImage( "scene5.jpg" );
  smooth ();
  
}


void draw() { 
    background(200);
    imageMode(CORNER);
    image(images[counter], 0, 0);   // take image from counter array and place image at corner
    
    
   if(counter == 0) {
   noStroke (); 
   fill (145, 35, 27);
   ellipse(mouseX, mouseY, 75, 15);
   }
   
   if(counter == 1) {
   noStroke (); 
   fill(random(165), random (175), 60, 100);
   rect(random(width), random(height), 1, 15);
   rect(random(width), random(height), 1, 25); 
   rect(random(width), random(height), 1, 10);   
   rect(random(width), random(height), 1, 35);  //rain effect
   }
   
  
  
  if(counter == 3) {
   noStroke (); 
   fill (255);
   ellipse(random(width), random(height), 10, 10);
   ellipse(random(width), random(height), 5, 5); 
   ellipse(random(width), random(height), 2, 2);   
   ellipse(random(width), random(height), 15, 15);  //snow effect 
   }
   
   
   if(counter == 2) {
   noStroke (); 
   fill(random(165), random (75), 60, 60);
   rect(random(width), random(height), 10, 10);
   rect(random(width), random(height), 15, 15); 
   rect(random(width), random(height), 21, 21);   
   rect(random(width), random(height), 25, 25);  //leaves
   }

  }
  void mousePressed() {
  if(counter < 4) {
    counter++;
 } else {
   counter = 0;

 }
   
 }


