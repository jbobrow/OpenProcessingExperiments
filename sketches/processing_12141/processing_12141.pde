
// loading and Image

// PImage is a special Datatype.  It is used to store images
PImage img; // Setting up an image variable called img

void setup(){
  size (610,610);
  // using Processing's loadImage method to import an image and store it in the variable img
  img = loadImage("image0033.jpg");
}



void draw(){
  background(255);
  // using Processing's image method to display the image
// the image method has three arguments (the name of the image, the x position , the y position)
// when we write a method we will often add what we call arguments.  For example the rectangle 
// method has 4 arguments the x and y position and the width and height.  
// the code as we have see looks like this rect (10,10,50,50);
// the arguments are the information that goes inside the brackets
// each argument is separated by a comma 

  image(img, 0, 0);

  
}

