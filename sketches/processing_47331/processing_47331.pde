

PShape mypicture;// it is used to load a shape

void setup() {
  size(640, 640);
  smooth();
 mypicture = loadShape("bot1.svg"); //shape created by Inkscape.
}                                    //It is a vector image so no distrotion can be made

void draw() {
  background(0);
  translate(width/2, height/2);// now this is used to pinpoint the centre of the screen.
  float sizeofmypicture = map(mouseX, 0, width, 0.1, 4.5); //map function actually calculate the position of mouse pointer and value is saved in sizeofmypicture variable 
  scale(sizeofmypicture); 
  shape(mypicture, -340, -280);
}

