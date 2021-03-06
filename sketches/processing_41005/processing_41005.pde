
void setup( )
{
  size(640, 480);
  background(241,231,196);
}
void draw001()
{
strokeWeight(3);  
arc(442, 480, 180, 180, -PI,0);
fill(255,234,172);
arc(625, 480, 180, 180, -PI,0);
fill(239,223,226);
arc(506,-53, 150, 150, 0,PI);
}

void draw(){


strokeWeight(5);
smooth();
noFill();
beginShape();
vertex(0, 106);
bezierVertex(25, 58, 60, 61, 106, 100);
endShape();

beginShape();
strokeWeight(4);
vertex(106, 100);
bezierVertex(138, 130, 168, 127, 220, 70);
endShape();

beginShape();
strokeWeight(3);
line(0,130,432,15);
vertex(220, 70);
bezierVertex(269, 12, 347 , -5, 447, 5);
endShape();

  
draw001();

noStroke();
fill(241,230,212);
arc(625, 480, 160, 160, -PI,0);

noStroke();
fill(228,211,180);
ellipse(172,243,82,103);  
fill(204,189,164);
ellipse(172,243,78,100);  
fill(221,213,172);
ellipse(172,243,68,88);  
fill(124,148,111);
ellipse(172,243,62,80);  

fill(192,202,148);
ellipse(292,266,170,170);  
fill(253,234,214);
ellipse(292,266,150,150);  
fill(183,198,190);
ellipse(292,266,130,130);  


stroke(0);
strokeWeight(2);
fill(234,220,200);
ellipse(172,243,50,65);

fill(234,220,200);
ellipse(292,266,100,100);

fill(254,210,107); 
triangle(0,0, 50,0, 0,49);
strokeWeight(3);  
line(50,0,0,49);

noStroke();
fill(241,216,210);
quad(584,0,640,0,640,286,533,193);
fill(154,200,200);
triangle(638,289,266,360,458,132);
fill(159,133,87); 
triangle(569,285, 640,240, 640,285);

strokeWeight(4); 
stroke(141,51,36);
line(533,102,640,50);
line(584,0,458,480);
strokeWeight(6); 
stroke(0);
line(491,221,640,0);
stroke(0);
strokeWeight(3);  
line(310,0,640,288);
line(584,0,458,480);




noStroke();
fill(160,84,12);
quad(0,480,30,480,44,460,0,414);
fill(241,231,196);
quad(0,414,44,460,79,409,0,348);
fill(95,123,72);
quad(-5,335,79,409,118,354,13,295);
fill(241,231,196);
quad(14,295,118,354,145,310,35,241);
fill(0);
quad(35,241,145,310,175,270,64,165);

fill(204,217,205);
quad(30,480,59,480,65,475,44,460);
fill(0);
quad(44,460,65,475,109,433,79,409);
fill(241,231,196);
quad(79,409,109,433,160,379,118,354);
fill(118,181,190);
quad(118,354,163,379,196,342,145,310);
fill(241,231,196);
quad(145,310,196,342,220,313,175,270);
fill(0);
quad(175,270,220,313,247,292,194,240);
fill(241,231,196);
quad(191,240,247,292,263,273,209,217);
fill(0);
quad(209,217,265,273,293,247,232,185);

fill(231,222,152);
quad(65,475,91,510,133,453,109,433);
fill(74,134,80);
quad(196,342,221,355,244,331,220,313);
fill(0);
quad(245,292,265,309,283,288,265,273);
fill(0);
quad(380,156,394,169,421,136,407,126);

fill(228,170,154);
quad(191,388,221,406,251,370,221,355);
fill(0);
quad(244,331,268,354,288,328,265,309);
fill(160,84,12);
quad(283,288,304,309,331,279,308,261);
fill(0);
quad(359,208,376,228,412,189,394,169);
fill(0);
quad(418,140,437,159,464,129,442,115);
fill(0);
quad(470,87,486,100,508,75,487,62);
fill(0);
quad(508,43,523,57,546,33,529,18);
fill(241,231,196);
quad(225,313,244,328,262,309,246,293);
quad(269,271,283,286,306,262,292,248);
quad(295,245,330,280,374,229,344,194);
quad(269,309,289,328,303,311,285,292);

stroke(0);
strokeWeight(4);
line(64,165,0,324);
line(232,185,30,480);
line(59,480,407,126);
line(83,510,529,18);
line(158,480,546,33);

line(0,414,68,480);
line(-5,335,161,476);
line(13,295,220,407);
line(35,241,249,372);
line(64,165,265,352);
line(194,240,287,328);
line(209,217,305,309);
line(232,185,329,280);
line(344,192,376,228);
line(407,126,437,159);

stroke(139,47,33);
strokeWeight(10);
line(130,485,640,310);
stroke(0);
line(132,401,640,290);
strokeWeight(3);
line(550,53,640,10);
strokeWeight(2);
line(547,46,640,0);

}




