


//Numbers 1-7 control the shirt color
//The keys a,s, and d control shorts color
//Glasses randomly change color each time a key is pressed.
//press 1 for green
//press 2 for yellow
//press 3 for orange
//press 4 for red
//press 5 for blue
//press 6 for black
//press 7 for grey
//
//press a for black
//press s for grey
//press d for khaki

color skin = #FFDCB7;
color bglass=#3473D6;
color beye=#3B88FF;
int shirt = 0;
int fillval= 150;
color hairb = #FEBB55;
color hair = #FFEF5F;
color hbehind = #E8D649;

void setup (){
size (600,750);
background (200);//background color
//background (random(255),random(255),random(255));////background random

}

void draw (){
 noLoop();
smooth();
fill(skin);

//Basic body shape (body-arms)

//body
//ellipse (300,345,100,250);

////neck
//fill(skin);ellipse (300,230,45,45);

////shoulders
//fill(skin);
//ellipse (240,270,50,50);//left
//ellipse (360,270,50,50);//right

//hair (behind head)
stroke(hbehind);
fill(hbehind);rect(250,190,100,100);

//left arm
stroke(0);strokeWeight(1);
fill(skin);
//ellipse (225,340,30,130);////upper arm for body outline
ellipse (225,410,30,130);//lower arm

//right arm
stroke(0);
fill(skin);
//ellipse (375,340,30,130);////upper arm for body outline
ellipse (375,410,30,130);//lower arm

//left hand
smooth();strokeWeight(1);stroke(0);
ellipse(224,472,42,30);//palm
strokeWeight(8);stroke(0);//finger outline
line(242,475,242,495);//thumb
line(231,480,231,508);//index
line(223,480,223,511);//middle
line(215,480,215,506);//ring
line(207,480,207,503);//little
strokeWeight(6);stroke(skin);//finger color
line(242,475,242,495);//thumb
line(231,480,231,508);//index
line(223,480,223,511);//middle
line(215,480,215,506);//ring
line(207,480,207,503);//little


//right hand
smooth();strokeWeight(1);stroke(0);
ellipse(376,472,42,30);//palm
strokeWeight(8);stroke(0);//finger outline
line(358,475,358,495);//thumb
line(369,480,369,508);//index
line(377,480,377,511);//middle
line(385,480,385,506);//ring
line(393,480,393,503);//little
strokeWeight(6);stroke(skin);//finger color
line(358,475,358,495);//thumb
line(369,480,369,508);//index
line(377,480,377,511);//middle
line(385,480,385,506);//ring
line(393,480,393,503);//little


//left foot
noStroke();
strokeWeight(1);
fill(100);
ellipse(265,722,33,22);//foot
stroke(0);
bezier(248,726,250,718,252,690,262,700); //left side of foot
bezier(280,726,288,718,268,680,260,670);//right side of foot
fill(50);
ellipse(250,728,6,6);//little toe
ellipse(255,730,7,7);//4th toe
ellipse(261,730,8,8);//3rd toe
ellipse(268,730,10,10);//2nd toe
ellipse(277,730,12,12);//big toe


//left leg
strokeWeight(1);stroke(0);
fill(skin);
//ellipse (270,520,50,150);//upper leg outline
ellipse (265,640,40,150);//lower leg
noStroke();fill(100);rect(255,710,22,10);//part of shoe

//right foot
noStroke();
fill(100);
ellipse(335,722,35,22);//foot
stroke(0);
bezier(318,726,318,718,320,690,340,700); //left side of foot
bezier(350,726,360,718,340,690,335,700); //right side of foot
fill(50);
ellipse(348,728,6,6);//little toe
ellipse(343,730,7,7);//4th toe
ellipse(337,730,8,8);//3rd toe
ellipse(331,730,10,10);//2nd toe
ellipse(323,730,12,12);//big toe

//right leg
strokeWeight(1);stroke(0);
fill(skin);
//ellipse (330,520,50,150);//upper leg outline
ellipse (335,640,40,150);//lower leg
noStroke();fill(100);rect(328,710,22,10);//part of shoe

//shorts
fill(fillval);
stroke(0);
quad(250, 460, 240, 610, 290, 610, 300, 460); //left leg
quad(300, 460, 310, 610, 360, 610, 350, 460);//right leg
noStroke();
ellipse(300,455,99,60);//waist
strokeWeight(1);stroke(50);noFill();
bezier(246,510,260,485,270,480,253,460);//left pocket
bezier(354,510,340,485,330,480,337,460);//right pocket

//shirt
stroke(0);
fill(shirt);
rect(250,250,100,220);//shirt chest
rect(202,275,45,90);//left sleeve
rect(353,275,45,90);//right sleeve
noStroke();
ellipse (300,260,65,60);//shirt neck
ellipse(300,255,180,30);//shirt neck-shoulders
ellipse(370,272,55,55);//shirt shoulder right
ellipse(230,272,55,55);//shirt shoulder left
stroke(50);line(250,470,350,470);//shirt bottom
fill(skin);stroke(0);ellipse (300,230,45,45);//neck
noFill();
stroke(0);strokeWeight(1);
bezier(202,275,202,245,225,242,280,240);//outline left shoulder
bezier(398,275,398,245,375,242,320,240);//outline right shoulder

//head
stroke(0);
fill(skin);
ellipse (300,150,120,170);


//face
//eye (left)
fill(200);ellipse (270,130,40,40);//silver frame of glasses
fill(skin);ellipse (270,130,35,35);//skin around eye
fill(255);ellipse (270,130,25,25);//white of the eye
fill(beye);ellipse (270,130,13,13);//iris(blue)
fill(0);ellipse (270,130,6,6);//pupil
fill(skin);bezier(260, 123,268,115,272,115,280, 123);//eyelid
fill(skin);bezier(262, 120, 250, 130, 290, 130, 278, 120);//eyelid

//eye (right)
fill(200);ellipse (330,130,40,40);//silver frame of glasses
fill(skin);ellipse (330,130,35,35);//skin around eye
fill(255);ellipse (330,130,25,25);//white of the eye
fill(beye);ellipse (330,130,13,13);//iris(blue)
fill(0);ellipse (330,130,6,6);//pupil
fill(skin);bezier(320, 123,328,115,332,115,340, 123);//eyelid
fill(skin);bezier(322, 120, 310, 130, 350, 130, 338, 120);//eyelid

//glasses lense
fill(random(255), random(255), random(255), 200);
ellipse (270,130,35,35);//glasses(w/ alpha)(left)
ellipse (330,130,35,35);//glasses(w/ alpha)(right)

//nose
noFill();
bezier(295, 125, 300, 173, 280, 173, 290, 180);//left bridge
bezier(305,125,300,173,320,173,305,180);//right bridge
stroke(60,80);
bezier(296,180,298,170,296,166,292,166);//faint lines around nostril (left)
bezier(302,180,300,170,304,166,308,166);//faint lines around nostril (right)
stroke(60,200);line(297,178,302,178);//line between nostrils
fill(0);ellipse(292,179,6,3);//left nostril
fill(0);ellipse(304,179,6,3);//right nostril
stroke(0);noFill();bezier(294,178,292,182,302,182,304,178);//part of nose between nostrils (lower)

strokeWeight(4);bezier(291,130,298,125,302,125,309,130);//Outline of nosepiece on glasses
strokeWeight(3);stroke(200);bezier(291,130,298,125,302,125,309,130);//Nosepiece on glasses

//earpieces of glasses
strokeWeight(5);stroke(0);line(250,130,245,125);//left outline
strokeWeight(3);stroke(200);line(250,130,245,125);//left
strokeWeight(5);stroke(0);line(350,130,355,125);//right outline
strokeWeight(3);stroke(200);line(351,130,355,125);//right

//mouth
strokeWeight(1);stroke(0);
line(280,200,315,200);

//hair  made of various curves
strokeWeight(8);
stroke(hair);
//left side
bezier(290,75,220,100,250,220,250,240);
bezier(290,75,220,100,245,220,245,240);
bezier(288,70,220,100,250,220,250,200);
bezier(286,70,220,100,250,220,250,220);
bezier(282,70,220,100,250,220,250,220);
//right side
bezier(290,75,380,80,360,220,360,240);
bezier(290,70,380,80,360,220,360,240);
bezier(300,70,380,80,360,220,360,220);
bezier(310,70,380,80,360,220,360,220);
bezier(290,70,300,65,380,80,360,220);
bezier(305,68,300,65,380,80,360,220);
bezier(290,68,300,65,380,80,360,220);
bezier(295,67,300,65,380,80,360,220);
bezier(300,67,300,65,380,80,360,220);
bezier(340,100,340,100,370,100,352,240);
bezier(340,100,340,100,370,100,355,240);
line(355,190,350,240);

//goatee  many lines that move towards a point
strokeWeight(3);
stroke(hairb);line(297,225,300,245);
stroke(hairb);line(294,225,300,245);
stroke(hairb);line(291,225,300,245);
stroke(hairb);line(288,225,300,245);
stroke(hairb);line(285,225,300,245);
stroke(hairb);line(282,225,300,245);
stroke(hairb);line(279,225,300,245);
stroke(hairb);line(275,225,300,245);
stroke(hairb);line(276,225,300,245);
stroke(hairb);line(300,225,300,245);
stroke(hairb);line(303,225,300,245);
stroke(hairb);line(306,225,300,245);
stroke(hairb);line(309,225,300,245);
stroke(hairb);line(312,225,300,245);
stroke(hairb);line(315,225,300,245);
stroke(hairb);line(318,225,300,245);
stroke(hairb);line(321,225,300,245);
stroke(hairb);line(325,225,300,245);
stroke(hairb);line(324,225,300,245);

save("self.png");

//if else on glasses color maybe
//link eye movement to mouse
//maybe make blink if mouse hovers on eyes
}


void keyPressed() {
if (key == '1') {
    shirt = #14A000;}//press 1 for green
if (key == '2'){
 shirt = #FFF300;}//press 2 for yellow
if (key == '3'){
 shirt = #FF8D00;}//press 3 for orange
if (key == '4'){
 shirt = #FF0000;}//press 4 for red
if (key == '5'){
 shirt = #083BFF;}//press 5 for blue
if (key == '6'){
 shirt =0;}//press 6 for black
if (key == '7'){
 shirt =150;}//press 6 for grey
if (key == 'a'){
 fillval = 0;}//press a for black
if (key == 's'){
 fillval = 150;}//press s for grey
if (key == 'd'){
 fillval = #F0E68C;}//press d for khaki
 redraw();
}

