
/* A cross is drawn on screen if a key is pressed in this example.
Answer the questions provided in the comments.
 
Developed by Laura Maye, University of Limerick*/
  
/* Q: Modify this code so that:
      a. If a key is pressed and the key is 'r', the shape fills red
      b. If a key is pressed and the key is 'g', the shape fills green
      c. If a key is pressed and the key is 'b', the shpe fills blue
*/

void setup()
{
  size(200, 200);
  background(0);
  rectMode(CENTER);
  noStroke();
}

void draw()
{
  background(0);
  if (keyPressed)
  {
    rect(width/2, height/2, width, 20);
    rect(width/2, height/2, 20, height);
  }
}
