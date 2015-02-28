
PImage img;  // Declare variable "a" of type PImage

void setup(){
  size(450, 450); //size of applet
  textFont(createFont("Helvetica", 14)); //command for font
  img = loadImage("small-plug.jpg"); //details for image
}

void draw(){
  background(150, 150, 150); //background colour
  image(img, 135, 155, 175, 136); //position and size of image
  
  if((mouseX < width/2) && (mouseY < height/2)){
    //details for red shapes and text
  noStroke(); //shapes have no stroke
  fill(255, 0, 0); //red fill for ellipse and square
  ellipse(100, 75, 160, 100); //red ellipse
  rect(142, 88, 30, 30); //red square
  fill(0); //black fill for text
  textAlign(CENTER); //text alignment
  text("I can't work,", 100, 70); //text for red bubble
  text("there is a power cut!", 100, 90); //text for red bubble
  fill(255, 0, 0, 70);
  rect(135, 155, 175, 136);
  
  
  }else if((mouseX > width/2) && (mouseY < height/2)){
    //details for yellow shapes and text
  noStroke(); //shapes have no stroke
  fill(255, 247, 0); //yellow fill for ellipse and square
  ellipse(350, 75, 160, 100); //yellow ellipse
  rect(278, 88, 30, 30); //yellow square
  fill(0); //black fill for text
  textAlign(CENTER); //text alignment
  text("I am sick,", 350, 70); //text for yellow bubble
  text("I need a new fuse!", 350, 90); //text for yellow bubble
  fill(255, 255, 0, 90);
  rect(135, 155, 175, 136);
  
  }else if((mouseX < width/2) && (mouseY > height/2)){
    //details for blue shapes and text
  noStroke(); //shapes have no stroke
  fill(0, 0, 255); //blue fill for ellipse and square
  ellipse(100, 375, 160, 100); //blue ellipse
  rect(142, 332, 30, 30); //blue square
  fill(0); //black fill for text
  textAlign(CENTER); //text alignment
  text("I am not connected", 100, 370);
  text("to anything!", 100, 390);
  fill(0, 0, 255, 80);
  rect(135, 155, 175, 136);
  
  }else if((mouseX > width/2) && (mouseY > height/2)){
    //details for green shapes and text
  noStroke(); //shapes have no stroke
  fill(0, 255, 0); //green fill for ellipse and square
  ellipse(350, 375, 160, 100); //green ellipse
  rect(278, 332, 30, 30); //green rectangle
  fill(0); //black fill for text
  textAlign(CENTER); //text alignment
  text("I am connected to", 350, 370);
  text("a foreign plug!", 350, 390);
  fill(0, 255, 0, 80);
  rect(135, 155, 175, 136);
  }
  }
  


