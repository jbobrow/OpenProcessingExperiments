
//Import 'Minim' library files
import ddf.minim.*;

//Declare global variables
float angle = 0.0;
PImage img;
color[]ocean={#27353E,#51A2D3,#FC545F,#FAF55D,#86FFAF};
int x;
Minim minim;
AudioSample mixdown;

//Load audio and image files
void setup() {
  size(1280, 720);
  img = loadImage ("proce.jpg");
  smooth();
   minim = new Minim(this);
 mixdown = minim.loadSample("mixdown.wav");
  
}
//Draw code block
void draw() {
 translate(mouseX, mouseY);
rotate(angle); 
fill(80, 148, 234);
  image(img, -180, -180, 210, 210);
  angle += 0.1;

 float r=random(4);
fill(ocean[int(r)]);
stroke(ocean[(4)]);
strokeWeight(5);
rect(x,100,100,100);

 x+=75;
 if (x > 800){
 x=0;
 
}
}
//Create a key trigger
void keyPressed() {
 if ( key == 'b' ) mixdown.trigger();
  if ( key == 'b' ) println("sample triggered");
  
}

