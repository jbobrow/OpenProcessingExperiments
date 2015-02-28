
void setup(){size(500,572); background(#E5DC89);}

void draw(){ 
  
//hair
noStroke();
fill(#554524); 
arc(290, 200, 280, 250, 3.04, TWO_PI+0.04); 
//leftburn
noStroke();
beginShape();
vertex(150,210);
vertex(154,220);
vertex(163,256);
vertex(200,200);
endShape(CLOSE);
//rightburn
beginShape();
vertex(412,205);
vertex(420,205);
vertex(398,250);
vertex(380,200);
endShape(CLOSE);
//mask
fill(#E5DC89);
beginShape();
vertex(398,250);
vertex(406,200);
vertex(409,190);
vertex(410,180);
vertex(405,150);
vertex(402,140);
vertex(375,105);
vertex(370,100);
vertex(280,50);
vertex(450,130);
vertex(450,250);
endShape(CLOSE);
//wall
stroke(0,100,60);
strokeWeight(1);
line(0,270,500,267);
line(0,238,500,235);
line(170,270,170,575);
line(70,271,70,575);
line(437,268,437,575);
//neck
stroke(200,200,200);
strokeWeight(1);
fill(#FAD081);
beginShape();
vertex(200,393);
vertex(203,403);
vertex(200,446);
vertex(180,460);
vertex(200,485);
vertex(270,500);
vertex(370,463);
vertex(357,424);
vertex(355,401);
endShape(CLOSE);
//face
noStroke();
fill(#FFDA89);
beginShape();
vertex(163,256);
vertex(164,212);
vertex(173,205);
vertex(171,180);
vertex(173,170);
vertex(176,160);
vertex(200,155);
vertex(246,156);
vertex(300,152);
vertex(340,150);
vertex(363,155);
vertex(380,165);
vertex(386,182);
vertex(389,193);
vertex(397,205);
vertex(398,250);
  endShape(CLOSE); 
//face2
beginShape();
vertex(163,256);
vertex(167,282);
vertex(170,325);
vertex(175,340);
vertex(181,360);
vertex(183,365);
vertex(205,400);
vertex(211,409);
vertex(240,429);
vertex(258,432);
vertex(300,432);
vertex(320,429);
vertex(347,412);
vertex(374,372);
vertex(389,324);
vertex(395,274);
vertex(398,250);
endShape(CLOSE);
//eyebrows
fill(#463710);
stroke(0);
strokeWeight(5);
line(208,218,265,223);
line(295,223,348,215);
//eyes
fill(#F7EFD9);
noStroke();
ellipse(240,240,50,18);
ellipse(320,240,50,18);
fill(#2A375A);
ellipse(247,240,19,18);
ellipse(327,240,19,18);
fill(0,0,0);
ellipse(247,240,10,10);
ellipse(327,240,10,10);
//mouth
stroke(240,40,40);
strokeWeight(6);
line(252,360,317,360);
//nose
noStroke();
fill(0);
ellipse(269,315,9,3);
ellipse(295,315,9,3);
noFill();
stroke(200,200,200);
strokeWeight(1);
bezier(254,312,255,300,266,300,265,300);
bezier(265,300,276,265,273,265,270,240);
bezier(310,312,311,300,300,300,299,300);
bezier(299,300,288,265,290,271,290,240);

//ears
stroke(240,240,240);
fill(#FCCA78);
bezier(166,283,138,288,133,175,160,234);
bezier(394,283,410,286,416,200,398,230);
//shirt
stroke(0);
strokeWeight(7);
noFill();
bezier(196,450,150,510,385,500,364,442);
fill(0);
bezier(195,450,118,487,46,547,5,570);
noStroke();
beginShape();
vertex(500,488);
vertex(367,442);
vertex(362,460);
vertex(337,477);
vertex(291,489);
vertex(347,491);
vertex(205,484);
vertex(190,468);
vertex(188,454);
vertex(114,494);
vertex(0,570);
vertex(0,600);
vertex(600,600);
endShape(CLOSE);

//mouse
noStroke();
fill(#E5DC89);
rect(0,0,50,50); 
fill(0);
int x=mouseX;
int y=mouseY;
text(x, 20,10);
text(y, 20,20);
String c="x="; String d="y=";
text(c, 5,10); text(d, 5,20);

}





