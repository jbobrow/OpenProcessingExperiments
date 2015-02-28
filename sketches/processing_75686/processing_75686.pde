


PShape bot;


size(900, 725);
smooth();
  
bot = loadShape("bot1.svg");
  


background(255);
  
shape(bot, 0,0);            


noStroke ();
fill (0);

//lange linien von oben nach unten:
fill (130,124,227);
rect (90,156,710,10);
fill (154,124,227);
rect (90,302,710,10);
fill (154,124,227);
rect (90,448,710,6);
fill (130,124,227);
rect (90,595,710,8);

//linien unten
rectMode (CORNERS);
fill (154,124,227);
rect (90,620,488,625);
fill (130,124,227);
rect (90,643,348,647);
fill (180,124,227);
rect (90,674,258,678);


//deutschlandfahne
rectMode (CORNER);
fill (31,72,34);
rect (508,535,116,10);
fill (153,106,160);
rect (508,545,116,10);
fill (221,123,234);
rect (508,555,116,10);
fill (247,247,82);
rect (508,565,116,10);

//Quadrate rechts unten
fill (216,24,24);
rect (646,506,6,6);
fill (219,87,64);
rect (673,506,6,6);
fill (234,107,57);
rect (703,506,6,6);
fill (240,127,34);
rect (738,506,6,6);
fill (247,196,25);
rect (783,506,6,6);

//linien darüber
fill (64,48,41);
rect (638,347,162,5);
fill (118,71,62);
rect (638,374,162,4);
fill (201,99,113);
rect (638,401,162,2);

//Block 2.reihe von links nach rechts und jeweils von oben nach unten. die kleinen zum schluß

fill (62,71,98);
rect (72,220,30,70);
fill(157,16,16);
rect (72,255,30,35);

fill(25,70,26);
rect (102,220,30,70);
fill(245,230,59);
rect (102,238,30,52);

fill (140,180,247);
rect (132,220,30,70);
fill (14,14,15);
rect (132,263,30,27);

fill (39,11,11);
rect (162,220,30,70);
fill (245,230,59);
rect (162,247,30,43);

fill (189,240,235);
rect (192,220,30,70);
fill (250,88,88);
rect (192,277,30,13);


rectMode (CENTER);
fill (245,230,59);
rect (147,272,10,5);
fill (250,182,230);
rect (207,249,5,34);

//rechtecke erste reihe


fill (216,74,46);
rectMode (CORNER);
rect (181,57,9,9);

//2.

fill (106,42,88);
rect (219,208,36,4);
fill (44,157,94);
rect (440,171,24,2);
rectMode(CORNERS);
fill (234,47,50);
rect (519,268,524,277 );
rectMode (CORNER);
fill (234,47,50);
rect (610,270,4,4 );
      
//3.
rectMode(CORNERS);
fill (216,24,24);
rect (195,323,216,327);
fill (49,152,60);
rect (185,346,195,353);

fill (216,24,24);
rect (288,330,290,358);
rectMode (CORNER);

fill (110,30,250);
rect (296,330,2,2);
rect (296,340,2,2);
rect (296,350,2,2);

fill (216,24,24);
rect (300,411,2,2);

rectMode(CORNERS);

fill (36,66,126);
rect (363,332,370,339);
rect (390,332,397,339);

fill (216,24,24);
rect (345,383,349,389);
rect (375,414,381,423);
rect (396,399,399,406);

fill (113,29,31);
rect (519,416,522,439);

//4

fill (88,22,46);
rect (160,470,191,475);

rectMode (CORNER);
fill (93,21,42);
rect (440,510,22,3);
fill (255,222,52);
rect (440,513,22,5);
rect (440,521,22,5);
fill (60,62,85);
rect (440,518,22,3);
fill (175,178,214);
rect (440,526,22,5);








