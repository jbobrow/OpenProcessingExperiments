
//naming the image variable. 
PImage dig1;
PImage dig2;

//image sizing and selection.
void setup(){
  size(400,267); 
  smooth();
  noStroke();  
  dig1 = loadImage("dig1.jpg");
  dig2 = loadImage("dig2green.jpg");
}

void draw() {
//original image positioning.
image(dig1,0,0);

//setting the interaction in order to change the image.
    keyReleased ();
  if (keyCode==DOWN) {
    image(dig1,0,0);
}

//setting the interaction to change back to the original image. 
      keyReleased ();
  if (keyCode==UP) {
    image(dig2,0,0);
  }
}


