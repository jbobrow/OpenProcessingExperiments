
void setup() {
  size(800, 800);

  //smooth();

  strokeWeight(7);
}

void draw() {

  // fill in any objects with yellow
  background(255, 241, 54);

  //background rounds
  fill(250, 223, 36);
  noStroke();  
  ellipse(400, 400, 750+mouseX/2, 750+mouseX/2);

  fill(255, 205, 18);
  noStroke();  
  ellipse(400, 400, 500+mouseX/8, 500+mouseX/8);

  fill(237, 169, 0);
  noStroke();  
  ellipse(400, 400, 350+mouseX/20, 350+mouseX/20);
  



  // body part--------------------------------------
  //arms
  fill(250, 224, 212);
  noStroke();
  quad(280, 400, 320, 450, 180, 520, 140, 500);
  quad(480, 450, 520, 400, 660, 500, 620, 520);  

  //hand
  fill(250, 224, 212);
  noStroke();  
  ellipse(160, 510, 90, 90);
  ellipse(640, 510, 90, 90);
  
  // body
  fill(250, 224, 212);
  stroke(250, 224, 212);
  ellipse(400, 500, 330, 290);
  
  //diaper
  fill(255);
  stroke(230, 255, 255);
  rect(230, 500, 340, 148, 6, 6, 100, 100);
  
  //legs
  fill(250, 224, 212);
  noStroke();
  quad(280, 610, 370, 630, 330, 760, 260, 760);
  quad(430, 630, 520, 610, 540, 760, 470, 760);

  fill(255);
  noStroke();
  ellipse(400, 597, 330, 90);  

  //feet
  fill(209, 178, 255);
  stroke(173, 142, 219);
  rect(240, 700, 100, 60, 100, 100, 20, 20);  
  rect(460, 700, 100, 60, 100, 100, 20, 20);    
  
  //scarf
  //fill(255, 225, 36);
  fill(219, 0, 0);
  //stroke(255, 148, 54);
  stroke(183, 0, 0);
  quad(400, 300, 250, 415, 320, 500, 550, 415);

  noFill();
  stroke(165, 0, 0);
  curve(0, 500, 380, 400, 340, 460, 0, 450);

  noFill();
  stroke(165, 0, 0);
  curve(0, 600, 360, 400, 320, 425, 0, 500);


  // head part-----------------------------------------
  //face
  fill(250, 224, 212);
  stroke(250, 224, 212);
  ellipse(400, 200, 320, 360);
  
  //hair
  fill(173, 142, 219);
  noStroke();
  ellipse(400, 80, 60, 50);
  ellipse(360, 80, 50, 40);
  ellipse(440, 80, 50, 40);
  
  fill(250, 224, 212);
  noStroke();
  ellipse(370, 70, 35, 30);
  ellipse(430, 70, 35, 30);
  ellipse(400, 65, 45, 40);
  
  //ears
  fill(250, 224, 212);
  stroke(250, 224, 212);
  ellipse(200, 170, 120, 160);
  ellipse(600, 170, 120, 160);

  //left cheek
  fill(250, 224, 212);
  stroke(250, 224, 212);
  ellipse(340, 260, 260, 220);

  //right cheek
  fill(250, 224, 212);
  stroke(250, 224, 212);
  ellipse(460, 260, 260, 220);

  //chin
  fill(250, 224, 212);
  stroke(250, 224, 212);
  ellipse(400, 330, 150, 120);
  
  //scarf around neck
  //fill(255, 225, 36);
  fill(219, 0, 0);
  //stroke(255, 148, 54);
  stroke(183, 0, 0);
  rect(250, 358, 300, 40, 100);

  //left pink cheek
  //fill(255, 167, 167);
  fill(255, 221-mouseX/3, 221-mouseX/3);
  //stroke(255, 185, 185);
  noStroke();
  ellipse(280, 280, 100, 70);
  
  // left darker cheek
  //fill(255, 167, 167);
  fill(255, 180-mouseX/3, 180-mouseX/3);
  //stroke(255, 167, 167);
  noStroke();
  ellipse(280, 280, 80, 50);
  
  //right pink cheek
  //fill(255, 167, 167);
  fill(255, 221-mouseX/3, 221-mouseX/3);
  //stroke(255, 185, 185);
  noStroke();
  ellipse(520, 280, 100, 70);
  
  // right darker cheek
  //fill(255, 167, 167);
  fill(255, 180-mouseX/3, 180-mouseX/3);
  //stroke(255, 167, 167);
  noStroke();
  ellipse(520, 280, 80, 50);
  
  //dummy
  fill(209, 178, 255);
  stroke(173, 142, 219);
  ellipse(400, 340+mouseY/50, 160, 140);

  fill(117, 54, 207);
  stroke(117, 54, 207);
  ellipse(400, 340+mouseY/60, 100, 80);
  
  //dummy ring
  fill(63, 0, 153);
  stroke(63, 0, 153);
  ellipse(400, 360+mouseY/60, 90, 70);
  
  fill(117, 54, 207);
  noStroke();
  ellipse(400, 355+mouseY/60, 50, 40);

  fill(117, 54, 207);
  stroke(63, 0, 153);
  rect(380, 320+mouseY/60, 40, 30, 100);

  //eyebrows
  stroke(0);
  line(310, 180, 380, 210);
  
  stroke(0);
  line(420, 210, 380, 210);

  stroke(0);
  //line(420, 210, 490, 135);
  line(420, 210, 490, 135+mouseY/30);
  
  stroke(0);
  line(490, 160, 470, 135);
  //line(420, 160+mouseY/50, 490, 135+mouseY/50);

  //earlines
  // When flip over, tip: left x1(x4) + right x1(x4) = 800(which is screen size)
  noFill();
  stroke(178, 152, 140);
  curve(-150, 450, 170, 140, 200, 230, -200, 350);
  
  noFill();
  stroke(178, 152, 140);
  curve(950, 450, 630, 140, 600, 230, 1000, 350);
  
  noFill();
  stroke(178, 152, 140);
  ellipse(197, 205, 40, 50);

  noFill();
  stroke(178, 152, 140);
  ellipse(603, 205, 40, 50);
  
  //eyelashes
  stroke(0);
  line(292, 245, 280, 255);
  line(310, 255, 297, 270);
  line(325, 265, 319, 280);  
  line(508, 245, 520, 255);
  line(490, 255, 503, 270);
  line(475, 265, 481, 280);  

  // because of rotate, put eyes at last
  //left eyes
  fill(255);
  stroke(0);
  ellipse(325, 235, 70, 70);

  //right eyes
  fill(255);
  stroke(0);
  ellipse(475, 235, 70, 70);
  
    //left eyeball
  fill(0);
  noStroke();
  ellipse(333, 235, 60, 60);

  //right eyeball
  fill(0);
  noStroke();
  ellipse(467, 235, 60, 60);
  
  
    //lights reflected on eyes
  fill(255);
  //stroke(178, 152, 140);
  noStroke();
  rect(298, 230-mouseY/90, 30, 20, 100);
  rect(472, 230-mouseY/90, 30, 20, 100);
  
  /*
  //left thumb
  noFill();
  stroke(178, 152, 140);
  translate(-170, 290);
  arc(-26, -26, 40, 40, 0, PI+QUARTER_PI);

  //right thumb
  noFill();
  stroke(178, 152, 140);
  translate(406, -1);
  scale(-1, 1);
  arc(-26, -26, 40, 40, 0, PI+QUARTER_PI);
  */

  
  //-----------head finished--------------

  
  
}
