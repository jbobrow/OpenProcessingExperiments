
//Introduction to Computational Arts: Processing
//Project 3. Bring It All Together.

/*Credits "paper-texture-07" by Max Stanworth: http://www.flickr.com/photos/28920179@N03/7585527758/in
 /photolist-cyiP8m-cyiKC3-cyiTqN-cyiMxQ-cyiU6h-cyiSQd-cyiSfQ-cyiJZQ-dsFhMk-e56Yja-dPJ5rg-dPPDM9-dPPGg7
 -dPJ52a-dPJ1UT-dPJ2J4-dPPHkj-dPPGK5-dPPF6L-dPPEjJ-dPJ7si-8TNm7k-abRSWy-eEW24K-b9rnVB-7TTf3X-7TTf3n
 -7TTf6n-7TWtw7-7TWtus-7TTfdp-7TTfia-7TWttj-7TTf2n-7TWtps-7TTf2X-eEW23e */

/*User input
 keyboard: 's' or 'S': save a screenshot. 'DEL' or 'BACKSPACE': blank the canvas. 
 mouse:    click and drag: draw a colourful trail around the pointer. NOTE: The slower you drag, the more 
 dots you paint.*/

/*About: This little piece of code intend to simulate a drawing tool. Specifically a colorful dotted 
 trail while the user drags the pointer around the canvas. The paper texture want to intensify the idea 
 of to be painting on a sketchbook's sheet.*/

float x;
float y;
int counter = 0;
color [] palette = {
  #F5F5F5, #0F1011, #E9E450, #981626, #1E7198
};
PImage paper_texture2;

void setup() {
  size(1024, 683);
  paper_texture2 = loadImage("texture2.jpg");
  image(paper_texture2, 0, 0);
}

void draw() {
  if (mousePressed) {
    noStroke();
    float r = random(1, 5);    
    //variable for color pick.
    float t = random(60, 85);  
    //variable for transparency.
    fill(palette[int(r)], int(t));
    x = random(mouseX, mouseX + 50);
    // ellipse's x coordinate
    y = random(mouseY, mouseY + 20);
    // ellipse's y coordinate
    float d = random(10);
    ellipse(x, y, d, d);
  }
}

void keyPressed() {
  if (key==DELETE || key==BACKSPACE) image(paper_texture2, 0, 0);
  ;
  if (key=='s' || key=='S') saveFrame("screenshot.png");
}



