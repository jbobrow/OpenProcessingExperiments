
int hair = #271604;
int skin = #FFCB93;
int a = 100;
int b = 200;
int c = 300;
int d = 400;
int e = 500;
int f = 10;
int g = 20;
int h = 30;
PImage bg;
void setup() {
  size(500,500);
  bg = loadImage("spbg.jpg");
   
}
   
 void draw() {
  background(bg);
   smooth();
   noStroke();
   // hair bg
   fill(hair);
   ellipse(b+h+h,a+85,208,212);
   // jacket
   fill(0);
   triangle(140,450,260,300,370,450);
   // shirt  
   noStroke();
   fill(255); 
   rect(177,290,a+60,150);
    // pants
   fill(#1609B2);
   rect(164,425,185,60);
   
  
   // pants curve
   fill(#1609B2);
   ellipse(205,480,95,70);
   ellipse(310,480,95,70);
   
   // shoulders
   noStroke();
    fill(0);
   ellipse(177,290,50,50);
   ellipse(343,290,50,50);
   
   // arms 
   stroke(0);
   strokeWeight(50);
   line(175,290,135,340);
   line(135,340,135,365);
   line(347,290,377,340);
   line(377,340,377,365);
  
   // jacket front
   noStroke();
   fill(0); 
   rect(162,290,75,160);
   rect(277,290,75,160); 
   // lapel
   stroke(255); 
   strokeWeight(1);
   line(186,275,220,330);
   line(220,330,210,335);
   line(210,335,235,400);
   
   line(334,275,300,330);
   line(300,330,310,335);
   line(310,335,280,400); 
   // hands
   stroke(skin);
    strokeWeight(55);
   line(135,385,136,386);
   line(375,386,375,386);
   // pockets
   stroke(0);
   line(180,405,180,415);
   line(330,405,330,415);
   
  
   noStroke();
   
   // neck
   fill(255);
   ellipse(260,275,a,a);
  
   // shoes
   fill(0);
   ellipse(205,490,110,70);
   ellipse(310,490,110,70);
   strokeWeight(10);
   stroke(255);

   noStroke();
   // floor
   fill(#363434);
   rect(0,490,500,50); 
   
   fill(skin);
   ellipse(260,b+5,b,b);
   noFill();
   strokeWeight(4);
   stroke(#FFBC9B);
   ellipse(260,b+5,b,b);
   noStroke();
   fill(hair);
   rect(190,108,135,25);
   fill(skin);
   ellipse(298,182,120,120);

   ellipse(322,149,40,40); 
   ellipse(219,184,115,118);
   
   stroke(hair);
   strokeWeight(7);
   line(170,145,190,a+f);
   line(163,175,183,a+g);
   line(163,175,174,130);
line(167,130,205,a);   
line(167,130,160,198);
line(164,132,163,215);
line(167,130,162,201); 
line(163,176,b,101);

line(359,175,357,215);
line(359,175,320,a);
line(357,173,357,b);

fill(skin);

noStroke();
ellipse(257,143,120,30);
fill(hair);

ellipse(260, 110, 75,15);
triangle(163, 131, 195, 108, 188, 99);
triangle(186, 108, 215, 103, 195, 97);
triangle(b, a, 220, 93, 205, 90);
triangle(230, 86, 255, 85, 238, 75);
triangle(245, 82, 257, 80, 250, 69);
triangle(255, 80, 265, 80, 260, 65);
triangle(265, 80, 275, 80, 269, 70);
triangle(272, 81, 280, 82, 279, 73);
triangle(285, 86, 304, 88, 293, 78);
triangle(302, 91, 315, 99, 304, 83);
triangle(255,285, 265, 285, 260, 277);
strokeWeight(7);
stroke(hair);
line(225,162,245,162);
line(212,167,225,162);
line(275,162,295,162);
line(295,162,307,166);
stroke(skin);	
triangle(244,135, 253, 135, 249, 130);
triangle(250,135, 257, 135, 255, 130);
// sclera
pushMatrix();
noStroke();
  fill(255);
   translate(width/2, height/2);
rotate(PI/7.5);

ellipse(-37, -35, 53, 64);

rotate(PI/1.3);
ellipse(-50, 35, 53, 64);
fill(hair);
popMatrix();

// pupil
ellipse(230,220,f,f);   
ellipse(290,220,f,f);
fill(255);
ellipse(232,217,5,5);   
ellipse(292,217,5,5);

// nose
noFill();
stroke(0);
strokeWeight(2);
ellipse(258,245, 10,10);
noStroke();
fill(skin);
ellipse(258,243, 15,10);

// smile
stroke(0);
noFill();
bezier(235,260,245,280,280,270,280,260);

// goatee
stroke(hair);
bezier(230,270,230,290,290,290,290,270);
line(230,285,230,270);
line(231,286,231,275);
line(232,287,232,276);
line(233,286,233,277);
line(234,289,234,278);
line(235,290,235,279);
line(236,291,236,279);
line(237,290,237,280);
line(238,293,238,282);
line(239,294,239,282);
line(240,295,240,283);
line(241,294,241,283);
line(242,297,242,284);
line(243,295,243,284);
line(244,299,244,284);
line(245,c,245,284);
line(246,299,246,285);
line(247,302,247,285);
line(248,303,248,285);
line(249,304,249,285);
line(250,305,250,285);
line(251,304,251,285);
line(252,307,252,285);
line(253,308,253,285);
line(254,309,254,285);
line(255,310,255,285);
line(256,307,256,285);
line(257,310,257,285);
line(258,310,258,285);
line(259,308,259,285);
line(260,310,260,285);
line(261,310,261,285);
line(262,309,262,285);
line(263,307,263,285);
line(264,310,264,285);
line(265,309,265,285);
line(266,308,266,285);
line(267,307,267,285);
line(268,304,268,285);
line(269,305,269,285);
line(270,304,270,285);
line(271,303,271,285);
line(272,302,272,285);
line(273,301,273,285);
line(274,c,274,285);
line(275,297,275,284);
line(276,298,276,284);
line(277,293,277,284);
line(278,296,278,284);
line(279,295,279,283);
line(280,294,280,283);
line(281,291,281,282);
line(282,292,282,281);
line(283,291,283,280);
line(284,290,284,280);
line(285,287,285,280);
line(286,288,286,279);
line(287,287,287,279);
line(288,286,288,276);
line(289,285,289,275);
line(290,284,290,272);
//flinch
 if(mouseX > 130 && mouseX <400)
  {
    if(mouseY > 120 && mouseY < 320)
    {

pushMatrix();
noStroke();
  fill(skin);
   translate(width/2, height/2);
rotate(PI/7.5);

ellipse(-37, -35, 53, 64);

rotate(PI/1.3);
ellipse(-50, 35, 53, 64);

popMatrix();
fill(skin);
ellipse(230,220,f,f);   
ellipse(290,220,f,f);

ellipse(232,217,5,5);   
ellipse(292,217,5,5);
stroke(hair);
strokeWeight(1);
line(210,230,300,190);
line(210,190,300,230);
strokeWeight(7);
line(220,170,240,180);
line(280,180,300,170);
strokeWeight(8);
stroke(skin);
line(225,162,245,162);
line(212,167,225,162);
line(275,162,295,162);
line(295,162,307,166);

strokeWeight(3);
noFill();
bezier(235,260,245,280,280,270,280,260);
fill(hair);
strokeWeight(2);
ellipse(259,268,15,10);
 }
  }
}

