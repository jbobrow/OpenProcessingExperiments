
int snowWidth;

void setup()
{
  size(400, 400);
  background(255, 255, 255);
  smooth();
  

}

void draw()
{
  background(255, 255, 255);
  
  snowWidth = mouseY / 5;   // scale of drawing is based on mouseY

  fill(255, 255, 255);

  // draw arms  
  line(mouseX - snowWidth, mouseY-snowWidth, mouseX, mouseY);  // left
  line(mouseX + snowWidth, mouseY-snowWidth, mouseX, mouseY);  // right

  // draw body
  ellipse(mouseX, mouseY+snowWidth, snowWidth*2, snowWidth*2);  // bottom
  ellipse(mouseX, mouseY, snowWidth*1.5, snowWidth*1.5);        // middle
  ellipse(mouseX, mouseY-snowWidth, snowWidth, snowWidth);      // top
  
  // draw eyes
  fill(0, 0, 0);
  ellipse(mouseX-snowWidth/4, mouseY-snowWidth, snowWidth/10, snowWidth/10);  // left
  ellipse(mouseX+snowWidth/4, mouseY-snowWidth, snowWidth/10, snowWidth/10);  // right
  
  // draw hat
  rect(mouseX-snowWidth/2, mouseY-snowWidth*1.5, snowWidth, snowWidth/10);  // brim
  rect(mouseX-snowWidth/4, mouseY-snowWidth*2, snowWidth/2, snowWidth/2);   // top
  

  
}
