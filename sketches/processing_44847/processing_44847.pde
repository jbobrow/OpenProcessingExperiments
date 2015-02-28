
//source code:  http://openprocessing.org/visuals/?visualID=40760


PImage img;

void setup() {
  noStroke();
  smooth();
  size(400, 354);
  img=loadImage ("post_itcropped.jpg");
  image(img,0,0);
}
 
void draw() {
  frameRate(800);

 
  if (mousePressed && (mouseButton == LEFT)) {
    fill(0);
    ellipse(mouseX,mouseY,4,4);
    fill(0,100);
    ellipse(mouseX+1,mouseY-2,4,2);
    //writing tool - creates a trail of ellipses
      

  } else if (mousePressed && (mouseButton == RIGHT)) {
    image(img,0,0);  
    //resets the image to a blank canvas when right mouse is right clicked
  
  } else {
    noFill();
    
    
  }
}

