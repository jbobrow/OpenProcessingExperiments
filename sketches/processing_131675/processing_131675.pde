
// James Robe
// NMD 295
// "My tree House" 1-22-14
//the following code is code design assistor
Sun s1 = new Sun(1,1); 
HLine h1 = new HLine(1,1); 
HLine h2 = new HLine(1,1); 
HLine h3 = new HLine(1,1); 
HLine h4 = new HLine(1,1); 
HLine h5 = new HLine(1,1); 
HLine h6 = new HLine(1,1); 
HLine h7 = new HLine(1,1); 
HLine h8 = new HLine(1,1); 
//Cloud2 c1 = new Cloud2(50, 2.5);
int numberShape = 1;
int number = 0;
float light1 = 0;
float light = 0;


//the following code is a code deisng assistor

color skyblue = #3BB9FF; //color of sky
color grassgreen = #659D32; //color of grass
color treebrown = #8A3324; //tree color
color treebrown1 = #53350A; // tree outline color
color sandybrown = #CC9933; //wood color for house
color indigo = #0147FA; // roof top peice and house color
color supportwood = #AA6600;
color windowd = #CDC5BF; //window day color
void setup()
{
  size(1000,900);
  // sets the static background color for sky. 
 
}

void draw()
{
  
  //below code is a coding assistor
 
 //above code is a coding assistor
 
  smooth(4);
   background(skyblue);
   s1.update();
    h1.update(); 
  h2.update(); 
    h3.update(); 
  h4.update();
    h5.update(); 
  h6.update(); 
    h7.update(); 
  h8.update(); 
//  c1.update();
 // drawing cloud function

   
   
   
   
  //this shape is the large ground green mass. 
  noStroke();
  fill(grassgreen);
beginShape();
vertex(0.0, 509.0);
bezierVertex(-22.0, 682.0, -65.0, 503.0, 0.0, 509.0);
bezierVertex(65.0, 515.0, 292.0, 528.0, 431.0, 599.0);
bezierVertex(570.0, 670.0, 550.0, 651.0, 631.0, 658.0);
bezierVertex(712.0, 665.0, 661.0, 637.0, 787.0, 627.0);
bezierVertex(913.0, 617.0, 999.0, 555.0, 1000.0, 559.0);
bezierVertex(1001.0, 563.0, 1001.0, 966.0, 1000.0, 975.0);
bezierVertex(999.0, 984.0, 3.0, 983.0, 0.0, 985.0);
bezierVertex(-3.0, 987.0, 1.0, 529.0, 0.0, 509.0);
endShape();

//master shift and translate function



scale(.5,.5);
translate(800,800);

// this is the code to draw the tree
fill(treebrown);
strokeWeight(2);
stroke(treebrown1);

beginShape();
vertex(812.0, 762.0);
bezierVertex(983.0, 749.0, 812.0, 762.0, 812.0, 762.0);
bezierVertex(812.0, 762.0, 816.0, 761.0, 814.0, 751.0);
bezierVertex(812.0, 741.0, 816.0, 651.0, 812.0, 645.0);
bezierVertex(808.0, 639.0, 807.0, 531.0, 801.0, 526.0);
bezierVertex(795.0, 521.0, 799.0, 510.0, 786.0, 503.0);
bezierVertex(773.0, 496.0, 768.0, 497.0, 730.0, 499.0);
bezierVertex(692.0, 501.0, 606.0, 490.0, 595.0, 484.0);
bezierVertex(584.0, 478.0, 479.0, 479.0, 455.0, 472.0);
bezierVertex(431.0, 465.0, 348.0, 453.0, 339.0, 446.0);
bezierVertex(330.0, 439.0, 305.0, 404.0, 333.0, 407.0);
bezierVertex(361.0, 410.0, 348.0, 410.0, 385.0, 420.0);
bezierVertex(422.0, 430.0, 411.0, 423.0, 448.0, 428.0);
bezierVertex(485.0, 433.0, 467.0, 435.0, 506.0, 433.0);
bezierVertex(545.0, 431.0, 594.0, 443.0, 649.0, 437.0);
bezierVertex(704.0, 431.0, 700.0, 437.0, 724.0, 439.0);
bezierVertex(748.0, 441.0, 813.0, 438.0, 809.0, 437.0);
bezierVertex(805.0, 436.0, 808.0, 308.0, 812.0, 265.0);
bezierVertex(816.0, 222.0, 815.0, 188.0, 816.0, 159.0);
bezierVertex(817.0, 130.0, 812.0, -30.0, 810.0, -30.0);
bezierVertex(808.0, -30.0, 884.0, -34.0, 884.0, -34.0);
bezierVertex(884.0, -34.0, 910.0, 215.0, 908.0, 188.0);
bezierVertex(906.0, 161.0, 914.0, 345.0, 913.0, 379.0);
bezierVertex(912.0, 413.0, 929.0, 528.0, 929.0, 539.0);
bezierVertex(929.0, 550.0, 975.0, 723.0, 975.0, 733.0);
bezierVertex(975.0, 743.0, 978.0, 770.0, 978.0, 770.0);
bezierVertex(978.0, 770.0, 813.0, 764.0, 813.0, 764.0);
endShape();

beginShape();
vertex(702.0, 770.0);
bezierVertex(697.0, 750.0, 702.0, 770.0, 702.0, 770.0);
bezierVertex(702.0, 770.0, 686.0, 729.0, 662.0, 723.0);
bezierVertex(638.0, 717.0, 627.0, 722.0, 614.0, 723.0);
bezierVertex(601.0, 724.0, 601.0, 725.0, 592.0, 733.0);
bezierVertex(583.0, 741.0, 583.0, 740.0, 572.0, 751.0);
bezierVertex(561.0, 762.0, 559.0, 776.0, 559.0, 776.0);
bezierVertex(559.0, 776.0, 550.0, 786.0, 553.0, 792.0);
bezierVertex(556.0, 798.0, 578.0, 792.0, 578.0, 792.0);
bezierVertex(578.0, 792.0, 581.0, 779.0, 584.0, 776.0);
bezierVertex(587.0, 773.0, 600.0, 770.0, 600.0, 770.0);
bezierVertex(600.0, 770.0, 618.0, 764.0, 624.0, 766.0);
bezierVertex(630.0, 768.0, 649.0, 775.0, 649.0, 775.0);
bezierVertex(649.0, 775.0, 648.0, 776.0, 648.0, 776.0);
bezierVertex(648.0, 776.0, 699.0, 770.0, 699.0, 770.0);
bezierVertex(699.0, 770.0, 703.0, 769.0, 703.0, 769.0);
endShape();


////////////////////building supports
fill(supportwood);
stroke(treebrown1);
strokeWeight(2);


//peices of wood at the very bottom of house
beginShape();
vertex(370,414);
vertex(775,414);
vertex(775,424);
vertex(370,424);
vertex(370,414);
endShape();

rect(775,414, 10, 60);
rect(370,414, 10, 60);

//support beams branching from the ground
rect(422,711,30, -288);

beginShape();
vertex(440,511);
vertex(545,423);
vertex(579,422);
vertex(439,539);
vertex(440,511);
endShape();

//building side supports
rect(366,170,30,254);
rect(765,170,-30,254);

////////////////////////end of building supports

//front wall
fill(indigo);
noStroke();
beginShape();
vertex(398,160);
vertex(734,193);
vertex(734,413);
vertex(398,413);
vertex(398,160);
endShape();

///////windows
fill(windowd);
stroke(supportwood);
strokeWeight(3);
//ellipse(662,294,80,80);
////cross window lines 
//line(663,257,663,335);
//line(623,295,702,295);
//
//ellipse(16,294,80,80);
////cross window lines 
//line(16,257,663,335);
//line(623,295,702,295);
rect(413,216, 90, 100, 50);
rect(625,216, 90, 100, 50);

//door
fill(#FF4500);
stroke(#0EBFE9);
beginShape();
vertex(523.0, 412.0);
bezierVertex(523.0, 412.0, 523.0, 412.0, 523.0, 412.0);
bezierVertex(523.0, 412.0, 523.0, 308.0, 523.0, 308.0);
bezierVertex(523.0, 308.0, 523.0, 279.0, 561.0, 280.0);
bezierVertex(599.0, 281.0, 594.0, 309.0, 594.0, 309.0);
bezierVertex(594.0, 309.0, 594.0, 412.0, 594.0, 412.0);
bezierVertex(594.0, 412.0, 524.0, 412.0, 524.0, 412.0);
endShape();

ellipse(584,360,20,20);

//railway
stroke(treebrown1);
strokeWeight(1);
fill(supportwood);

rect(410,414,10,-60);
rect(440,414,10,-65);
rect(470,414,10,-64);
rect(500,414,10,-57);
rect(530,414,10,-54);
rect(560,414,10,-50);
rect(590,414,10,-48);
rect(620,414,10,-47);

beginShape();
vertex(411.0, 342.0);
bezierVertex(358.0, 353.0, 411.0, 342.0, 411.0, 342.0);
bezierVertex(411.0, 342.0, 463.0, 344.0, 463.0, 344.0);
bezierVertex(463.0, 344.0, 579.0, 361.0, 579.0, 361.0);
bezierVertex(579.0, 361.0, 644.0, 367.0, 644.0, 367.0);
bezierVertex(644.0, 367.0, 653.0, 375.0, 653.0, 375.0);
bezierVertex(653.0, 375.0, 603.0, 380.0, 603.0, 380.0);
bezierVertex(603.0, 380.0, 503.0, 366.0, 503.0, 366.0);
bezierVertex(503.0, 366.0, 438.0, 358.0, 438.0, 358.0);
bezierVertex(438.0, 358.0, 396.0, 358.0, 396.0, 358.0);
bezierVertex(396.0, 358.0, 383.0, 341.0, 383.0, 341.0);
bezierVertex(383.0, 341.0, 410.0, 341.0, 410.0, 341.0);
endShape();



//knotted rope
beginShape();
noFill();
strokeWeight(15);
stroke(#F5F5F5); //white smoke color
curveVertex(707,404);
curveVertex(724,411);
curveVertex(707,464);
curveVertex(703,555);
curveVertex(719,609);
curveVertex(722,668);
curveVertex(711,744);
curveVertex(711,744);
endShape();

ellipse(707,404, 10,10);
ellipse(724,411, 9,9);
ellipse(707,464, 7,7);
ellipse(703,555, 12,12);
ellipse(719,609, 10,10);
ellipse(711,744, 9, 9);






//the roof
fill(sandybrown);
stroke(treebrown1);
strokeWeight(2);
beginShape();
vertex(552.0, 35.0);
bezierVertex(563.0, 33.0, 607.0, 31.0, 552.0, 35.0);
bezierVertex(497.0, 39.0, 379.0, 77.0, 331.0, 138.0);
bezierVertex(283.0, 199.0, 793.0, 214.0, 793.0, 194.0);
bezierVertex(793.0, 174.0, 570.0, 16.0, 552.0, 35.0);
endShape();

//roof lines
noFill();
curve(-512, 58, 560, 37, 374, 174, 366, 142);
curve(250, 20, 674, 96, 512, 194, 366, 142);
curve(650, 20, 751, 154, 692, 201, 800, 142);
curve(500,-100, 505, 44, 559, 40, 200, 0);

//roof peice
fill(indigo);
beginShape();
vertex(537.0, 45.0);
bezierVertex(537.0, 45.0, 537.0, 45.0, 537.0, 45.0);
bezierVertex(537.0, 45.0, 581.0, 45.0, 581.0, 45.0);
bezierVertex(581.0, 45.0, 563.0, 21.0, 566.0, 26.0);
bezierVertex(569.0, 31.0, 559.0, 2.0, 559.0, 2.0);
bezierVertex(559.0, 2.0, 551.0, 26.0, 551.0, 26.0);
bezierVertex(551.0, 26.0, 535.0, 45.0, 535.0, 45.0);
endShape();

// code for tree leafs

scale(1.5, 1.8);
translate(-320,-405);
fill(#008000);
stroke(#5DFC0A);
strokeWeight(5);

beginShape();
vertex(722.0, 392.0);
bezierVertex(806.0, 391.0, 741.0, 357.0, 722.0, 392.0);
bezierVertex(703.0, 427.0, 656.0, 389.0, 656.0, 389.0);
bezierVertex(656.0, 389.0, 605.0, 327.0, 548.0, 320.0);
bezierVertex(491.0, 313.0, 425.0, 251.0, 477.0, 205.0);
bezierVertex(529.0, 159.0, 477.0, 107.0, 564.0, 77.0);
bezierVertex(651.0, 47.0, 615.0, 16.0, 672.0, 52.0);
bezierVertex(729.0, 88.0, 812.0, -5.0, 868.0, 85.0);
bezierVertex(924.0, 175.0, 858.0, 37.0, 974.0, 98.0);
bezierVertex(1090.0, 159.0, 1006.0, 203.0, 1104.0, 145.0);
bezierVertex(1202.0, 87.0, 1172.0, 228.0, 1151.0, 272.0);
bezierVertex(1130.0, 316.0, 1030.0, 249.0, 1065.0, 313.0);
bezierVertex(1100.0, 377.0, 1035.0, 331.0, 1027.0, 404.0);
bezierVertex(1019.0, 477.0, 1000.0, 385.0, 950.0, 464.0);
bezierVertex(900.0, 543.0, 868.0, 467.0, 868.0, 467.0);
bezierVertex(868.0, 467.0, 784.0, 469.0, 795.0, 432.0);
bezierVertex(806.0, 395.0, 768.0, 410.0, 765.0, 396.0);
bezierVertex(762.0, 382.0, 721.0, 404.0, 721.0, 393.0);
endShape();








// house supports that go form ground to the house supporting it. 


//beginShape();
//vertex(993.0, 755.0);
//bezierVertex(993.0, 755.0, 993.0, 755.0, 993.0, 755.0);
//bezierVertex(993.0, 755.0, 788.0, 746.0, 788.0, 746.0);
//bezierVertex(788.0, 746.0, 790.0, 652.0, 786.0, 646.0);
//bezierVertex(782.0, 640.0, 786.0, 539.0, 780.0, 534.0);
//bezierVertex(774.0, 529.0, 776.0, 513.0, 763.0, 506.0);
//bezierVertex(750.0, 499.0, 689.0, 481.0, 646.0, 475.0);
//bezierVertex(603.0, 469.0, 490.0, 496.0, 490.0, 496.0);
//bezierVertex(490.0, 496.0, 406.0, 489.0, 395.0, 483.0);
//bezierVertex(384.0, 477.0, 350.0, 466.0, 326.0, 456.0);
//bezierVertex(302.0, 446.0, 209.0, 447.0, 185.0, 440.0);
//bezierVertex(161.0, 433.0, 116.0, 429.0, 107.0, 422.0);
//bezierVertex(98.0, 415.0, 78.0, 389.0, 102.0, 397.0);
//bezierVertex(126.0, 405.0, 119.0, 394.0, 156.0, 404.0);
//bezierVertex(193.0, 414.0, 276.0, 408.0, 313.0, 413.0);
//bezierVertex(350.0, 418.0, 364.0, 419.0, 387.0, 430.0);
//bezierVertex(410.0, 441.0, 433.0, 442.0, 448.0, 446.0);
//bezierVertex(463.0, 450.0, 524.0, 437.0, 573.0, 409.0);
//bezierVertex(622.0, 381.0, 673.0, 387.0, 696.0, 384.0);
//bezierVertex(719.0, 381.0, 752.0, 390.0, 766.0, 394.0);
//bezierVertex(780.0, 398.0, 799.0, 405.0, 795.0, 404.0);
//bezierVertex(791.0, 403.0, 793.0, 315.0, 797.0, 272.0);
//bezierVertex(801.0, 229.0, 791.0, 196.0, 792.0, 167.0);
//bezierVertex(793.0, 138.0, 787.0, -24.0, 787.0, -24.0);
//bezierVertex(787.0, -24.0, 894.0, -28.0, 894.0, -28.0);
//bezierVertex(894.0, -28.0, 920.0, 221.0, 918.0, 194.0);
//bezierVertex(916.0, 167.0, 939.0, 349.0, 938.0, 383.0);
//bezierVertex(937.0, 417.0, 959.0, 549.0, 959.0, 549.0);
//bezierVertex(959.0, 549.0, 959.0, 581.0, 969.0, 637.0);
//bezierVertex(979.0, 693.0, 995.0, 756.0, 995.0, 756.0);
//endShape();

light = map(angle, 270, 360, 255,0);

scale(1,1);
translate(0,0);
//degScale = map(y,270,360,255,0);
//
//fill(0, 0, 0, map(y, 150, 300, 0, 100));
//if (angle > 180 && angle < 270)
//{
//for (int f = 0; f < 100; f = f + 1)
//{
//light = map(f, 0, 100, 150, 0); 
//println(f);
//}
//}
//
//if (angle > 270 && angle < 360)
//{
//for (int f = 100; f > 0; f = f - 1)
//{
//light = map(f, 0, 100, 150, 0);  
//} 
//}

    if(angle > 180 && angle <= 270){
     
    light = map(angle, 180, 270, 200, 0);
  

     
  } 
  if(angle > 270 && angle <= 360){
     
    light = map(angle, 270, 360, 0, 200);
     
  } 
  
  if (angle >= 0 && angle <= 180)
  {
    light = 200;
  }
//  if (angle > 360);
//  {
//   light = 255;
//  }

// attempt here we go


//y = sin(radians(angle)) * radius;
//fill(0,0,0, map(y, 700, -100, 250, 0) * 1.2);
fill(0,0,0, light);
rect(-300,-200, 2000, 2000);
}


//drawing assistor

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == ALT)
    {
   println("point number" + "[" + number + "]" + "(" + mouseX + "," + mouseY + ")");
      number = number + 1;
}
if (keyCode == UP)
{
  println();
  println("New Shape" + "(" + numberShape + ")");
  numberShape = 1 + numberShape;
}
  
  }
}




class HLine { 
float y = random(0, 400);
float speed = random(.001, 1);
float scale = random(8, 15);
float scale1 = random(8, 15);
float cx1 = random(-10,0);
 float cy1 = random(-10,0);
  float cx2 = random(0,10);
  float cy2 = random(-10,-20);
  float cx3 = random(10,20);
 float cy3 = random(-10, -20);
  float cx4 = random(20,10);
 float cy4 = random(-10,0);
  float cx5 = random(10,0);
float cy5 = random(0,5);
float cc1 = random(-10,0);
 float cv1 = random(-10,0);
  float cc2 = random(0,10);
  float cv2 = random(-10,-20);
  float cc3 = random(10,20);
 float cv3 = random(-10, -20);
  float cc4 = random(20,10);
 float cv4 = random(-10,0);
  float cc5 = random(10,0);
float cv5 = random(0,5);
int d = -1;
float circR = random(10,70);
float cloudCount;
boolean once = true;
  HLine (float y, float s) {  

  } 
  void update() { 
    if (once == true)
    {
    cloudCount = scale * random(-30, -400);
    
  } 
  once =  false;
 
 
       if (cloudCount < 1000)
   {
     noStroke();
     fill(255, 255, 255, 120);
     beginShape();
     curveVertex(cloudCount, y);
     curveVertex(cloudCount, y);
     curveVertex(cloudCount + (cx1 * scale), y + (cy1 * scale));
     curveVertex(cloudCount + (cx2 * scale), y + (cy2 * scale));
     curveVertex(cloudCount + (cx3 * scale), y + (cy3 * scale));
     curveVertex(cloudCount + (cx4 * scale), y + (cy4 * scale));
     curveVertex(cloudCount + (cx5 * scale), y + (cy5 * scale));
     curveVertex(cloudCount, y);
     curveVertex(cloudCount, y);
   endShape();
   if (circR > 0)
   {
   ellipse(cloudCount * circR/(circR/5), y * circR/(circR/5), circR/(circR/5), circR/(circR/5));
   }
    beginShape();
     curveVertex(cloudCount, y);
     curveVertex(cloudCount, y);
     curveVertex(cloudCount + (cc1 * scale1), y + (cv1 * scale1));
     curveVertex(cloudCount + (cc2 * scale1), y + (cv2 * scale1));
     curveVertex(cloudCount + (cc3 * scale1), y + (cv3 * scale1));
     curveVertex(cloudCount + (cc4 * scale1), y + (cv4 * scale1));
     curveVertex(cloudCount + (cc5 * scale1), y + (cv5 * scale1));
     curveVertex(cloudCount, y);
     curveVertex(cloudCount, y);
   endShape();
   cloudCount = cloudCount + speed;
   }
   
    if (cloudCount >= 1000 )
   {
     circR = random(-200,200);
 cloudCount = scale * random(-30, -400);
   y = random(0, 400);
   speed = random(.01, 1);
   scale = random(8, 15);
 cx1 = random(-10,0);
 cy1 = random(-10,0);
 cx2 = random(0,10);
 cy2 = random(-10,-20);
 cx3 = random(10,20);
 cy3 = random(-10, -20);
 cx4 = random(20,10);
 cy4 = random(-10,0);
 cx5 = random(10,0);
 cy5 = random(0,5);
 
  scale1 = random(8, 15);
 cc1 = random(-10,0);
 cv1 = random(-10,0);
 cc2 = random(0,10);
 cv2 = random(-10,-20);
 cc3 = random(10,20);
 cv3 = random(-10, -20);
 cc4 = random(20,10);
 cv4 = random(-10,0);
 cc5 = random(10,0);
 cv5 = random(0,5);


   }
  } 
} 



class Cloud2 { 
  float cloudCount = 1000;
float y = random(0, 400);
float speed = random(.001, 1);
float scale = random(1, 8);
float cx1 = random(-10,0);
 float cy1 = random(-10,0);
  float cx2 = random(0,10);
  float cy2 = random(-10,-20);
  float cx3 = random(10,20);
 float cy3 = random(-10, -20);
  float cx4 = random(20,10);
 float cy4 = random(-10,0);
  float cx5 = random(10,0);
float cy5 = random(0,5);
int d = -1;
  Cloud2 (float y, float s) {  

  } 
  void update() { 
 
       if (cloudCount > 0)
   {
     noStroke();
     fill(255);
     beginShape();
     curveVertex(cloudCount, y);
     curveVertex(cloudCount, y);
     curveVertex(cloudCount + (cx1 * scale), y + (cy1 * scale));
     curveVertex(cloudCount + (cx2 * scale), y + (cy2 * scale));
     curveVertex(cloudCount + (cx3 * scale), y + (cy3 * scale));
     curveVertex(cloudCount + (cx4 * scale), y + (cy4 * scale));
     curveVertex(cloudCount + (cx5 * scale), y + (cy5 * scale));
     curveVertex(cloudCount, y);
     curveVertex(cloudCount, y);
   endShape();
   cloudCount = cloudCount - speed;
   }
   
    if (cloudCount <= 0 )
   {
   cloudCount = 1000;
   y = random(0, 400);
   speed = random(.01, 1);
   scale = random(5, 15);
 cx1 = random(-10,0);
 cy1 = random(-10,0);
 cx2 = random(0,10);
 cy2 = random(-10,-20);
 cx3 = random(10,20);
 cy3 = random(-10, -20);
 cx4 = random(20,10);
 cy4 = random(-10,0);
 cx5 = random(10,0);
 cy5 = random(0,5);


   }
  } 
} 
 
 float angle = 0;
float radius = 500;
int day = 60;
float inc = .00416 * day;
float x = cos(radians(angle)) * radius;
float y = sin(radians(angle)) * radius;
float shade = y;

 class Sun { 

  Sun (float a, float b) {  

  } 
  void update() { 
  float x = cos(radians(angle)) * (radius + 150) + 500;
  float y = sin(radians(angle)) * (radius - 50) + 650;
  fill(253, 184, 19);
  noStroke();
  ellipse(x, y, 100, 100);
    fill(253, 184, 19, 50);
   ellipse(x, y, 200, 200);
    ellipse(x, y, 400, 400);
  angle += inc;
  shade = y;
  if (angle > 360)
  {
    light = 255;
    angle = 0;
  }
//  if (angle >= 360)
//  {
//    angle = 0;
//  }
//  
//  if (shade == 900)
//  {
//   for (x = 0; x  
//  }
//  
  

  }
 }



