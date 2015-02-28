
//background
int x = 480;
float s, targetS, easing = 0.5;
float targetX, targetY;
float easing2 = 0.8;

void setup() {
  size (320, 480);
  smooth ();
  noStroke();
}


//robot 
void draw () {
  
  //sky
  background (0);
  
  //ground
  fill(108, 86, 53);
  quad(0, x-85, 320, x-85, 320, x, 0, x);
  
  //building
  fill(45, 49, 58);
  beginShape();
  vertex(0, x-398);
  vertex(67, x-398);
  vertex(67, x-317);
  vertex(122, x-317);
  vertex(122, x-441);
  vertex(205, x-441);
  vertex(205, x-233);
  vertex(263, x-233);
  vertex(263, x-339);
  vertex(320, x-339);
  vertex(320, x-85);
  vertex(0, x-85);
  endShape();
  
  //moon
  fill(255,242,0);
  ellipse(263, x-441, 50, 50);
  fill(0);
  ellipse(275, x-447, 50, 50);
  
  //windows
  fill(255);
  quad(6, x-379, 27, x-379, 27, x-356, 6, x-356);
  quad(38, x-379, 59, x-379, 59, x-356, 38, x-356);
  quad(137, x-425, 159, x-425, 159, x-403, 137, x-403);
  quad(173, x-425, 199, x-425, 199, x-403, 173, x-403);
  quad(173, x-393, 199, x-393, 199, x-370, 173, x-370);
  quad(271, x-325, 293, x-325, 293, x-304, 271, x-304);
  quad(271, x-293, 293, x-293, 293, x-273, 271, x-273);
  
  //targetS = mouseX; 
  //s = s + ((targetS - s) * easing);

  //robot head
  fill(187, 215, 86);
  quad(129, x-296, 200, x-296, 200, x-233, 129, x-233);

  //robot flashing ball
  fill(215, 31, 38);
  targetY = dist(mouseX, mouseY, pmouseX, pmouseY) * 0.5;
  targetX = targetX + ((targetY - targetX) * easing2);
  ellipse(164, x - 309, targetX, targetX);

  //robot eyes

  fill(215, 31, 38);
  ellipse(149, x - 271, 16, 16);
  ellipse(179, x - 271, 16, 16);

  //robot eyes (inside)

  fill(255);
  float ex = constrain(mouseX, 175, 183); 
  float ey = constrain(x - mouseY, x - 266, x - 275); 
  float ex2 = constrain(mouseX, 145, 153); 
  float ey2 = constrain(x - mouseY, x - 266, x - 275); 
  ellipse(ex2, ey2, 7, 7); 
  ellipse(ex, ey, 7, 7); 


  //robot mouth
  fill (150);
  quad(150, x-247, 177, x-247, 178, x-241, 149, x-241);

  //robot neck
  fill(112, 113, 113);
  quad (144, x - 233, 185, x - 233, 186, x- 223, 142, x - 223);

  //robot body
  fill(187, 215, 86);
  quad (121, x - 223, 211, x - 223, 211, x - 125, 121, x - 125);

  //robot command
  fill(112, 113, 113);
  quad (129, x - 213, 201, x - 213, 201, x - 165, 129, x - 165);

  //robot command round buttons
  
    if ((mousePressed == true) && ((mouseX > 171) && (mouseX < 183) &&
    (mouseY < x - 194) && (mouseY > x - 208))) {
    stroke(0);
    line(150, x-247, 155, x-241);
    line(155, x-241, 160, x-247);
    line(160, x-247, 165, x-241);
    line(165, x-241, 170, x-247);
    line(170, x-247, 175, x-241);
    line(175, x-241, 178, x-247);
    noStroke();
     PFont x; 
    x = loadFont("Technoidone-48.vlw"); 
    textFont(x, 48); 
    fill (random(0,255)); 
    text("Rebooting", 5, 90);
    fill (255, 242, 0);
  } 
  else {
     fill(215, 31, 38);
  }
  ellipse (177, x - 201, 12, 12);
  
  
      if ((mousePressed == true) && ((mouseX > 185) && (mouseX < 199) &&
    (mouseY < x - 194) && (mouseY > x - 208))) {
    stroke(0);
    line(150, x-247, 155, x-241);
    line(155, x-241, 160, x-247);
    line(160, x-247, 165, x-241);
    line(165, x-241, 170, x-247);
    line(170, x-247, 175, x-241);
    line(175, x-241, 178, x-247);
    noStroke();
     PFont x; 
    x = loadFont("Technoidone-48.vlw"); 
    textFont(x, 30); 
    fill (random(0,255)); 
    text("Self-Destruct!", 8, 90);
    fill (255, 242, 0);
  } 
  else {
     fill(215, 31, 38);
  }
   ellipse (192, x - 201, 12, 12);

  //left leg
  fill(112, 113, 113);
  quad(136, x - 125, 150, x - 125, 153, x - 92, 134, x - 92); 
  fill(187, 215, 86);
  quad(127, x - 92, 159, x - 92, 162, x - 76, 124, x - 76);
  stroke(0);
  strokeWeight(2);
  line(135, x - 119, 151, x - 119);
  line(134, x - 110, 152, x - 110);
  line(134, x - 100, 152, x - 100);
  noStroke();

  //right leg
  fill(112, 113, 113);
  quad(179, x - 125, 194, x - 125, 197, x- 92, 177, x - 92);
  fill(187, 215, 86);
  quad(170, x - 92, 203, x- 92, 206, x - 76, 169, x - 76);
  stroke(0);
  line(179, x - 119, 195, x - 119);
  line(178, x - 110, 196, x - 110);
  line(178, x - 100, 196, x - 100);
  noStroke();

  //antenna
  fill(187, 215, 86);
  triangle(164, x - 309, 170, x - 296, 161, x- 296);


  //sparks
  fill(215, 31, 38);
  beginShape();
  vertex(135, x - 313);
  vertex(147, x - 318);
  vertex(148, x - 312);
  vertex(154, x - 312);
  vertex(145, x - 307);
  vertex(144, x - 312);
  endShape();

  beginShape();
  vertex(162, x - 343);
  vertex(168, x - 331);
  vertex(162, x - 329);
  vertex(162, x - 323);
  vertex(157, x - 332);
  vertex(162, x - 334);
  endShape();

  beginShape();
  vertex(173, x - 313);
  vertex(181, x - 318);
  vertex(183, x - 313);
  vertex(192, x - 315);
  vertex(181, x - 307);
  vertex(178, x - 313);
  endShape();

  //left arm
  fill(112, 113, 113);
  beginShape();
  vertex(121, x - 201);
  vertex(77, x - 201);
  vertex(77, x - 245);
  vertex(95, x - 245);
  vertex(95, x - 219);
  vertex(121, x - 219);
  endShape();
  stroke(0);
  line(77, x - 234, 95, x - 234);
  line(77, x - 223, 95, x - 223);
  line(77, x - 202, 95, x - 219);
  line(102, x - 219, 102, x - 202);
  line(112, x - 219, 112, x - 202);
  noStroke();

  //right arm
  fill(112, 113, 113);
  beginShape();
  vertex(211, x - 220);
  vertex(255, x - 220);
  vertex(255, x - 176);
  vertex(236, x - 176);
  vertex(237, x - 201);
  vertex(211, x - 201);
  endShape();
  stroke(0);
  line(220, x - 220, 220, x - 201);
  line(229, x - 220, 229, x - 201);
  line(237, x - 201, 254, x - 219);
  line(237, x - 196, 255, x - 196);
  line(237, x - 186, 255, x - 186);
  noStroke();

  //right hand
  fill(187, 215, 86);
  ellipse(86, x - 256, 30, 30);
  fill(45, 49, 58);
  ellipse(86, x - 265, 17, 17);

  //left hand
  fill(187, 215, 86);
  ellipse(246, x - 165, 30, 30);
  fill(45, 49, 58);
  ellipse(246, x - 155, 17, 17);

  //robot command line
  stroke(0);
  line(141, x - 197, 141, x - 169);
  line(145, x - 197, 145, x - 169);
  line(149, x - 197, 149, x - 169);
  line(153, x - 197, 153, x - 169);
  noStroke();

  //TOP LEFT BUTTON

  if ((mousePressed == true) && ((mouseX > 173) && (mouseX < 182) &&
    (mouseY < x - 181) && (mouseY > x - 189))) {
    stroke(0);
    line(150, x-247, 155, x-241);
    line(155, x-241, 160, x-247);
    line(160, x-247, 165, x-241);
    line(165, x-241, 170, x-247);
    line(170, x-247, 175, x-241);
    line(175, x-241, 178, x-247);
    noStroke();
     PFont x; 
    x = loadFont("Technoidone-48.vlw"); 
    textFont(x, 48); 
    fill (random(0,255)); 
    text("Hello!", 70, 90);

    fill (255, 242, 0);
  } 
  else {
    fill (random (0, 255));
  }
  quad(173, x - 189, 182, x - 189, 182, x - 181, 173, x - 181);



  //TOP RIGHT BUTTON

  if ((mousePressed == true) && ((mouseX > 184) && (mouseX < 192) &&
    (mouseY < x - 181) && (mouseY > x - 189))) {
    stroke(0);
    line(150, x-247, 155, x-241);
    line(155, x-241, 160, x-247);
    line(160, x-247, 165, x-241);
    line(165, x-241, 170, x-247);
    line(170, x-247, 175, x-241);
    line(175, x-241, 178, x-247);
    noStroke();
    PFont x; 
    x = loadFont("Technoidone-48.vlw"); 
    textFont(x, 40); 
    fill (random(0,255)); 
    text("I can be LOUD!", 8, 90);

    fill (255, 242, 0);
  } 
  else {
    fill (random(0, 255));

  }
  quad(184, x - 189, 192, x - 189, 192, x - 181, 184, x - 181);

  //BOTTOM LEFT BUTTON

  if ((mousePressed == true) && ((mouseX > 173) && (mouseX < 182) &&
    (mouseY < x - 170) && (mouseY > x - 179))) {
    stroke(0);
    line(150, x-247, 155, x-241);
    line(155, x-241, 160, x-247);
    line(160, x-247, 165, x-241);
    line(165, x-241, 170, x-247);
    line(170, x-247, 175, x-241);
    line(175, x-241, 178, x-247);
    noStroke();
    PFont x; 
    x = loadFont("Technoidone-48.vlw"); 
    textFont(x, 15); 
    fill (random(0,255)); 
    text("I can be quiet...", 105, 90);
    fill (255, 242, 0);
  } 
  else {
    fill (random (0, 255));

  }
  quad(173, x - 179, 182, x - 179, 182, x- 170, 173, x - 170);

  //BOTTOM RIGHT BUTTON

  if ((mousePressed == true) && ((mouseX > 184) && (mouseX < 192) &&
    (mouseY < x - 170) && (mouseY > x - 179))) {
    stroke(0);
    line(150, x-247, 155, x-241);
    line(155, x-241, 160, x-247);
    line(160, x-247, 165, x-241);
    line(165, x-241, 170, x-247);
    line(170, x-247, 175, x-241);
    line(175, x-241, 178, x-247);
    noStroke();
    PFont x; 
    x = loadFont("Technoidone-48.vlw"); 
    textFont(x, 15); 
    fill (random(0,255)); 
    text("Please tell me what to do!", 40, 90);
    fill (255, 242, 0);
  } 
  else {
    fill (random (0, 255));

  }
  quad(184, x - 179, 192, x - 179, 192, x - 170, 184, x - 170);

}







