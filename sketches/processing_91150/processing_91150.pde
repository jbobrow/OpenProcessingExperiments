
/*
  EX3_cartoon
  Evan Gallagher
  1/30/2013
  
  cartoon characters drawn with shapes
*/


void setup(){
  size(480,480);
  smooth();
}

void draw(){
    //outer body
    fill(252,252,5);
  rect(140,100,200,300);
    fill(255);
    //eyes
  ellipse(205,190,75,75);
  ellipse(275,190,75,75);
    fill(5,143,252);
  ellipse(215,190,35,35);
  ellipse(265,190,35,35);
    fill(0);
  ellipse(215,190,12,12);
  ellipse(265,190,12,12);
    fill(255);
    //pants
 
 
    //smile
    fill(252,252,5);
  beginShape();
    vertex(170,240);
    vertex(200,255);
    vertex(215,260);
    vertex(265,260);
    vertex(280,255);
    vertex(310,240);
  endShape();
    fill(255);
    //teeth
  rect(217,260,20,25);
  rect(243,260,20,25);
    //pants
  rect(140,340,200,60);
  fill(134,33,12);
  rect(140,365,200,35);
    fill(252,5,9);
   beginShape();
    vertex(232,340);
    vertex(237,350);
    vertex(230,380);
    vertex(240,392);
    vertex(250,380);
    vertex(243,350);
    vertex(248,340);
  endShape();
    line(237,350,243,350);
  endShape();
  fill(255);
  beginShape();
    vertex(232,340);
    vertex(222,350);
    vertex(205,340);
  endShape();
  beginShape();
    vertex(248,340);
    vertex(258,350);
    vertex(275,340);
  endShape();
  fill(0);
  rect(150,370,30,8);
  rect(190,370,30,8);
  rect(260,370,30,8);
  rect(300,370,30,8);
  fill(255);
  beginShape();
    vertex(340,310);
    vertex(358,355);
    vertex(340,355);
  endShape();
  beginShape();
    vertex(140,310);
    vertex(122,355);
    vertex(140,355);
  endShape();
  fill(255,247,0);
  beginShape();
    vertex(126,355);
    vertex(126,410);
    vertex(116,410);
    vertex(116,435);
    vertex(150,435);
    vertex(150,425);
    vertex(155,425);
    vertex(155,410);
    vertex(140,410);
    vertex(140,355);
  endShape();
  beginShape();
    vertex(354,355);
    vertex(354,410);
    vertex(364,410);
    vertex(364,435);
    vertex(330,435);
    vertex(330,425);
    vertex(325,425);
    vertex(325,410);
    vertex(340,410);
    vertex(340,355);
  endShape();
  fill(134,33,12);
  beginShape();
    vertex(185,400);
    vertex(180,410);
    vertex(215,410);
    vertex(210,400);
  endShape();
  beginShape();
    vertex(275,400);
    vertex(270,410);
    vertex(305,410);
    vertex(300,400);
  endShape();
  
}
