
//PImage dog = loadImage ("dog.jpg");
//image (dog, 0 , 0, 100, 100); // image ( image name, x, y , width, height); 

// copy( x, y , width, height, dx, dy, dwidth, dheight); 

//copy ( 0 , 0 , 100, 50, 0, 50, 100,50); 

PImage dog, puppy; 

void setup() {
  
  size(600, 400); 
  dog = loadImage("dog.jpg"); // image sourced from - takeapaws.com.au
  puppy = loadImage("puppy.jpg"); // image sourced from - climateshifts.org
  
}

void draw () {
  image(dog, 0 ,0 , width, height); // 1st imageas the background
  //copy (source Img, x, y , width, height, dx, dy, dwidth, dheight); 
  // where dx and dy refers to the area 
  
  copy (puppy, 0 , mouseY, width, 133, 0 , mouseY, width, 133);
} 
  // 133 is the no. of pixels

