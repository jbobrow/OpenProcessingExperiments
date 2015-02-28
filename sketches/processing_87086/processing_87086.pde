
void setup() {
  size(480, 480);
  noStroke();
  ellipseMode(RADIUS);
  background(0,100,200);
  smooth();
}
void draw(){ 
   
  //Right Wing
  fill (200);
  quad(217, 128, 480, 75, 392, 364,300, 400);

  // Body
  fill(0);
  ellipse(220, 300, 115, 175); // Body

 //Head
 fill (255);
 ellipse(260, 220, 80, 75); // Stomach
 
 //eye
 stroke(0);
 fill(200,0,0);
 ellipse (260,220,40, 35);
 fill(0);
 ellipse (260,220, 10, 10);
 noStroke();
 
 // cross aim eye
stroke(0);
line (260, 188, 260, 255);
line (220, 222, 301, 222);
noStroke();

 //Left Wing
fill(200);
quad(128, 198, 175, 289, 78, 410, 69, 265);
 
  // Bill
  fill(200,100,0);
  quad(320, 270, 337, 210, 399, 300, 364, 315);

  println("X = " + mouseX + " , " + "Y = " + mouseY);
}



