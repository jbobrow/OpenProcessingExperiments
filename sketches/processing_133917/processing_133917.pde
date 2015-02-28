
// James Robe
// NMD 295
// "My tree House" 1-22-14
//the following code is code design assistor

moon t1 = new moon();
Sun s1 = new Sun(); 
Cloud c1 = new Cloud(); 
Cloud c2 = new Cloud(); 
Cloud c3 = new Cloud(); 
Cloud c4 = new Cloud(); 
Cloud c5 = new Cloud(); 
Cloud c6 = new Cloud(); 
Cloud c7 = new Cloud(); 
Cloud c8 = new Cloud(); 


int numberShape = 1;
int number = 0;
float light1 = 0;
float light = 0;

int cChange;

ArrayList<Stars> manyStars;
ArrayList<fireflies> manyFlies;


// within the following are the color variables for all of 
// the colors I use within this simulation

color skyblue = #3BB9FF; //color of sky
color grassgreen = #659D32; //color of grass
color treebrown = #8A3324; //tree color
color treebrown1 = #53350A; // tree outline color
color sandybrown = #CC9933; //wood color for house
color indigo = #0147FA; // roof top peice and house color
color supportwood = #AA6600;
color door = #FF4500;
color rope = #F5F5F5;
color treeL = #008000;

// window color values
color windowDay = color(255, 255, 155); //window day color
color windowNight = color(255, 255, 155);//night window color

void setup()
{ 
  
  size(1000,900); // pretty self explanitory
  
  ///////////////////////////////////////////
  // set's up the array list for the star class
   manyStars = new ArrayList<Stars>();
  // in the beginning 500 star objects are added to the array
  // many stars, it asigns each of them a permanent location
    for (int i = 0; i <= 700; i += 1)
  {
    float starY = random(0, 1000);
    float starX = random(0, 1000);
    manyStars.add(new Stars(starX, starY));
  }
  /////////////////////////////////////////////
  manyFlies = new ArrayList<fireflies>();
  
  for (int i = 0; i <= 30; i += 1){
  float fireX = random(0, 1000);
  float fireY = random(450, 1000);
  manyFlies.add(new fireflies(fireX, fireY));
  }
  /////////////////////////////////////////////
  //set's up a firefly array list
  
}

void draw()
{
    background(skyblue);
    smooth(4);
  
  // says go count up to as many items that are in the array list
  // many stars and run the function run.  Run simply is a umbrella
  // function that runs a bunch of other function
  for(int i=0; i<manyStars.size(); i++){
  Stars currentStars = manyStars.get(i);
  currentStars.run();
  }
  
  
 
 
  // creating all of my cloud classes,  sun class,  and moon class
   
   t1.update(); // moon
   s1.update(); // sun
   
   // clouds,  I have 8
   c1.update(); 
   c2.update(); 
   c3.update(); 
   c4.update();
   c5.update(); 
   c6.update(); 
   c7.update(); 
   c8.update(); 


   
   
   
////////////////////////////////////////////////////////
//hard coded values for the background scenery
//this shape is the large ground green mass for the grass. 
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

//door
fill(door);
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
fill(treeL);
noStroke();
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
//end of background scenery
///////////////////////////////////////////////////////

///////////////////////////////////////////////////////
// if statements that control the overal lighting color commands

light = map(angle, 270, 360, 255,0); // light value simple

scale(1,1);
translate(0,0);


    if(angle > 180 && angle <= 270){
     
    light = map(angle, 180, 270, 225, 0);
  

     
  } 
  if(angle > 270 && angle <= 360){
     
    light = map(angle, 270, 360, 0, 225);
     
  } 
  
  if (angle >= 0 && angle <= 180)
  {
    light = 225;
  }

if (light > 130)
{  
skyblue = color(59 - (light - 20), 185 - (light - 90), 255 - (light - 120));
grassgreen = color(101 - (light - 50) , 157 - (light - 100), 50 - (light - 25));
treebrown = color(138 - (light - 80) , 51 - (light - 25), 36 - (light - 12)); //tree color
treebrown1 =  color(83 - (light - 25) , 53 - (light - 25), 10 - (light - 5)); // tree outline color
sandybrown = color(204 - (light - 100) , 153 - (light - 75), 51 - (light - 25)); //wood color for house
indigo = color(1, 71 - (light - 35), 250 - (light - 125)); // roof top peice and house color
supportwood = color(170 - (light - 90), 102 - (light - 50), 0);
door = color(255 - (light - 125), 69 - (light - 34), 0);
treeL = color(30, 158 - (light - 114), 30);
rope = color(245 - (light));
}


//fill(0,0,70, map(light, 0, 255, 0, 240));
//rect(-300,-200, 2000, 2000);

///////windows
color windowDay = color(192, 192, 192); //window day color
color windowNight = color(255, 152, 44); 
color windowSleep = color(0, 0, 0);

if (angle >= 150 && angle < 200)
{
  cChange = windowNight;
}

if (angle >= 150 && angle < 200 || angle > 320 && angle < 20)
{
  cChange = windowNight;
}

if (angle > 200 && angle <= 320)
{
  cChange = windowDay;
}

if (angle >= 20 && angle < 150)
{
  cChange = windowSleep;
}


fill(cChange);

noStroke();
strokeWeight(3);
rect(590, 540, 70, 50, 30);
rect(730, 540, 70, 50, 30);

for(int i=0; i<manyFlies.size(); i++){
  fireflies currentFly = manyFlies.get(i);
  currentFly.run();
  }

}

