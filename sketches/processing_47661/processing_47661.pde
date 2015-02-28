
//source code:  http://openprocessing.org/visuals/?visualID=40760
 
 
PImage img;
 
void setup() {
  noStroke();
  smooth();
  size(640, 480);
  img=loadImage ("img_0142.jpg");
  image(img,0,0);
}
  
void draw() {
  frameRate(1000);
 
//writing tool - creates a trail of ellipses 
//(draw your own milk image on the latte) 
  if (mousePressed && (mouseButton == LEFT)) {
    fill(#f5ead5);
    ellipse(mouseX,mouseY,6,6);
    ellipse(mouseX+10,mouseY-2,4,2);
    
       
 //resets the image to a blank canvas when right mouse is right clicked
  } else if (mousePressed && (mouseButton == RIGHT)) {
    image(img,0,0); 
    
   
  } else {
    noFill();
     
     
  }
}


