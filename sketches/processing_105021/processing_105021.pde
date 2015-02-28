
void setup() {
  size(500, 355);
}

void draw() {

  background(255);
  smooth();
  
  //Blue G
  strokeWeight(1);
  stroke(39, 147, 160);
  noFill();
  ellipse(mouseX+372,mouseY+166, 254, 254);
  ellipse(mouseX+372,mouseY+166, 181, 181);
  line(mouseX+427,mouseY+232,mouseX+377,mouseY+160);
  line(mouseX+377,mouseY+160,mouseX+498,mouseY+160);
  line(mouseX+452,mouseY+122,mouseX+479,mouseY+99);
  
  //Blue M
  line(mouseX+53,mouseY+288,mouseX+244,mouseY+288);
  line(mouseX+53, mouseY+288,mouseX+101,mouseY+39);
  line(mouseX+101,mouseY+39,mouseX+181,mouseY+219);
  line(mouseX+181,mouseY+219,mouseX+263,mouseY+39);
  line(mouseX+263,mouseY+39,mouseX+305,mouseY+276);
  line(mouseX+113,mouseY+148,mouseX+180,mouseY+288);
  line(mouseX+180,mouseY+288,mouseX+250,mouseY+132);

  //Red G
  strokeWeight(2);
  stroke(66, 11, 46);
  ellipse(353, 178, 244, 244);
  ellipse(353, 178, 171, 171);
  line(475, 173, 360, 173);
  line(406, 245, 360, 173);
  line(423, 127, 450, 104);

  //Red M
  line(31, 295, 230, 295);
  line(31, 295, 87, 40);
  line(87, 40, 167, 221);
  line(167, 221, 250, 40);
  line(250, 40, 289, 282);
  line(98, 154, 165, 295);
  line(165, 295, 233, 154);
}



