
void setup() {
  size(480, 480);
  noStroke();
  ellipseMode(RADIUS);
  background(191,173,163);
  smooth();
}
void draw(){ 
   
  //Right Wing
  fill (140,107,77);
  quad(217, 128, 480, 75, 392, 364,300, 400);

//right 2nd wing
 fill (166,128,106);
 quad (253,147, 479, 100, 429, 335, 310, 380);
 
  // Body
  fill(89,85,76);
  ellipse(220, 300, 115, 175); // Body

 //Head
 fill (255);
 ellipse(260, 220, 80, 75); // Stomach
 
 //eye
 stroke(0);
 strokeWeight(4);
 fill(86,119,140);
 ellipse (260,220,40, 35);
 fill(0);
 ellipse (260,220, 10, 10);
 
 // cross aim eye
line (260, 188, 260, 254);
line (220, 222, 299, 222);
noStroke();

//Left 2nd Wing
fill(140,107, 77);
quad (128, 188, 175, 299, 78, 420, 69, 255);

 //Left Wing
fill(166,128,106);
quad(136, 198, 175, 289, 78, 410, 69, 265);

  // Bill
  fill(86,119,140);
  quad(320, 270, 337, 210, 399, 300, 364, 315);

  println("X = " + mouseX + " , " + "Y = " + mouseY);
}