void keyPressed(){
  if (key=='f'){
    float fire1x = random(0,1000);
    float fire1y = random(0,1000);
    manyFlies.add(new fireflies(fire1x, fire1y));
  }
}










 // master angle variable,  controls the sine functions
 // for both the moon and the sun
 //  all of the below variables control the sin and cos 
float angle = 0;
float radius = 500;
int day = 24; // day in multiplyer
float inc = .00416 * day; // set's angle inc to be realistic to day





//////////////////////////////////////////// 
  class moon { 
    // x and y position control var for moon
float xM = sin(radians(angle)) * radius;
float yM = cos(radians(angle)) * radius;
  moon () {  

  } 
  void update() { 
//eliptical position control   
xM = cos(radians(angle + 180)) * (radius + 150) + 500;
yM = sin(radians(angle + 180)) * (radius) + 650;

// draw actual moon
fill(255);
arc(xM, yM, 80, 80, radians(50), radians(290), CHORD);

// draw out outer moon ellipses
fill(255, 255, 255, 25);
ellipse(xM, yM, 600, 600);
  }
 }
 
////////////////////////////////////////////

 class Sun { 
// x and y position control var for moon
float x = cos(radians(angle)) * radius;
float y = sin(radians(angle)) * radius;

  Sun () {  
  } 
  
  void update() { 
// updates x and y control points according to the angle var  
 x = cos(radians(angle)) * (radius + 150) + 500;
 y = sin(radians(angle)) * (radius) + 650;

// actual sun center  
  fill(253, 184, 19);
  noStroke();
  ellipse(x, y, 100, 100);
    
    
// outer sun rings
fill(253, 184, 19, 50);
ellipse(x, y, 200, 200);
ellipse(x, y, 400, 400);
    
// controls the angle variable,  setting it to zero if it exceeds
// 360
    if (angle > 360)
  {
    angle = 0; 
  }
  // increments the angle var by the time inc
  angle += inc;
  }
 }
 
 ////////////////////////////////////////////
 

 

 




class Cloud { 
float y = random(0, 400);
float speed = random(1, 4);
float scale = random(8, 15);
float scale1 = random(8, 15);

// initailizes random size for part 1 of cloud
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

// initailizes random size for part 2 of cloud
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


// the speed of the clouds
float cloudCount;

// controls the once run thing that makes the location of the cloud randon
boolean once = true;
  Cloud () {  

  } 
  
  void update() { 
    // tells each cloud to go to a random location on or off the screen. 
    //this only happense once when the simulation is started
    if (once == true)
    {
    cloudCount = random(-400, 1000);
    once =  false;
  } 
   
 
 // if the cloud if 
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

 cloudCount = scale * random(-30, -400);
 y = random(0, 500);
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


class fireflies{
int savedTime;
int totalTime = 5000 + int(random(8000));
float j,k;
boolean once = true;
int change = 1;
color firefly;
int count = millis();
float speedx = random(-1,1);
float speedy = random(-1,1);
float randomY = random(1000, 550);
float randomX = random(width);

 fireflies(float parameterX, float parameterY) { 
 j = parameterX;
 k = parameterY;


  } 
  
   void run(){
   makeFire();
   move();
   time();
   }
   
   void makeFire()
   {
     if (once == true){
     firefly = color(234 + random(-100, 100), 228 + random(-100, 100), 12 + random(-100, 100)); 
     once =  false;
     }

   if (light > 150) { 
     
   if (change >= 1)
   {
    fill(firefly, light - 50);
   }
   else {
     noFill();
   }
   }
   else {
     noFill();
   }
   
   noStroke();
   ellipse(j,k, 7, 7);
  }
   
  
  void move(){
  k += speedx;
  j += speedy;
  
  if (random(50) < 1){
    speedx = random(-1, 1);
    speedy = random(-1, 1);
    speedx *= -1;
    speedy *= -1;
    
  }
  }
  
void time()
{
  int passedTime = millis() - savedTime;
if (passedTime > totalTime) {
 change *= -1;
    savedTime = millis(); 
  }
}
    
  }


class Stars{
 float d, c;
float size; 
float  r = random(50);
float  j = random(50);
float k = random(50);
 Stars(float parameterX, float parameterY) { 
 
d = parameterX;
c = parameterY;
size = random(0,10);
  } 
  
   void run(){
   makeStars();
   }
   
   void makeStars()
   {
     d = d + random(-.1, .1);
     c = c + random(-.1, .1);
    
    if (random(10) < 1)
   {
     r = random(100, 200);
     j = random(100, 200);
     k = random(100, 200);
    } 
    else
    {
     r = 0;
     j = 0;
     k = 0; 
    }


    fill(255 - r, 255 - j, 255 - k, light - 100);
    noStroke();
    ellipse(d,c,size,size);
  }
 }



 

 






