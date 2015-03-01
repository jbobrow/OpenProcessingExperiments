
//the very hungry caterpillar
size(1000, 500);
background(255);
noStroke();

 //ground
 fill(100,51,0);
 rect(0, 450, 1000, 50);

//body
color bodyColor1 = color(0,153,76);
color bodyColor2 = color(0,110,0);
color bodyColor3 = color(0,150,0);
color bodyColor4 = color(25,117,94);
fill(bodyColor3);
ellipse(260, 420, 25, 40);
fill(bodyColor4);
ellipse(275, 420, 30, 55);
fill(bodyColor2);
ellipse(290, 420, 35, 65);
fill(bodyColor1);
ellipse(305, 420, 35, 70);
fill(bodyColor4);
ellipse(320, 420, 35, 75);
fill(bodyColor2);
ellipse(335, 420, 35, 75);
fill(bodyColor3);
ellipse(350, 420, 35,75);
fill(bodyColor2);
ellipse(365, 420, 35, 70);
fill(bodyColor1);
ellipse(380, 420, 35, 65);


 //head
 fill(204, 153, 255);
 ellipse(408, 385, 5, 35);
 ellipse(392, 385, 5, 35); 
 fill(255,45, 0);
 ellipse(400, 425, 47, 60);
  //face
  fill(255, 255,0);
  ellipse(410, 415, 13,20);
  ellipse(390, 415, 13,20);
  fill(0, 155,0);
  ellipse(412, 417, 10, 15);
  ellipse(392, 417, 10, 15);
  stroke(30);
  strokeWeight(8);
  point(400, 435);
  
//legs
stroke(0);
strokeWeight(5);
line(365,455, 365, 465);
line(350,455,350,465);
line(335,455,335,465);
line(285,455,285,465);
line(292,455,292,465);

//food
 //cheese
 noStroke();
 fill(242,181,59);
 triangle(700, 380, 700,470,810,460);
 fill(255);
 arc(780,420,80,40, HALF_PI, TWO_PI);
 arc(700,440, 25, 15, PI+HALF_PI, PI+TWO_PI);
 ellipse(710,400,5,5);
 fill(100,51,0);
 ellipse(730,460, 10,10);
 
 
  //watermelon
  noStroke();
   //rind
   fill(11,105,58);
   strokeWeight(10);
   arc(600,380,185,210, QUARTER_PI, QUARTER_PI+HALF_PI); 
  
  fill(245,94,94);
  arc(600,350,150,250, QUARTER_PI, QUARTER_PI+HALF_PI);
   //seeds
   fill(0);
   ellipse(590, 380, 5, 10);
   ellipse(600, 385, 5,10); 
   ellipse(595, 400, 5, 10);
   ellipse(570, 420, 5, 10);
   ellipse(620, 410, 5, 10);
   
  //cherry
  fill(72,46,18);
  rect(470, 410,3,30);
  noFill();
  strokeWeight(15);
  stroke(175,25,25);
  ellipse(470,450, 25,25);
  
