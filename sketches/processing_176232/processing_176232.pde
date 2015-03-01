
void setup() {  //setup function called initially, only once
  size(1000,700);
  background(255);  //set background white
  
}

void draw() {  

fill(0);
quad(533,533,542,542,628,448,620,440); // staff of cane

fill(255);
beginShape(); 

vertex(624,453); // top of cane
vertex(614,446);
vertex(630,430);
vertex(644,435);
vertex(650,444);
vertex(644,458);
vertex(635,450);
vertex(638,448); 
vertex(636,440);
vertex(632,442);
vertex();

endShape(CLOSE);


strokeWeight(2);
fill(115,58,21);
beginShape();

vertex(100,420); // start of left flipper
vertex(120,420);
vertex(140,400);
vertex(220,360);

vertex(320,280); // head
vertex(380,260);
vertex(420,250); // top point of head
vertex(460,260);
vertex(540,300);
vertex(620,300);
vertex(640,320);
vertex(680,320);
vertex(715,350);

vertex(760,320); // tail
vertex(765,338);
vertex(730,360);
vertex(770,345);
vertex(780,360);
vertex(735,370);
vertex(785,378);
vertex(795,395);
vertex(735,380);
vertex(800,418);
vertex(818,445);
vertex(715,395);

vertex(660,420); // bottom part of body
vertex(640,420);
vertex(620,410);
vertex(570,430);
vertex(620,480);
vertex(640,480);
vertex(600,510);
vertex(560,510);
vertex(510,460);
vertex(380,480);
vertex(280,460);
vertex(240,440);
vertex(180,460);
vertex(160,460);
vertex(140,460);

endShape(CLOSE);


fill(225);
beginShape();

vertex(100,420); // left flipper glove
vertex(120,420);
vertex(140,400);
vertex(180,460);
vertex(160,460);
vertex(140,460);

endShape(CLOSE);

fill(225);
beginShape();

vertex(600,460);
vertex(620,480);
vertex(640,480);
vertex(600,510);
vertex(560,510);

endShape(CLOSE);


fill(0)
ellipse(310,370,20,20); // eyes
ellipse(410,384,20,20);

strokeWeight(3);

line(325,330,340,345);
line(405,348,385,355); // eyebrows

line(310,418,318,425); // left part of mouth
line(318,425,328,428);
line(328,428,340,425);
line(340,425,345,418);

line(345,418,349,425); // right part of mouth
line(349,425,362,428);
line(362,428,370,426);
line(370,426,378,421);

line(328,428,335,435); // middle part of mouth
line(335,435,344,440);
line(344,440,355,435);
line(355,435,360,428);


strokeWeight(2);

line(520,380,570,430);// body details
line(440,440,510,460);
line(220,360,200,384);
line(200,384,220,420);
line(220,420,240,440);
line(460,260,525,320);
line(540,300,580,320);
line(640,320,660,340);
line(620,410,640,400);

fill(225);
beginShape();

vertex(326,426); // left tusk
vertex(320,440);
vertex(315,460);
vertex(318,480);
vertex(325,492);
vertex(325,480);
vertex(326,460);
vertex(335,435);

endShape(CLOSE);


beginShape();

vertex(355,435); // right tusk
vertex(356,442);
vertex(358,460);
vertex(356,480);
vertex(354,492);
vertex(360,480);
vertex(368,460);
vertex(370,440);
vertex(365,427);

endShape(CLOSE);


strokeWeight(1);

fill(39,48,146);
quad(270,242,297,225,312,250,285,265); // hat
quad(283,285,330,255,340,271,293,301);
fill(213,17,27);
quad(285,265,311,249,319,262,293,277);





vertex();
vertex();
vertex();



}
