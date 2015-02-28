
//rubix cube
//by evan litvak

void setup(){
size(600,600);
background(0);
smooth();
}

void draw(){
  
fill(236,250,48);

//beginShape();
  vertex(298,108);
  vertex(481,167);
  vertex(302,247);
  vertex(118,166);
  vertex(298,108);
endShape();

//beginShape();
  vertex(302,247);
  vertex(481,167);
  vertex(461,383);
  vertex(302,491);
  vertex(302,247);
endShape();

//beginShape();
  vertex(302,247);
  vertex(302,491);
  vertex(134,381);
  vertex(117,167);
  vertex(302,247);
endShape();

strokeWeight(1.75);

//top face squares

fillRed();

beginShape();
  vertex(302,247);
  vertex(369,217);
  vertex(305,191);
  vertex(238,219);
  vertex(302,247);
endShape();

fillBlue();

beginShape();
  vertex(371,216);
  vertex(429,190);
  vertex(366,166);
  vertex(307,190);
  vertex(371,216);
endShape();

fillOrange();

beginShape();
  vertex(429,190);
  vertex(367,165);
  vertex(414,146);
  vertex(481,167);
  vertex(429,190);
endShape();

fillRed();

beginShape();
  vertex(413,145);
  vertex(350,125);
  vertex(302,142);
  vertex(366,165);
  vertex(413,145);
endShape();

fillGreen();

beginShape();
  vertex(348,124);
  vertex(298,108);
  vertex(250,124);
  vertex(300,142);
  vertex(348,124);
endShape();

fillYellow();

beginShape();
  vertex(364,165);
  vertex(300,143);
  vertex(241,164);
  vertex(305,190);
  vertex(364,165);
endShape();

fillWhite();

beginShape();
  vertex(303,190);
  vertex(240,165);
  vertex(171,190);
  vertex(236,218);
  vertex(303,190);
endShape();

fillWhite();

beginShape();
  vertex(240,164);
  vertex(298,142);
  vertex(248,124);
  vertex(189,143);
  vertex(240,164);
endShape();

fillBlue();

beginShape();
  vertex(170,189);
  vertex(238,164);
  vertex(187,144);
  vertex(118,166);
  vertex(170,189);
endShape();

//right face squares 

fillWhite();

beginShape();
  vertex(303,248);
  vertex(372,217);
  vertex(369,303);
  vertex(303,337);
  vertex(303,248);
endShape();

fillOrange();

beginShape();
  vertex(374,217);
  vertex(431,192);
  vertex(425,273);
  vertex(370,302);
  vertex(374,217);
endShape();

fillYellow();

beginShape();
  vertex(432,191);
  vertex(482,169);
  vertex(474,248);
  vertex(426,273);
  vertex(432,191);
endShape();

fillRed();

beginShape();
  vertex(303,338);
  vertex(368,304);
  vertex(365,382);
  vertex(303,422);
  vertex(303,338);
endShape();

fillGreen();

beginShape();
  vertex(370,303);
  vertex(425,275);
  vertex(420,347);
  vertex(366,381);
  vertex(370,303);
endShape();

fillWhite();

beginShape();
  vertex(426,274);
  vertex(474,249);
  vertex(467,317);
  vertex(421,346);
  vertex(426,274);
endShape();

fillWhite();

beginShape();
  vertex(303,423);
  vertex(365,383);
  vertex(362,450);
  vertex(303,491);
  vertex(303,423);
endShape();

fillRed();

beginShape();
  vertex(366,383);
  vertex(420,348);
  vertex(415,414);
  vertex(363,449);
  vertex(366,383);
endShape();

fillBlue();

beginShape();
  vertex(421,348);
  vertex(467,318);
  vertex(461,383);
  vertex(417,413);
  vertex(421,348);
endShape();

//right face squares

fillBlue();

beginShape();
  vertex(301,248);
  vertex(235,219);
  vertex(236,302);
  vertex(301,336);
  vertex(301,248);
endShape();

fillGreen();

beginShape();
  vertex(234,219);
  vertex(171,191);
  vertex(174,270);
  vertex(235,302);
  vertex(234,219);
endShape();

fillYellow();

beginShape();
  vertex(170,191);
  vertex(117,167);
  vertex(123,244);
  vertex(173,270);
  vertex(170,191);
endShape();

fillGreen();

beginShape();
  vertex(301,337);
  vertex(236,304);
  vertex(237,382);
  vertex(301,420);
  vertex(301,337);
endShape();

fillRed();

beginShape();
  vertex(235,302);
  vertex(174,272);
  vertex(178,346);
  vertex(236,381);
  vertex(235,302);
endShape();

fillOrange();

beginShape();
  vertex(173,271);
  vertex(123,245);
  vertex(129,317);
  vertex(176,345);
  vertex(173,271);
endShape();

fillOrange();

beginShape();
  vertex(301,422);
  vertex(237,383);
  vertex(238,450);
  vertex(301,491);
  vertex(301,422);
endShape();

fillYellow();


beginShape();
  vertex(236,383);
  vertex(178,347);
  vertex(180,411);
  vertex(237,449);
  vertex(236,383);
endShape();

fillGreen();

beginShape();
  vertex(176,347);
  vertex(129,318);
  vertex(134,381);
  vertex(179,410);
  vertex(176,347);
endShape();
}

void fillRed(){
  fill(224,28,32);
}

void fillOrange(){
  fill(244,86,0);
}

void fillBlue(){
  fill(33,103,178);
}

void fillGreen(){
  fill(9,106,54);
}

void fillYellow(){
  fill(253,242,0);
}

void fillWhite(){
  fill(245);
}



