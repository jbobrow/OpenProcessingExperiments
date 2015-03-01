
void setup() {
  //window size
  size(803,648,P3D);
  //window background
  PImage backgroundImg;
  backgroundImg = loadImage("moleskin.png");
  background(backgroundImg);


}

void draw() {
  /*//reference fox--comment out when done drawing geometry.
  PImage foxRef;
  foxRef = loadImage("smallfox.png");
  image(foxRef,440,200);
  */
  
  //triangulated fox
  noStroke(); 
  fill(120);
  triangle(450, 385, 497, 347, 463, 392);
  fill(230);
  triangle(463, 392, 497, 347, 535, 345);
  fill(190);
  triangle(463, 392, 510, 395, 535, 345);
  fill(120);
  triangle(463, 392, 510, 395, 480, 403);
  fill(210);
  triangle(600, 364, 510, 395, 535, 345);
  fill(190);
  triangle(600, 364, 615, 315, 535, 345);
  fill(160);
  triangle(560, 270, 615, 315, 535, 345);
  fill(210);
  triangle(560, 270, 497, 347, 535, 345);
  fill(190);
  triangle(560, 270, 497, 347, 523, 268);
  fill(120);
  triangle(560, 270, 510, 220, 523, 268);
  fill(190);
  triangle(560, 270, 615, 315, 615, 282);
  fill(150);
  triangle(560, 270, 580, 220, 615, 282);
  fill(120);
  triangle(600, 364, 615, 315, 630, 325);
  fill(180);
  triangle(600, 364, 648, 380, 630, 325);
  fill(170);
  triangle(600, 364, 648, 380, 577, 405);
  fill(120);
  triangle(620, 420, 648, 380, 577, 405);
  fill(190);
  triangle(600, 364, 535, 386, 577, 405);   
 
  //eye
  fill(0);
  ellipse(530, 330, 10, 10);}





