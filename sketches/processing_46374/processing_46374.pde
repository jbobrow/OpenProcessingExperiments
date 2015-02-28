
//SOURCEL: 
//Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de



//Right away, I took out bunch of options that I didn't find necessary, such as 
//pdf recordings, etc. Kept what I needed and adapted it to the image.


float x =206, y = 378;// makes sure to start the drawing from the top of the head, independently of where the cursor is positioned.
float stepSize = 5.0;
PImage img0;
PFont font;
String letters = "...now what if I try this instead... I didn't think of that, did I? Of course not. How about I try to represent something - an object, a face maybe? A face made out of paint strokes? Of paint splashes? Yeah, right, like that will be possible. Well, maybe... Really like that paint splassh idea, I should run with it. What if I try it this way, instead? Is that an option? I should check out this guy, he's done lots of paint-splashing work, he may be a reference... Now what about those colours?";
int fontSizeMin = 3; //didn't change this, it seems to be a good minimal size
float angleDistortion = 0.0;

int counter = 0;


void setup() {

  size(600,600);
  img0 = loadImage("thought2.jpg");
  smooth();
  cursor(CROSS);


  font = createFont("Gladifilthefte",48); //here I created a font instead of using
  //...some boring sans serif? Figure I need a fun font for that train of thought + more esthetically pleasing I find
  textFont(font,fontSizeMin);
  textAlign(LEFT);
  fill(255,200); //changed colour. Matches my initial idea of 'thought bubble' more. Added a LITTLE bit of transparency, as well.
  
image(img0,0,0);

  
}


void draw() {
  
 if(mouseX>0 && mouseX<697 && mouseY>0 && mouseY<364){ //constrains the area where the text appears to space above the head
  if (mousePressed) {
    float d = dist(x,y, mouseX,mouseY);
    textFont(font,fontSizeMin+d/2);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x); 

      pushMatrix();
      translate(x, y);
      rotate(angle + random(angleDistortion));
      text(newLetter, 0, 0);
      popMatrix();

      counter++;
      if (counter > letters.length()-1) counter = 0;

      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize; 
    }
  }

 }


}




void keyReleased() {
//this condition clears the canvas AND resets the coordinates to start drawing from the top of the head, instead of picking up where the sentence left off */
  if (key == DELETE || key == BACKSPACE) {
  
   image(img0,0,0);
x = 206;
y = 378;
}

 
}

void keyPressed() {
  // with arrow keys up/down, we can change the angle. I kept it because it makes the words distorted, like jumbled thoughts can be. Thought it matches the concept well.
  if (keyCode == UP) angleDistortion += 0.1;
  if (keyCode == DOWN) angleDistortion -= 0.1; 
}




















