

 
PImage img;
PImage maskImg;

void setup() {
  size(200, 200);
  img = loadImage("foto.jpg");
  maskImg = loadImage("gerardo.jpg");
  img.mask(maskImg);
  imageMode(CENTER);
  frameRate(30);
  smooth ();
}

void draw() {
  background(map(mouseX+mouseY, 0, width+height, 0, 255));
  image(img, width/2, height/2);
  image(img, mouseY, mouseX);
  stroke(mouseX, 20 , mouseY); 
float distance = dist(pmouseX, pmouseY, mouseX, mouseX);
float maxStroke = 25;
strokeWeight(maxStroke - constrain(distance, 5, maxStroke));
fill (9,189,9);
line(pmouseX, pmouseY, mouseX, mouseY);
if (mousePressed) {
fill(0,0,200);
} else {

}
ellipse(mouseX, mouseY, 30, 30);
if (mousePressed) {  

  fill(20,20,0);
line (90,90,90,90); 
}

if(keyPressed) { 
  fill (100,100,100);
ellipse (mouseY, mouseX, 180,180);
}
 
}


