
float h=0;
float s=100;
float b=100;
 float dh=1;
  

int opacity=100;
int dia=50;

void setup(){
  size(600,500);
  background(0);
  smooth();
}

void draw(){

 colorMode (HSB, 100);
  fill(h,s,b,opacity);
  noStroke();
  ellipse(mouseX,mouseY,dia,dia);
  ellipse(mouseX, height-mouseY, dia, dia); // the height- and width- allows it to be mirrored on the x and y axis
  ellipse(width-mouseX,mouseY,dia,dia);
  ellipse(width-mouseX, height-mouseY, dia,dia);
     
  h+=.5; // makes rainbow color
 if (h>=100){h=0;} // makes makes rainbow color conintue to rotate the colors

  opacity=random(50,75);
  dia=random(10,40);
  


}
void keyPressed() { //hit the "s" key and save my image
  if (key=='s')
  {
    saveDrawing();
  }
}


 function saveDrawing() {
  saveFrame("images/circles-###.png"); //when running on the web it will put the PNG in a new browser tab
 }


