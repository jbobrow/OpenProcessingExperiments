
/**
 *Sketch 1
 *Daniel Zhu 0412620
 */
 
void setup() {
  //Canvas setup with black background
  //400 by 400 pixels
  size(400,400);
  background(0);
  
  //Drawing planet
  ellipseMode(300);
  fill(204,102,0);
  ellipse(300,100,400,400);
  
  //Drawing stars
  stroke(255);
  point(50,100);
  point(100,25);
  point(300,40);
  point(75,275);
}

void draw() {
  
  
  
  //Drawing with white
  stroke(255);
  
  //Drawing right side gun
  point(36,150);
  point(80,164);
  point(80,174);
  point(4,149);
  point(32,154);
  line(36,150,80,164);
  line(80,164,80,174);
  line(80,174,4,149);
  line(4,149,32,154);
  line(32,154,36,150);
  
  //Drawing left side gun
  point(106,143);
  point(107,139);
  point(100,133);
  point(57,124);
  point(54,126);
  point(27,121);
  line(106,143,107,139);
  line(107,139,100,133);
  line(100,133,57,124);
  line(57,124,54,126);
  line(54,126,27,121);
  line(27,121,106,143);
  
  //Drawing front underbelly Section 1
  point(58,142);
  point(56,156);
  point(95,168);
  point(119,148);
  point(76,136);
  line(58,142,56,156);
  line(56,156,95,168);
  line(95,168,119,148);
  line(119,148,76,136);
  line(76,136,58,142);

  //Drawing front underbelly Section 2
  point(95,168);
  point(119,148);
  point(149,155);
  point(119,174);
  line(95,168,119,148);
  line(119,148,149,155);
  line(149,155,119,174);
  line(119,174,95,168);
  
  //Drawing main underbelly Section 3
  point(119,174);
  point(149,155);
  point(255,190);
  point(234,211);
  line(119,174,149,155);
  line(149,155,255,190);
  line(255,190,234,211);
  line(234,211,119,174);
  
  //Drawing back underbelly Section 4
  point(255,190);
  point(309,212);
  point(320,221);
  point(308,229);
  point(287,225);
  point(234,211);
  line(255,190,309,212);
  line(309,212,320,221);
  line(320,221,308,229);
  line(308,229,287,225);
  line(287,225,234,211);
  line(234,211,255,190);
  
  //Drawing leftside of the ship
  point(107,139);
  point(116,139);
  point(175,154);
  point(201,162);
  point(260,184);
  point(242,184);
  line(107,139,116,139);
  line(116,139,175,154);
  line(175,154,201,162);
  line(201,162,260,184);
  line(260,184,242,184);
  
  //Drawing left inner wing
  line(242,184,285,184);
  line(285,184,314,204);
  line(314,204,304,207);
  line(304,207,302,211);
  
  //Drawing right inner wing
  line(232,210,280,224);
  line(280,224,269,226);
  line(269,226,262,234);
  line(262,234,235,225);
  line(235,225,232,210);
  
  //Drawing right wing inner jet 1
  line(235,225,199,215);
  line(199,215,192,224);
  line(192,224,216,235);
  line(216,235,264,250);
  line(264,250,267,246);
  line(267,246,281,250);
  line(281,250,287,243);
  line(287,243,280,240);
  line(280,240,274,237);
  line(274,237,274,235);
  line(274,235,265,232);
  line(265,232,262,234);
  line(262,234,235,225);
  
  //Drawing right wing outter jet 2
  line(208,251,213,244);
  line(213,244,237,249);
  line(237,249,250,253);
  line(250,253,256,254);
  line(256,254,264,259);
  line(264,259,271,261);
  line(271,261,267,266);
  line(267,266,256,265);
  line(256,265,253,267);
  line(253,267,247,266);
  line(247,266,208,251);
  
  //Drawing right wing connection between jets
  line(236,241,237,250);
  line(255,247,249,253);
  
  //Drawing left wing inner jet 1
  line(261,167,281,160);
  line(281,160,342,202);
  line(342,202,354,216);
  line(354,216,341,219);
  line(341,219,334,213);
  line(334,213,330,215);
  line(330,215,315,206);
  line(315,206,261,167);
  
  //Drawing left wing outter jet 2
  line(314,168,333,165);
  line(333,165,373,196);
  line(373,196,377,197);
  line(377,197,383,202);
  line(383,202,384,207);
  line(384,207,384,210);
  line(384,210,388,215);
  line(388,215,373,216);
  line(373,216,359,207);
  line(359,207,355,207);
  line(355,207,350,202);
  line(350,202,349,197);
  line(349,197,314,168);
  
  //Drawing left wing connection
  line(319,182,331,182);
  line(339,199,348,197);
  
  //Drawing ship tail
  line(309,213,315,207);
  line(315,207,319,209);
  line(319,209,316,218);
  
  //Jet flame streaks
  stroke(130,126);
  
  //right wing outter
  line(269,267,309,277);
  line(272,262,314,276);
  
  //right wing inner
  line(283,250,313,256);
  line(287,245,324,257);
  
  //left wing inner
  line(343,220,376,243);
  line(355,211,376,235);
  
  //left wing outter
  line(390,215,395,220);
  line(374,217,392,230);
  
  
  
}


