
size(640,900);
smooth();
background(#F88800);

//Clouds Up----------------------
fill(#F99420);
noStroke();
rect(0,0,640,75);
for(int i=0; i<10; i++) {
  float diam = random(45,200);
  ellipseMode(CENTER);
  ellipse(75*i, 75, diam, diam);
}
//End Clouds Up----------------------

//Snow---------------------------
fill(255,50);
for(int i=0; i<75; i++) {
  float x = random(width);
  float y = random(height);
  float diam = random(10);
  ellipseMode(CENTER);
  ellipse(x, y, diam, diam);
}
//End Snow---------------------------

//Body--------------------------------
//left hand --------------------------------
fill(#FFA544);
beginShape();
vertex(63,808);
bezierVertex(142, 847, 230, 661, 154, 624);
bezierVertex(75, 585, -14, 770, 63,808);
endShape();

//Body--------------------------------
stroke(#F88800);
strokeWeight(8);
strokeJoin(ROUND);
beginShape();
vertex(485, 950);
line(485, 950,132, 939);
bezierVertex(508, 620, 640, 357, 331, 359);
bezierVertex(128, 360, 87, 591, 132, 939);
endShape();
noStroke();

//Right Hand --------------------------------
beginShape();
vertex(525,838);
bezierVertex(612, 823, 575, 620, 492, 635);
bezierVertex(405, 650, 440, 853,525,838);
endShape();
//En Body --------------------------------

//face --------------------------------------
fill(#F88800);
ellipse(330,540,290,220);
quad(233,619,239,682,382,699,400,618);
fill(#FFA544);
beginShape();
vertex(449,489);
bezierVertex(400,424,268,417,211,489);
bezierVertex(275,440,385,437,449,489);
endShape();
ellipse(317,672,30,30);
rectMode(CENTER);
rect(317,687,30,30);
//eyes-------------------------------------
ellipse(233,550,50,50);
triangle(408,548,432,562,428,568);
triangle(446,545,428,561,434,566);
triangle(449,577,432,562,428,568);
triangle(414,586,428,561,434,566);
//end face--------------------------------

// Spots ---------------------------------
fill(#F88800);
ellipse(178,858,11,43);
ellipse(145,709,11,43);
ellipse(163,738,11,43);
ellipse(136,780,11,43);
ellipse(168,807,11,43);
ellipse(145,850,11,43);




//End Spots-------------------------------

//Clouds down----------------------
fill(255);
noStroke();
ellipseMode(CORNER);
ellipse(-150,787,220,220);
ellipse(10,875,173,173);
ellipse(126,850,185,185);
ellipse(266,876,160,160);
ellipse(389,903,125,125);
ellipse(467,858,175,175);
ellipse(578,803,125,125);
//End Clouds down----------------------






