
PImage myImage;


void setup(){
   myImage= loadImage("colorpicker.jpg");
  size(558,407);
  imageMode(CORNER);
}

void draw(){
  image(myImage,0,0);
  background(myImage);
  fill(mouseX,mouseY/2,89+mouseY);
  rect(27,58,230,230);
  
  fill(98);
  rect(380,84,137,46);
  
  textSize(13);
  fill(255);
  text("Ok,Im feeling it",400,115);
}


