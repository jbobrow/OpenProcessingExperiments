
//This is my altered version of the kids toy, Wooly Willy, that I like to call Baldy Billy
//Blue= Press A, Red=Hold R, Bigger circle= press +, Delete= Space Bar

PImage img;
int tp = 15;

void setup() {
  //Image of Billy Corgan and made it the background
  img = loadImage("BillyBaldycolor.jpg");
  size(998,916);
  background(img);
  
}
//This allows the color to change as you hold or press certain keys
 void draw() {
    noStroke();
    fill(0);
    if(keyPressed)
    if (key == 'r' || key == 'r')
      fill(255,0,0);
    if (key == 'a' || key == 'a')
      fill(0,53,255);
    if (key == 'y' || key == 'y')
      fill(255,241,85);
    if (key == 'o' || key == 'o')
      fill(252,115,3);
    if (key == 'g' || key == 'g')
      fill(25,160,5);
    if (key == 'p' || key == 'p')
      fill(113,3,173);
    if (key == 'k' || key == 'k')
      fill(247,90,219);
    if (key == 'w' || key == 'w')
      fill(255);
    if (key == 's' || key == 's')
      save("BALD.tif");
    if (key == ' ' || key == ' ')
      background(img); 
    if(mousePressed) {
    ellipse(mouseX, mouseY, tp, tp);
     
    if(key == '+' || key == '+'){
    tp = tp+1;
    } else {
    tp = 15;
 }
    }
    
 }




