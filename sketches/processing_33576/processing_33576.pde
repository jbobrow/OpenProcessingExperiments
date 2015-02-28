
void setup () {
  size(600, 600);
  background (168,96,82);
}
void draw () {
}
 
void mouseDragged() {
  //to draw a crown
  if (key== 'a') {
    rect(mouseX, mouseY, 10, 10);
    triangle(mouseX,mouseY,pmouseX,pmouseY,pmouseY,mouseX);
  }
     else  if (key== 'b')
    //dotted line
    {
              ellipse(mouseX,mouseY,10,10);
              fill(22,231,204);
            }
              else {
                     line(mouseX,mouseY,pmouseX,pmouseY);
                     //pmouse means it ends when i release
               }
}
 
void keyPressed () {
  if (key== 'f') {                //for fusia  f
    stroke(231, 22, 194);
  }
  if (key=='y') {                //for yellow  y
    stroke(242,255,97);
  }
  if (key== 'p') {
    stroke(random(256), random(256), random(256)); 
  }//for random p
 
 if (key=='o') {
  stroke(149,255,97);   //for lime o
  }
  if (key== 'c') {
    background(240, 240, 240);  //to clear the screen Press c
  }
 
   
}


