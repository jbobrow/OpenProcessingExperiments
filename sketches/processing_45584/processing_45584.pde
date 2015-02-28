
//loading variables
PImage img;
PFont font1; 
float x, y;

//setting up size, font and images
void setup() {
  img = loadImage("rita.jpg");
  size(700, 525);
  image(img, 0, 0);
  smooth();
  frameRate(100);

  font1= loadFont("ARCHRISTY-30.vlw");
  textFont(font1);
noStroke();
}

// font/typography
void draw() {
textFont(font1);
textSize(50);
fill(#FFFFFF, 200);
text("lebanon 2010", 400, 400);


}
//whenever you drag mouse, cirles will show
void mouseDragged() {
  fill(255);
  ellipse(mouseX, mouseY, 20, 20);
  
}

void keyPressed(){
  image(img, 0, 0);
}



  


