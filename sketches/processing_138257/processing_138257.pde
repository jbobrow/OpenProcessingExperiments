
/*At the Beginning appears a Photo and when you move the mouse over it you can read a comment.
When you press the mouse and you keep it pressed then a new picture appears with a new comment.
*/
//Declare a PImage variable type
//Images
PImage img1;
PImage img2;

//setup()
void setup() {
 size(800, 800);
 img1 = loadImage("summer.jpg"); 
 img2 = loadImage("Time.jpg"); 
}
//Draw the image to the screen at (0,0)
void draw() {
 image(img1, 0 ,0, 800, 800); 
  fill(#000000);
   textSize(30);
  text("Writing and dreaming", mouseX, mouseY);
 if(mousePressed){
 image(img2, 0 ,0, 800, 800); 
  fill(#C6BDA3);
   textSize(30);
  text("While time counts...", mouseX, mouseY);
 
 }
}

