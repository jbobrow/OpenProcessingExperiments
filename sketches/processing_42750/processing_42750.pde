
void startFace(){
  
 }
  
  
  
 void testFace(){
  
   background(255);
   stroke(0);
  
  
  
 fill(255,224,173);
  
 beginShape(); // face
  
 curveVertex (-100,200);
  
 curveVertex (-100,200);
  
 curveVertex (130,430);
  
 curveVertex (370,430);
  
 curveVertex (600,200);
  
 curveVertex (600,-100);
  
 curveVertex (-100,-100);
  
 curveVertex (-100,-100);
  
 endShape(CLOSE);
  
  
  
float m0 = 0;
float m1 = 0;
float m2 = 0;
float m3 = 0;
  
if (v>100*sensitivity){
  m0=map(v,100*sensitivity,3000*sensitivity,0,15);
}
if (v>100*sensitivity){
  m1=map(v,100*sensitivity,3000*sensitivity,0,20);
}
  
float cap22=230+m0;
float cap23=240+m1;
if (cap22>245){
  cap22=245;
}
if (cap23>265){
  cap23=265;
}
  
  
 fill (20,0,0);
  
 beginShape(); // blackness
  
 vertex (60,165);
  
 vertex (160,75);
  
 vertex (340,75);
  
 vertex (443,167);
  
 vertex (300,cap23+60);
  
 vertex (200,cap23+60);
  
 vertex (63,165);
  
 endShape(CLOSE);
  
  
  
  
  
 fill (255,153,153);
  
 rect (130,80,250,20); // gums
  
  
  
  
  
fill (90,70,85);
  
 beginShape(); // backer tooth left
  
 curveVertex (105, 105);
  
 curveVertex (110, 105);
  
 curveVertex (110, 105);
  
 curveVertex (110, 135);
  
 curveVertex (125, 130);
  
 curveVertex (150, 135);
  
 curveVertex (152, 105);
  
 curveVertex (152, 105);
  
 endShape();
  
  
  
  
  
 fill (90,70,85);
  
 beginShape(); // backer tooth right
  
 curveVertex (395, 105);
  
 curveVertex (390, 105);
  
 curveVertex (390, 105);
  
 curveVertex (390, 135);
  
 curveVertex (375, 130);
  
 curveVertex (350, 135);
  
 curveVertex (348, 105);
  
 curveVertex (348, 105);
  
 endShape();
  
  
  
  
  
 fill (170,150,165);
  
 beginShape(); // back tooth left
  
 curveVertex (110, 100);
  
 curveVertex (115, 100);
  
 curveVertex (115, 100);
  
 curveVertex (115, 130);
  
 curveVertex (130, 125);
  
 curveVertex (155, 130);
  
 curveVertex (157, 100);
  
 curveVertex (157, 100);
  
 endShape();
  
  
  
  
  
 fill (170,150,165);
  
 beginShape(); // back tooth right
  
 curveVertex (390, 100);
  
 curveVertex (385, 100);
  
 curveVertex (385, 100);
  
 curveVertex (385, 130);
  
 curveVertex (370, 125);
  
 curveVertex (345, 130);
  
 curveVertex (343, 100);
  
 curveVertex (343, 100);
  
 endShape();
  
  
  
  
  
 fill (240,240,255);
  
 beginShape(); // leftmost tooth
  
 curveVertex (155,83);
  
 curveVertex (155,83);
  
 curveVertex (160,103);
  
 curveVertex (155,118);
  
 curveVertex (140,130);
  
 curveVertex (130,125);
  
 curveVertex (125,105);
  
 curveVertex (130,83);
  
 endShape();
  
  
  
  
  
 fill (240,240,255);
  
 beginShape(); // next left tooth
  
 curveVertex (195,80);
  
 curveVertex (195,80);
  
 curveVertex (200,100);
  
 curveVertex (195,120);
  
 curveVertex (165,123);
  
 curveVertex (160,103);
  
 curveVertex (165,83);
  
 curveVertex (165,83);
  
 endShape();
  
  
  
  
  
 fill (240,240,255);
  
 beginShape(); //left front tooth
  
 curveVertex(245,85);
  
 curveVertex(245,85);
  
 curveVertex(250,100);
  
 curveVertex(245,120);
  
 curveVertex(205,120);
  
 curveVertex(200,100);
  
 curveVertex(205,85);
  
 curveVertex(205,85);
  
 endShape();
  
  
  
  
  
 fill (240,240,255);
  
 beginShape(); //right front tooth
  
 curveVertex(255,85);
  
 curveVertex(255,85);
  
 curveVertex(250,100);
  
 curveVertex(255,120);
  
 curveVertex(295,120);
  
 curveVertex(300,100);
  
 curveVertex(295,85);
  
 curveVertex(295,85);
  
 endShape();
  
  
  
  
  
 fill (240,240,255);
  
 beginShape(); // next right tooth
  
 curveVertex (305,80);
  
 curveVertex (305,80);
  
 curveVertex (300,100);
  
 curveVertex (305,120);
  
 curveVertex (335,123);
  
 curveVertex (340,103);
  
 curveVertex (335,83);
  
 curveVertex (335,83);
  
 endShape();
  
  
  
  
  
 fill (240,240,255);
  
 beginShape(); // rightmost tooth
  
 curveVertex (345,83);
  
 curveVertex (345,83);
  
 curveVertex (340,103);
  
 curveVertex (345,118);
  
 curveVertex (360,130);
  
 curveVertex (370,125);
  
 curveVertex (375,105);
  
 curveVertex (370,83);
  
 endShape();
  
  
  
  
  
 fill (130,110,125);
  
 beginShape(); // bottom leftest tooth
  
 curveVertex (153,cap22);
  
 curveVertex (153,cap22);
  
 curveVertex (148,cap22-46);
  
 curveVertex (133,cap22-45);
  
 curveVertex (113,cap22-48);
  
 curveVertex (103,cap22-20);
  
 curveVertex (103,cap22-40);
  
 endShape(CLOSE);
  
  
  
  
  
 fill (220,200,215);
  
 beginShape(); // bottom lefter tooth
  
 curveVertex (160,cap22);
  
 curveVertex (160,cap22);
  
 curveVertex (155,cap22-37);
  
 curveVertex (140,cap22-35);
  
 curveVertex (120,cap22-38);
  
 curveVertex (110,cap22-10);
  
 curveVertex (110,cap22-10);
  
 endShape(CLOSE);
  
  
  
  
  
 beginShape(); // lefter rooth ridge
  
 curveVertex (120,cap22-22);
  
 curveVertex (120,cap22-22);
  
 curveVertex (125,cap22-27);
  
 curveVertex (135,cap22-22);
  
 curveVertex (135,cap22-22);
  
 endShape();
  
  
  
  
  
 fill (240,240,255);
  
 beginShape(); // bottom left tooth
  
 curveVertex (180,cap22+15);
  
 curveVertex (180,cap22+15);
  
 curveVertex (177,cap22-20);
  
 curveVertex (145,cap22-25);
  
 curveVertex (135,cap22-5);
  
 curveVertex (135,cap22+5);
  
 endShape(CLOSE);
  
  
  
 fill (240,240,255);
  
 beginShape(); //bottom next to front left tooth
  
 curveVertex (210,cap22+25);
  
 curveVertex (210,cap22+25);
  
 curveVertex (207,cap22-5);
  
 curveVertex (172,cap22-5);
  
 curveVertex (170,cap22+25);
  
 curveVertex (170,cap22+25);
  
 endShape();
  
  
  
 fill (240,240,255);
  
 beginShape(); //bottom front left tooth
  
 curveVertex (250,cap22+25);
  
 curveVertex (250,cap22+25);
  
 curveVertex (247,cap22-5);
  
 curveVertex (212,cap22-5);
  
 curveVertex (210,cap22+25);
  
 curveVertex (210,cap22+25);
  
 endShape();
  
  
  
  
  
 fill (130,110,125);
  
 beginShape(); // bottom rightest tooth
  
 curveVertex (347,cap22+10);
  
 curveVertex (347,cap22+10);
  
 curveVertex (352,cap22-46);
  
 curveVertex (367,cap22-45);
  
 curveVertex (387,cap22-48);
  
 curveVertex (397,cap22-20);
  
 curveVertex (397,cap22-20);
  
 endShape(CLOSE);
  
  
  
  
  
 noFill();
  
 beginShape(); // righter tooth ridge
  
 curveVertex (385,cap22-32);
  
 curveVertex (385,cap22-32);
  
 curveVertex (380,cap22-37);
  
 curveVertex (370,cap22-32);
  
 curveVertex (370,cap22-32);
  
 endShape();
  
  
  
  
  
 fill (220,200,215);
  
 beginShape(); // bottom righter tooth
  
 curveVertex (330,cap22+20);
  
 curveVertex (330,cap22+20);
  
 curveVertex (335,cap22-37);
  
 curveVertex (350,cap22-35);
  
 curveVertex (370,cap22-38);
  
 curveVertex (380,cap22-10);
  
 curveVertex (380,cap22-10);
  
 endShape(CLOSE);
  
  
  
  
  
 beginShape(); // righter rooth ridge
  
 curveVertex (365,cap22-22);
  
 curveVertex (365,cap22-22);
  
 curveVertex (360,cap22-27);
  
 curveVertex (350,cap22-22);
  
 curveVertex (350,cap22-22);
  
 endShape();
  
  
  
  
  
 fill (240,240,255);
  
 beginShape(); // bottom right tooth
  
 curveVertex (320,cap22+15);
  
 curveVertex (320,cap22+15);
  
 curveVertex (323,cap22-20);
  
 curveVertex (355,cap22-25);
  
 curveVertex (365,cap22+5);
  
 curveVertex (365,cap22+5);
  
 endShape(CLOSE);
  
  
  
 fill (240,240,255);
  
 beginShape(); //bottom next to front right tooth
  
 curveVertex (290,250);
  
 curveVertex (290,250);
  
 curveVertex (293,220);
  
 curveVertex (328,220);
  
 curveVertex (330,250);
  
 curveVertex (330,250);
  
 endShape();
  
  
  
 fill (240,240,255);
  
 beginShape(); //bottom front right tooth
  
 curveVertex (250,250);
  
 curveVertex (250,250);
  
 curveVertex (253,220);
  
 curveVertex (288,220);
  
 curveVertex (290,250);
  
 curveVertex (290,250);
  
 endShape();
  
  
  
  
  
 fill (204,0,0);
  
 beginShape();
  
 curveVertex(60,160); //upper lip top
  
 curveVertex(60,160);
  
 curveVertex(150,45);
  
 curveVertex(250,48);
  
 curveVertex(350,45);
  
 curveVertex(440,160);
  
 curveVertex (430,163); //upper lip bottom
  
 curveVertex (340,87);
  
 curveVertex (250,90);
  
 curveVertex (160,87);
  
 curveVertex (70,163);
  
 curveVertex (60,160);
  
 curveVertex (60,159);
  
 endShape(CLOSE);
  
  
 fill (204,0,0);
  
 beginShape();
  
 curveVertex (60,165); //lower lip top
  
 curveVertex (60,165);
  
 curveVertex (150,cap22);
  
 curveVertex (250,cap23);
  
 curveVertex (350,cap22);
  
 curveVertex (445,170);
  
 curveVertex (350,cap22+50);
  
 curveVertex (250,cap23+65);
  
 curveVertex (150,cap22+50);
  
 curveVertex (60,165);
  
 curveVertex (60,164);
  
 endShape(CLOSE);
  
  
  
  
  
 fill (255,102,102);
  
 beginShape();
  
  
  
 float y6 = 0;
  
 float y7 = 0;
  
 float cap1 = 172+y6;
  
 float cap2 = 180+y7;
  
  
  
 if (cap1>172){
  
   cap1=172;
  
 }
  
  if (cap1>180){
  
   cap1=180;
  
 }
  
  
  
  if (v > 50*sensitivity) {
  
   y6 = map(v, 50*sensitivity, 500*sensitivity, 0, -20);
  
 }
  
  if (v > 50*sensitivity) {
  
   y6 = map(v, 50*sensitivity, 500*sensitivity, 0, -20);
  
 }
  
  
  
 curveVertex (192,cap1); //tongue
  
 curveVertex (160,cap2);
  
  
  
 float y0 = 0;
  
 float y1 = 0;
  
 float y2 = 0;
  
 float y3 = 0;
  
 float y4 = 0;
  
 float y5 = 0;
  
  
  
  
  
 if (v > 50*sensitivity) {
  
   y0 = map(v, 50*sensitivity, 500*sensitivity, 0, 40);
  
 }
  
  if (v > 50*sensitivity) {
  
   y1 = map(v, 50*sensitivity, 500*sensitivity, 0, 150);
  
 }
  
  if (v > 50*sensitivity) {
  
   y2 = map(v, 50*sensitivity, 500*sensitivity, 0, 200);
  
 }
  
  if (v > 50*sensitivity) {
  
   y3 = map(v, 50*sensitivity, 500*sensitivity, 0, 200);
  
 }
  
  if (v > 50*sensitivity) {
  
   y4 = map(v, 50*sensitivity, 500*sensitivity, 0, 150);
  
 }
  
  if (v > 50*sensitivity) {
  
   y5 = map(v, 50*sensitivity, 500*sensitivity, 0, 40);
  
 }
  
  
  
 float cap3 = 200+y0;
  
 float cap4 = 215+y1;
  
 float cap5 = 225+y2;
  
 float cap6 = 225+y3;
  
 float cap7 = 215+y4;
  
 float cap8 = 200+y5;
  
  
  
 if (cap3>240){
  
   cap3 = 240;
  
 }
  
  if (cap4>365){
  
   cap4 = 365;
  
 }
  
  if (cap5>425){
  
   cap5 = 425;
  
 }
  
  if (cap6>425){
  
   cap6 = 425;
  
 }
  
  if (cap7>365){
  
   cap7 = 365;
  
 }
  
  if (cap8>240){
  
   cap8 = 240;
  
 }
  
  
  
 curveVertex (150,cap3);
  
 curveVertex (165,cap4);
  
 curveVertex (205,cap5);
  
 curveVertex (295,cap6);
  
 curveVertex (335,cap7);
  
 curveVertex (350,cap8);
  
  
  
 /*
  
 curveVertex (150,240); parameters for tongue fully out
  
 curveVertex (165,365);
  
 curveVertex (205,425);
  
 curveVertex (295,425);
  
 curveVertex (335,365);
  
 curveVertex (350,240);
  
 */
  
  
  
 float y8 = 0;
  
 float y9 = 0;
  
 float y10 = 0;
  
 float y11 = 0;
  
 float y12 = 0;
  
  
  
  if (v > 50*sensitivity) {
  
   y8 = map(v, 50*sensitivity, 500*sensitivity, 0, -10);
  
 }
  
   if (v > 50*sensitivity) {
  
   y9 = map(v, 50*sensitivity, 500*sensitivity, 0, -20);
  
 }
  
   if (v > 50*sensitivity) {
  
   y10 = map(v, 50*sensitivity, 500*sensitivity, 0, -20);
  
 }
  
   if (v > 50*sensitivity) {
  
   y11 = map(v, 50*sensitivity, 500*sensitivity, 0, -2);
  
 }
  
    if (v > 50*sensitivity) {
  
   y12 = map(v, 50*sensitivity, 500*sensitivity, 0, -15);
  
 }
  
  
  
 float cap9 = 180+y8;
  
 float cap10 = 170+y9;
  
 float cap11 = 172+y10;
  
 float cap12 = 175+y11;
  
 float cap13 = 180+y11;
  
  
  
  
  
  
  
 if (cap9<170){
  
   cap9 = 170;
  
 }
  
  if (cap10<150){
  
   cap10 = 150;
  
 }
  
  if (cap11<152){
  
   cap11 = 152;
  
 }
  
  if (cap12<173){
  
   cap12 = 173;
  
 }
  
  if (cap13<165){
  
   cap13 = 165;
  
 }
  
  
  
 curveVertex (340,cap9);
  
 curveVertex (250,cap10);
  
 curveVertex (195,cap11);
  
 curveVertex (167,cap12);
  
 curveVertex (161,cap13);
  
 endShape(CLOSE);
  
  
  
 float e0 = 0;
  
 float e1 = 0;
  
 float e2 = 0;
  
  
  
 if (v > 300*sensitivity){
  
 e0 = map(v, 300*sensitivity, 800*sensitivity, -3, 90);
  
 }
  
 if(v >300*sensitivity){
  
   e2 = map(v, 300*sensitivity, 800*sensitivity, -4,100);
  
  
  
 if (v > 300*sensitivity){
  
   e1 = map (v, 300*sensitivity, 1000*sensitivity, 0, 2);
  
  
  
 }
  
  
  
 float cap14 = 172+e0;
  
  
  
  
  
  
  
 if (cap14>259){
  
   cap14 = 259;
  
 }
  
  
  
  
  
  
  
 float b0=0;
 float b1 = 0;
 if(v>4000){
   b0=map(v,4000,8000,0,-5);
 }
 if(v>6000){
   b1=map(v,4000,8000,0,5);
 }
  
  
  
 fill(255);
  
 pushMatrix ();
  
 translate(220, cap14);
  
 beginShape(); //left eye white on tongue
  
 curveVertex(0+b1, 0);
  
 curveVertex(0+b1, 0);
  
 curveVertex(-30, 0+b0);
  
 curveVertex(-20, 20+b0);
  
 curveVertex(-10,20+b0);
  
 curveVertex(0, 0+b0);
  
 curveVertex(0, 0+b0);
  
 endShape(CLOSE);
  
 popMatrix();
  
  
  
  
  
  
 fill(0); //left pupil
  
 pushMatrix ();
  
 translate(217, cap14);
  
 ellipse(-10,4,5,8);
  
 popMatrix();
  
  
  
 fill(255);
  
 pushMatrix ();
  
 translate(280, cap14);
  
 beginShape(); //right eye white on tongue
  
 curveVertex(0, 0);
  
 curveVertex(0, 0);
  
 curveVertex(30, 0);
  
 curveVertex(20, 20);
  
 curveVertex(10,20);
  
 curveVertex(0, 0);
  
 curveVertex(0, 0);
  
// curveVertex (280,172+e0);
  
// curveVertex (280,172+e0);
  
// curveVertex (295,172+e0);
  
// curveVertex (290,182+e0);
  
// curveVertex (280,172+e0);
  
// curveVertex (280,172+e0);
  
 endShape(CLOSE);
  
 popMatrix();
  
  
  
  
  
  
 fill(0); //right pupil
  
 pushMatrix ();
  
 translate(283, cap14);
  
 ellipse(10,4,5,8);
  
 popMatrix();
  
  
  
  
  
  
 float t2 = 0;
  
  
  
 float el0 = 0;
  
 float el2 = 0;
  
  
  
  
  
 if(v>300*sensitivity){
  
   t2 = map(v, 300*sensitivity, 1000*sensitivity, -20,110);
  
 }
  
 if(v>350*sensitivity){
  
   el0 = map(v,350*sensitivity,1000*sensitivity,0,-15);
  
 }
  
 if (v>350*sensitivity){
  
   el2 = map(v,350*sensitivity,1000*sensitivity,0,15);
  
 }
  
  
  
 float cap16 = 197+t2;
  
  
  
 if (el2>15){
  
   el2 = 15;
  
 }
  
  
  
 if (el0<15){
  
   el0 = -15;
  
 }
  
  
  
 if (cap16>267){
  
   cap16=267;
  
 }
  
  
  
 fill(255,102,102);
  
 beginShape(); // left lower eyelid
  
 curveVertex(185,cap16);
  
 curveVertex(185,cap16);
  
 curveVertex(200,15+cap16);
  
 curveVertex(210,15+cap16);
  
 curveVertex(225,cap16);
  
 curveVertex(205,cap16+el2);
  
 curveVertex(185,1+cap16);
  
 curveVertex(185,1+cap16);
  
 endShape();
  
  
  
 fill(255,102,102);
  
 beginShape(); // left upper eyelid
  
 curveVertex(185,cap16-2);
  
 curveVertex(185,cap16-2);
  
 curveVertex(200,cap16-17);
  
 curveVertex(210,cap16-17);
  
 curveVertex(225,cap16-2);
  
 curveVertex(205,3+cap16+el0);
  
 curveVertex(185,cap16-1);
  
 curveVertex(185,cap16-1);
  
 endShape();
  
  
  
 fill(255,102,102);
  
 beginShape(); // right lower eyelid
  
 curveVertex(315,cap16);
  
 curveVertex(315,cap16);
  
 curveVertex(300,15+cap16);
  
 curveVertex(290,15+cap16);
  
 curveVertex(275,cap16);
  
 curveVertex(295,cap16-5+el2);
  
 curveVertex(315,1+cap16);
  
 curveVertex(315,1+cap16);
  
 endShape();
  
  
  
 fill(255,102,102);
  
 beginShape(); // right upper eyelid
  
 curveVertex(315,cap16-2);
  
 curveVertex(315,cap16-2);
  
 curveVertex(300,cap16-17);
  
 curveVertex(290,cap16-17);
  
 curveVertex(275,cap16-2);
  
 curveVertex(295,3+cap16+el0);
  
 curveVertex(315,cap16-1);
  
 curveVertex(315,cap16-1);
  
 endShape();
  
  
  
 }
  
  float t1 = 0;
  
  if(v>1000*sensitivity){
  
   t1 = map(v, 1000*sensitivity, 4000*sensitivity, 0, 45);
  
  
  
  
  
  float cap15 = 205+y1;
  
  float t3 = 0;
  
  
  
  if(v>600*sensitivity){
  
  t3 = map(v,600*sensitivity, 10000*sensitivity,0,45);
  
  }
  
  
  
  if (t1>90){
  
    t1=90;
  
  }
  
  if (t3>110){
  
    t3=110;
  
  }
  
  
  
  
  
  if (cap15>301){
  
   cap15 = 301;
  
 }
  
  
  
  
  
 fill(0); // mouth on tongue
  
 pushMatrix ();
  
 translate (250, cap15);
  
 beginShape();
  
 curveVertex(-60, 0);
  
 curveVertex(-60, 0);
  
 curveVertex(-35, 0+t3);
  
 curveVertex(35, 0+t3);
  
 curveVertex(60, 0);
  
 curveVertex(60, 0);
  
 endShape();
  
 popMatrix();
  
  
  
 float w = 0;
  
 float w1 = 0;
  
  
  
 if (v>600*sensitivity){
  
   w = map(v,600*sensitivity,1000*sensitivity,0,45);
  
 }
  
 if (v>600*sensitivity){
  
   w1 = map(v,600*sensitivity,1000*sensitivity,-5,100);
  
 }
  
  
  
 float cap17 = 280+w;
  
 float cap18 = 240+w1;
  
  
  
 if (cap17>320){
  
   cap17=320;
  
 }
  
 if (cap18>325){
  
   cap18=325;
  
 }
  
  
  
 noFill();
  
 beginShape(); //mouth wrinkle
  
 curveVertex(230,cap17+t1+5);
  
 curveVertex(230,cap17+t1+5);
  
 curveVertex(240,cap17+t1+10);
  
 curveVertex(250,cap17+t1);
  
 curveVertex(260,cap17+t1+10);
  
 curveVertex(270,cap17+t1+5);
  
 curveVertex(270,cap17+t1+5);
  
 endShape();
  
  
  
 noFill();
  
 beginShape(); //mouth left wrinkle
  
 curveVertex(190,cap18-27);
  
 curveVertex(190,cap18-27);
  
 curveVertex(180,cap18-22);
  
 curveVertex(185,cap18-15);
  
 curveVertex(185,cap18-15);
  
 endShape();
  
  
  
 noFill();
  
 beginShape(); //mouth right wrinkle
  
 curveVertex(310,cap18-27);
  
 curveVertex(310,cap18-27);
  
 curveVertex(320,cap18-22);
  
 curveVertex(315,cap18-15);
  
 curveVertex(315,cap18-15);
  
 endShape();
  
  
float j0=0;
float j1=0;
  
if(v>450){
  j0=map(v,450,1000,0,20);
}
if(v>450){
  j1=map(v,450,1000,0,40);
}
  
float cap24=410+j0;
float cap25=430+j1;
  
if (cap24>430){
  cap24=430;
}
if(cap25>470){
  cap25=470;
}
  
if(v>450){
 fill(255,200,200);
 stroke(0);
}
else{
  noFill();
  noStroke();
}
  
 beginShape(); //tongue on tongue
 curveVertex(230, 388);
 curveVertex(230, 388);
 /*
 curveVertex(220, 430);
 curveVertex(230, 470);
 curveVertex(270, 470);
 curveVertex(280, 430);
 */
 curveVertex(220, cap24-12);
 curveVertex(230, cap25-12);
 curveVertex(270, cap25-12);
 curveVertex(280, cap24-12);
  
 curveVertex(270, 388);
 curveVertex(250, 383);
  
 curveVertex(230, 387);
 curveVertex(230, 387);
 endShape();
 }
  
 }


