
PImage myPug;
PFont myFont;
  int penThickness = 1;
  color penColor;
  color red = color(255, 0, 0);
  color blue = color(0, 10, 247);
  color green = color(35, 139, 9);

void setup() {
    smooth();
  size(800, 800);
  myPug = loadImage("pug.jpg");
  image(myPug, 0, 0, 800, 800);

}

void draw() {
  smooth();
  myFont = loadFont("CaviarDreams-48.vlw");
  textFont(myFont, 32);
  fill(255, 0, 0);
  text ("Give this pug a baller costume!", 10, 40);
  
 // ellipse(mouseX, mouseY, 3, 3); //brush
  
  noStroke();
  fill(255); //eraser
  rect(20, 80, 70, 70);
  fill(255, 0, 0); //red square
  rect(20, 170, 70, 70);
  fill(0, 10, 247); //blue square
  rect(20, 260, 70, 70);
  fill(35, 139, 9); //green square
  rect(20, 350, 70, 70);
  
  
  if(mousePressed) {
    stroke(penColor);
    line(pmouseX, pmouseY, mouseX, mouseY); }
   
       if(mousePressed && mouseX >= 20 && mouseX <= 90 && mouseY >= 80 && mouseY <=150) {
      myPug = loadImage("pug.jpg");
      image(myPug, 0, 0);
       line(pmouseX, pmouseY, mouseX, mouseY); } 
   
      if(mouseX >=20 && mouseX <=90) {
        if(mouseY >= 170 && mouseY <= 240) {
          penColor = (red); //red square
          line(pmouseX, pmouseY, mouseX, mouseY);
        }
     if(mouseX >=20 && mouseX <=90) {
        if(mouseY >=260 && mouseY <= 340) {
          penColor = blue; //blue square
          line(pmouseX, pmouseY, mouseX, mouseY);
        }
       if(mouseX >=20 && mouseX <=90) {
         if(mouseY >=360 && mouseY <= 430) {
           penColor = green; //green square
          line(pmouseX, pmouseY, mouseX, mouseY);
         }
        }
      }
    }
   

            
}




