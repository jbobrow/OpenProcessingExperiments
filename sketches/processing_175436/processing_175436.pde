
// loading and Image
 
// PImage is a special Datatype.  It is used to store images
PImage img; // Setting up an image variable called img
    // @pjs preload must be used to preload the image 

    /* @pjs preload="IMG_1543.jpg"; */

    PImage b;

    b = loadImage("IMG_1543.jpg");

    image(b, 0, 0); 
PImage online;



void setup() {

  String url = "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQUe72FPpLWjHSCNssJGTnknk9Pnsq_tLM2enlItgSBmDvMqeeq";

  online = loadImage(url, "png");

  noLoop();

}
    
void setup(){
  size (610,610);
  // using Processing's loadImage method to import an image and store it in the variable img
  img = loadImage("IMG_1543.jpg");
}
 
 
 
void draw(){
      background(150);
  // using Processing's image method to display the image
// the image method has three arguments (the name of the image, the x position , the y position)
// when we write a method we will often add what we call arguments.  For example the rectangle
// method has 4 arguments the x and y position and the width and height. 
// the code as we have see looks like this rect (10,10,50,50);
// the arguments are the information that goes inside the brackets
// each argument is separated by a comma
 
  image(img, 0, 0);
 
   
}
