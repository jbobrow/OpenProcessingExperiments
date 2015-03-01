
background(255,255,255);
size(622,400);
smooth();

//SOMBRERO
  fill(20,19,25);
  rect(220,70,180,68);
  rect(165,166,295,23);
  fill(47,46,54);
  rect(220,139,180,27);

//CARA
  fill(214,158,140);
  arc(310,190,170,360,0,PI);

//OREJAS
  arc(230,230,40,50,HALF_PI,PI+HALF_PI);
  arc(390,230,40,50,PI+HALF_PI,PI+HALF_PI+PI);

//SOMBRA FRENTE sombrero
  fill(180,124,106);
  noStroke();
  rect(226,190,169,8);

//GAFAS DE SOL
  fill(9,9,9);
  rect(240,220,60,40);
  rect(320,220,60,40);
  noStroke();
  rect(295,230,30,15);
    //REFLEJO
    stroke(255,255,255);
    line(252,243,265,228);
    line(267,250,286,227);
    line(332,243,345,228);
    line(347,250,366,228);

//ARRUGAS
  stroke(0,0,0);
  line(262,200,357,200);
  line(262,208,357,208);

//PATILLAS GAFAS
  strokeWeight(4);
  stroke(9,9,9);
  line(226,204,240,238);
  line(380,238,394,204);

//NARIZ
  strokeWeight(1);
  noFill();
  arc(289,282,30,55,TWO_PI-QUARTER_PI,TWO_PI+QUARTER_PI);
  arc(333,282,30,55,HALF_PI+QUARTER_PI,PI+QUARTER_PI);

//BARBA
  //BIGOTE
    noStroke();
    fill(57,32,16);
    rect(282,300,57,15);
    triangle(271,317,282,300,282,317);
    triangle(339,317,339,300,350,317);
  //PERILLA
    rect(271,317,11,30);
    rect(339,317,11,30);
    rect(281,336,60,11);
    arc(310,347,79,46,0,PI);

//BOCA
  stroke(0,0,0);
  noFill();
  line(288,325,333,325);
  arc(289,325,10,15,HALF_PI,PI+HALF_PI);
  arc(332,325,10,15,PI+HALF_PI,PI+HALF_PI+PI);


