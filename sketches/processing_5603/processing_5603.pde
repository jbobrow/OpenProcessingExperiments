
//INT
int x = 480;
int page = 1;
int startTime = 0;
int introTitle, narrationTime = 3000;

//FLOAT
float targetX, targetY;
float easing = 1;
float xx;

//FONT
PFont f;

//SHAPE
PShape bl, s, h, a, p, e, ss, hh, aa, pp, ee, sh, sa, sp, se, hs, ha, hp, he, r, o, b, t, as, ah, ap;

void setup() {
  smooth();
  noStroke();
  size (640, 480);

  //FONT
  f = loadFont ("Cracked-25.vlw");

  //SHAPE
  bl = loadShape ("Black.svg");
  s = loadShape ("Title Page.svg");
  h = loadShape ("Title Page Head.svg");
  a = loadShape ("Title Page Arms.svg");
  p = loadShape ("Title Page Bubble.svg");
  e = loadShape ("Narration Page.svg");
  ss = loadShape ("Professor X.svg");
  hh = loadShape ("Professor X Quote.svg");
  aa = loadShape ("Narration 2.svg");
  pp = loadShape ("Searching.svg");
  ee = loadShape ("Arm.svg");
  sh = loadShape ("Searching Green.svg");
  sa = loadShape ("Found Green.svg");
  sp = loadShape ("Found Green Leg.svg");
  se = loadShape ("Disappointed.svg");
  hs = loadShape ("Thirsty.svg");
  ha = loadShape ("Repair Robot.svg");
  hp = loadShape ("Repair.svg");
  he = loadShape ("Throw it away.svg");
  r = loadShape ("arms.svg");
  o = loadShape ("headbody.svg");
  b = loadShape ("legs.svg");
  t = loadShape ("neck.svg");
  as = loadShape ("Oil.svg");
  ah = loadShape ("Water.svg");
  ap = loadShape ("End.svg");

  //TIME
  startTime = millis();
}

