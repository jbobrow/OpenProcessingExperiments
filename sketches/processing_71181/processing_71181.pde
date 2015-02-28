
int star1 = 12;
int star2 = 20;
int star3 = 30;
int star4 = 60;
int star5 = 40;
int letter = 8;

void setup(){
  size(800,500);
  noStroke();
}

void draw(){
  background(0,0,30);
  //land
  fill(0,40,0);
  beginShape();
  curveVertex(0,475);
  curveVertex(0,475);
  curveVertex(165,453);
  curveVertex(350,463);
  curveVertex(460,465);
  curveVertex(540,455);
  curveVertex(700,465);
  curveVertex(800,475);
  curveVertex(800,475);
  endShape();
  rect(0,475,800,30);
  //female
  fill(100,0,100);
  ellipse(413,401,10,12);
  rect(406,409,15,18);
  beginShape();
  vertex(419,425);
  vertex(430,448);
  vertex(421,452);
  vertex(421,462);
  vertex(424,466);
  vertex(421,470);
  vertex(416,470);
  vertex(416,465);
  vertex(414,453);
  vertex(408,454);
  vertex(408,425);
  endShape();
  //male
  fill(0,80,100);
  ellipse(400,396,10,13);
  rect(398,400,4,6);
  ellipse(400,407,20,5);
  rect(390,408,20,24);
  ellipse(413,407,20,6);
  beginShape();
  vertex(409,428);
  vertex(409,465);
  vertex(411,470);
  vertex(400,470);
  vertex(400,438);
  vertex(393,465);
  vertex(393,470);
  vertex(382,470);
  vertex(382,467);
  vertex(384,465);
  vertex(392,428);
  endShape();
  
  //stars
  fill(255);
  rect(30,35,star1,star1);
  fill(0,0,30);
  ellipse(30,35,star1,star1);
  ellipse(30+star1,35,star1,star1);
  ellipse(30,star1+35,star1,star1);
  ellipse(30+star1,35+star1,star1,star1);
  
  fill(255);
  rect(55,400,star1,star1);
  fill(0,0,30);
  ellipse(55,400,star1,star1);
  ellipse(55+star1,400,star1,star1);
  ellipse(55,star1+400,star1,star1);
  ellipse(55+star1,400+star1,star1,star1);
  
  fill(255);
  rect(80,200,star2,star3);
  fill(0,0,30);
  ellipse(80,200,star2,star3);
  ellipse(80+star2,200,star2,star3);
  ellipse(80,star3+200,star2,star3);
  ellipse(80+star2,200+star3,star2,star3);
  
  fill(255);
  rect(150,300,star2,star2);
  fill(0,0,30);
  ellipse(150,300,star2,star2);
  ellipse(150+star2,300,star2,star2);
  ellipse(150,star2+300,star2,star2);
  ellipse(150+star2,300+star2,star2,star2);
  
  fill(255);
  rect(220,110,star1,star2);
  fill(0,0,30);
  ellipse(220,110,star1,star2);
  ellipse(220+star1,110,star1,star2);
  ellipse(220,star2+110,star1,star2);
  ellipse(220+star1,110+star2,star1,star2);
  
  fill(255);
  rect(300,5,star1,star1);
  fill(0,0,30);
  ellipse(300,5,star1,star1);
  ellipse(300+star1,5,star1,star1);
  ellipse(300,star1+5,star1,star1);
  ellipse(300+star1,5+star1,star1,star1);
  
  fill(255);
  rect(365,210,star1,star1);
  fill(0,0,30);
  ellipse(365,210,star1,star1);
  ellipse(365+star1,210,star1,star1);
  ellipse(365,star1+210,star1,star1);
  ellipse(365+star1,210+star1,star1,star1);
  
  fill(255);
  rect(420,150,star1,star1);
  fill(0,0,30);
  ellipse(420,150,star1,star1);
  ellipse(420+star1,150,star1,star1);
  ellipse(420,star1+150,star1,star1);
  ellipse(420+star1,150+star1,star1,star1);
  
  fill(255);
  rect(500,290,star2,star3);
  fill(0,0,30);
  ellipse(500,290,star2,star3);
  ellipse(500+star2,290,star2,star3);
  ellipse(500,star3+290,star2,star3);
  ellipse(500+star2,290+star3,star2,star3);
  
  fill(255);
  rect(590,90,star1,star2);
  fill(0,0,30);
  ellipse(590,90,star1,star2);
  ellipse(590+star1,90,star1,star2);
  ellipse(590,star2+90,star1,star2);
  ellipse(590+star1,90+star2,star1,star2);
  
  fill(255);
  rect(600,370,star1,star2);
  fill(0,0,30);
  ellipse(600,370,star1,star2);
  ellipse(600+star1,370,star1,star2);
  ellipse(600,star2+370,star1,star2);
  ellipse(600+star1,370+star2,star1,star2);
  
  fill(255);
  rect(650,20,star1,star1);
  fill(0,0,30);
  ellipse(650,20,star1,star1);
  ellipse(650+star1,20,star1,star1);
  ellipse(650,star1+20,star1,star1);
  ellipse(650+star1,20+star1,star1,star1);
  
  fill(255);
  rect(720,200,star1,star1);
  fill(0,0,30);
  ellipse(720,200,star1,star1);
  ellipse(720+star1,200,star1,star1);
  ellipse(720,star1+200,star1,star1);
  ellipse(720+star1,200+star1,star1,star1);
  
  fill(255);
  rect(755,430,star1,star1);
  fill(0,0,30);
  ellipse(755,430,star1,star1);
  ellipse(755+star1,430,star1,star1);
  ellipse(755,star1+430,star1,star1);
  ellipse(755+star1,430+star1,star1,star1);
  
  fill(255);
  rect(780,50,star2,star2);
  fill(0,0,30);
  ellipse(780,50,star2,star2);
  ellipse(780+star2,50,star2,star2);
  ellipse(780,star2+50,star2,star2);
  ellipse(780+star2,50+star2,star2,star2);
}


//flashing stars

void mousePressed(){
  fill(255);
  rect(mouseX,mouseY-100,star3,star4);
  fill(0,0,30);
  ellipse(mouseX,mouseY-100,star3,star4);
  ellipse(mouseX+star3,mouseY-100,star3,star4);
  ellipse(mouseX,star4+mouseY-100,star3,star4);
  ellipse(mouseX+star3,mouseY-100+star4,star3,star4);
  
  fill(255);
  rect(mouseX+50,mouseY+70,star2,star3);
  fill(0,0,30);
  ellipse(mouseX+50,mouseY+70,star2,star3);
  ellipse(mouseX+50+star2,mouseY+70,star2,star3);
  ellipse(mouseX+50,star3+mouseY+70,star2,star3);
  ellipse(mouseX+50+star2,mouseY+70+star3,star2,star3);
  
  fill(255);
  rect(mouseX-100,mouseY+50,star3,star3);
  fill(0,0,30);
  ellipse(mouseX-100,mouseY+50,star3,star3);
  ellipse(mouseX-100+star3,mouseY+50,star3,star3);
  ellipse(mouseX-100,star3+mouseY+50,star3,star3);
  ellipse(mouseX-100+star3,mouseY+50+star3,star3,star3);
  
  fill(255);
  rect(mouseX,mouseX-450,star4,star5);
  fill(0,0,30);
  ellipse(mouseX,mouseX-450,star4,star5);
  ellipse(mouseX+star4,mouseX-450,star4,star5);
  ellipse(mouseX,star5+mouseX-450,star4,star5);
  ellipse(mouseX+star4,mouseX-450+star5,star4,star5);
  
  fill(255);
  rect(mouseX/2,mouseY/2,star5,star5);
  fill(0,0,30);
  ellipse(mouseX/2,mouseY/2,star5,star5);
  ellipse(mouseX/2+star5,mouseY/2,star5,star5);
  ellipse(mouseX/2,star5+mouseY/2,star5,star5);
  ellipse(mouseX/2+star5,mouseY/2+star5,star5,star5);
  
  fill(255);
  rect(mouseX-250,mouseY+50,star2,star2);
  fill(0,0,30);
  ellipse(mouseX-250,mouseY+50,star2,star2);
  ellipse(mouseX-250+star2,mouseY+50,star2,star2);
  ellipse(mouseX-250,star2+mouseY+50,star2,star2);
  ellipse(mouseX-250+star2,mouseY+50+star2,star2,star2);
}

void mouseReleased(){
  fill(255);
  rect(mouseY,mouseX,star3,star4);
  fill(0,0,30);
  ellipse(mouseY,mouseX,star3,star4);
  ellipse(mouseY+star3,mouseX,star3,star4);
  ellipse(mouseY,star4+mouseX,star3,star4);
  ellipse(mouseY+star3,mouseX+star4,star3,star4);
  
  fill(255);
  rect(mouseX+150,mouseY-50,star3,star3);
  fill(0,0,30);
  ellipse(mouseX+150,mouseY-50,star3,star3);
  ellipse(mouseX+150+star3,mouseY-50,star3,star3);
  ellipse(mouseX+150,star3+mouseY-50,star3,star3);
  ellipse(mouseX+150+star3,mouseY-50+star3,star3,star3);
  
  fill(255);
  rect(mouseX-70,mouseY-10,star2,star2);
  fill(0,0,30);
  ellipse(mouseX-70,mouseY-10,star2,star2);
  ellipse(mouseX-70+star2,mouseY-10,star2,star2);
  ellipse(mouseX-70,star2+mouseY-10,star2,star2);
  ellipse(mouseX-70+star2,mouseY-10+star2,star2,star2);
  
  fill(255);
  rect(mouseX+150,mouseY+150,star2,star2);
  fill(0,0,30);
  ellipse(mouseX+150,mouseY+150,star2,star2);
  ellipse(mouseX+150+star2,mouseY+150,star2,star2);
  ellipse(mouseX+150,star2+mouseY+150,star2,star2);
  ellipse(mouseX+150+star2,mouseY+150+star2,star2,star2);
  
  fill(255);
  rect(mouseX+250,mouseY,star2,star2);
  fill(0,0,30);
  ellipse(mouseX+250,mouseY,star2,star2);
  ellipse(mouseX+250+star2,mouseY,star2,star2);
  ellipse(mouseX+250,star2+mouseY,star2,star2);
  ellipse(mouseX+250+star2,mouseY+star2,star2,star2);
  
  fill(255);
  rect(mouseY+50,mouseX+170,star5,star4);
  fill(0,0,30);
  ellipse(mouseY+50,mouseX+170,star5,star4);
  ellipse(mouseY+50+star5,mouseX+170,star5,star4);
  ellipse(mouseY+50,star4+mouseX+170,star5,star4);
  ellipse(mouseY+50+star5,mouseX+170+star4,star5,star4);
}


