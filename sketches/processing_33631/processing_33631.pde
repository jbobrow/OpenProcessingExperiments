
PImage myImage;
float eyesize = 30;




void setup() {
  smooth();
  size(500, 612);
  myImage=loadImage("queen.jpg");
  image(myImage, 0, 0);
}
void draw() {

  strokeWeight(1);    
  fill (255, 255, 255);
  ellipse (216, 204, eyesize, eyesize-10);
  ellipse (323, 184, eyesize, eyesize-10);
  fill (0, 0, 0);
  
  println(mouseX + " , " + mouseY);

  float leftangleeye=atan2 (mouseY-130, mouseX-320);
  float lefteyex=cos (leftangleeye) * eyesize * .3;
  float lefteyey=sin (leftangleeye) * eyesize *.3;

  ellipse (lefteyex + 216, lefteyey + 204, 5, 5);

  float rightangleeye=atan2 (mouseY-130, mouseX-420);
  float righteyex=cos (rightangleeye) * eyesize *.3;
  float righteyey=sin (rightangleeye) * eyesize *.3;

  ellipse (righteyex + 323, righteyey + 184, 5, 5);
}


