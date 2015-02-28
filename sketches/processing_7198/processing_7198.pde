

PImage camera;
PFont garamond;

void setup(){
size( 400, 400);
camera = loadImage("camera.png");
background(100);
garamond = loadFont("Garamond-67.vlw");
textFont(garamond);
textSize(40);
textLeading(50);
}

void draw(){
  
noTint();
image(camera, 40, 40);
image(camera, -40, -40);
tint(241, 189, 49, 100);
fill(255, 5);
image(camera, random(-500,500), random(-500,510) );
fill(255, 255);
text("CAMERA", random(-50, 500), random(-20, 500));


}