void keyPressed(){
  
  if(key == 'y'){
    
    //letter
    fill(255);
    rect(22,77,letter,letter);
    fill(0,0,30);
    ellipse(22,77,letter,letter);
    ellipse(22+letter,77,letter,letter);
    ellipse(22,letter+77,letter,letter);
    ellipse(22+letter,77+letter,letter,letter);
    
    fill(255);
    rect(34,84,letter,letter);
    fill(0,0,30);
    ellipse(34,84,letter,letter);
    ellipse(34+letter,84,letter,letter);
    ellipse(34,letter+84,letter,letter);
    ellipse(34+letter,84+letter,letter,letter);
    
    fill(255);
    rect(46,91,letter,letter);
    fill(0,0,30);
    ellipse(46,91,letter,letter);
    ellipse(46+letter,91,letter,letter);
    ellipse(46,letter+91,letter,letter);
    ellipse(46+letter,91+letter,letter,letter);
    
    fill(255);
    rect(58,98,letter,letter);
    fill(0,0,30);
    ellipse(58,98,letter,letter);
    ellipse(58+letter,98,letter,letter);
    ellipse(58,letter+98,letter,letter);
    ellipse(58+letter,98+letter,letter,letter);
    
    fill(255);
    rect(63,86,letter,letter);
    fill(0,0,30);
    ellipse(63,86,letter,letter);
    ellipse(63+letter,86,letter,letter);
    ellipse(63,letter+86,letter,letter);
    ellipse(63+letter,86+letter,letter,letter);
    
    fill(255);
    rect(68,74,letter,letter);
    fill(0,0,30);
    ellipse(68,74,letter,letter);
    ellipse(68+letter,74,letter,letter);
    ellipse(68,letter+74,letter,letter);
    ellipse(68+letter,74+letter,letter,letter);
    
    fill(255);
    rect(73,62,letter,letter);
    fill(0,0,30);
    ellipse(73,62,letter,letter);
    ellipse(73+letter,62,letter,letter);
    ellipse(73,letter+62,letter,letter);
    ellipse(73+letter,62+letter,letter,letter);
    
    fill(255);
    rect(61,110,letter,letter);
    fill(0,0,30);
    ellipse(61,110,letter,letter);
    ellipse(61+letter,110,letter,letter);
    ellipse(61,letter+110,letter,letter);
    ellipse(61+letter,110+letter,letter,letter);
    
    fill(255);
    rect(64,122,letter,letter);
    fill(0,0,30);
    ellipse(64,122,letter,letter);
    ellipse(64+letter,122,letter,letter);
    ellipse(64,letter+122,letter,letter);
    ellipse(64+letter,122+letter,letter,letter);
    
    fill(255);
    rect(67,134,letter,letter);
    fill(0,0,30);
    ellipse(67,134,letter,letter);
    ellipse(67+letter,134,letter,letter);
    ellipse(67,letter+134,letter,letter);
    ellipse(67+letter,134+letter,letter,letter);
  
    //extra stars
    fill(255);
    rect(270,350,star2,star3);
    fill(0,0,30);
    ellipse(270,350,star2,star3);
    ellipse(270+star2,350,star2,star3);
    ellipse(270,star3+350,star2,star3);
    ellipse(270+star2,350+star3,star2,star3);
      
    fill(255);
    rect(450,70,star2,star3);
    fill(0,0,30);
    ellipse(450,70,star2,star3);
    ellipse(450+star2,70,star2,star3);
    ellipse(450,star3+70,star2,star3);
    ellipse(450+star2,70+star3,star2,star3);
    
    fill(255);
    rect(680,300,star2,star2);
    fill(0,0,30);
    ellipse(680,300,star2,star2);
    ellipse(680+star2,300,star2,star2);
    ellipse(680,star2+300,star2,star2);
    ellipse(680+star2,300+star2,star2,star2);
  }
    
  if (key == 'o'){
    
    //letter
    fill(255);
    rect(112,50,letter,letter);
    fill(0,0,30);
    ellipse(112,50,letter,letter);
    ellipse(112+letter,50,letter,letter);
    ellipse(112,letter+50,letter,letter);
    ellipse(112+letter,50+letter,letter,letter);
    
    fill(255);
    rect(102,60,letter,letter);
    fill(0,0,30);
    ellipse(102,60,letter,letter);
    ellipse(102+letter,60,letter,letter);
    ellipse(102,letter+60,letter,letter);
    ellipse(102+letter,60+letter,letter,letter);
    
    fill(255);
    rect(98,74,letter,letter);
    fill(0,0,30);
    ellipse(98,74,letter,letter);
    ellipse(98+letter,74,letter,letter);
    ellipse(98,letter+74,letter,letter);
    ellipse(98+letter,74+letter,letter,letter);
    
    fill(255);
    rect(98,88,letter,letter);
    fill(0,0,30);
    ellipse(98,88,letter,letter);
    ellipse(98+letter,88,letter,letter);
    ellipse(98,letter+88,letter,letter);
    ellipse(98+letter,88+letter,letter,letter);
    
    fill(255);
    rect(103,102,letter,letter);
    fill(0,0,30);
    ellipse(103,102,letter,letter);
    ellipse(103+letter,102,letter,letter);
    ellipse(103,letter+102,letter,letter);
    ellipse(103+letter,102+letter,letter,letter);
   
    fill(255);
    rect(113,114,letter,letter);
    fill(0,0,30);
    ellipse(113,114,letter,letter);
    ellipse(113+letter,114,letter,letter);
    ellipse(113,letter+114,letter,letter);
    ellipse(113+letter,114+letter,letter,letter);
    
    fill(255);
    rect(128,120,letter,letter);
    fill(0,0,30);
    ellipse(128,120,letter,letter);
    ellipse(128+letter,120,letter,letter);
    ellipse(128,letter+120,letter,letter);
    ellipse(128+letter,120+letter,letter,letter);
    
    fill(255);
    rect(143,118,letter,letter);
    fill(0,0,30);
    ellipse(143,118,letter,letter);
    ellipse(143+letter,118,letter,letter);
    ellipse(143,letter+118,letter,letter);
    ellipse(143+letter,118+letter,letter,letter);
    
    fill(255);
    rect(156,108,letter,letter);
    fill(0,0,30);
    ellipse(156,108,letter,letter);
    ellipse(156+letter,108,letter,letter);
    ellipse(156,letter+108,letter,letter);
    ellipse(156+letter,108+letter,letter,letter);
    
    fill(255);
    rect(162,94,letter,letter);
    fill(0,0,30);
    ellipse(162,94,letter,letter);
    ellipse(162+letter,94,letter,letter);
    ellipse(162,letter+94,letter,letter);
    ellipse(162+letter,94+letter,letter,letter);
    
    fill(255);
    rect(162,78,letter,letter);
    fill(0,0,30);
    ellipse(162,78,letter,letter);
    ellipse(162+letter,78,letter,letter);
    ellipse(162,letter+78,letter,letter);
    ellipse(162+letter,78+letter,letter,letter);
    
    fill(255);
    rect(156,63,letter,letter);
    fill(0,0,30);
    ellipse(156,63,letter,letter);
    ellipse(156+letter,63,letter,letter);
    ellipse(156,letter+63,letter,letter);
    ellipse(156+letter,63+letter,letter,letter);
    
    fill(255);
    rect(145,52,letter,letter);
    fill(0,0,30);
    ellipse(145,52,letter,letter);
    ellipse(145+letter,52,letter,letter);
    ellipse(145,letter+52,letter,letter);
    ellipse(145+letter,52+letter,letter,letter);
    
    fill(255);
    rect(129,47,letter,letter);
    fill(0,0,30);
    ellipse(129,47,letter,letter);
    ellipse(129+letter,47,letter,letter);
    ellipse(129,letter+47,letter,letter);
    ellipse(129+letter,47+letter,letter,letter);
    
    //extra stars
    fill(255);
    rect(280,40,star2,star2);
    fill(0,0,30);
    ellipse(280,40,star2,star2);
    ellipse(280+star2,40,star2,star2);
    ellipse(280,star2+40,star2,star2);
    ellipse(280+star2,40+star2,star2,star2);
    
    fill(255);
    rect(520,180,star2,star2);
    fill(0,0,30);
    ellipse(520,180,star2,star2);
    ellipse(520+star2,180,star2,star2);
    ellipse(520,star2+180,star2,star2);
    ellipse(520+star2,180+star2,star2,star2);
    
    fill(255);
    rect(560,390,star3,star3);
    fill(0,0,30);
    ellipse(560,390,star3,star3);
    ellipse(560+star3,390,star3,star3);
    ellipse(560,star3+390,star3,star3);
    ellipse(560+star3,390+star3,star3,star3);
    
    fill(255);
    rect(680,100,star2,star2);
    fill(0,0,30);
    ellipse(680,100,star2,star2);
    ellipse(680+star2,100,star2,star2);
    ellipse(680,star2+100,star2,star2);
    ellipse(680+star2,100+star2,star2,star2);
  }
  
  if (key == 'u'){
    
    //letter
    fill(255);
    rect(175,32,letter,letter);
    fill(0,0,30);
    ellipse(175,32,letter,letter);
    ellipse(175+letter,32,letter,letter);
    ellipse(175,letter+32,letter,letter);
    ellipse(175+letter,32+letter,letter,letter);
    
    fill(255);
    rect(179,46,letter,letter);
    fill(0,0,30);
    ellipse(179,46,letter,letter);
    ellipse(179+letter,46,letter,letter);
    ellipse(179,letter+46,letter,letter);
    ellipse(179+letter,46+letter,letter,letter);
    
    fill(255);
    rect(183,60,letter,letter);
    fill(0,0,30);
    ellipse(183,60,letter,letter);
    ellipse(183+letter,60,letter,letter);
    ellipse(183,letter+60,letter,letter);
    ellipse(183+letter,60+letter,letter,letter);
    
    fill(255);
    rect(187,74,letter,letter);
    fill(0,0,30);
    ellipse(187,74,letter,letter);
    ellipse(187+letter,74,letter,letter);
    ellipse(187,letter+74,letter,letter);
    ellipse(187+letter,74+letter,letter,letter);
    
    fill(255);
    rect(194,87,letter,letter);
    fill(0,0,30);
    ellipse(194,87,letter,letter);
    ellipse(194+letter,87,letter,letter);
    ellipse(194,letter+87,letter,letter);
    ellipse(194+letter,87+letter,letter,letter);
    
    fill(255);
    rect(207,94,letter,letter);
    fill(0,0,30);
    ellipse(207,94,letter,letter);
    ellipse(207+letter,94,letter,letter);
    ellipse(207,letter+94,letter,letter);
    ellipse(207+letter,94+letter,letter,letter);
    
    fill(255);
    rect(223,90,letter,letter);
    fill(0,0,30);
    ellipse(223,90,letter,letter);
    ellipse(223+letter,90,letter,letter);
    ellipse(223,letter+90,letter,letter);
    ellipse(223+letter,90+letter,letter,letter);
    
    fill(255);
    rect(233,76,letter,letter);
    fill(0,0,30);
    ellipse(233,76,letter,letter);
    ellipse(233+letter,76,letter,letter);
    ellipse(233,letter+76,letter,letter);
    ellipse(233+letter,76+letter,letter,letter);
    
    fill(255);
    rect(231,62,letter,letter);
    fill(0,0,30);
    ellipse(231,62,letter,letter);
    ellipse(231+letter,62,letter,letter);
    ellipse(231,letter+62,letter,letter);
    ellipse(231+letter,62+letter,letter,letter);
    
    fill(255);
    rect(227,48,letter,letter);
    fill(0,0,30);
    ellipse(227,48,letter,letter);
    ellipse(227+letter,48,letter,letter);
    ellipse(227,letter+48,letter,letter);
    ellipse(227+letter,48+letter,letter,letter);
    
    fill(255);
    rect(224,34,letter,letter);
    fill(0,0,30);
    ellipse(224,34,letter,letter);
    ellipse(224+letter,34,letter,letter);
    ellipse(224,letter+34,letter,letter);
    ellipse(224+letter,34+letter,letter,letter);
    
    fill(255);
    rect(220,20,letter,letter);
    fill(0,0,30);
    ellipse(220,20,letter,letter);
    ellipse(220+letter,20,letter,letter);
    ellipse(220,letter+20,letter,letter);
    ellipse(220+letter,20+letter,letter,letter);
    
    //extra stars
    fill(255);
    rect(335,70,star2,star3);
    fill(0,0,30);
    ellipse(335,70,star2,star3);
    ellipse(335+star2,70,star2,star3);
    ellipse(335,star3+70,star2,star3);
    ellipse(335+star2,70+star3,star2,star3);
    
    fill(255);
    rect(390,280,star2,star3);
    fill(0,0,30);
    ellipse(390,280,star2,star3);
    ellipse(390+star2,280,star2,star3);
    ellipse(390,star3+280,star2,star3);
    ellipse(390+star2,280+star3,star2,star3);
    
    fill(255);
    rect(635,220,star2,star3);
    fill(0,0,30);
    ellipse(635,220,star2,star3);
    ellipse(635+star2,220,star2,star3);
    ellipse(635,star3+220,star2,star3);
    ellipse(635+star2,220+star3,star2,star3);
  }
  
  if (key == 'l'){
    
    //letter
    fill(255);
    rect(265,50,letter,letter);
    fill(0,0,30);
    ellipse(265,50,letter,letter);
    ellipse(265+letter,50,letter,letter);
    ellipse(265,letter+50,letter,letter);
    ellipse(265+letter,50+letter,letter,letter);
    
    fill(255);
    rect(268,64,letter,letter);
    fill(0,0,30);
    ellipse(268,64,letter,letter);
    ellipse(268+letter,64,letter,letter);
    ellipse(268,letter+64,letter,letter);
    ellipse(268+letter,64+letter,letter,letter);
    
    fill(255);
    rect(271,78,letter,letter);
    fill(0,0,30);
    ellipse(271,78,letter,letter);
    ellipse(271+letter,78,letter,letter);
    ellipse(271,letter+78,letter,letter);
    ellipse(271+letter,78+letter,letter,letter);
    
    fill(255);
    rect(274,92,letter,letter);
    fill(0,0,30);
    ellipse(274,92,letter,letter);
    ellipse(274+letter,92,letter,letter);
    ellipse(274,letter+92,letter,letter);
    ellipse(274+letter,92+letter,letter,letter);
    
    fill(255);
    rect(277,106,letter,letter);
    fill(0,0,30);
    ellipse(277,106,letter,letter);
    ellipse(277+letter,106,letter,letter);
    ellipse(277,letter+106,letter,letter);
    ellipse(277+letter,106+letter,letter,letter);
    
    fill(255);
    rect(279,118,letter,letter);
    fill(0,0,30);
    ellipse(279,118,letter,letter);
    ellipse(279+letter,118,letter,letter);
    ellipse(279,letter+118,letter,letter);
    ellipse(279+letter,118+letter,letter,letter);
    
    fill(255);
    rect(294,114,letter,letter);
    fill(0,0,30);
    ellipse(294,114,letter,letter);
    ellipse(294+letter,114,letter,letter);
    ellipse(294,letter+114,letter,letter);
    ellipse(294+letter,114+letter,letter,letter);
    
    fill(255);
    rect(309,110,letter,letter);
    fill(0,0,30);
    ellipse(309,110,letter,letter);
    ellipse(309+letter,110,letter,letter);
    ellipse(309,letter+110,letter,letter);
    ellipse(309+letter,110+letter,letter,letter);
    
    fill(255);
    rect(324,107,letter,letter);
    fill(0,0,30);
    ellipse(324,107,letter,letter);
    ellipse(324+letter,107,letter,letter);
    ellipse(324,letter+107,letter,letter);
    ellipse(324+letter,107+letter,letter,letter);
    
    //extra stars
    fill(255);
    rect(50,70,star3,star4);
    fill(0,0,30);
    ellipse(50,70,star3,star4);
    ellipse(50+star3,70,star3,star4);
    ellipse(50,star4+70,star3,star4);
    ellipse(50+star3,70+star4,star3,star4);
    
    fill(255);
    rect(200,170,star2,star3);
    fill(0,0,30);
    ellipse(200,170,star2,star3);
    ellipse(200+star2,170,star2,star3);
    ellipse(200,star3+170,star2,star3);
    ellipse(200+star2,170+star3,star2,star3);
    
    fill(255);
    rect(300,290,star2,star2);
    fill(0,0,30);
    ellipse(300,290,star2,star2);
    ellipse(300+star2,290,star2,star2);
    ellipse(300,star2+290,star2,star2);
    ellipse(300+star2,290+star2,star2,star2);
    
    fill(255);
    rect(530,50,star2,star2);
    fill(0,0,30);
    ellipse(530,50,star2,star2);
    ellipse(530+star2,50,star2,star2);
    ellipse(530,star2+50,star2,star2);
    ellipse(530+star2,50+star2,star2,star2);
    
    fill(255);
    rect(620,220,star2,star2);
    fill(0,0,30);
    ellipse(620,220,star2,star2);
    ellipse(620+star2,220,star2,star2);
    ellipse(620,star2+220,star2,star2);
    ellipse(620+star2,220+star2,star2,star2);
    
    fill(255);
    rect(720,280,star3,star5);
    fill(0,0,30);
    ellipse(720,280,star3,star5);
    ellipse(720+star3,280,star3,star5);
    ellipse(720,star5+280,star3,star5);
    ellipse(720+star3,280+star5,star3,star5);
  }
  
  if (key == 'i'){
    
    //letter
    fill(255);
    rect(330,36,letter,letter);
    fill(0,0,30);
    ellipse(330,36,letter,letter);
    ellipse(330+letter,36,letter,letter);
    ellipse(330,letter+36,letter,letter);
    ellipse(330+letter,36+letter,letter,letter);
    
    fill(255);
    rect(333,50,letter,letter);
    fill(0,0,30);
    ellipse(333,50,letter,letter);
    ellipse(333+letter,50,letter,letter);
    ellipse(333,letter+50,letter,letter);
    ellipse(333+letter,50+letter,letter,letter);
    
    fill(255);
    rect(336,63,letter,letter);
    fill(0,0,30);
    ellipse(336,63,letter,letter);
    ellipse(336+letter,63,letter,letter);
    ellipse(336,letter+63,letter,letter);
    ellipse(336+letter,63+letter,letter,letter);
    
    fill(255);
    rect(339,77,letter,letter);
    fill(0,0,30);
    ellipse(339,77,letter,letter);
    ellipse(339+letter,77,letter,letter);
    ellipse(339,letter+77,letter,letter);
    ellipse(339+letter,77+letter,letter,letter);
    
    fill(255);
    rect(342,91,letter,letter);
    fill(0,0,30);
    ellipse(342,91,letter,letter);
    ellipse(342+letter,91,letter,letter);
    ellipse(342,letter+91,letter,letter);
    ellipse(342+letter,91+letter,letter,letter);
    
    fill(255);
    rect(345,104,letter,letter);
    fill(0,0,30);
    ellipse(345,104,letter,letter);
    ellipse(345+letter,104,letter,letter);
    ellipse(345,letter+104,letter,letter);
    ellipse(345+letter,104+letter,letter,letter);
    
    //extra stars
    fill(255);
    rect(100,320,star2,star2);
    fill(0,0,30);
    ellipse(100,320,star2,star2);
    ellipse(100+star2,320,star2,star2);
    ellipse(100,star2+320,star2,star2);
    ellipse(100+star2,320+star2,star2,star2);
    
    fill(255);
    rect(130,-10,star5,star4);
    fill(0,0,30);
    ellipse(130,-10,star5,star4);
    ellipse(130+star5,-10,star5,star4);
    ellipse(130,star4+-10,star5,star4);
    ellipse(130+star5,-10+star4,star5,star4);
    
    fill(255);
    rect(250,185,star3,star2);
    fill(0,0,30);
    ellipse(250,185,star3,star2);
    ellipse(250+star3,185,star3,star2);
    ellipse(250,star2+185,star3,star2);
    ellipse(250+star3,185+star2,star3,star2);
    
    fill(255);
    rect(580,260,star2,star2);
    fill(0,0,30);
    ellipse(580,260,star2,star2);
    ellipse(580+star2,260,star2,star2);
    ellipse(580,star2+260,star2,star2);
    ellipse(580+star2,260+star2,star2,star2);
    
    fill(255);
    rect(765,130,star5,star4);
    fill(0,0,30);
    ellipse(765,130,star5,star4);
    ellipse(765+star5,130,star5,star4);
    ellipse(765,star4+130,star5,star4);
    ellipse(765+star5,130+star4,star5,star4);
  }
  
  if (key == 'g'){
    
    //letter
    fill(255);
    rect(415,32,letter,letter);
    fill(0,0,30);
    ellipse(415,32,letter,letter);
    ellipse(415+letter,32,letter,letter);
    ellipse(415,letter+32,letter,letter);
    ellipse(415+letter,32+letter,letter,letter);
    
    fill(255);
    rect(402,25,letter,letter);
    fill(0,0,30);
    ellipse(402,25,letter,letter);
    ellipse(402+letter,25,letter,letter);
    ellipse(402,letter+25,letter,letter);
    ellipse(402+letter,25+letter,letter,letter);
    
    fill(255);
    rect(388,24,letter,letter);
    fill(0,0,30);
    ellipse(388,24,letter,letter);
    ellipse(388+letter,24,letter,letter);
    ellipse(388,letter+24,letter,letter);
    ellipse(388+letter,24+letter,letter,letter);
    
    fill(255);
    rect(374,29,letter,letter);
    fill(0,0,30);
    ellipse(374,29,letter,letter);
    ellipse(374+letter,29,letter,letter);
    ellipse(374,letter+29,letter,letter);
    ellipse(374+letter,29+letter,letter,letter);
    
    fill(255);
    rect(364,40,letter,letter);
    fill(0,0,30);
    ellipse(364,40,letter,letter);
    ellipse(364+letter,40,letter,letter);
    ellipse(364,letter+40,letter,letter);
    ellipse(364+letter,40+letter,letter,letter);
    
    fill(255);
    rect(360,55,letter,letter);
    fill(0,0,30);
    ellipse(360,55,letter,letter);
    ellipse(360+letter,55,letter,letter);
    ellipse(360,letter+55,letter,letter);
    ellipse(360+letter,55+letter,letter,letter);
    
    fill(255);
    rect(361,70,letter,letter);
    fill(0,0,30);
    ellipse(361,70,letter,letter);
    ellipse(361+letter,70,letter,letter);
    ellipse(361,letter+70,letter,letter);
    ellipse(361+letter,70+letter,letter,letter);
    
    fill(255);
    rect(366,84,letter,letter);
    fill(0,0,30);
    ellipse(366,84,letter,letter);
    ellipse(366+letter,84,letter,letter);
    ellipse(366,letter+84,letter,letter);
    ellipse(366+letter,84+letter,letter,letter);
    
    fill(255);
    rect(377,94,letter,letter);
    fill(0,0,30);
    ellipse(377,94,letter,letter);
    ellipse(377+letter,94,letter,letter);
    ellipse(377,letter+94,letter,letter);
    ellipse(377+letter,94+letter,letter,letter);
    
    fill(255);
    rect(392,98,letter,letter);
    fill(0,0,30);
    ellipse(392,98,letter,letter);
    ellipse(392+letter,98,letter,letter);
    ellipse(392,letter+98,letter,letter);
    ellipse(392+letter,98+letter,letter,letter);
    
    fill(255);
    rect(407,96,letter,letter);
    fill(0,0,30);
    ellipse(407,96,letter,letter);
    ellipse(407+letter,96,letter,letter);
    ellipse(407,letter+96,letter,letter);
    ellipse(407+letter,96+letter,letter,letter);
    
    fill(255);
    rect(420,88,letter,letter);
    fill(0,0,30);
    ellipse(420,88,letter,letter);
    ellipse(420+letter,88,letter,letter);
    ellipse(420,letter+88,letter,letter);
    ellipse(420+letter,88+letter,letter,letter);
    
    fill(255);
    rect(426,76,letter,letter);
    fill(0,0,30);
    ellipse(426,76,letter,letter);
    ellipse(426+letter,76,letter,letter);
    ellipse(426,letter+76,letter,letter);
    ellipse(426+letter,76+letter,letter,letter);
    
    fill(255);
    rect(427,64,letter,letter);
    fill(0,0,30);
    ellipse(427,64,letter,letter);
    ellipse(427+letter,64,letter,letter);
    ellipse(427,letter+64,letter,letter);
    ellipse(427+letter,64+letter,letter,letter);
    
    fill(255);
    rect(411,65,letter,letter);
    fill(0,0,30);
    ellipse(411,65,letter,letter);
    ellipse(411+letter,65,letter,letter);
    ellipse(411,letter+65,letter,letter);
    ellipse(411+letter,65+letter,letter,letter);
    
    fill(255);
    rect(395,66,letter,letter);
    fill(0,0,30);
    ellipse(395,66,letter,letter);
    ellipse(395+letter,66,letter,letter);
    ellipse(395,letter+66,letter,letter);
    ellipse(395+letter,66+letter,letter,letter);
    
    //extra stars
    fill(255);
    rect(180,60,star2,star3);
    fill(0,0,30);
    ellipse(180,60,star2,star3);
    ellipse(180+star2,60,star2,star3);
    ellipse(180,star3+60,star2,star3);
    ellipse(180+star2,60+star3,star2,star3);
    
    fill(255);
    rect(230,235,star3,star4);
    fill(0,0,30);
    ellipse(230,235,star3,star4);
    ellipse(230+star3,235,star3,star4);
    ellipse(230,star4+235,star3,star4);
    ellipse(230+star3,235+star4,star3,star4);
    
    fill(255);
    rect(600,135,star3,star3);
    fill(0,0,30);
    ellipse(600,135,star3,star3);
    ellipse(600+star3,135,star3,star3);
    ellipse(600,star3+135,star3,star3);
    ellipse(600+star3,135+star3,star3,star3);
  }
  
  if (key == 'h'){
    
    //letter
    fill(255);
    rect(444,23,letter,letter);
    fill(0,0,30);
    ellipse(444,23,letter,letter);
    ellipse(444+letter,23,letter,letter);
    ellipse(444,letter+23,letter,letter);
    ellipse(444+letter,23+letter,letter,letter);
    
    fill(255);
    rect(446,36,letter,letter);
    fill(0,0,30);
    ellipse(446,36,letter,letter);
    ellipse(446+letter,36,letter,letter);
    ellipse(446,letter+36,letter,letter);
    ellipse(446+letter,36+letter,letter,letter);
    
    fill(255);
    rect(448,49,letter,letter);
    fill(0,0,30);
    ellipse(448,49,letter,letter);
    ellipse(448+letter,49,letter,letter);
    ellipse(448,letter+49,letter,letter);
    ellipse(448+letter,49+letter,letter,letter);
    
    fill(255);
    rect(449,62,letter,letter);
    fill(0,0,30);
    ellipse(449,62,letter,letter);
    ellipse(449+letter,62,letter,letter);
    ellipse(449,letter+62,letter,letter);
    ellipse(449+letter,62+letter,letter,letter);
    
    fill(255);
    rect(451,75,letter,letter);
    fill(0,0,30);
    ellipse(451,75,letter,letter);
    ellipse(451+letter,75,letter,letter);
    ellipse(451,letter+75,letter,letter);
    ellipse(451+letter,75+letter,letter,letter);
    
    fill(255);
    rect(453,88,letter,letter);
    fill(0,0,30);
    ellipse(453,88,letter,letter);
    ellipse(453+letter,88,letter,letter);
    ellipse(453,letter+88,letter,letter);
    ellipse(453+letter,88+letter,letter,letter);
    
    fill(255);
    rect(463,52,letter,letter);
    fill(0,0,30);
    ellipse(463,52,letter,letter);
    ellipse(463+letter,52,letter,letter);
    ellipse(463,letter+52,letter,letter);
    ellipse(463+letter,52+letter,letter,letter);
    
    fill(255);
    rect(478,50,letter,letter);
    fill(0,0,30);
    ellipse(478,50,letter,letter);
    ellipse(478+letter,50,letter,letter);
    ellipse(478,letter+50,letter,letter);
    ellipse(478+letter,50+letter,letter,letter);
    
    fill(255);
    rect(493,48,letter,letter);
    fill(0,0,30);
    ellipse(493,48,letter,letter);
    ellipse(493+letter,48,letter,letter);
    ellipse(493,letter+48,letter,letter);
    ellipse(493+letter,48+letter,letter,letter);
    
    fill(255);
    rect(504,13,letter,letter);
    fill(0,0,30);
    ellipse(504,13,letter,letter);
    ellipse(504+letter,13,letter,letter);
    ellipse(504,letter+13,letter,letter);
    ellipse(504+letter,13+letter,letter,letter);
    
    fill(255);
    rect(506,26,letter,letter);
    fill(0,0,30);
    ellipse(506,26,letter,letter);
    ellipse(506+letter,26,letter,letter);
    ellipse(506,letter+26,letter,letter);
    ellipse(506+letter,26+letter,letter,letter);
    
    fill(255);
    rect(508,39,letter,letter);
    fill(0,0,30);
    ellipse(508,39,letter,letter);
    ellipse(508+letter,39,letter,letter);
    ellipse(508,letter+39,letter,letter);
    ellipse(508+letter,39+letter,letter,letter);
    
    fill(255);
    rect(509,52,letter,letter);
    fill(0,0,30);
    ellipse(509,52,letter,letter);
    ellipse(509+letter,52,letter,letter);
    ellipse(509,letter+52,letter,letter);
    ellipse(509+letter,52+letter,letter,letter);
    
    fill(255);
    rect(511,65,letter,letter);
    fill(0,0,30);
    ellipse(511,65,letter,letter);
    ellipse(511+letter,65,letter,letter);
    ellipse(511,letter+65,letter,letter);
    ellipse(511+letter,65+letter,letter,letter);
    
    fill(255);
    rect(513,78,letter,letter);
    fill(0,0,30);
    ellipse(513,78,letter,letter);
    ellipse(513+letter,78,letter,letter);
    ellipse(513,letter+78,letter,letter);
    ellipse(513+letter,78+letter,letter,letter);
    
    //extra stars
    fill(255);
    rect(230,30,star2,star3);
    fill(0,0,30);
    ellipse(230,30,star2,star3);
    ellipse(230+star2,30,star2,star3);
    ellipse(230,star3+30,star2,star3);
    ellipse(230+star2,30+star3,star2,star3);
    
    fill(255);
    rect(400,235,star3,star2);
    fill(0,0,30);
    ellipse(400,235,star3,star2);
    ellipse(400+star3,235,star3,star2);
    ellipse(400,star2+235,star3,star2);
    ellipse(400+star3,235+star2,star3,star2);
    
    fill(255);
    rect(680,350,star3,star4);
    fill(0,0,30);
    ellipse(680,350,star3,star4);
    ellipse(680+star3,350,star3,star4);
    ellipse(680,star4+350,star3,star4);
    ellipse(680+star3,350+star4,star3,star4);
    
    fill(255);
    rect(680,150,star3,star3);
    fill(0,0,30);
    ellipse(680,150,star3,star3);
    ellipse(680+star3,150,star3,star3);
    ellipse(680,star3+150,star3,star3);
    ellipse(680+star3,150+star3,star3,star3);
  }
  
  if (key == 't'){
    
    //letter
    fill(255);
    rect(525,13,letter,letter);
    fill(0,0,30);
    ellipse(525,13,letter,letter);
    ellipse(525+letter,13,letter,letter);
    ellipse(525,letter+13,letter,letter);
    ellipse(525+letter,13+letter,letter,letter);
    
    fill(255);
    rect(541,12,letter,letter);
    fill(0,0,30);
    ellipse(541,12,letter,letter);
    ellipse(541+letter,12,letter,letter);
    ellipse(541,letter+12,letter,letter);
    ellipse(541+letter,12+letter,letter,letter);
    
    fill(255);
    rect(557,11,letter,letter);
    fill(0,0,30);
    ellipse(557,11,letter,letter);
    ellipse(557+letter,11,letter,letter);
    ellipse(557,letter+11,letter,letter);
    ellipse(557+letter,11+letter,letter,letter);
    
    fill(255);
    rect(573,10,letter,letter);
    fill(0,0,30);
    ellipse(573,10,letter,letter);
    ellipse(573+letter,10,letter,letter);
    ellipse(573,letter+10,letter,letter);
    ellipse(573+letter,10+letter,letter,letter);
    
    fill(255);
    rect(589,9,letter,letter);
    fill(0,0,30);
    ellipse(589,9,letter,letter);
    ellipse(589+letter,9,letter,letter);
    ellipse(589,letter+9,letter,letter);
    ellipse(589+letter,9+letter,letter,letter);
    
    fill(255);
    rect(558,25,letter,letter);
    fill(0,0,30);
    ellipse(558,25,letter,letter);
    ellipse(558+letter,25,letter,letter);
    ellipse(558,letter+25,letter,letter);
    ellipse(558+letter,25+letter,letter,letter);
    
    fill(255);
    rect(559,39,letter,letter);
    fill(0,0,30);
    ellipse(559,39,letter,letter);
    ellipse(559+letter,39,letter,letter);
    ellipse(559,letter+39,letter,letter);
    ellipse(559+letter,39+letter,letter,letter);
    
    fill(255);
    rect(560,53,letter,letter);
    fill(0,0,30);
    ellipse(560,53,letter,letter);
    ellipse(560+letter,53,letter,letter);
    ellipse(560,letter+53,letter,letter);
    ellipse(560+letter,53+letter,letter,letter);
    
    fill(255);
    rect(561,67,letter,letter);
    fill(0,0,30);
    ellipse(561,67,letter,letter);
    ellipse(561+letter,67,letter,letter);
    ellipse(561,letter+67,letter,letter);
    ellipse(561+letter,67+letter,letter,letter);
    
    fill(255);
    rect(562,81,letter,letter);
    fill(0,0,30);
    ellipse(562,81,letter,letter);
    ellipse(562+letter,81,letter,letter);
    ellipse(562,letter+81,letter,letter);
    ellipse(562+letter,81+letter,letter,letter);
    
    //extra stars
    fill(255);
    rect(120,230,star1,star2);
    fill(0,0,30);
    ellipse(120,230,star1,star2);
    ellipse(120+star1,230,star1,star2);
    ellipse(120,star2+230,star1,star2);
    ellipse(120+star1,230+star2,star1,star2);
    
    fill(255);
    rect(295,130,star3,star3);
    fill(0,0,30);
    ellipse(295,130,star3,star3);
    ellipse(295+star3,130,star3,star3);
    ellipse(295,star3+130,star3,star3);
    ellipse(295+star3,130+star3,star3,star3);
    
    fill(255);
    rect(435,0,star3,star5);
    fill(0,0,30);
    ellipse(435,0,star3,star5);
    ellipse(435+star3,0,star3,star5);
    ellipse(435,star5+0,star3,star5);
    ellipse(435+star3,0+star5,star3,star5);
    
    fill(255);
    rect(615,340,star3,star2);
    fill(0,0,30);
    ellipse(615,340,star3,star2);
    ellipse(615+star3,340,star3,star2);
    ellipse(615,star2+340,star3,star2);
    ellipse(615+star3,340+star2,star3,star2);
  }
  
  if (key == 'u'){
    fill(255);
    rect(619,43,letter,letter);
    fill(0,0,30);
    ellipse(619,43,letter,letter);
    ellipse(619+letter,43,letter,letter);
    ellipse(619,letter+43,letter,letter);
    ellipse(619+letter,43+letter,letter,letter);
    
    fill(255);
    rect(620,57,letter,letter);
    fill(0,0,30);
    ellipse(620,57,letter,letter);
    ellipse(620+letter,57,letter,letter);
    ellipse(620,letter+57,letter,letter);
    ellipse(620+letter,57+letter,letter,letter);
    
    fill(255);
    rect(621,71,letter,letter);
    fill(0,0,30);
    ellipse(621,71,letter,letter);
    ellipse(621+letter,71,letter,letter);
    ellipse(621,letter+71,letter,letter);
    ellipse(621+letter,71+letter,letter,letter);
    
    fill(255);
    rect(622,84,letter,letter);
    fill(0,0,30);
    ellipse(622,84,letter,letter);
    ellipse(622+letter,84,letter,letter);
    ellipse(622,letter+84,letter,letter);
    ellipse(622+letter,84+letter,letter,letter);
    
    fill(255);
    rect(627,96,letter,letter);
    fill(0,0,30);
    ellipse(627,96,letter,letter);
    ellipse(627+letter,96,letter,letter);
    ellipse(627,letter+96,letter,letter);
    ellipse(627+letter,96+letter,letter,letter);
    
    fill(255);
    rect(639,104,letter,letter);
    fill(0,0,30);
    ellipse(639,104,letter,letter);
    ellipse(639+letter,104,letter,letter);
    ellipse(639,letter+104,letter,letter);
    ellipse(639+letter,104+letter,letter,letter);
    
    fill(255);
    rect(652,104,letter,letter);
    fill(0,0,30);
    ellipse(652,104,letter,letter);
    ellipse(652+letter,104,letter,letter);
    ellipse(652,letter+104,letter,letter);
    ellipse(652+letter,104+letter,letter,letter);
    
    fill(255);
    rect(664,98,letter,letter);
    fill(0,0,30);
    ellipse(664,98,letter,letter);
    ellipse(664+letter,98,letter,letter);
    ellipse(664,letter+98,letter,letter);
    ellipse(664+letter,98+letter,letter,letter);
    
    fill(255);
    rect(670,84,letter,letter);
    fill(0,0,30);
    ellipse(670,84,letter,letter);
    ellipse(670+letter,84,letter,letter);
    ellipse(670,letter+84,letter,letter);
    ellipse(670+letter,84+letter,letter,letter);
    
    fill(255);
    rect(669,69,letter,letter);
    fill(0,0,30);
    ellipse(669,69,letter,letter);
    ellipse(669+letter,69,letter,letter);
    ellipse(669,letter+69,letter,letter);
    ellipse(669+letter,69+letter,letter,letter);
    
    fill(255);
    rect(668,54,letter,letter);
    fill(0,0,30);
    ellipse(668,54,letter,letter);
    ellipse(668+letter,54,letter,letter);
    ellipse(668,letter+54,letter,letter);
    ellipse(668+letter,54+letter,letter,letter);
    
    fill(255);
    rect(667,39,letter,letter);
    fill(0,0,30);
    ellipse(667,39,letter,letter);
    ellipse(667+letter,39,letter,letter);
    ellipse(667,letter+39,letter,letter);
    ellipse(667+letter,39+letter,letter,letter);
  }
  
  if (key == 'p'){
    
    //letter
    fill(255);
    rect(691,36,letter,letter);
    fill(0,0,30);
    ellipse(691,36,letter,letter);
    ellipse(691+letter,36,letter,letter);
    ellipse(691,letter+36,letter,letter);
    ellipse(691+letter,36+letter,letter,letter);
    
    fill(255);
    rect(691,50,letter,letter);
    fill(0,0,30);
    ellipse(691,50,letter,letter);
    ellipse(691+letter,50,letter,letter);
    ellipse(691,letter+50,letter,letter);
    ellipse(691+letter,50+letter,letter,letter);
    
    fill(255);
    rect(692,64,letter,letter);
    fill(0,0,30);
    ellipse(692,64,letter,letter);
    ellipse(692+letter,64,letter,letter);
    ellipse(692,letter+64,letter,letter);
    ellipse(692+letter,64+letter,letter,letter);
    
    fill(255);
    rect(692,78,letter,letter);
    fill(0,0,30);
    ellipse(692,78,letter,letter);
    ellipse(692+letter,78,letter,letter);
    ellipse(692,letter+78,letter,letter);
    ellipse(692+letter,78+letter,letter,letter);
    
    fill(255);
    rect(693,92,letter,letter);
    fill(0,0,30);
    ellipse(693,92,letter,letter);
    ellipse(693+letter,92,letter,letter);
    ellipse(693,letter+92,letter,letter);
    ellipse(693+letter,92+letter,letter,letter);
    
    fill(255);
    rect(693,106,letter,letter);
    fill(0,0,30);
    ellipse(693,106,letter,letter);
    ellipse(693+letter,106,letter,letter);
    ellipse(693,letter+106,letter,letter);
    ellipse(693+letter,106+letter,letter,letter);
    
    fill(255);
    rect(705,35,letter,letter);
    fill(0,0,30);
    ellipse(705,35,letter,letter);
    ellipse(705+letter,35,letter,letter);
    ellipse(705,letter+35,letter,letter);
    ellipse(705+letter,35+letter,letter,letter);
    
    fill(255);
    rect(719,35,letter,letter);
    fill(0,0,30);
    ellipse(719,35,letter,letter);
    ellipse(719+letter,35,letter,letter);
    ellipse(719,letter+35,letter,letter);
    ellipse(719+letter,35+letter,letter,letter);
    
    fill(255);
    rect(732,38,letter,letter);
    fill(0,0,30);
    ellipse(732,38,letter,letter);
    ellipse(732+letter,38,letter,letter);
    ellipse(732,letter+38,letter,letter);
    ellipse(732+letter,38+letter,letter,letter);
    
    fill(255);
    rect(741,48,letter,letter);
    fill(0,0,30);
    ellipse(741,48,letter,letter);
    ellipse(741+letter,48,letter,letter);
    ellipse(741,letter+48,letter,letter);
    ellipse(741+letter,48+letter,letter,letter);
    
    fill(255);
    rect(742,60,letter,letter);
    fill(0,0,30);
    ellipse(742,60,letter,letter);
    ellipse(742+letter,60,letter,letter);
    ellipse(742,letter+60,letter,letter);
    ellipse(742+letter,60+letter,letter,letter);
    
    fill(255);
    rect(734,71,letter,letter);
    fill(0,0,30);
    ellipse(734,71,letter,letter);
    ellipse(734+letter,71,letter,letter);
    ellipse(734,letter+71,letter,letter);
    ellipse(734+letter,71+letter,letter,letter);
    
    fill(255);
    rect(720,74,letter,letter);
    fill(0,0,30);
    ellipse(720,74,letter,letter);
    ellipse(720+letter,74,letter,letter);
    ellipse(720,letter+74,letter,letter);
    ellipse(720+letter,74+letter,letter,letter);
    
    fill(255);
    rect(706,74,letter,letter);
    fill(0,0,30);
    ellipse(706,74,letter,letter);
    ellipse(706+letter,74,letter,letter);
    ellipse(706,letter+74,letter,letter);
    ellipse(706+letter,74+letter,letter,letter);
    
    //extra stars
    fill(255);
    rect(100,150,star2,star2);
    fill(0,0,30);
    ellipse(100,150,star2,star2);
    ellipse(100+star2,150,star2,star2);
    ellipse(100,star2+150,star2,star2);
    ellipse(100+star2,150+star2,star2,star2);
    
    fill(255);
    rect(180,350,star2,star3);
    fill(0,0,30);
    ellipse(180,350,star2,star3);
    ellipse(180+star2,350,star2,star3);
    ellipse(180,star3+350,star2,star3);
    ellipse(180+star2,350+star3,star2,star3);
    
    fill(255);
    rect(520,240,star3,star3);
    fill(0,0,30);
    ellipse(520,240,star3,star3);
    ellipse(520+star3,240,star3,star3);
    ellipse(520,star3+240,star3,star3);
    ellipse(520+star3,240+star3,star3,star3);
    
    fill(255);
    rect(720,380,star3,star3);
    fill(0,0,30);
    ellipse(720,380,star3,star3);
    ellipse(720+star3,380,star3,star3);
    ellipse(720,star3+380,star3,star3);
    ellipse(720+star3,380+star3,star3,star3);
  }
  
  if (key == 'm'){
    fill(255);
    rect(195,173,letter,letter);
    fill(0,0,30);
    ellipse(195,173,letter,letter);
    ellipse(195+letter,173,letter,letter);
    ellipse(195,letter+173,letter,letter);
    ellipse(195+letter,173+letter,letter,letter);
    
    fill(255);
    rect(199,188,letter,letter);
    fill(0,0,30);
    ellipse(199,188,letter,letter);
    ellipse(199+letter,188,letter,letter);
    ellipse(199,letter+188,letter,letter);
    ellipse(199+letter,188+letter,letter,letter);
    
    fill(255);
    rect(203,203,letter,letter);
    fill(0,0,30);
    ellipse(203,203,letter,letter);
    ellipse(203+letter,203,letter,letter);
    ellipse(203,letter+203,letter,letter);
    ellipse(203+letter,203+letter,letter,letter);
    
    fill(255);
    rect(207,218,letter,letter);
    fill(0,0,30);
    ellipse(207,218,letter,letter);
    ellipse(207+letter,218,letter,letter);
    ellipse(207,letter+218,letter,letter);
    ellipse(207+letter,218+letter,letter,letter);
    
    fill(255);
    rect(211,233,letter,letter);
    fill(0,0,30);
    ellipse(211,233,letter,letter);
    ellipse(211+letter,233,letter,letter);
    ellipse(211,letter+233,letter,letter);
    ellipse(211+letter,233+letter,letter,letter);
    
    fill(255);
    rect(210,185,letter,letter);
    fill(0,0,30);
    ellipse(210,185,letter,letter);
    ellipse(210+letter,185,letter,letter);
    ellipse(210,letter+185,letter,letter);
    ellipse(210+letter,185+letter,letter,letter);
    
    fill(255);
    rect(225,197,letter,letter);
    fill(0,0,30);
    ellipse(225,197,letter,letter);
    ellipse(225+letter,197,letter,letter);
    ellipse(225,letter+197,letter,letter);
    ellipse(225+letter,197+letter,letter,letter);
    
    fill(255);
    rect(240,209,letter,letter);
    fill(0,0,30);
    ellipse(240,209,letter,letter);
    ellipse(240+letter,209,letter,letter);
    ellipse(240,letter+209,letter,letter);
    ellipse(240+letter,209+letter,letter,letter);
    
    fill(255);
    rect(244,191,letter,letter);
    fill(0,0,30);
    ellipse(244,191,letter,letter);
    ellipse(244+letter,191,letter,letter);
    ellipse(244,letter+191,letter,letter);
    ellipse(244+letter,191+letter,letter,letter);
    
    fill(255);
    rect(248,173,letter,letter);
    fill(0,0,30);
    ellipse(248,173,letter,letter);
    ellipse(248+letter,173,letter,letter);
    ellipse(248,letter+173,letter,letter);
    ellipse(248+letter,173+letter,letter,letter);
    
    fill(255);
    rect(252,155,letter,letter);
    fill(0,0,30);
    ellipse(252,155,letter,letter);
    ellipse(252+letter,155,letter,letter);
    ellipse(252,letter+155,letter,letter);
    ellipse(252+letter,155+letter,letter,letter);
    
    fill(255);
    rect(260,175,letter,letter);
    fill(0,0,30);
    ellipse(260,175,letter,letter);
    ellipse(260+letter,175,letter,letter);
    ellipse(260,letter+175,letter,letter);
    ellipse(260+letter,175+letter,letter,letter);
    
    fill(255);
    rect(264,189,letter,letter);
    fill(0,0,30);
    ellipse(264,189,letter,letter);
    ellipse(264+letter,189,letter,letter);
    ellipse(264,letter+189,letter,letter);
    ellipse(264+letter,189+letter,letter,letter);
    
    fill(255);
    rect(268,203,letter,letter);
    fill(0,0,30);
    ellipse(268,203,letter,letter);
    ellipse(268+letter,203,letter,letter);
    ellipse(268,letter+203,letter,letter);
    ellipse(268+letter,203+letter,letter,letter);
    
    fill(255);
    rect(272,217,letter,letter);
    fill(0,0,30);
    ellipse(272,217,letter,letter);
    ellipse(272+letter,217,letter,letter);
    ellipse(272,letter+217,letter,letter);
    ellipse(272+letter,217+letter,letter,letter);
    
    //extra letters
    fill(255);
    rect(15,310,star3,star3);
    fill(0,0,30);
    ellipse(15,310,star3,star3);
    ellipse(15+star3,310,star3,star3);
    ellipse(15,star3+310,star3,star3);
    ellipse(15+star3,310+star3,star3,star3);
    
    fill(255);
    rect(500,70,star5,star3);
    fill(0,0,30);
    ellipse(500,70,star5,star3);
    ellipse(500+star5,70,star5,star3);
    ellipse(500,star3+70,star5,star3);
    ellipse(500+star5,70+star3,star5,star3);
    
    fill(255);
    rect(770,290,star3,star3);
    fill(0,0,30);
    ellipse(770,290,star3,star3);
    ellipse(770+star3,290,star3,star3);
    ellipse(770,star3+290,star3,star3);
    ellipse(770+star3,290+star3,star3,star3);
  }
  
  if(key == 'y'){
    fill(255);
    rect(272,150,letter,letter);
    fill(0,0,30);
    ellipse(272,150,letter,letter);
    ellipse(272+letter,150,letter,letter);
    ellipse(272,letter+150,letter,letter);
    ellipse(272+letter,150+letter,letter,letter);
    
    fill(255);
    rect(283,159,letter,letter);
    fill(0,0,30);
    ellipse(283,159,letter,letter);
    ellipse(283+letter,159,letter,letter);
    ellipse(283,letter+159,letter,letter);
    ellipse(283+letter,159+letter,letter,letter);
    
    fill(255);
    rect(294,168,letter,letter);
    fill(0,0,30);
    ellipse(294,168,letter,letter);
    ellipse(294+letter,168,letter,letter);
    ellipse(294,letter+168,letter,letter);
    ellipse(294+letter,168+letter,letter,letter);
    
    fill(255);
    rect(305,177,letter,letter);
    fill(0,0,30);
    ellipse(305,177,letter,letter);
    ellipse(305+letter,177,letter,letter);
    ellipse(305,letter+177,letter,letter);
    ellipse(305+letter,177+letter,letter,letter);
    
    fill(255);
    rect(313,165,letter,letter);
    fill(0,0,30);
    ellipse(313,165,letter,letter);
    ellipse(313+letter,165,letter,letter);
    ellipse(313,letter+165,letter,letter);
    ellipse(313+letter,165+letter,letter,letter);
    
    fill(255);
    rect(321,153,letter,letter);
    fill(0,0,30);
    ellipse(321,153,letter,letter);
    ellipse(321+letter,153,letter,letter);
    ellipse(321,letter+153,letter,letter);
    ellipse(321+letter,153+letter,letter,letter);
    
    fill(255);
    rect(329,141,letter,letter);
    fill(0,0,30);
    ellipse(329,141,letter,letter);
    ellipse(329+letter,141,letter,letter);
    ellipse(329,letter+141,letter,letter);
    ellipse(329+letter,141+letter,letter,letter);
    
    fill(255);
    rect(307,190,letter,letter);
    fill(0,0,30);
    ellipse(307,190,letter,letter);
    ellipse(307+letter,190,letter,letter);
    ellipse(307,letter+190,letter,letter);
    ellipse(307+letter,190+letter,letter,letter);
    
    fill(255);
    rect(308,203,letter,letter);
    fill(0,0,30);
    ellipse(308,203,letter,letter);
    ellipse(308+letter,203,letter,letter);
    ellipse(308,letter+203,letter,letter);
    ellipse(308+letter,203+letter,letter,letter);
    
    fill(255);
    rect(310,216,letter,letter);
    fill(0,0,30);
    ellipse(310,216,letter,letter);
    ellipse(310+letter,216,letter,letter);
    ellipse(310,letter+216,letter,letter);
    ellipse(310+letter,216+letter,letter,letter);
  }
  
  if (key == 'l'){
    fill(255);
    rect(385,135,letter,letter);
    fill(0,0,30);
    ellipse(385,135,letter,letter);
    ellipse(385+letter,135,letter,letter);
    ellipse(385,letter+135,letter,letter);
    ellipse(385+letter,135+letter,letter,letter);
    
    fill(255);
    rect(386,149,letter,letter);
    fill(0,0,30);
    ellipse(386,149,letter,letter);
    ellipse(386+letter,149,letter,letter);
    ellipse(386,letter+149,letter,letter);
    ellipse(386+letter,149+letter,letter,letter);
    
    fill(255);
    rect(387,163,letter,letter);
    fill(0,0,30);
    ellipse(387,163,letter,letter);
    ellipse(387+letter,163,letter,letter);
    ellipse(387,letter+163,letter,letter);
    ellipse(387+letter,163+letter,letter,letter);
    
    fill(255);
    rect(388,177,letter,letter);
    fill(0,0,30);
    ellipse(388,177,letter,letter);
    ellipse(388+letter,177,letter,letter);
    ellipse(388,letter+177,letter,letter);
    ellipse(388+letter,177+letter,letter,letter);
    
    fill(255);
    rect(389,190,letter,letter);
    fill(0,0,30);
    ellipse(389,190,letter,letter);
    ellipse(389+letter,190,letter,letter);
    ellipse(389,letter+190,letter,letter);
    ellipse(389+letter,190+letter,letter,letter);
    
    fill(255);
    rect(390,203,letter,letter);
    fill(0,0,30);
    ellipse(390,203,letter,letter);
    ellipse(390+letter,203,letter,letter);
    ellipse(390,letter+203,letter,letter);
    ellipse(390+letter,203+letter,letter,letter);
    
    fill(255);
    rect(403,202,letter,letter);
    fill(0,0,30);
    ellipse(403,202,letter,letter);
    ellipse(403+letter,202,letter,letter);
    ellipse(403,letter+202,letter,letter);
    ellipse(403+letter,202+letter,letter,letter);
    
    fill(255);
    rect(416,201,letter,letter);
    fill(0,0,30);
    ellipse(416,201,letter,letter);
    ellipse(416+letter,201,letter,letter);
    ellipse(416,letter+201,letter,letter);
    ellipse(416+letter,201+letter,letter,letter);
    
    fill(255);
    rect(429,200,letter,letter);
    fill(0,0,30);
    ellipse(429,200,letter,letter);
    ellipse(429+letter,200,letter,letter);
    ellipse(429,letter+200,letter,letter);
    ellipse(429+letter,200+letter,letter,letter);
    
    fill(255);
    rect(442,199,letter,letter);
    fill(0,0,30);
    ellipse(442,199,letter,letter);
    ellipse(442+letter,199,letter,letter);
    ellipse(442,letter+199,letter,letter);
    ellipse(442+letter,199+letter,letter,letter);
  }
  
  if (key == 'i'){
    fill(255);
    rect(465,125,letter,letter);
    fill(0,0,30);
    ellipse(465,125,letter,letter);
    ellipse(465+letter,125,letter,letter);
    ellipse(465,letter+125,letter,letter);
    ellipse(465+letter,125+letter,letter,letter);
    
    fill(255);
    rect(465,139,letter,letter);
    fill(0,0,30);
    ellipse(465,139,letter,letter);
    ellipse(465+letter,139,letter,letter);
    ellipse(465,letter+139,letter,letter);
    ellipse(465+letter,139+letter,letter,letter);
    
    fill(255);
    rect(466,153,letter,letter);
    fill(0,0,30);
    ellipse(466,153,letter,letter);
    ellipse(466+letter,153,letter,letter);
    ellipse(466,letter+153,letter,letter);
    ellipse(466+letter,153+letter,letter,letter);
    
    fill(255);
    rect(466,167,letter,letter);
    fill(0,0,30);
    ellipse(466,167,letter,letter);
    ellipse(466+letter,167,letter,letter);
    ellipse(466,letter+167,letter,letter);
    ellipse(466+letter,167+letter,letter,letter);
    
    fill(255);
    rect(467,181,letter,letter);
    fill(0,0,30);
    ellipse(467,181,letter,letter);
    ellipse(467+letter,181,letter,letter);
    ellipse(467,letter+181,letter,letter);
    ellipse(467+letter,181+letter,letter,letter);
    
    fill(255);
    rect(467,195,letter,letter);
    fill(0,0,30);
    ellipse(467,195,letter,letter);
    ellipse(467+letter,195,letter,letter);
    ellipse(467,letter+195,letter,letter);
    ellipse(467+letter,195+letter,letter,letter);
  }
  
  if (key == 'f'){
    fill(255);
    rect(495,123,letter,letter);
    fill(0,0,30);
    ellipse(495,123,letter,letter);
    ellipse(495+letter,123,letter,letter);
    ellipse(495,letter+123,letter,letter);
    ellipse(495+letter,123+letter,letter,letter);
    
    fill(255);
    rect(495,138,letter,letter);
    fill(0,0,30);
    ellipse(495,138,letter,letter);
    ellipse(495+letter,138,letter,letter);
    ellipse(495,letter+138,letter,letter);
    ellipse(495+letter,138+letter,letter,letter);
    
    fill(255);
    rect(495,152,letter,letter);
    fill(0,0,30);
    ellipse(495,152,letter,letter);
    ellipse(495+letter,152,letter,letter);
    ellipse(495,letter+152,letter,letter);
    ellipse(495+letter,152+letter,letter,letter);
    
    fill(255);
    rect(495,167,letter,letter);
    fill(0,0,30);
    ellipse(495,167,letter,letter);
    ellipse(495+letter,167,letter,letter);
    ellipse(495,letter+167,letter,letter);
    ellipse(495+letter,167+letter,letter,letter);
    
    fill(255);
    rect(495,181,letter,letter);
    fill(0,0,30);
    ellipse(495,181,letter,letter);
    ellipse(495+letter,181,letter,letter);
    ellipse(495,letter+181,letter,letter);
    ellipse(495+letter,181+letter,letter,letter);
    
    fill(255);
    rect(495,196,letter,letter);
    fill(0,0,30);
    ellipse(495,196,letter,letter);
    ellipse(495+letter,196,letter,letter);
    ellipse(495,letter+196,letter,letter);
    ellipse(495+letter,196+letter,letter,letter);
    
    fill(255);
    rect(510,123,letter,letter);
    fill(0,0,30);
    ellipse(510,123,letter,letter);
    ellipse(510+letter,123,letter,letter);
    ellipse(510,letter+123,letter,letter);
    ellipse(510+letter,123+letter,letter,letter);
    
    fill(255);
    rect(525,123,letter,letter);
    fill(0,0,30);
    ellipse(525,123,letter,letter);
    ellipse(525+letter,123,letter,letter);
    ellipse(525,letter+123,letter,letter);
    ellipse(525+letter,123+letter,letter,letter);
    
    fill(255);
    rect(540,123,letter,letter);
    fill(0,0,30);
    ellipse(540,123,letter,letter);
    ellipse(540+letter,123,letter,letter);
    ellipse(540,letter+123,letter,letter);
    ellipse(540+letter,123+letter,letter,letter);
    
    fill(255);
    rect(508,159,letter,letter);
    fill(0,0,30);
    ellipse(508,159,letter,letter);
    ellipse(508+letter,159,letter,letter);
    ellipse(508,letter+159,letter,letter);
    ellipse(508+letter,159+letter,letter,letter);
    
    fill(255);
    rect(523,159,letter,letter);
    fill(0,0,30);
    ellipse(523,159,letter,letter);
    ellipse(523+letter,159,letter,letter);
    ellipse(523,letter+159,letter,letter);
    ellipse(523+letter,159+letter,letter,letter);
    
    //extra stars
    fill(255);
    rect(130,160,star3,star3);
    fill(0,0,30);
    ellipse(130,160,star3,star3);
    ellipse(130+star3,160,star3,star3);
    ellipse(130,star3+160,star3,star3);
    ellipse(130+star3,160+star3,star3,star3);
    
    fill(255);
    rect(220,390,star3,star3);
    fill(0,0,30);
    ellipse(220,390,star3,star3);
    ellipse(220+star3,390,star3,star3);
    ellipse(220,star3+390,star3,star3);
    ellipse(220+star3,390+star3,star3,star3);
    
    fill(255);
    rect(640,130,star3,star3);
    fill(0,0,30);
    ellipse(640,130,star3,star3);
    ellipse(640+star3,130,star3,star3);
    ellipse(640,star3+130,star3,star3);
    ellipse(640+star3,130+star3,star3,star3);
  }
  
  if (key == 'e'){
    fill(255);
    rect(565,124,letter,letter);
    fill(0,0,30);
    ellipse(565,124,letter,letter);
    ellipse(565+letter,124,letter,letter);
    ellipse(565,letter+124,letter,letter);
    ellipse(565+letter,124+letter,letter,letter);
    
    fill(255);
    rect(564,139,letter,letter);
    fill(0,0,30);
    ellipse(564,139,letter,letter);
    ellipse(564+letter,139,letter,letter);
    ellipse(564,letter+139,letter,letter);
    ellipse(564+letter,139+letter,letter,letter);
    
    fill(255);
    rect(563,154,letter,letter);
    fill(0,0,30);
    ellipse(563,154,letter,letter);
    ellipse(563+letter,154,letter,letter);
    ellipse(563,letter+154,letter,letter);
    ellipse(563+letter,154+letter,letter,letter);
    
    fill(255);
    rect(562,169,letter,letter);
    fill(0,0,30);
    ellipse(562,169,letter,letter);
    ellipse(562+letter,169,letter,letter);
    ellipse(562,letter+169,letter,letter);
    ellipse(562+letter,169+letter,letter,letter);
    
    fill(255);
    rect(561,184,letter,letter);
    fill(0,0,30);
    ellipse(561,184,letter,letter);
    ellipse(561+letter,184,letter,letter);
    ellipse(561,letter+184,letter,letter);
    ellipse(561+letter,184+letter,letter,letter);
    
    fill(255);
    rect(560,200,letter,letter);
    fill(0,0,30);
    ellipse(560,200,letter,letter);
    ellipse(560+letter,200,letter,letter);
    ellipse(560,letter+200,letter,letter);
    ellipse(560+letter,200+letter,letter,letter);
    
    fill(255);
    rect(580,125,letter,letter);
    fill(0,0,30);
    ellipse(580,125,letter,letter);
    ellipse(580+letter,125,letter,letter);
    ellipse(580,letter+125,letter,letter);
    ellipse(580+letter,125+letter,letter,letter);
    
    fill(255);
    rect(595,126,letter,letter);
    fill(0,0,30);
    ellipse(595,126,letter,letter);
    ellipse(595+letter,126,letter,letter);
    ellipse(595,letter+126,letter,letter);
    ellipse(595+letter,126+letter,letter,letter);
    
    fill(255);
    rect(610,127,letter,letter);
    fill(0,0,30);
    ellipse(610,127,letter,letter);
    ellipse(610+letter,127,letter,letter);
    ellipse(610,letter+127,letter,letter);
    ellipse(610+letter,127+letter,letter,letter);
    
    fill(255);
    rect(576,161,letter,letter);
    fill(0,0,30);
    ellipse(576,161,letter,letter);
    ellipse(576+letter,161,letter,letter);
    ellipse(576,letter+161,letter,letter);
    ellipse(576+letter,161+letter,letter,letter);
    
    fill(255);
    rect(591,162,letter,letter);
    fill(0,0,30);
    ellipse(591,162,letter,letter);
    ellipse(591+letter,162,letter,letter);
    ellipse(591,letter+162,letter,letter);
    ellipse(591+letter,162+letter,letter,letter);
    
    fill(255);
    rect(575,201,letter,letter);
    fill(0,0,30);
    ellipse(575,201,letter,letter);
    ellipse(575+letter,201,letter,letter);
    ellipse(575,letter+201,letter,letter);
    ellipse(575+letter,201+letter,letter,letter);
    
    fill(255);
    rect(590,202,letter,letter);
    fill(0,0,30);
    ellipse(590,202,letter,letter);
    ellipse(590+letter,202,letter,letter);
    ellipse(590,letter+202,letter,letter);
    ellipse(590+letter,202+letter,letter,letter);
    
    fill(255);
    rect(605,203,letter,letter);
    fill(0,0,30);
    ellipse(605,203,letter,letter);
    ellipse(605+letter,203,letter,letter);
    ellipse(605,letter+203,letter,letter);
    ellipse(605+letter,203+letter,letter,letter);
    
    //extra stars
    fill(255);
    rect(0,290,star3,star2);
    fill(0,0,30);
    ellipse(0,290,star3,star2);
    ellipse(0+star3,290,star3,star2);
    ellipse(0,star2+290,star3,star2);
    ellipse(0+star3,290+star2,star3,star2);
    
    fill(255);
    rect(290,220,star3,star3);
    fill(0,0,30);
    ellipse(290,220,star3,star3);
    ellipse(290+star3,220,star3,star3);
    ellipse(290,star3+220,star3,star3);
    ellipse(290+star3,220+star3,star3,star3);
    
    fill(255);
    rect(380,5,star3,star3);
    fill(0,0,30);
    ellipse(380,5,star3,star3);
    ellipse(380+star3,5,star3,star3);
    ellipse(380,star3+5,star3,star3);
    ellipse(380+star3,5+star3,star3,star3);
    
    fill(255);
    rect(750,380,star4,star3);
    fill(0,0,30);
    ellipse(750,380,star4,star3);
    ellipse(750+star4,380,star4,star3);
    ellipse(750,star3+380,star4,star3);
    ellipse(750+star4,380+star3,star4,star3);
  }
}

