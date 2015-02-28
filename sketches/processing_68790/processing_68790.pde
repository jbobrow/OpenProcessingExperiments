
void setup()
{
  size(400, 600);
  //background(124, 108, 89);
  background(124, 108, 89);
  int a = 600;
  int b = 0;
  int i = 0;
  while (a > 200)
  {
    fill(113+i, 84+i, 56+i);
    noStroke();
    rect(0, b, 600, b+10);
    b = b+10;
    a = a-10;
    i = i+2;
  }

  stroke(140, 140, 140);
  smooth();
  noFill();
  int e = 6;
  int y = 8;
  int s = 0;
  int n = 0;
  while (e>0)
  {
    triangle(n+10, 28, n+5, 8, n+8, 6);
    ellipse(n+10, 33, 15, 15);
    triangle(n+50, 88, n+55, 68, n+58, 66);
    ellipse(n+50, 93, 15, 15);
    triangle(n+10, 148, n+5, 128, n+8, 126);
    ellipse(n+10, 153, 15, 15);
    triangle(n+50, 208, n+55, 188, n+58, 186);
    ellipse(n+50, 213, 15, 15);
    triangle(n+10, 268, n+5, 248, n+8, 246);
    ellipse(n+10, 273, 15, 15);
    triangle(n+50, 328, n+55, 308, n+58, 306);
    ellipse(n+50, 333, 15, 15);
    triangle(n+10, 388, n+5, 368, n+8, 366);
    ellipse(n+10, 393, 15, 15);
    triangle(n+50, 448, n+55, 428, n+58, 426);
    ellipse(n+50, 453, 15, 15);
    triangle(n+10, 508, n+5, 488, n+8, 486);
    ellipse(n+10, 513, 15, 15);
    triangle(n+50, 568, n+55, 548, n+58, 546);
    ellipse(n+50, 573, 15, 15);
    n = n+80;
    e = e-1;
  }

  stroke(0, 0, 0);
  smooth();
  fill(165, 160, 155);
  beginShape(); //Top body outer
  curveVertex(100, 240);
  curveVertex(183, 325);
  curveVertex(100, 400);
  curveVertex(150, 480);
  curveVertex(250, 480);
  curveVertex(245, 340);
  curveVertex(245, 340);
  endShape();

  beginShape(); //Bottom body line down
  vertex(150, 480);
  vertex(150, 520);
  vertex(150, 580);
  vertex(150, 599);
  vertex(400, 599);
  vertex(280, 489);
  vertex(250, 480); 
  endShape();

  beginShape(); //Bottom body behind
  curveVertex(250, 480);
  curveVertex(250, 480);
  curveVertex(290, 490);  
  curveVertex(340, 520);
  curveVertex(390, 570);
  curveVertex(390, 600);
  curveVertex(250, 480);
  endShape();

  fill(0, 0, 0);
  ellipse(245, 200, 270, 315);//hair
  ellipse(260, 200, 290, 280);
  //ellipse(330,310,125,125);
  fill(255, 255, 255); //pearl_left earring
  ellipse(103, 200, 12, 12);
  fill(194, 178, 159);
  ellipse(245, 200, 280, 280); //head shape
  beginShape(); //Top body inner
  curveVertex(100, 280);
  curveVertex(183, 325);
  curveVertex(181, 355);
  curveVertex(150, 400);
  curveVertex(200, 370);
  curveVertex(245, 340);
  curveVertex(245, 340);
  endShape();
  fill(255, 255, 255, 200);
  rect(10, 500, 50, 90); 
  fill(0, 0, 0, 220);
  rect(70, 500, 50, 90);
  fill(247, 229, 62);
  ellipse(35, 545, 45, 45);
  fill(0, 0, 0);
  ellipse(23, 535, 5, 5);
  ellipse(47, 535, 5, 5);
  arc(35, 545, 30, 30, 0, PI);
  fill(255, 255, 255);
  stroke(255, 255, 255);
  strokeWeight(5);
  ellipse(95, 530, 35, 35);
  line(80, 560, 110, 580);
  line(110, 560, 80, 580);
  rect(85, 530, 20, 20);
  fill(0, 0, 0);
  strokeWeight(1);
  ellipse(83, 530, 7, 7);
  ellipse(107, 530, 7, 7);
}




