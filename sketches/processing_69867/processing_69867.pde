
//setup
size(650, 650);
background(255);
smooth();
ellipseMode(CENTER);
rectMode(CORNER);

//grass
noStroke();
fill(100, 220, 0);
rect(0,500, 650, 150);

//sky
fill(70, 70, 255);
rect(0,0, 650, 500);

//sun
fill(255, 255, 0);
ellipse(0,0, 200, 200);

//cloud
noStroke();
fill(255);
ellipse(550,10, 100, 100);
ellipse(450,20, 100, 100);
ellipse(500,40, 100, 100);
ellipse(575,50, 100, 100);
ellipse(650,60, 100, 100);
ellipse(640,1, 100, 100);
ellipse(430,1, 100, 100);

//girl
  //hair
  stroke(0);
  strokeWeight(3);
  fill(139, 90, 43);
  ellipse(440,310, 90, 125);
    //dress
  stroke(0);
  strokeWeight(3);
  fill(255, 0, 0);
  triangle(380,475, 500,475, 440,300);
  //legs
  line(415,475, 415,510);
  line(465,475, 465,510);
  //feet
  fill(145, 96, 41);
  ellipse(408,510, 20, 10);
  ellipse(458,510, 20, 10);
  //head
  fill(255, 218, 185);
  ellipse(440,290, 80, 80);
    //eyes
    fill(0);
    ellipse(425,280, 2, 2);
    ellipse(455,280, 2, 2);
    //mouth
    strokeWeight(2);
    arc(440,308, 25, 25, 0, PI);
  //arms
  strokeWeight(3);
  line(472,390, 500,370);
  line(408,390, 382,370);
  //hands
  fill(255, 218, 185);
  strokeWeight(2);
  ellipse(500,370, 13, 13); //left
  ellipse(382,370, 13, 13); //right

//ballon bunch
  //strings
  strokeWeight(1);
  line(382,370, 420,180);
  line(382,370, 382,200);
  line(382,370, 300,210);
  line(382,370, 340,180);
  line(382,370, 250,150);
  //balloons
  fill(255, 0, 0);
  ellipse(265,125, 70, 90);
  triangle(265,170, 270,175, 260,175);
  fill(0, 255, 0);
  ellipse(382,160, 70, 90);
  triangle(382,205, 387,210, 377,210);
  fill(0, 0, 255);
  ellipse(308,180, 60, 80);
  triangle(308,220, 313,225, 303,225);
  fill(255, 255, 0);
  ellipse(340,140, 70, 90);
  triangle(340,185, 345,190, 335,190);
  fill(210, 0, 255);
  ellipse(320,105, 70, 90);
  line(382,370, 320,150); //string (in front of other balloons)
  triangle(320,150, 325,155, 315,155);
  fill(255, 160, 0);
  ellipse(420,170, 70, 90);
  triangle(415,215, 420,220, 410,220);
