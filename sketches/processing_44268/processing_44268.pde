
PFont font1;
PFont font2;
PImage img; 

void setup(){
  
  background(0);
  size(800,800);
  frameRate(10);
  font1 = loadFont("ArialBlack-18.vlw");
  font2 = loadFont("ArialBlack-36.vlw");
  img = loadImage("IMG_1737.JPG"); 
   image (img, -20, 0); 
    
}
  
void draw(){
  
  textFont(font1);
float x = mouseX; // mouse x position determines x position
float y = mouseY; // mouse y position determines y position
    
text("Pumpkins scream in the dead of night", x, y);
fill(random(200),random(10),random(100));
if (mousePressed){
  image (img, -10, 0); 
  textFont(font2);
text("Pumpkins scream in the dead of night", x, y);
  
}
}


