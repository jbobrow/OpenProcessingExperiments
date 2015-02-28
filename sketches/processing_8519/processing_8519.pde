
int windowFill = 2;
int windowR = 0;
int windowG = 0;
int windowB = 0;
int starOneX = 50;
int starOneY = 25;
int starTwoX = 200;
int starTwoY = 50;
int starThreeX = 300;
int starThreeY = 75;
int starFourX = 400;
int starFourY = 100;
int starFiveX = 475;
int starFiveY = 25;
int starSixX = 525;
int starSixY = 100;
int starSevenX = 612;
int starSevenY = 137;
int starEightX = 650;
int starEightY = 25;
int starR = 0;
int starG = 0;
int starB = 0;
int starFill = 2;
int creatureSpeed = 25;
int creatureOriginY = 230;
boolean flight = false;
int creatSpeed = 2;
int creatOneY = 230;
int creatOneX = 5;
int creatTwoX = 50;
int creatTwoY = 125;
int creatThreeX = 100;
int creatThreeY = 200;
int creatFourX = 150;
int creatFourY = 125;
int creatFiveX = 225;
int creatFiveY = 225;
int creatSixX = 325;
int creatSixY = 225;
int creatSevenX = 400;
int creatSevenY = 200;
int moonX = 770;
int moonY = 25;
int moonWidth = 50;
int moonSpeedX = -3;
int moonSpeedY = 2;

void setup() {
  size(800,450);
  background(24,38,106);
  smooth();
}



