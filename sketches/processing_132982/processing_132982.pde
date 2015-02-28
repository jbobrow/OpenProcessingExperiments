
void setup() {
  size(450,450);
}

void draw() {
  
  frameRate(1);
  
  if(mouseY<225 && mouseX<225) {
    background(random(255),random(255),0,100);
  }
  if(mouseY<225 && mouseX>225) {
    background(random(255),0,random(255),100);
  }
  if(mouseY>225 && mouseX<225) {
    background(0,random(255),random(255),100);
  }
  if(mouseY>225 && mouseX>225){
    background(random(255),random(255),random(255),100);
  }
 strokeWeight(20);
 if (Y<15) {
 rect(random(450),random(15),random(20),random(20));
 stroke(random(100),random(200),random(150));
 }
 if (Y<30) {
   rect(random(450),random(16,30),random(20),random(20));
   stroke(random(56),random(179),random(230));
 }
 if (Y<45) {
   rect(random(450),random(31,45),random(20),random(20));
   stroke(random(134),random(234),random(20));
 }
 if (Y<60) {
   rect(random(450),random(46,60),random(20),random(20));
   stroke(random(150),random(45),random(21));
 }
 if (Y<75) {
   rect(random(450),random(61,75),random(20),random(20));
   stroke(random(132),random(203),random(111));
 }
  if (Y<90) {
   rect(random(450),random(76,90),random(20),random(20));
   stroke(random(23),random(131),random(21));
 }
  if (Y<105) {
   rect(random(450),random(91,105),random(20),random(20));
   stroke(random(234),random(91),random(80));
 }
  if (Y<120) {
   rect(random(450),random(106,120),random(20),random(20));
   stroke(random(100),random(45),random(245));
 }
  if (Y<135) {
   rect(random(450),random(121,136),random(20),random(20));
   stroke(random(134),random(205),random(211));
 }
  if (Y<150) {
   rect(random(450),random(136,150),random(20),random(20));
   stroke(random(209),random(145),random(21));
 }
  if (Y<165) {
   rect(random(450),random(151,165),random(20),random(20));
   stroke(random(150),random(45),random(21));
 }
  if (Y<180) {
   rect(random(450),random(166,180),random(20),random(20));
   stroke(random(151),random(145),random(56));
 }
  if (Y<195) {
   rect(random(450),random(181,195),random(20),random(20));
   stroke(random(32),random(79),random(251));
 }
  if (Y<210) {
   rect(random(450),random(196,210),random(20),random(20));
   stroke(random(15),random(79),random(21));
 }
  if (Y<225) {
   rect(random(450),random(211,225),random(20),random(20));
   stroke(random(179),random(250),random(141));
 }
   if (Y<240) {
 rect(random(450),random(226,240),random(20),random(20));
 stroke(random(100),random(200),random(150));
 }
 if (Y<255) {
   rect(random(450),random(241,255),random(20),random(20));
   stroke(random(56),random(179),random(230));
 }
 if (Y<270) {
   rect(random(450),random(256,270),random(20),random(20));
   stroke(random(134),random(234),random(20));
 }
 if (Y<285) {
   rect(random(450),random(271,285),random(20),random(20));
   stroke(random(150),random(45),random(21));
 }
 if (Y<300) {
   rect(random(450),random(286,300),random(20),random(20));
   stroke(random(132),random(203),random(111));
 }
  if (Y<315) {
   rect(random(450),random(301,315),random(20),random(20));
   stroke(random(23),random(131),random(21));
 }
  if (Y<330) {
   rect(random(450),random(316,330),random(20),random(20));
   stroke(random(234),random(91),random(80));
 }
  if (Y<345) {
   rect(random(450),random(331,345),random(20),random(20));
   stroke(random(100),random(45),random(245));
 }
  if (Y<360) {
   rect(random(450),random(346,360),random(20),random(20));
   stroke(random(134),random(205),random(211));
 }
  if (Y<375) {
   rect(random(450),random(361,375),random(20),random(20));
   stroke(random(209),random(145),random(21));
 }
  if (Y<390) {
   rect(random(450),random(376,390),random(20),random(20));
   stroke(random(150),random(45),random(21));
 }
  if (Y<405) {
   rect(random(450),random(391,405),random(20),random(20));
   stroke(random(151),random(145),random(56));
 }
  if (Y<420) {
   rect(random(450),random(406,420),random(20),random(20));
   stroke(random(32),random(79),random(251));
 }
  if (Y<435) {
   rect(random(450),random(421,435),random(20),random(20));
   stroke(random(15),random(79),random(21));
 }
  if (Y<450) {
   rect(random(450),random(436,450),random(20),random(20));
   stroke(random(179),random(250),random(141));
 }
  if (X<15) {
 rect(random(15),random(450),random(20),random(20));
 stroke(random(100),random(200),random(150));
 }
 if (X<30) {
   rect(random(16,30),random(450),random(20),random(20));
   stroke(random(56),random(179),random(230));
 }
 if (X<45) {
   rect(random(31,45),random(450),random(20),random(20));
   stroke(random(134),random(234),random(20));
 }
 if (X<60) {
   rect(random(46,60),random(450),random(20),random(20));
   stroke(random(150),random(45),random(21));
 }
 if (X<75) {
   rect(random(61,75),random(450),random(20),random(20));
   stroke(random(132),random(203),random(111));
 }
  if (X<90) {
   rect(random(76,90),random(450),random(20),random(20));
   stroke(random(23),random(131),random(21));
 }
  if (X<105) {
   rect(random(91,105),random(450),random(20),random(20));
   stroke(random(234),random(91),random(80));
 }
  if (X<120) {
   rect(random(106,120),random(450),random(20),random(20));
   stroke(random(100),random(45),random(245));
 }
  if (X<135) {
   rect(random(121,136),random(450),random(20),random(20));
   stroke(random(134),random(205),random(211));
 }
  if (X<150) {
   rect(random(136,150),random(450),random(20),random(20));
   stroke(random(209),random(145),random(21));
 }
  if (X<165) {
   rect(random(151,165),random(450),random(20),random(20));
   stroke(random(150),random(45),random(21));
 }
  if (X<180) {
   rect(random(166,180),random(450),random(20),random(20));
   stroke(random(151),random(145),random(56));
 }
  if (X<195) {
   rect(random(181,195),random(450),random(20),random(20));
   stroke(random(32),random(79),random(251));
 }
  if (X<210) {
   rect(random(196,210),random(450),random(20),random(20));
   stroke(random(15),random(79),random(21));
 }
  if (X<225) {
   rect(random(211,225),random(450),random(20),random(20));
   stroke(random(179),random(250),random(141));
 }
 if (X<240) {
 rect(random(226,240),random(450),random(20),random(20));
 stroke(random(100),random(200),random(150));
 }
 if (X<255) {
   rect(random(241,255),random(450),random(20),random(20));
   stroke(random(56),random(179),random(230));
 }
 if (X<270) {
   rect(random(256,270),random(450),random(20),random(20));
   stroke(random(134),random(234),random(20));
 }
 if (X<285) {
   rect(random(271,285),random(450),random(20),random(20));
   stroke(random(150),random(45),random(21));
 }
 if (X<300) {
   rect(random(286,300),random(450),random(20),random(20));
   stroke(random(132),random(203),random(111));
 }
  if (X<315) {
   rect(random(301,315),random(450),random(20),random(20));
   stroke(random(23),random(131),random(21));
 }
  if (X<330) {
   rect(random(316,330),random(450),random(20),random(20));
   stroke(random(234),random(91),random(80));
 }
  if (X<345) {
   rect(random(331,345),random(450),random(20),random(20));
   stroke(random(100),random(45),random(245));
 }
  if (X<360) {
   rect(random(346,360),random(450),random(20),random(20));
   stroke(random(134),random(205),random(211));
 }
  if (X<375) {
   rect(random(361,375),random(450),random(20),random(20));
   stroke(random(209),random(145),random(21));
 }
  if (X<390) {
   rect(random(376,390),random(450),random(20),random(20));
   stroke(random(150),random(45),random(21));
 }
  if (X<405) {
   rect(random(391,405),random(450),random(20),random(20));
   stroke(random(151),random(145),random(56));
 }
  if (X<420) {
   rect(random(406,420),random(450),random(20),random(20));
   stroke(random(32),random(79),random(251));
 }
  if (X<435) {
   rect(random(421,435),random(450),random(20),random(20));
   stroke(random(15),random(79),random(21));
 }
  if (X<450) {
   rect(random(436,450),random(450),random(20),random(20));
   stroke(random(179),random(250),random(141));
 }
  
  
}