void draw () {

  //Page 1: Title Page
  if (page == 1) {
    //background
    shape (s, 0, 0);
    //head
    float shake = random (-2, 2);
    shape (h, 97, (x - 164) + shake);
    //arms
    float shake1 = random (-5, 5);
    shape (a, 0, (x - 468) + shake1);
    //bubble
    if ((mouseX > 40) && (mouseX < 606) &&
      (mouseY < x - 231) && (mouseY > x - 294)) {
      shape (p, 13, x - 216); 
    } 
    else {
    }
    //siren
    fill(215, 31, 38);
    targetY = dist(mouseX, mouseY, pmouseX, pmouseY) * 1;
    targetX = targetX + ((targetY - targetX) *easing);
    ellipse (212, x - 165, targetX, targetX);
  }

  //Page 2: Narration 1
  else if (page == 2) {
    shape (ss, 0, 0); 
    textFont (f);
    fill (255);
    text("Professor X decides to build himself a robot.", 280, 250);
    if ((millis() > startTime + 2000) && (millis() < startTime + 4000)) {
      shape (hh, 250, x - 445);
    } 
    else { 
    }
    if (millis() > startTime + 4000) {
      page = 3;
    }
  }  

  //Page 3: Narration 2
  else if (page == 3) {
    shape (e, 0, 0);
    fill(0);
    text("To find essential parts for the robot,", 200, 375);
    text("Professor X heads out to a landfill.", 250, 400);
    if (millis() > startTime + 8000) {
      page = 4;
    }
  }

  //Page 4: Narration 3
  else if (page == 4) {
    shape (aa, 0, 0);
    fill(255);
    text("Professor X spends hours tring to find parts for his new robot.", 60, x - 370);
    if (millis() > startTime + 12000) {
      page = 5;
    }
  }

  //Page 41: Narration 3 Extra
  else if (page == 41) {
    shape (aa, 0, 0);
    fill(255);
    text("Professor X spends hours trying to find parts for his new robot.", 60, x - 370);
    if (millis() > startTime + 4000) {
      page = 5;
    }
  }

  //Page 5: Searching through trash
  else if (page == 5) {
    shape (pp, 0, 0);
    shape (sh, 286, x - 365);
    text("Help Professor X find parts for his robot!", 191, x - 434);
    targetX = mouseX;
    xx = xx + ((targetX - xx) * easing);
    shape (ee, xx - 150, x - 237);
  }

  //Page 6: Finding Green Machine
  else if (page == 6) {
    shape (sa, 0, 0);
    float shake1 = random (-2, 2);
    shape (sp, 374, (x - 409) + shake1);
  }

  //Page 7: Disappointed
  else if (page == 7) {
    shape (se, 0, 0);
    text("You return home disappointed.", 200, 400);
    if (millis() > startTime + 3000) {
      page = 41;
      startTime = millis();
    }
  }

  //Page 8: Fixed
  else if (page == 8) {
    shape (bl, 0, 0);

    //BODY 
    float sc = random (-2, 2); 
    shape (o, 120, (x - 309.5) + sc); 

    //ROBOT ARMS 
    float sh = random (-2, 2); 
    shape (r, 70, (x - 217) + sh); 

    //LEGS 
    float sa = random (-2, 2); 
    shape (b, 120, (x - 126) + sa); 

    //NECK 
    float sp = random (-.5, .5); 
    shape (t, 120, (x - 343) + sp); 

    //ANTENNA 
    fill (187, 215, 86); 
    triangle(163, x - 309, 170, x - 296, 160, x- 296);   

    //COMMAND  
    fill (157, 159, 161); 
    quad (129, x - 213, 201, x - 213, 201, x - 165, 129, x - 165);  

    //SIREN 
    fill(215, 31, 38); 
    targetY = dist(mouseX, mouseY, pmouseX, pmouseY) * 0.5; 
    targetX = targetX + ((targetY - targetX) * easing); 
    ellipse(166, x - 309, targetX, targetX); 

    //EYEBALL RED 
    fill(215, 31, 38); 
    ellipse(149, x - 271, 16, 16); 
    ellipse(179, x - 271, 16, 16); 

    //EYEBALL WHITE 
    fill(255); 
    float ex = constrain(mouseX, 175, 183);  
    float ey = constrain(x - mouseY, x - 266, x - 275);  
    float ex2 = constrain(mouseX, 145, 153);  
    float ey2 = constrain(x - mouseY, x - 266, x - 275);  
    ellipse(ex2, ey2, 7, 7);  
    ellipse(ex, ey, 7, 7);  

    //SPARKS 
    fill (random(100, 255)); 
    beginShape(); 
    vertex(133, x - 313); 
    vertex(147, x - 318); 
    vertex(148, x - 312); 
    vertex(154, x - 312); 
    vertex(145, x - 307); 
    vertex(142, x - 312); 
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
    
    fill(215, 31, 38); 
    ellipse (177, x - 201, 12, 12); 
    ellipse (192, x - 201, 12, 12);     
    
    fill (random (0, 255)); 
    quad(173, x - 189, 182, x - 189, 182, x - 181, 173, x - 181); 
    quad(184, x - 189, 192, x - 189, 192, x - 181, 184, x - 181); 
    quad(173, x - 179, 182, x - 179, 182, x- 170, 173, x - 170);   
    quad(184, x - 179, 192, x - 179, 192, x - 170, 184, x - 170); 

    text("FIXED!", width/2, height/2);
    if (millis() > startTime + 4000) {
      page = 10;
    }
  }

  //Page 9: Throw it Away
  else if (page == 9) {
    shape (he, 0, 0);
    if (millis() > startTime + 4000) {
      page = 41;
      startTime = millis();
    }
  }
  
  //Page 10: Thirsty
  else if (page == 10) {
    shape (hs, 0, 0);
    float shake1 = random (-1, 1);
    shape (as, 155 + shake1, x - 300 + shake1);
    
    float shake2 = random (-3, 3);
    shape (ah, 422 + shake2, x - 317 + shake2);
  }

  //Page 11: Fries Up
  else if (page == 11) {
    shape (hp, 0, 0);
    float shake1 = random (-2, 2);
    shape (ha, (271 + shake1), (x - 392 + shake1));
  }


  //Page 12: Play!
  else if (page == 12) {
    shape (bl, 0, 0);

  //robot head 
  fill(187, 215, 86); 
  quad(129, x-296, 200, x-296, 200, x-233, 129, x-233); 
 
  //robot flashing ball 
  fill(215, 31, 38); 
  targetY = dist(mouseX, mouseY, pmouseX, pmouseY) * 0.5; 
  targetX = targetX + ((targetY - targetX) * easing); 
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
    fill (random(0,255));  
    text("Rebooting", 100, 90); 
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
    fill (random(0,255));  
    text("Self-Destruct!", 100, 90); 
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
  fill(0); 
  ellipse(86, x - 265, 17, 17); 
 
  //left hand 
  fill(187, 215, 86); 
  ellipse(246, x - 165, 30, 30); 
  fill(0); 
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
    fill (random(0,255));  
    text("I can be LOUD!", 100, 90); 
 
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
    fill (random(0,255));  
    text("Please tell me what to do!", 100, 90); 
    fill (255, 242, 0); 
  }  
  else { 
    fill (random (0, 255)); 
 
  } 
  quad(184, x - 179, 192, x - 179, 192, x - 170, 184, x - 170); 

    text ("Green Machine is happy! Play with him!", width/2, height/2 - 100);
    if (millis() > startTime + 14000) {
      page = 14;
    }
  }

  //Page 13: Fixing...1
  else if (page == 13) {
    shape (bl, 0, 0);
    text ("Fixing...", width/2, height/2);
    if (millis() > startTime + 2000) {
      page = 10;
    }
  }

  //Page 13: Fixing...2
  else if (page == 131) {
    shape (bl, 0, 0);
    text ("Fixing...", width/2, height/2);
    if (millis() > startTime + 2000) {
      page = 8;
    }
  }

  //Page 14: End.
  else if (page == 14) {
    shape (ap, 0, 0);
  } 
}

void mousePressed() {
  //Page 1: Title Page
  if (page == 1) {
    if ((mouseX > 40) && (mouseX < 606) &&
      (mouseY < x - 231) && (mouseY > x - 294)) {
      page = 2;
      startTime = millis();
    }
    else {
      page = 1;
    }
  }

  //Page 5: Searching
  else if (page == 5) {
    if ((mouseX > 285) && (mouseX < 319) &&
      (mouseY < x - 332) && (mouseY > x - 361)) {
      float shake2 = random (-2, 2);
      shape (sh, 286, (x - 360) + shake2);
      page = 6;
    } 
    else {
      page = 7;
      startTime = millis();
    }
  } 

  //Page 10: Thirsty
  else if (page == 10) {
    if (mouseX > width/2) {
      page = 11;
      startTime = millis();
    } 
    else {
      page = 12;
      startTime = millis();
    }
  }
}

void keyPressed() {
  //Page 6: Finding Green Machine
  if (page == 6) {
    if (key == 'y') {
      page = 131;
      startTime = millis();
    }
    else if (key == 'n') {
      page = 9;
      startTime = millis();
    }
  }

  //Page 11: Fries Up
  if (page == 11) {
    if (key == 'r') {
      page = 13;
      startTime = millis();
    } 
    else {
    }
  }
  
  //Page 14: End
  if (page == 14) { 
    if (key == ' ') {
      page = 1;
    }
  }
}

