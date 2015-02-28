
//Andres Kõpper
//Processing class, IED Barcelona, Week 11
//23.02.2011

//The sketch is a simple way of giving a RETRO kind of a look with just few second
//And there is not even a need to touch Photoshop!

//Pressing 'i' 'v' and 'o' keys it is possible to change pictures.
//Pressing 'c' clears the screen.

//I first enter the images needed.
PImage img;
PImage img1;
PImage img2;
PImage particle; //The colorizing point
PImage vignette;// Darker edges
PImage crack; //Possibility to make cracks by clicking the mouse.
float pointillize = random(150,200); //The size of the colorizing spots




void setup() {
  size(720,480);
  img = loadImage("IMG_9631.jpg");
   img1 = loadImage("IMG_9630.jpg");
   img2 = loadImage("IMG_9626.jpg");
  crack = loadImage("crack.png");
  vignette = loadImage("vignette.png");
  particle = loadImage("smoke_particle.png");
 
  smooth();
  //Display background image
  image(img,0,0);
  tint(255,190);
  image(vignette,0,0);
}
void keyPressed () {
  switch (key) {
    case'i':
    
  imageMode(CORNER);
  
  image(img,0,0);
  break;

  case'v':
  imageMode(CORNER);
  
  image(img1,0,0);
  break;
  case'c':
  fill(240,10);
  rect(0,0,width,height);
  
   break;

  case'o':
  imageMode(CORNER);
  image(img2,0,0);
  }
}
void draw() {
  
  // Pick a random point
  
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  // Display the particle image on a pixels with its original (pixel) color.
  tint(r+90,g+78,b-20,10);
  
imageMode(CENTER); 
  image(particle,x,y,pointillize,pointillize); 
  //Then draw ines to make te picture look old.
  strokeWeight(1);
  stroke(r-100,g-90,b-220,5);
  line(random(width),random(height),random(width),random(height));
  //Adding some random shapes to make the image more weary.
  fill(r-200,g-200,b-100,1);
  quad(random(width),random(height),random(width),random(height),random(width),random(height),random(width),random(height));
// A possibility to create some cracks in the picture
if(mousePressed){
  tint(14,3);
  image(crack,mouseX,mouseY,crack.width/5,crack.height/2);
updatePixels();  
}

}


