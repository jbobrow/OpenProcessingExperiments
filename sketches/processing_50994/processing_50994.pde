
void setup()
{
  size(316, 450);
  background(235, 235, 235);
  smooth();
  
  //blue ray
  fill(76, 107, 162, 220);
  noStroke();
  beginShape();
  vertex(55, 0);
  vertex(316, 316);
  vertex(316, 186);
  vertex(110, 0);
  endShape(CLOSE);
  
  //yellow ray
  fill(190, 140, 10, 220);
  beginShape();
  vertex(288, 0);
  vertex(0, 238);
  vertex(0, 319);
  vertex(32, 319);
  vertex(316, 0);
  endShape(CLOSE);
  
  //texture background
  noFill();
  int counter = 0;
  while (counter < 9000) 
  {
    float randomizer = 245 - random(30);
    strokeWeight(random(2));
    stroke(randomizer, randomizer, randomizer, random(5));
    ellipse(random(316), random(319), random(316), random(319));
    counter = counter + 1;
  }
  
  //outer circles
  //orange bottom left
  fill(191, 39, 0, 170);
  stroke(0);
  strokeWeight(.5);
  ellipse(62, 234, 20, 20);
  //peach bottom center
  fill(208, 139, 82, 170);
  stroke(0);
  strokeWeight(1.2);
  ellipse(173, 266, 18, 18);
  //yellow bottom center
  fill(228, 160, 10, 170);
  stroke(0);
  strokeWeight(.2);
  ellipse(189, 240, 9, 9);
  //black bottom center
  fill(0);
  noStroke();
  ellipse(128, 234, 6, 6);
  //dark blue left center
  fill(0, 17, 89, 255);
  stroke(0);
  strokeWeight(2);
  ellipse(41, 186, 9, 9);
  //red left center
  fill(189, 27, 4, 255);
  stroke(0);
  strokeWeight(4);
  ellipse(58, 148, 18, 18);
  //red top center
  fill(188, 27, 4, 230);
  stroke(0);
  strokeWeight(1.5);
  ellipse(144, 38, 7, 7);
  //redish bottom right
  fill(100, 10, 10, 200);
  stroke(0);
  strokeWeight(1.5);
  ellipse(250, 233, 13, 13);
  //orange bottom center
  fill(165, 64, 0, 255);
  stroke(0);
  strokeWeight(.8);
  ellipse(150, 226, 7, 7);
  
  //yellow large background
  fill(215, 121, 0, 160);
  stroke(0);
  strokeWeight(.5);
  ellipse(119, 180, 80, 80);
  
  //blue small left
  fill(35, 80, 151, 170);
  stroke(0);
  strokeWeight(1.5);
  ellipse(82, 190, 25, 25);
  
  //red large top left
  fill(172, 88, 102, 170);
  stroke(0);
  strokeWeight(1);
  ellipse(117, 95, 69, 69);
  
  //blue medium top left
  fill(103, 111, 159, 170);
  stroke(0);
  strokeWeight(.6);
  ellipse(117, 129, 39, 39);
  
  //maroon top right
  fill(51, 6, 17, 170);
  noStroke();
  ellipse(216, 86, 40, 40);
  
  //red medium top
  fill(178, 24, 10, 180);
  stroke(0);
  strokeWeight(.2);
  ellipse(160, 110, 57, 57);
  
  //green right center
  fill(42, 71, 27, 200);
  noStroke();
  ellipse(212, 150, 80, 80);
  
  //yellow bottom right
  fill(255, 194, 22, 190);
  stroke(0);
  strokeWeight(.6);
  ellipse(201, 200, 55, 55);
  
  //blue right center
  fill(32, 41, 58, 170);
  stroke(0);
  strokeWeight(.6);
  ellipse(247, 152, 30, 30);
  
  //black over green
  fill(6, 6, 6, 220);
  noStroke();
  ellipse(218, 128, 16, 16);
  
  //black near maroon
  fill(8, 7, 5, 220);
  noStroke();
  ellipse(192, 101, 22, 22);
  
  //background lines (thin)
  stroke(0, 170);
  strokeWeight(.5);
  line(48, 192, 255, 215);
  line(34, 134, 259, 196);
  line(76, 260, 190, 103);
  line(191, 262, 223, 62);
  
  //smaller lines (thin)
  stroke(0, 170);
  strokeWeight(.5);
  line(49, 121, 35, 146);
  line(55, 123, 39, 144);
  line(75, 131, 68, 154);
  line(69, 249, 135, 237);
  line(85, 232, 132, 259);
  line(182, 255, 214, 235);
  line(185, 259, 217, 240);
  line(187, 264, 219, 244);
  
  //yellowish big center
  fill(80, 50, 7, 180);
  noStroke();
  ellipse(146, 174, 99, 99);
  
  //red tiny center
  fill(183, 32, 13, 200);
  noStroke();
  ellipse(159, 192, 10, 10);
  
  //orange medium middle
  fill(243, 114, 10, 160);
  stroke(0);
  strokeWeight(2);
  ellipse(143, 148, 37, 37);
  
  //black over orange
  fill(0);
  noStroke();
  ellipse(143, 148, 10, 10);
  
  //black over yellow
  fill(15, 17, 16, 230);
  noStroke();
  ellipse(217, 218, 16, 16);
  
  //background lines (medium)
  stroke(0, 180);
  strokeWeight(.7);
  line(200, 279, 235, 56);
  
  //middleground lines (medium)
  stroke(0, 190);
  strokeWeight(.8);
  line(36, 129, 259, 188);
  line(48, 175, 144, 85);
  line(83, 262, 213, 69);
  
  //red medium bottom left
  fill(189, 0, 0, 180);
  stroke(0);
  strokeWeight(1);
  ellipse(110, 212, 31, 31);
  
  //texture foreground
  noFill();
  int counter2 = 0;
  while (counter2 < 8000) 
  {
    float randomizer2 = 100 + random(30);
    strokeWeight(random(2));
    stroke(randomizer2, randomizer2, randomizer2, random(2));
    ellipse(random(316), random(319), random(316), random(319));
    counter2 = counter2 + 1;
  }
  
  //foreground lines (medium)
  stroke(0, 200);
  strokeWeight(.95);
  line(196, 269, 229, 62);
  line(89, 58, 266, 187);
  line(52, 176, 219, 261);
  
  //foreground lines (thick)
  stroke(0, 240);
  strokeWeight(1.2);
  line(65, 79, 267, 112);
  line(30, 161, 271, 209);
  line(65, 207, 175, 63);
  line(98, 263, 225, 50);
  
  //smaller lines (thick)
  stroke(0, 240);
  strokeWeight(1.2);
  line(160, 66, 174, 83);
  line(164, 59, 177, 78);
  line(232, 113, 246, 113);
  line(231, 118, 252, 118);
  
  //thickest line
  stroke(0, 240);
  strokeWeight(1.6);
  line(237, 237, 235, 100);
  
  //big circle
  noFill();
  stroke(0);
  strokeWeight(15);
  ellipse(158, 160, 290, 290);
  
  //white rectangle bottom
  fill(255);
  noStroke();
  rect(0, 319, 316, 131);
  //print: Wassily Kandinsky
  fill(70);
  PFont wassilyK;
  wassilyK = loadFont("Champagne&Limousines-32.vlw");
  textFont(wassilyK);
  text("Wassily Kandinsky", 58, 380);
  //print: Circles in a circle
  PFont circlesCircles;
  circlesCircles = loadFont("Champagne&Limousines-12.vlw");
  textFont(circlesCircles);
  text("Circles in a circle", 123, 401);
}

