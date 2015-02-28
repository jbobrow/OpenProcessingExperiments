
PImage hand;

void setup() {
  size(640, 480);
  smooth();
  hand = loadImage("Home.jpeg");
      background( 238, 238, 238);
  
}

void draw() {
    //scale(.2, .2);
  image( hand, mouseX-(216/2), mouseY - (166/2));

  if (mousePressed == true) {
 

  
    scale(random(.5,1.2), random(.5,1.2));
    
   
}
}


