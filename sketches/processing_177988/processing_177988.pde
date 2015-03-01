
void setup() {
  size(800,800);
 PImage img;
img = loadImage("R4.png");

image(img,0,0);
}
void draw() {
  if (mousePressed == true){
  PImage img;
    fill(mouseX,mouseY,0);
   img = loadImage("R2.png");
   img = loadImage("R1.png");
   image(img,random(width), random(height));
 
}
if (key=='i'||key=='I'){
  PImage img; 
img = loadImage("R4.png");
image(img,0,0);
}  
  if (mousePressed == true){
  PImage img;
   img = loadImage("R2.png");
   image(img,random(width), random(height));
 
}

if (key=='t'||key=='T'){
 textSize(random(30));
fill(random(100), random(100), random(100)); 
text("Connecting minds", random(width), random(height)); 
text("Creating the future", random(width), random(height));
text("The future is in our hands", random(width), random(height));

  
  
  
}

//Background image as soon as you press 'i' or 'I' will not be interactable.
//Same as the text which will not stop.
//to fix this, press any keyboard key.


}


