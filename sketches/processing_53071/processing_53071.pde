
//Self-Portrait II by Maxwell Paparella
//February 15, 2012
//maxwell.paparella@gmail.com

//this sketch turned out significantly different than my designblocks 
//self-portrait. I concentrated on a simple dynamic element of interactivity,
//keeping the forms themselves fairly basic and not trying to "get away" with 
//as much within the program, as I tried to do with the designblocks piece.
//It was my original intention to have a different piece of clothing displayed 
//for each letter on the keyboard, but this turned out to be slightly outside 
//the scope of the project for now. I plan to keep working and update the program 
//soonish. There are also some bugs in the program that I plan on working out, 
//including the current inability to select more than one item at the same time.
 


void setup() {
  size(600, 600);
  background(255);
  smooth();
  stroke(0, 0);
  rectMode(CENTER);
}

void draw() {

  //NAKED

  background(255);
  fill(249, 242, 147); //skin tone
  ellipse(300, 200, 45, 50);  //head
  rect(300, 225, 20, 25);  //neck
  rect(300, 290, 50, 100);  //torso
  rect(300, 240, 68, 20); //shoulders
  rect(265, 280, 14, 100); //L arm
  rect(335, 280, 14, 100); //R arm
  rect(283, 375, 15, 90); //L leg
  rect(317, 375, 15, 90); //R leg
  ellipse(300, 340, 7, 28); //penis

  fill(0); //black
  ellipse(292, 190, 5, 5); //L eye
  ellipse(308, 190, 5, 5); //R eye
  rect(300, 210, 18, 2); //mouth
  ellipse(288, 260, 3, 3); //L nipple
  ellipse(312, 260, 3, 3); //R nipple
  ellipse(300, 305, 3, 3); //bellybutton
  ellipse(300, 333, 12, 7); //pubic hair

  fill(175, 124, 48); //hair tone
  ellipse(303, 178, 40, 10); //top hair
  ellipse(280, 188, 10, 25); //side hair

  fill(249, 242, 147); //skin tone
  ellipse(278, 197, 10, 10); //L ear


  //CLOTHED

  if (keyPressed) {

    //naked underneath
    background(255);
    fill(249, 242, 147); //skin tone
    ellipse(300, 200, 45, 50);  //head
    rect(300, 225, 20, 25);  //neck
    rect(300, 290, 50, 100);  //torso
    rect(300, 240, 68, 20); //shoulders
    rect(265, 280, 14, 100); //L arm
    rect(335, 280, 14, 100); //R arm
    rect(283, 375, 15, 90); //L leg
    rect(317, 375, 15, 90); //R leg
    ellipse(300, 340, 7, 28); //penis


    fill(0); //black
    ellipse(292, 190, 5, 5); //L eye
    ellipse(308, 190, 5, 5); //R eye
    rect(300, 210, 18, 2); //mouth
    ellipse(288, 260, 3, 3); //L nipple
    ellipse(312, 260, 3, 3); //R nipple
    ellipse(300, 305, 3, 3); //bellybutton
    ellipse(300, 333, 12, 7); //pubic hair

    fill(175, 124, 48); //hair tone
    ellipse(303, 178, 40, 10); //top hair
    ellipse(280, 188, 10, 25); //side hair

    fill(249, 242, 147); //skin tone
    ellipse(278, 197, 10, 10); //L ear


    //CLOTHING
    //TOP ROW (HEAD)
    if (key == 'q' || key == 'Q') {
      //QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

      fill(0); //hat tone
      arc(300, 180, 48, 30, PI, TWO_PI-PI/2); //hat (L side)
      arc(300, 180, 48, 30, TWO_PI-PI/2, TWO_PI); //hat (R side)
      stroke(0); //set stroke 
      strokeWeight(2); //set strokeWeight
      line(300, 179, 300, 167); //hat (gap)
      line(300, 179, 340, 179); //hat (brim)
      stroke(0, 0); //reset stroke
    }

    if (key == 'w' || key == 'W') {
      //WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
      //head (top row)
      fill(0); //black
      ellipse(292, 190, 5, 5); //L eye
      ellipse(308, 190, 5, 5); //R eye
      rect(300, 210, 18, 2); //mouth

      fill(0, 0); //fill for glasses
      stroke(0); //stroke for glasses
      strokeWeight(1); //strokeWeight for glasses
      ellipse(292, 190, 14, 12); //glasses (L eye)
      line (295, 184, 305, 184); //glasses (upper bridge)
      line (299, 190, 301, 190); //glasses (lower bridge)
      ellipse(308, 190, 14, 12); //glasses (R eye)
      stroke (0, 0); //reset stroke

      fill(175, 124, 48); //hair tone
      ellipse(303, 178, 40, 10); //top hair
      ellipse(280, 188, 10, 25); //side hair

      fill(249, 242, 147); //skin tone
      ellipse(278, 197, 10, 10); //L ear
    }

    if (key == 'e' || key == 'E') {
      //EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
      //head (top row)
      fill(0); //black
      ellipse(292, 190, 5, 5); //L eye
      ellipse(308, 190, 5, 5); //R eye
      rect(300, 210, 18, 2); //mouth

      fill(175, 124, 48); //hair tone
      ellipse(303, 178, 40, 10); //top hair
      ellipse(280, 188, 10, 25); //side hair

      fill(249, 242, 147); //skin tone
      ellipse(278, 197, 10, 10); //L ear

      fill(249, 207, 0); //earring tone
      ellipse(278, 202, 3, 3); //earring (top ball)
      ellipse(278, 206, 4, 4); //earring (middle ball)
      ellipse(278, 211, 5, 5); //earring (bottom ball)
    }

    if (key == 'r' || key == 'R') {
      //RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
      //head (top row)
      fill(0); //black
      ellipse(292, 190, 5, 5); //L eye
      ellipse(308, 190, 5, 5); //R eye
      rect(300, 210, 18, 2); //mouth

      fill(175, 124, 48); //hair tone
      ellipse(303, 178, 40, 10); //top hair
      ellipse(280, 188, 10, 25); //side hair

      fill(249, 242, 147); //skin tone
      ellipse(278, 197, 10, 10); //L ear

      fill(250, 110, 213); //party hat tone
      triangle(275, 180, 315, 175, 285, 140);//party hat
      fill(153, 215, 238); //party hat pattern tone
      ellipse(283, 166, 5, 5); //polka dot 1
      ellipse(289, 153, 5, 5); //polka dot 2
      ellipse(293, 170, 5, 5); //polka dot 3
      ellipse(295, 161, 5, 5); //pola dot 4
      ellipse(303, 169, 5, 5); //polka dot 5
    }
    
    if (key == 't' || key == 'T') {
    //TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
    //head (top row)

    fill(32, 26, 219); //mask tone
    arc(292, 223, 52, 110, PI, TWO_PI-PI/2); //mask (L)
    arc(308, 223, 52, 110, TWO_PI-PI/2, TWO_PI); //mask (R)
    rect(300, 196, 18, 55); //mask (fill)
    
    fill(249, 242, 147); //skin tone
    ellipse(292, 190, 10, 10); //L eyehole
    ellipse(308, 190, 10, 10); //R eyehole
    fill(0); //black
    ellipse(292, 190, 5, 5); //L eye
    ellipse(308, 190, 5, 5); //R eye
    }

    //BOTTOM ROW (LEGS)
    if (key == 'z' || key == 'Z') {
      //ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
      //legs (bottom row)
      fill(23, 68, 112); //denim tone
      rect(300, 333, 50, 30); //jeans (crotch)
      rect(283, 375, 16, 70); //jeans (L leg)
      rect(317, 375, 16, 70); //jeans (R leg)

      fill(0); //belt tone
      rect(300, 323, 50, 10); //belt

      fill(23, 68, 112); //denim tone
      rect (282, 323, 5, 10); //belt loop 1
      rect(318, 323, 5, 10); //belt loop 2


      fill(245, 218, 87); //buckle tone
      rect(300, 323, 15, 10);

      fill(0); //belt tone
      rect(300, 323, 10, 5);//center of buckle

      fill(130, 152, 202); //lighter denim tone
      rect(283, 370, 11, 14);//ripped jeans
      fill(249, 242, 147); //skin tone
      rect(283, 370, 7, 7); //knee

      fill(255); //penis cover fill
      rect(300, 355, 18, 18); //penis cover
    }

    if (key == 'x' || key == 'X') {
      //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      //legs (bottom row)
      fill(0); //black jeans tone
      rect(300, 333, 50, 30); //jeans (crotch)
      rect(283, 375, 16, 70); //jeans (L leg)
      rect(317, 375, 16, 70); //jeans (R leg)

      fill(155, 89, 38); //stilt tone
      rect(272, 405, 7, 30); //stilts (L brace)
      rect(328, 405, 7, 30); //stilts (R brace)
      rect(281, 423, 25, 7); //stilts (L footing)
      rect(319, 423, 25, 7); //stilts (R footing)
      rect(283, 510, 7, 175); //stilts (L leg)
      rect(317, 510, 7, 175); //stilts (R leg)

      fill(255); //penis cover fill
      rect(300, 355, 18, 18); //penis cover
    }

    if (key == 'c' || key == 'C') {

      //CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      //legs (bottom row)
      fill(23, 68, 112); //denim tone    
      rect(300, 333, 50, 30); //jeans (crotch)
      rect(283, 355, 16, 20); //jeans (L leg)
      rect(317, 355, 16, 20); //jeans (R leg)

      fill(0); //belt tone
      rect(300, 323, 50, 10); //belt

      fill(23, 68, 112); //denim tone
      rect (282, 323, 5, 10); //belt loop 1
      rect(318, 323, 5, 10); //belt loop 2

      fill(245, 218, 87); //buckle tone
      rect(300, 323, 15, 10);

      fill(0); //belt tone
      rect(300, 323, 10, 5);//center of buckle

      fill(130, 152, 202); //lighter denim tone
      rect(283, 365, 16, 5); //L cuff
      rect(317, 365, 16, 5); //R cuff

      fill(255); //penis cover fill
      rect(300, 355, 18, 18); //penis cover
    }

    if (key == 'v' || key == 'V') {
      //VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
      //legs (bottom row)
      fill(29, 188, 98); //leaf tone
      ellipse(300, 342, 29, 25); //leaf
      stroke(29, 188, 98); //set stroke leaf tone
      strokeWeight(3); //set strokeWeight
      line(282, 334, 300, 345); //leaf stem
      stroke(0);
      strokeWeight(1); //reset strokeWeight
      line(293, 338, 306, 343); //main leaf vein
      line(299, 334, 296, 348); //L smaller leaf vein
      line(304, 336, 301, 349);
      stroke(0, 0); //reset stroke
    }
    
    if (key == 'b' || key == 'B') {
    //BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
    //legs (bottom row)
    fill(240); //underwear tone
    rect(300, 335, 50, 35); //underwear
    
    stroke(100); //set waistband stroke
    fill(249,242, 147); //skin tone
    arc(275, 352, 30, 40, TWO_PI-PI/2, TWO_PI); //leg hole (L)
    arc(325, 352, 30, 40, PI, TWO_PI-PI/2); //leg hole (R)
    stroke(0,0); //reset stroke

    fill(100); //waistband tone
    rect(283, 322, 5, 2); //waistband dash 1
    rect(293, 322, 5, 2); //waistband dash 2
    rect(303, 322, 5, 2); //waistband dash 3
    rect(313, 322, 5, 2); //waistband dash 4
    rect(322, 322, 4, 2); //waistband dash 5
    
    fill(255); //penis cover fill
    rect(300, 361, 18, 18); //penis cover
    }

    //MIDDLE ROW (TORSOS)

    if (key == 'a' || key == 'A') {

      //AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
      //torso (middle row)
      fill(240); //shirt tone
      rect(300, 277, 50, 81);  //shirt (torso)
      rect(300, 240, 68, 20); //shirt (shoulders)
      rect(265, 250, 16, 40); //shirt (L sleeve)
      rect(335, 250, 16, 40); //shirt (R sleeve)

      fill(249, 242, 147); //skin tone
      ellipse(300, 230, 20, 20); //shirt (neckline)
    }

    if (key == 's' || key == 'S') {

      //SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
      //torso (middle row)
      fill(208, 30, 30); //tank tone
      rect(300, 277, 50, 81);  //shirt (torso)
      rect(300, 240, 50, 20); //shirt (shoulders)


      fill(249, 242, 147); //skin tone
      arc(300, 229, 38, 50, 0, PI/2); //R neckline
      arc(300, 229, 38, 50, PI/2, PI); //L neckline
      stroke(249, 242, 147); //skin tone stroke
      line (300, 229, 300, 253);//filler
      stroke(0, 0); //reset stroke
    }

    if (key == 'd' || key == 'D') {

      //DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
      //torso (middle row)
      fill(28, 112, 25); //sweater tone
      rect(300, 277, 50, 82);  //shirt (torso)
      rect(300, 240, 68, 20); //shirt (shoulders)
      rect(265, 275, 16, 90); //shirt (L sleeve)
      rect(335, 275, 16, 90); //shirt (R sleeve)

      fill(176, 36, 8); //sweater pattern tone

      rect(280, 260, 5, 5); //sweater pattern (top row)
      rect(285, 255, 5, 5);
      rect(290, 260, 5, 5);
      rect(295, 255, 5, 5);
      rect(300, 260, 5, 5);
      rect(305, 255, 5, 5);
      rect(310, 260, 5, 5);
      rect(315, 255, 5, 5);
      rect(320, 260, 5, 5);

      //L sleeve
      rect(260, 260, 5, 5);
      rect(265, 255, 5, 5);
      rect(270, 260, 5, 5);

      //R sleeve
      rect(330, 260, 5, 5);
      rect(335, 255, 5, 5);
      rect(340, 260, 5, 5);

      rect(280, 275, 5, 5); //sweater pattern (middle row)
      rect(285, 280, 5, 5);
      rect(290, 275, 5, 5);
      rect(295, 280, 5, 5);
      rect(300, 275, 5, 5);
      rect(305, 280, 5, 5);
      rect(310, 275, 5, 5);
      rect(315, 280, 5, 5);
      rect(320, 275, 5, 5);

      //L sleeve
      rect(260, 275, 5, 5);
      rect(265, 280, 5, 5);
      rect(270, 275, 5, 5);

      //R sleeve
      rect(330, 275, 5, 5);
      rect(335, 280, 5, 5);
      rect(340, 275, 5, 5);


      rect(280, 300, 5, 5);//sweater pattern (bottom row)
      rect(285, 295, 5, 5);
      rect(290, 300, 5, 5);
      rect(295, 295, 5, 5);
      rect(300, 300, 5, 5);
      rect(305, 295, 5, 5);
      rect(310, 300, 5, 5);
      rect(315, 295, 5, 5);
      rect(320, 300, 5, 5);

      //L sleeve
      rect(260, 300, 5, 5);
      rect(265, 295, 5, 5);
      rect(270, 300, 5, 5);

      //R sleeve
      rect(330, 300, 5, 5);
      rect(335, 295, 5, 5);
      rect(340, 300, 5, 5);

      fill(249, 242, 147); //skin tone
      ellipse(300, 230, 20, 20); //sweater (neckline)

      noFill();
      stroke(176, 36, 8); //set stroke tone
      strokeWeight(3);
      arc(300, 230, 22, 22, PI/2, PI); //sweater (L neckline hem)
      arc(300, 230, 22, 22, 0, PI/2); //sweater (R neckline hem)
      line(257, 319, 272, 319); //sweater (L sleeve hem)
      line(327, 319, 342, 319); //sweater (R sleeve hem)
      stroke(0, 0); //reset stroke
      strokeWeight(1); //reset strokeWeight
    }

    if (key == 'f' || key == 'F') {

      //FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      //torso (middle row)
      fill(240); //apron tone
      rect(300, 280, 42, 100);  //apron (torso)
      rect(300, 240, 42, 20); //apron (shoulders)

      fill(249, 242, 147); //skin tone
      rect(300, 245, 30, 30); //neckline
      stroke(249, 242, 147); //skin tone stroke
      line (300, 229, 300, 253);//filler
      stroke(0, 0); //reset stroke

      fill(255, 0, 0); //text tone
      text("KISS", 288, 280); //text 1
      text("THE", 288, 295); //text 2
      text("COOK", 282, 310); //text 3
    }
    
    if (key == 'g' || key == 'G') {
      
    //GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
    //torso (middle row)
    //torso (middle row)
    fill(50); //suit tone
    rect(300, 277, 50, 82);  //shirt (torso)
    rect(300, 240, 68, 20); //shirt (shoulders)
    rect(265, 275, 16, 90); //shirt (L sleeve)
    rect(335, 275, 16, 90); //shirt (R sleeve)
    
    fill(100); //flaps tone
    triangle(280, 230, 300, 310, 290, 230); //L flap
    triangle(320, 230, 300, 310, 310, 230); //R flap
    
    fill(250); //shirt tone
    triangle(300, 310, 290, 230, 310, 230); //shirt
    rect(265, 318, 17, 5); //L cuff
    rect(335, 318, 17, 5); //R cuff
    
    fill(133, 67, 208); //tie tone
    rect(300, 235, 8, 5); //tie knot
    rect(300, 260, 6, 42); //tie
    triangle(300, 310, 297, 280, 303, 280); //tie end
    }
  }
}