void draw() {
  //UpperBackground
  fill(24,38,106);
quad(800,0,800,287.5,0,287.5,0,0); 

rectMode(CENTER); 
 fill(0);
rect(creatTwoX,creatTwoY,random(2,5),random(2,5));//creatureTwo
rect(creatFourX,creatFourY,random(2,5),random(2,5));//creatureFour


 if (keyPressed){
    flight = true;
  }
  if (flight){
    creatOneY = creatOneY - creatSpeed; 
    creatOneX = creatOneX + creatSpeed;
    creatTwoY = creatTwoY - creatSpeed; 
    creatTwoX = creatTwoX + creatSpeed;
    creatThreeY = creatThreeY - creatSpeed; 
    creatThreeX = creatThreeX + creatSpeed;
    creatFourY = creatFourY - creatSpeed; 
    creatFourX = creatFourX + creatSpeed;
    creatFiveY = creatFiveY - creatSpeed; 
    creatFiveX = creatFiveX + creatSpeed;
    creatSixY = creatSixY - creatSpeed; 
    creatSixX = creatSixX + creatSpeed;
    creatSevenY = creatSevenY - creatSpeed; 
    creatSevenX = creatSevenX + creatSpeed;
  }
 if (creatOneY <= 0){
 creatOneY=230;
 creatOneX=5;
 creatTwoX=50;
 creatTwoY=125;
 creatThreeX = 100;
 creatThreeY = 200;
 creatFourX = 150;
 creatFourY = 125;
 creatFiveX = 225;
 creatFiveY = 225;
 creatSixX = 325;
 creatSixY = 225;
 creatSevenX = 400;
 creatSevenY = 200;
 flight = false;
}
 
 

  
   //Stars
starR = starR + starFill;
starG = starG + starFill;
starB = starB + starFill;

   fill(constrain(starR,0,186),constrain(starG,0,187),constrain(starB,0,146)); //GradualStarFill
  ellipse(starOneX,starOneY,5,random(1,10));
  ellipse(starTwoX,starTwoY,5,random(1,10));
  ellipse(starThreeX,starThreeY,5,random(1,10));
  ellipse(starFourX,starFourY,5,random(1,10));
  ellipse(starFiveX,starFiveY,5,random(1,10));
  ellipse(starSixX,starSixY,5,random(1,10));
  ellipse(starSevenX,starSevenY,5,random(1,10));
  ellipse(starEightX,starEightY,5,random(1,10));
  
//Sky
 for(int ellipWidth = 100; ellipWidth < width*2; ellipWidth+=40) {
   noFill();
    ellipse(770,25,ellipWidth,ellipWidth);
 }
 
 //LowerBackground
 fill(24,38,106);
 noStroke();
 quad(800,250,800,450,0,450,0,250);
 
//Moon
stroke(0);
strokeWeight(random(0,2));
fill(220,209,25);
ellipse(moonX,moonY,moonWidth,moonWidth);

  //River
  noStroke();
  fill(35,70,156,random(200,255));
  ellipse(550,375,50,15);
  ellipse(575,350,50,15);
  ellipse(625,437.5,50,15);
  ellipse(625,412.5,50,15);
  fill(186,187,146);
  ellipse(575,400,50,15);
  ellipse(600,387.5,50,15);
  ellipse(537.5,312.5,50,15);
  ellipse(512.50,387.5,50,15);
  ellipse(525,300,50,15);
  ellipse(560,312,50,15);
  ellipse(480,430,50,15);
  ellipse(525,400,50,15);
  ellipse(587.5,425,50,15);
  fill(18,13,56,random(200,255));
  ellipse(525,362.5,50,15);
  ellipse(525,325,50,15);
  ellipse(587.5,362.5,50,15);
  ellipse(550,450,50,15);
  ellipse(650,450,50,15);
  ellipse(625,400,50,15);
  ellipse(587.5,445,50,15);
  ellipse(550,325,50,15);
  ellipse(525,345,50,15);
  ellipse(550,425,50,15);



//RightBank

if(keyPressed){   //CityShake
strokeWeight(random(0,2));
} else {
  strokeWeight(0);
}


stroke(18,13,56);
line(450,87.5,450,125);
line(687.5,100,687.5,125);
stroke(18,13,56);//LeftCityScape
fill(18,13,56);
rectMode(CENTER);
rect(450,193.25,100,62.5);
rect(450,156.25,50,12.5);
rect(450,143.75,25,12.5);
rect(450,137.5,12.5,25);
rect(512.5,200,25,50);
rect(537.5,212.5,25,25);
rect(562.5,218.75,25,12.5);
triangle(500,225,575,225,575,250);
rect(612.5,237.5,75,25);


rect(650,206.25,25,87.5);//RightCityScape
rect(687.5,200,50,100);
rect(737.5,187.5,50,125);
rect(781.25,200,37.5,100);
rect(687.5,143.75,25,12.5);
rect(687.5,131.25,12.5,12.5);
quad(625,250,800,250,800,275,625,262.5);

stroke(18,13,56);
quad(400,223,500,223,500,287.5,400,287.5); //BankShade
quad(500,225,525,225,525,287.5,500,287.5);
quad(525,225,625,225,625,375,525,287.5);
quad(625,275,650,300,650,400,625,375);
quad(650,312.5,675,375,675,450,650,400);
quad(675,400,700,425,700,450,675,450);



stroke(18,13,56);
fill(18,13,56);
quad(650,300,800,275,800,300,650,337.5); //StairShade
quad(675,375,800,337.5,800,375,675,400);
quad(700,425,800,400,800,450,700,450);

//BridgeHeadRight
stroke(0);
fill(35,70,156);
quad(625,175,637.5,187.5,637.5,263.5,625,275);
fill(27,43,120);
beginShape();
vertex(625,275);
vertex(625,175);
vertex(575,200);
vertex(587.5,250);
vertex(600,250);
vertex(587.5,212.5);
vertex(600,200);
vertex(612.5,190);
vertex(612.5,262.5);
endShape(CLOSE);
noStroke();//BridgeHeadShadow
fill(12,8,36);
beginShape(); 
vertex(612.5,190);
vertex(600,200);
vertex(587.5,212.5);
vertex(600,250);
vertex(600,212.5);
vertex(612.5,200);
endShape(CLOSE);
fill(12,8,36);
quad(600,250,625,275,575,332,550,307);//BridgeShadow

//Bridge
fill(27,43,120);//light
beginShape();
triangle(600,250.5,612.5,253,612.5,263);
quad(600,250,612.5,262.5,500,362.5,500,325);
fill(12,8,36);
quad(612.5,262.5,612.5,269,500,369,500,362.5);

//LeftBank
fill(24,38,106);
quad(475,375,500,375,550,450,475,450);
quad(425,337.5,475,337.5,475,375,425,375);

stroke(0); //BridgeHead
line(425,337.5,475,337.5);
line(500,375,550,450);
fill(35,70,156);//highlight
quad(500,250,500,375,475,387.5,475,275);
fill(27,43,120);//midtone
quad(412.5,237,500,250,475,275,412.5,250);
fill(35,70,156);//highlight
quad(437.5,337.5,425,362.5,425,287.5,437.5,300);
quad(425,287.5,455,280,460,287.5,437.5,300);
noStroke();
fill(18,13,56);//Shadow
quad(475,387.5,450,375,462.5,300,475,275);
quad(425,287.5,425,362.5,412.5,362.5,412,287.5);
beginShape();
vertex(412.5,250);
vertex(475,275);
vertex(462.5,300);
vertex(450,280);
vertex(425,287.5);
vertex(412.5,287.5);
endShape(CLOSE);
//CastShadows
quad(450,375,500,375,500,450,425,450);
quad(425,362.5,375,450,225,450,312.5,350);
quad(175,325,225,350,75,450,0,450);
triangle(175,325,0,450,0,375);

//BuildingsRightSide
//Shadows
stroke(0);
fill(35,70,156);
quad(50,75,75,87.5,75,250,50,250);//EightLeft

rectMode(CENTER); 
 fill(0);
rect(creatSevenX,creatSevenY,random(2,5),random(2,5));//creatureSven

fill(18,13,56);
quad(375,150,375,375,337.5,375,337.5,175);//OneRight
quad(350,300,375,325,375,400,350,375);//TwoRight
quad(275,370,300,370,300,400,275,425);//FourRight
quad(230,125,240,325,212.5,325,212.5,137.5);//OneLeft
quad(200,175,200,275,175,275,175,175);//FourLeft
quad(200,175,187.5,175,187.5,162.5,200,162.5);
quad(200,150,200,162.5,193.75,162.5,193.75,150);
quad(150,75,150,250,125,250,125,100);//SixLeft
quad(50,75,50,250,12.5,250,12.5,100);//EightLeft
quad(25,250,25,400,0,387.5,0,250);//NineLeft
quad(50,175,100,175,100,400,50,375);//TenLeft
quad(75,137.5,87.5,125,87.5,137.5,75,150);
quad(62.5,150,87.5,137.5,87.5,175,62.5,175);
line(87.5,100,87.5,125);
//Highlights
fill(35,70,156);
quad(375,150,412.5,187.5,412.5,362.5,375,400);//OneRight
quad(375,287.5,400,300,375,325,350,300);//TwoRight

rectMode(CENTER); //creatureSix
 fill(0);
rect(creatSixX,creatSixY,random(4,7),random(4,7));

fill(35,70,156);
quad(325,200,325,400,300,387.5,300,225);//ThreeRight
quad(300,350,300,370,275,370,262.5,362.5);//FourRight
quad(300,250,300,262.5,287.5,270,287.5,262.5);//SixRight
quad(275,150,260,275,240,275,230,125);//OneLeft

quad(275,250,275,300,262.5,312.5,262.5,240);//TwoLeft
fill(18,13,56);//Shadow
quad(262.5,240,262.5,312.5,250,325,250,240);//TwoLeft
fill(35,70,156);

quad(250,250,262.5,262.5,262.5,312.5,250,325);//ThreeLeft
quad(225,175,225,275,200,275,200,175);//FourLeft
quad(200,162.5,212.5,162.5,212.5,175,200,175);
quad(200,150,206.25,150,206.25,162.5,200,162.5);
line(200,125,200,150);

rectMode(CENTER); 
 fill(0);
 rect(creatFiveX,creatFiveY,random(4,7),random(4,7));//creatureFive
 
fill(35,70,156);
quad(225,200,250,225,250,325,225,350);//FiveLeft
quad(225,187.5,237.5,200,237.5,212.5,225,200);
fill(18,13,56);//Shadow
quad(225,200,225,350,175,325,175,250);//FiveLeft
quad(225,200,200,225,200,200,225,187.5);
fill(35,70,156);

quad(150,75,175,100,175,250,150,250);//SixLeft
quad(175,200,200,250,175,370,150,375);//SevenLeft

rectMode(CENTER); //CreatureThree
 fill(0);
 rect(creatThreeX,creatThreeY,random(4,7),random(4,7));//creatureThree

fill(18,13,56);//Shadow
quad(50,175,100,175,100,400,50,375);//TenLeft
quad(175,200,150,375,125,375,125,237.5);//SevenLeft
fill(35,70,156);

quad(50,225,50,375,25,400,25,250);//NineLeft
quad(100,175,125,200,125,375,100,400);//TenLeft
quad(87.5,137.5,112.5,162.5,112.5,187.5,87.5,175);
quad(87.5,125,100,137.5,100,150,87.5,137.5);

rectMode(CENTER); //creatureOne
 fill(0);
rect(creatOneX,creatOneY,random(4,7),random(4,7));

//CastShadows
fill(20,32,88);
quad(325,200,350,225,350,390,325,400);//ThreeRight
quad(300,275,300,325,275,300,275,290);//EightRight
noStroke();
quad(412.5,250,412,300,400,300,375,287.5);//OneRight
quad(412.5,300,412.5,362.5,400,375,400,300);
quad(151,200,175,175,175,200,151,220);//SixLeft
quad(125,237.5,125,375,100,400,100,275);//TenLeft
stroke(0);
//Midtones
fill(27,43,120);
quad(400,300,400,375,375,400,375,325);//TwoRight
quad(262.5,362.5,275,370,275,425,262.5,412.5);//FourRight
quad(300,287.5,300,350,287.5,325,287.5,300);//FiveRight
quad(300,262.5,300,275,280,287.5,280,275);//SevenRight
quad(0,225,50,225,25,250,0,250);//NineLeft

//windows
fill(constrain(windowR,0,220),constrain(windowG,0,209),constrain(windowB,0,25)); //WindowFill
quad(25,100,30,100,30,112.5,25,112.5);//EightLeft
quad(25,150,25,162.5,20,162.5,20,150);
quad(25,200,20,200,20,187.5,25,187.5);
quad(35,125,40,125,40,135,35,135);
quad(30,162,35,162,35,177,30,177);
quad(13,275,20,275,20,300,13,300); //NineLeft
quad(13,325,13,350,6,350,6,325);
quad(75,200,75,225,65,225,65,200); //TenLeft
quad(75,250,85,250,85,275,75,275);
quad(60,300,70,300,70,325,60,325);
quad(150,237.5,150,262.5,140,262.5,140,237.5); //SevenLeft
quad(150,300,150,325,140,325,140,300);
quad(210,225,220,225,220,250,210,250); //FiveLeft
quad(200,275,210,275,210,300,200,300);
quad(282,387.5,293,380.5,292,400,282,412.5);//FourRight
quad(360,325,370,335,370,360,360,350); //TwoRight
quad(130,110,135,105,135,120,130,125); //SixLeft
quad(137.5,139,141.5,139,141.5,150,137.5,150);
quad(130,165,135,165,135,175,130,175);
quad(137.5,190,141.5,190,141.5,200,137.5,200);
quad(330,310,335,310,335,325,330,325);//ThreeRight
quad(335,350,340,350,340,365,335,365);
quad(330,235,335,235,335,250,330,250);
quad(340,275,345,275,345,290,340,290);
quad(350,175,357,175,357,195,350,195);//OneRight
quad(360,212,367,212,367,225,360,225);
quad(357,250,364,250,364,262.5,357,262.5);
  
  //WindowLights
 windowR = windowR + windowFill;
 windowG = windowG + windowFill;
 windowB = windowB + windowFill;
 
 if (windowR <= 0 && windowG <= 0 && windowB <= 0){
   windowR = 0;
   windowG = 0;
   windowB = 0;
   windowFill = 0;
 }
 

if (mouseX < 425 && mouseX > 0) {
  windowFill = 2;
windowFill = abs(windowFill);
} 
if (mouseY < 75 || mouseY > 425){
  windowFill = 2;
windowFill = windowFill*-1;
}

  
  if (mousePressed && mouseX > 750 && mouseY < 50){
  moonY = moonY + moonSpeedY;
  moonX = moonX + moonSpeedX;

  }
  if (mousePressed && moonY + moonWidth/2 >= 250) {
    moonSpeedY = moonSpeedY*-1;
  }
 
  if(mousePressed && mouseX < 50 && mouseY < 50){
    moonX = 770;
    moonY = 25;
    moonSpeedY = abs(moonSpeedY);
  }
}


