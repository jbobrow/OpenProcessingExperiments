
//Victoria Wright z3254281
//Assignment 1
//



//set button to false
boolean button = false;


Shape s0;
Shape1 s1;
Shape2 s2;
Shape3 s3;

//images to load
PImage Texture;
PImage Shape;
PImage Shape1;
PImage Shape2;
PImage Shape3;

//set button to false
boolean displayShape = false;
boolean changeColour = false;

void setup () { 
  // load images
  Shape = loadImage ("Shape.gif");
  Shape1 = loadImage ("Shape1.gif");
  Shape2 = loadImage ("Shape2.gif");
  Shape3 = loadImage ("Shape3.gif");
  Texture = loadImage ("Texture.jpg");
  size(Texture.width,Texture.height);
  smooth(); 

  //constructor 
  s0= new Shape (25);
  s1= new Shape1 (25);  
  s2= new Shape2 (25);
  s3= new Shape3 (25);
}

void draw () { 
  image (Texture,0,0);

  //call functions
  s0.update(mouseX,mouseY);
  s0.display();

  s1.update (mouseX+120,mouseY-45);
  s1.display();

  s2.update (mouseX+90,mouseY+55);
  s2.display();

  if (mouseY< 100) {
    //tint one
    tint(170,120,31); 
    image(Shape,mouseX,mouseY);
  }
  if ( mouseY > 100 && mouseY < 200) {
    //tint two
    tint(130,75,24); 
    image(Shape,mouseX,mouseY);
  }
  if ( mouseY > 200 && mouseY < 250) {
    //tint two
    tint(124,65,24); 
    image(Shape,mouseX,mouseY);
  }
  if (mouseY > 250 && mouseY <350) {
   //tint three
    tint(124,55,24); 
    image(Shape,mouseX,mouseY);
  }

  if (mouseY > 350) {
    //tint four
    tint(100,32,14); 
    image(Shape,mouseX,mouseY);
  }

  if(displayShape) {
    s3.update (mouseX-90,mouseY-150);
    s3.display();
  }
  //change tint to grey, only if mouse is pressed 
  if (changeColour) { 
    filter (GRAY); 
  }
}
// if mouse is pressed display the extra shape
void mousePressed () {
  if(displayShape) {
    displayShape = false;
  } 
  else {
    //its false make it true
    displayShape = true;
  }
}

void keyPressed () {
  if(changeColour) {
    changeColour = false;
  } 
  else {
    //its false make it true
    changeColour = true;
  }
}