void draw()
{
  //should turn green if mouseX,mouseY are within a certain region
  //if clicked on poison, check if mouseclicked, check if mouseX/mouseY are withing the square regions
  // if poison region, turn blush/drink green,draw toungue sticking out - else turn more red and draw happy lined
  //  //Blush
  //int c = 10; //counter
  //int d = 35; //size_left
  //int r = 70; //size_right
  //int f = 0; //color_red
  //int g = 0; //color_green
  //int q = 0; //color_blue
  //while (c > 0)
  //{
  //  //if (mouse
  //  fill(194+f,178-g,159-q);
  //  noStroke();
  //  ellipse(130,240,d,d);
  //  ellipse(260,280,r,r);
  //  d = d-2;
  //  r = r-3;
  //  c = c-1;
  //  f = f+2;
  //  g = g+2;
  //  q = q+1;
  //}

  fill(208, 203, 214);
  stroke(144, 140, 140);
  smooth();
  beginShape(); //Eye_left
  curveVertex(150, 200);
  curveVertex(150, 200);
  curveVertex(153, 190);
  curveVertex(158, 180);
  curveVertex(165, 170);
  curveVertex(173, 160);
  curveVertex(185, 150);
  curveVertex(195, 155);
  curveVertex(195, 160);
  curveVertex(195, 170);
  curveVertex(195, 190);
  curveVertex(195, 200);
  curveVertex(191, 208);
  curveVertex(162, 208);
  curveVertex(150, 200);
  curveVertex(150, 200);
  endShape();
  beginShape(); //Eye_right
  curveVertex(230, 220);
  curveVertex(230, 220);
  curveVertex(233, 210);
  curveVertex(238, 200);
  curveVertex(245, 190);
  curveVertex(253, 180);
  curveVertex(265, 170);
  curveVertex(275, 175);
  curveVertex(275, 180);
  curveVertex(275, 190);
  curveVertex(275, 210);
  curveVertex(275, 220);
  curveVertex(271, 228);
  curveVertex(242, 228);
  curveVertex(230, 220);
  curveVertex(230, 220);
  endShape();

  //beads
  stroke(0, 0, 0);
  fill(255, 255, 255);
  ellipse(185, 335, 8, 8);
  ellipse(180, 340, 8, 8);
  ellipse(175, 345, 8, 8);
  ellipse(170, 350, 8, 8);
  ellipse(165, 355, 8, 8);
  ellipse(161, 360, 8, 8);
  ellipse(158, 365, 8, 8);
  ellipse(155, 370, 8, 8);
  ellipse(152, 375, 8, 8);
  ellipse(149, 380, 8, 8);
  ellipse(148, 385, 8, 8);
  ellipse(150, 390, 8, 8);
  ellipse(245, 345, 8, 8);
  ellipse(240, 350, 8, 8);
  ellipse(234, 355, 8, 8);
  ellipse(228, 360, 8, 8);
  ellipse(222, 365, 8, 8);
  ellipse(216, 369, 8, 8);
  ellipse(210, 373, 8, 8);
  ellipse(204, 378, 8, 8);
  ellipse(198, 382, 8, 8);
  ellipse(192, 386, 8, 8);
  ellipse(185, 389, 8, 8);
  ellipse(178, 392, 8, 8);
  ellipse(171, 394, 8, 8);
  ellipse(163, 396, 8, 8);
  ellipse(155, 395, 8, 8);

  beginShape(); //eyelashes_left
  curveVertex(150, 200);
  curveVertex(150, 200);
  curveVertex(148, 198);
  curveVertex(143, 190);
  curveVertex(143, 190);
  endShape();
  beginShape();
  curveVertex(154, 203);
  curveVertex(154, 203);
  curveVertex(152, 201);
  curveVertex(147, 193);
  curveVertex(147, 193);
  endShape();
  beginShape();
  curveVertex(158, 207);
  curveVertex(158, 207);
  curveVertex(156, 204);
  curveVertex(151, 196);
  curveVertex(151, 196);
  endShape();
  beginShape();
  curveVertex(162, 208);
  curveVertex(162, 208);
  curveVertex(160, 207);
  curveVertex(155, 199);
  curveVertex(155, 199);
  endShape();

  beginShape(); //eyelashes_right
  curveVertex(230, 220);
  curveVertex(230, 220);
  curveVertex(228, 218);
  curveVertex(223, 210);
  curveVertex(223, 210);
  endShape();
  beginShape();
  curveVertex(234, 223);
  curveVertex(234, 223);
  curveVertex(232, 221);
  curveVertex(227, 213);
  curveVertex(227, 213);
  endShape();
  beginShape();
  curveVertex(238, 226);
  curveVertex(238, 226);
  curveVertex(236, 224);
  curveVertex(231, 216);
  curveVertex(231, 216);
  endShape();
  beginShape();
  curveVertex(242, 228);
  curveVertex(242, 228);
  curveVertex(240, 227);
  curveVertex(235, 219);
  curveVertex(235, 219);
  endShape();

  //hair
  fill(0, 0, 0);
  ellipse(250, 100, 110, 120);
  ellipse(370, 220, 60, 70);
  noStroke();
  fill(194, 178, 159);
  ellipse(280, 101, 70, 70);
  ellipse(366, 200, 40, 50);
  stroke(0, 0, 0);
  fill(255, 255, 255);
  ellipse(350, 250, 15, 15); //bead_right earring

  //nose
  noFill();
  beginShape();
  vertex(190, 225);
  vertex(185, 220);
  vertex(183, 230);
  endShape();

  //lips
  stroke(0, 0, 0);
  fill(255, 167, 167);
  ellipse(188, 283, 6, 10);
  noFill();
  beginShape();
  vertex(185, 280);
  vertex(188, 283);
  vertex(195, 285);
  vertex(200, 285);
  endShape();

  //Martini Glass with olive!
  //strokeWeight(2);

  fill(198, 177, 152);
  beginShape();
  vertex(70, 450);
  vertex(25, 370);
  vertex(64, 405);
  vertex(68, 390);
  vertex(70, 450);
  endShape();
  fill(229, 227, 227);
  rectMode(CENTER);
  rect(55, 440, 6, 85);
  triangle(10, 340, 100, 340, 55, 400);
  triangle(55, 460, 40, 485, 70, 485);
  fill(216, 94, 94);
  triangle(70, 363, 65, 338, 68, 336);
  ellipse(70, 363, 13, 13);
  fill(152, 240, 207);
  triangle(25, 360, 85, 360, 55, 400);

  //Blush
  int c = 10; //counter
  int d = 35; //size_left
  int r = 70; //size_right
  int f = 0; //color_red
  int g = 0; //color_green
  int q = 0; //color_blue
  while (c > 0)
  {
    //if (mouse
    fill(194+f, 178-g, 159-q);
    noStroke();
    ellipse(130, 240, d, d);
    ellipse(260, 280, r, r);
    d = d-2;
    r = r-3;
    c = c-1;
    f = f+2;
    g = g+2;
    q = q+1;
  }

  if ((mouseY > 500) && (mouseY<590))
  {
    if ((mouseX > 10) && (mouseX < 60)) // if the cursor is within the boundaries of the sugar
    {
      for (int h = 0;h<300;h++)
      {
        fill(random(100, 255), 30, 30); //turn different shades of red
        stroke(0,0,0);
        triangle(25, 360, 85, 360, 55, 400);
        stroke(0, 0, 0);
        fill(243, 250, 53);              //weird yellow happy things
        triangle(285, 220, 315, 207, 320, 225);
        triangle(285, 220, 320, 235, 310, 240);
        noStroke();
        fill(194, 178, 159);
        ellipse(130,240,35,35);
        ellipse(260,280,70,70);
          //Blush turns red
  int count = 10; //counter
  int d_l = 35; //size_left
  int r_r = 70; //size_right
  int f_r = 0; //color_red
  int g_r = 0; //color_green
  int q_r = 0; //color_blue
  while (count > 0)
  {
    fill(194+f_r, 178-g_r, 159-q_r);
    noStroke();
    ellipse(130, 240, d_l, d_l);
    ellipse(260, 280, r_r, r_r);
    d_l = d_l-2;
    r_r = r_r-3;
    count = count-1;
    f_r = f_r+6;
    g_r = g_r+16;
    q_r = q_r+15;
  }
      }
    }
    else if ((mouseX > 70) && (mouseX < 120)) //if curser is within the poison region
    {
      fill(194, 178, 159);
      rect(307, 220, 50, 60);
      for (int t = 0;t<300;t++)
      {
        fill(30, random(100, 255), 30);  //turn different shades of green
        triangle(25, 360, 85, 360, 55, 400);
        fill(235, 20, 20);
        stroke(0, 0, 0);
        beginShape();
        curveVertex(180, 275); //tongue shape
        curveVertex(180, 275);
        curveVertex(183, 295);
        curveVertex(194, 302);
        curveVertex(197, 295);
        curveVertex(205, 280);
        curveVertex(205, 280);
        endShape();
        line(180, 275, 205, 280);
        line(190,277,187,284);
      }
             fill(194, 178, 159);
             noStroke();
        ellipse(130,240,35,35);
        ellipse(260,280,70,70);
          //Blush turns greener when woman is posioned
  int countTwo = 10; //counter
  int d_g = 35; //size_left
  int r_g = 70; //size_right
  int f_g = 0; //color_red
  int g_g = 0; //color_green
  int q_g = 0; //color_blue
  while (countTwo > 0)
  {
    //if (mouse
    fill(194-f_g, 178-g_g, 159-q_g);
    noStroke();
    ellipse(130, 240, d_g, d_g);
    ellipse(260, 280, r_g, r_g);
    d_g = d_g-2;
    r_g = r_g-3;
    countTwo = countTwo-1;
    f_g = f_g+12;
    g_g = g_g+7;
    q_g = q_g+8;
  }
    }
    else
    {
      fill(194, 178, 159); //if its neither poison not sugar, cover up anyhting that was drawn to look like normal
      ellipse(185, 280, 80, 80); //mouth redrawn
      rect(307, 220, 50, 60); // side of left eye redrawn
      stroke(0, 0, 0);
      fill(255, 167, 167);
      ellipse(188, 283, 6, 10);
      noFill();
      beginShape();
      vertex(185, 280);
      vertex(188, 283);
      vertex(195, 285);
      vertex(200, 285);
      endShape();
      fill(152, 240, 207);
      triangle(25, 360, 85, 360, 55, 400);
    }
  }
  else //if the cursor is within the Y-region of the mouse but neither on the poison or sugar
  {    //redraw the woman as she was same as if you were not in the proper Y-region. 
    fill(194, 178, 159); 
    ellipse(185, 280, 80, 80);
    rect(307, 220, 50, 60);
    stroke(0, 0, 0);
    fill(255, 167, 167);
    ellipse(188, 283, 6, 10);

    noFill();
    beginShape();
    vertex(185, 280);
    vertex(188, 283);
    vertex(195, 285);
    vertex(200, 285);
    endShape();
    fill(152, 240, 207);
    triangle(25, 360, 85, 360, 55, 400);
  }
}
