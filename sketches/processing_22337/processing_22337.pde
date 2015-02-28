
//naming image and font variables. 
PFont fontA;
PImage img;

//image sizing and selection.
void setup() 
{
  smooth();
  size(400, 267);
  img = loadImage("lost.jpg");
  image(img,0,0);
//font sizing, selection and positioning.
  fontA = loadFont("Helvetica-48.vlw");
  textFont(fontA,10);
  textAlign(CENTER);
 
} 

 
void draw(){
  frameRate(35);
  fill(255);
//setting parameters for the randomize words to appear.
  text("LOST", random(0,400), random(0,267));
//setting the colour to white. 
  fill(255);
//setting the parameters for the text size.
  textSize(random(10,25));
}
 
//reseting screen (back to the originalimage) when mouse is clicked. 
void mouseClicked(){
  background(img);
}



