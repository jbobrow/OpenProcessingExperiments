
float xCor;
void setup () {
  // smooth();
  size (800, 600);
  xCor=200;
}
void draw () {
 // background(71);
  stroke (23, 89, 255);
  strokeWeight(1);

xCor=xCor+2;
  fill(204, 102, 100, 155);
 // ellipse(width/2, height/2, mouseX, mouseY );
   ellipse(xCor , height/10, mouseX, mouseY );
    ellipse(xCor , height/5, mouseX, mouseY );
  //ellipse(mouseX+100, mouseY, 55, 15);

  // saveFrame("bild.png");
}



