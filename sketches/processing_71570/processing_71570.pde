
// Homework 2. Alex Zajicek.
// Artwork title: Suprematism No. 50
// Artist: Kazimir Malevich
// Date: 1915

void setup(){

  size (492, 721);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  background (191, 10, 97);
}

void draw(){
  println("x:" +mouseX +"y:"+mouseY);
  strokeWeight(9);
  line(146, 70, 207, 128);
  strokeWeight(3);
  stroke(212, 86, 74); //light blue stroke
  line(238, 260, 251, 328);
  line(241, 298, 251, 350);
  stroke(46, 89, 90); //yellow stroke
  line(239, 310, 243, 333);
  noStroke();
  fill(188, 5, 8); //black fill
  quad(235, 13, 290, 13, 363, 712, 310, 715);
  quad(5, 390, 470, 525, 467, 555, 5, 420);
  fill(2, 84, 57); //dark red fill
  quad(46, 13, 486, 38, 486, 97, 44, 48);
  fill(2, 89, 95); // red fill
  rect(95, 141, 320, 79);
  quad(42, 290, 330, 263, 332, 293, 44, 319);
  quad(91, 464, 202, 589, 180, 606, 69, 481);
  quad(142, 660, 470, 637, 471, 683, 143, 694);
  fill(188, 5, 8); //black fill (for triangles)
  triangle(340, 120, 400, 95, 402, 135);
  triangle(400, 425, 451, 447, 400, 490);
  fill(233, 90, 92); //dark blue fill
  rect(380, 260, 75, 90);
  fill(46, 89, 90); //yellow fill
  quad(365, 357, 395, 357, 392, 409, 363, 408);
  ellipse(60, 585, 110, 80);
  
}

