
int hDO=26;
int sDO=91;
int bDO=88;

int hMB=220;
int sMB=73;
int bMB=67;

int hLO=26;
int sLO=99;
int bLO=99;

int hDeO=36;
int sDeO=99;
int bDeO=93;

int hO=34;
int sO=74;
int bO=99;

int ex100=100;
int e100=100;
int ex80=80;
int e80=80;
int ex70=70;
int e70=70;
int ex60=60;
int e60=60;
int ex50=50;
int e50=50;
int ex40=40;
int e40=40;
int ex30=30;
int e30=30;
int ex20=20;
int e20=20;

// still agjust these hues
int hE=286; //hue ellipse of pale pink
int sE=41;
int bE=64;

int hB=265; //hue of pale blue
int sB=38;
int bB=40;

int hY=47; //hue of pale yellow
int sY=70;
int bY=80;

int hG=0; //hue of light grey for loop
int sG=0;
int bG=90;

void setup() {
  size (800,800);
  noStroke();
  colorMode(HSB,360,100,100);
}

void draw() {
background (0,0,99);

for (int x = 0; x <= width; x+=100) {
  for (int y = 0; y <= height; y+=100) {
    fill(hG,sG,bG);
    rect(x,y,100,100);
    
    //bG=random(75,100);
  }
} 

//background colored ellipses
ellipseMode(CENTER);
//r1c1
fill(229,83,34); //dark blue
ellipse(50,50,100,100);
//r2c1
fill(229,83,34); //dark blue
ellipse(50,150,100,100);
//r2c2
fill(34,74,99); //orange
ellipse(150,150,100,100);
//r2c8
fill(229,83,34); //dark blue
ellipse(750,150,100,100);
//r3c1
fill(229,83,34); //dark blue
ellipse(50,250,100,100);
//r3c2
fill(229,83,34); //dark blue
ellipse(150,250,100,100);
//r3c3
fill(229,83,34); //dark blue
ellipse(250,250,100,100);
//r3c6
fill(229,83,34); //dark blue
ellipse(550,250,100,100);
//r3c7
fill(34,74,99); //orange
ellipse(650,250,100,100);
//r3c8
fill(34,74,99); //orange
ellipse(750,250,100,100);
//r4c1
fill(229,83,34); //dark blue
ellipse(50,350,100,100);
//r4c2
fill(229,83,34); //dark blue
ellipse(150,350,100,100);
//r4c6
fill(34,74,99); //orange
ellipse(550,350,100,100);
//r4c7
fill(229,83,34); //dark blue
ellipse(650,350,100,100);
//r4c8
fill(229,83,34); //dark blue
ellipse(750,350,100,100);
//r5c5
fill(34,74,99); //orange
ellipse(450,450,100,100);
//r5c6
fill(34,74,99); //orange
ellipse(550,450,100,100);
//r5c7
fill(34,74,99); //orange
ellipse(650,450,100,100);
//r5c8
fill(229,83,34); //dark blue
ellipse(750,450,100,100);
//r6c5
fill(34,74,99); //orange
ellipse(450,550,100,100);
//r6c6
fill(34,74,99); //orange
ellipse(550,550,100,100);
//r6c7
fill(34,74,99); //orange
ellipse(650,550,100,100);
//r6c8
fill(34,74,99); //orange
ellipse(750,550,100,100);
//r7c3
fill(34,74,99); //orange
ellipse(250,650,100,100);
//r7c4
fill(34,74,99); //orange
ellipse(350,650,100,100);
//r7c5
fill(229,83,34); //dark blue
ellipse(450,650,100,100);
//r7c6
fill(34,74,99); //orange
ellipse(550,650,100,100);
//r7c7
fill(229,83,34); //dark blue
ellipse(650,650,100,100);
//r7c8
fill(229,83,34); //dark blue
ellipse(750,650,100,100);
//r8c3
fill(229,83,34); //dark blue
ellipse(250,750,100,100);
//r8c4
fill(229,83,34); //dark blue
ellipse(350,750,100,100);
//r8c5
fill(229,83,34); //dark blue
ellipse(450,750,100,100);
//r8c6
fill(229,83,34); //dark blue
ellipse(550,750,100,100);
//r8c7
fill(229,83,34); //dark blue
ellipse(650,750,100,100);

//row1
//r1c1
fill(34,74,99); //orange
ellipse(50,50,80,80);
fill(220,73,67); //med. blue
ellipse(50,50,50,50);


//r1c2
fill(hB,sB,bB); //pale blue
ellipse(150,50,100,100);
fill(229,83,34); //dark blue
ellipse(120,20,40,40);
fill(229,83,34); //dark blue
ellipse(160,60,80,80);
fill(220,73,67); //med. blue
ellipse(160,60,50,50);
fill(34,74,99); //orange
ellipse(120,80,30,30);

//r1c3
fill(hB,sB,bB); //pale blue
ellipse(250,50,100,100); 
fill(hE,sE,bE); //pale pink
ellipse(250,50,70,70);
fill(hY,sY,bY); //pale yellow
ellipse(250,50,40,40);

//r1c4
fill(hB,sB,bB); //pale blue
ellipse(350,50,100,100);
fill(hB,sB,bB); //pale blue
ellipse(350,50,50,50);
fill(hY,sY,bY); //pale yellow
ellipse(350,50,20,20);

//r1c5
fill(hB,sB,bB); //pale blue
ellipse(450,50,100,100);
fill(hY,sY,bY); //pale yellow
ellipse(450,50,80,80);
fill(hE,sE,bE); //pale pink
ellipse(450,50,40,40);

//r1c6
fill(hE,sE,bE); //pale pink
ellipse(550,50,60,60);
fill(hY,sY,bY); //pale yellow
ellipse(550,50,20,20);

//r1c7
fill(hB,sB,bB); //pale blue
ellipse(650,50,80,80);
fill(hY,sY,bY); //pale yellow
ellipse(650,50,50,50);
fill(hE,sE,bE); //pale pink
ellipse(650,50,30,30);

//r1c8
fill(hB,sB,bB); //pale blue
ellipse(750,50,100,100);
fill(229,83,34); //dark blue
ellipse(780,80,80,80);
fill(229,83,34); //dark blue
ellipse(730,80,70,70);
fill(0,0,99);
ellipse(720,80,20,20);

//row2
//r2c1
fill(220,73,67); //med. blue
ellipse(50,150,80,80);
fill(34,74,99); //orange
ellipse(70,120,40,40);

//r2c2
fill(229,83,34); //dark blue
ellipse(180,120,40,40);

//r2c3
fill(hY,sY,bY); //pale yellow
ellipse(250,150,100,100);
fill(hE,sE,bE); //pale pink
ellipse(250,150,90,90);
fill(229,83,34); //dark blue
ellipse(240,160,80,80);
fill(220,73,67); //med. blue
ellipse(240,160,40,40);

//r2c4
fill(hY,sY,bY); //pale yellow
ellipse(350,150,100,100);
fill(hB,sB,bB); //pale blue
ellipse(350,150,80,80);
fill(hE,sE,bE); //pale pink
ellipse(350,150,60,60);

//r2c5
fill(hY,sY,bY); //pale yellow
ellipse(450,150,80,80);
fill(hE,sE,bE); //pale pink
ellipse(450,150,60,60);

//r2c6
fill(hB,sB,bB); //pale blue
ellipse(550,150,100,100);
fill(hY,sY,bY); //pale yellow
ellipse(550,150,80,80);
fill(229,83,34); //dark blue
ellipse(580,180,40,40);
fill(0,0,99);
ellipse(580,190,20,20);

//r2c7
fill(229,83,34); //dark blue
ellipse(650,150,100,100);

//r2c8
fill(220,73,67); //med. blue
ellipse(750,150,100,100);
fill(34,74,99); //orange
ellipse(730,180,60,40);

//row3
//r3c1
fill(220,73,67); //med. blue
ellipse(50,250,100,100);
fill(34,74,99); //orange
ellipse(30,270,60,60);

//r3c2
fill(34,74,99); //orange
ellipse(170,220,50,50);

//r3c3
fill(220,73,67); //med. blue
ellipse(250,250,70,70);
fill(34,74,99); //orange
ellipse(210,250,40,40);

//r3c4
fill(229,83,34); //dark blue
ellipse(350,250,100,100);
fill(220,73,67); //med. blue
ellipse(350,250,70,70);
fill(229,83,34); //dark blue
ellipse(330,270,60,60);

//r3c5
fill(hE,sE,bE); //pale pink
ellipse(450,250,100,100);
fill(229,83,34); //dark blue
ellipse(480,270,60,60);
fill(229,83,34); //dark blue
ellipse(430,270,60,60);
fill(220,73,67); //med. blue
ellipse(430,270,30,30);
fill(0,0,99);
ellipse(480,280,40,40);

//r3c6
fill(220,73,67); //med. blue
ellipse(550,250,80,80);
fill(0,0,99);
ellipse(510,210,20,20);
fill(34,74,99); //orange
ellipse(570,240,50,50);

//r3c7
fill(26,99,99); //light orange
ellipse(650,250,100,100);
fill(229,83,34); //dark blue
ellipse(610,210,20,20);

//r3c8
fill(26,99,99); //light orange
ellipse(750,250,100,100);

//row4
//r4c1
fill(220,73,67); //med. blue
ellipse(50,350,100,100);
fill(0,0,99);
ellipse(20,380,40,40);

//r4c2
fill(220,73,67); //med. blue
ellipse(150,350,100,100);
fill(229,83,34); //dark blue
ellipse(150,350,100,100);
fill(220,73,67); //med. blue
ellipse(150,350,50,50);

//r4c3
fill(229,83,34); //dark blue
ellipse(250,350,100,100);

//r4c4
fill(229,83,34); //dark blue
ellipse(350,350,100,100);

//r4c5
fill(34,74,99); //orange 
ellipse(460,370,80,80);
fill(229,83,34); //dark blue
ellipse(430,330,60,60);
fill(220,73,67); //med. blue
ellipse(430,330,40,40);
fill(229,83,34); //dark blue
ellipse(480,380,40,40);

//r4c6
fill(229,83,34); //dark blue
ellipse(550,370,60,60);

//r4c7
fill(220,73,67); //med. blue
ellipse(650,350,100,100);
fill(34,74,99); //orange
ellipse(630,330,60,60);

//r4c8
fill(220,73,67); //med. blue
ellipse(750,350,100,100);
fill(34,74,99); //orange
ellipse(720,320,40,40);
fill(26,99,99); //light orange
ellipse(730,380,60,40);

//row5
//r5c1
fill(hB,sB,bB); //pale blue
ellipse(50,450,100,100);
fill(hY,sY,bY); //pale yellow
ellipse(50,450,60,60);
fill(229,83,34); //dark blue
ellipse(80,480,40,40);
fill(220,73,67); //med. blue
ellipse(80,480,20,20);
fill(229,83,34); //dark blue
ellipse(90,410,30,30);

//r5c2
fill(229,83,34); //dark blue
ellipse(150,450,100,100);

//r5c3
fill(229,83,34); //dark blue
ellipse(250,450,100,100);

//r5c4
fill(229,83,34); //dark blue
ellipse(350,450,100,100);
fill(220,73,67); //med. blue
ellipse(350,450,70,70);

//r5c5
fill(229,83,34); //dark blue
ellipse(410,420,30,30);
fill(229,83,34); //dark blue
ellipse(410,470,30,30);

//r5c6
fill(26,99,99); //light orange
ellipse(550,450,100,100);

//r5c7
fill(26,99,99); //light orange
ellipse(650,450,100,100);
fill(229,83,34); //dark blue
ellipse(690,410,20,20);
fill(220,73,67); //med. blue
ellipse(690,410,10,10);

//r5c8
fill(220,73,67); //med. blue
ellipse(750,450,80,80);
fill(34,74,99); //orange
ellipse(720,480,40,40);

//row6
//r6c1
fill(229,83,34); //dark blue
ellipse(50,550,100,100);

//r6c2
fill(229,83,34); //dark blue
ellipse(150,550,100,100);

//r6c3
fill(229,83,34); //dark blue
ellipse(250,550,100,100);
fill(220,73,67); //med. blue
ellipse(260,550,80,80);
fill(229,83,34); //dark blue
ellipse(220,520,40,40);
fill(220,73,67); //med. blue
ellipse(220,520,20,20);

//r6c4
fill(229,83,34); //dark blue
ellipse(350,550,100,100);
fill(220,73,67); //med. blue
ellipse(350,550,70,70);
fill(34,74,99); //orange
ellipse(389,570,40,60);

//r6c5
fill(229,83,34); //dark blue
ellipse(450,550,100,100);
fill(220,73,67); //med. blue
ellipse(450,550,50,50);

//r6c6
fill(229,83,34); //dark blue
ellipse(540,560,80,80);
fill(220,73,67); //med. blue
ellipse(540,560,30,30);

//r6c7
fill(229,83,34); //dark blue
ellipse(670,510,30,30);

//r6c8
fill(26,99,99); //light orange
ellipse(750,550,100,100);

//row7
//r7c1
fill(229,83,34); //dark blue
ellipse(50,650,100,100);

//r7c2
fill(hY,sY,bY); //pale yellow
ellipse(150,650,100,100);
fill(229,83,34); //dark blue
ellipse(130,620,40,40);
fill(220,73,67); //med. blue
ellipse(130,620,10,10);
fill(229,83,34); //dark blue
ellipse(180,650,40,100);

//r7c3
fill(26,99,99); //light orange
ellipse(220,620,40,40);
fill(36,99,93); //deep orange
ellipse(280,620,40,40);

//r7c4
fill(26,99,99); //light orange
ellipse(350,650,100,100);
fill(229,83,34); //dark blue
ellipse(370,610,30,30);

//r7c5
fill(220,73,67); //med. blue
ellipse(450,650,80,80);
fill(34,74,99); //orange
ellipse(420,480,40,40);

//r7c6
fill(26,99,99); //light orange
ellipse(520,630,50,50);
fill(229,83,34); //dark blue
ellipse(580,640,80,80);

//r7c7
fill(220,73,67); //med. blue
ellipse(650,650,100,100);

//r7c8
fill(220,73,67); //med. blue
ellipse(750,650,100,100);
fill(34,74,99); //orange
ellipse(720,620,40,40);

//row8
//r8c1
fill(hY,sY,bY); //pale yellow
ellipse(50,750,100,100);
fill(hB,sB,bB); //pale blue
ellipse(50,750,80,80);
fill(hE,sE,bE); //pale pink
ellipse(50,750,60,60);
fill(229,83,34); //dark blue
ellipse(20,720,40,40);

//r8c2
fill(hE,sE,bE); //pale pink
ellipse(150,750,100,100);
fill(229,83,34); //dark blue
ellipse(170,730,60,60);
fill(220,73,67); //med. blue
ellipse(170,730,40,40);
fill(229,83,34); //dark blue
ellipse(150,770,60,60);

//r8c3
fill(220,73,67); //med. blue
ellipse(250,750,100,100);
fill(34,74,99); //orange
ellipse(250,750,100,100);

//r8c4
fill(220,73,67); //med. blue
ellipse(350,750,80,80);
fill(34,74,99); //orange
ellipse(350,750,100,100);

//r8c5
fill(220,73,67); //med. blue
ellipse(450,750,80,80);
fill(34,74,99); //orange
ellipse(450,750,100,100);

//r8c6
fill(220,73,67); //med. blue
ellipse(550,750,100,100);
fill(34,74,99); //orange
ellipse(510,770,20,40);
fill(26,99,99); //light orange
ellipse(570,730,60,60);

//r8c7
fill(220,73,67); //med. blue
ellipse(650,750,100,100);
fill(34,74,99); //orange
ellipse(620,720,40,40);

//r8c8
fill(hB,sB,bB); //pale blue
ellipse(750,750,100,100);
fill(hY,sY,bY); //pale yellow
ellipse(750,750,60,60);
fill(229,83,34); //dark blue
ellipse(710,770,40,40);
fill(229,83,34); //dark blue
ellipse(770,710,30,30);

//all dark orange ellipses
fill(hDO,sDO,bDO);
ellipseMode(CENTER);
ellipse(50,50,ex60,e60);
ellipse(550,320,ex50,e50);
ellipse(460,450,ex60,e60);
ellipse(550,450,ex60,e60);
ellipse(650,450,ex80,e80);
ellipse(750,550,ex80,e80);
ellipse(350,650,ex80,e80);
ellipse(250,750,ex60,e60);

//all medium blue ellipses
fill(hMB,sMB,bMB);
ellipseMode(CENTER);
ellipse(180,120,ex20,e20);
ellipse(650,150,ex50,e50);
ellipse(330,270,ex20,e20);
ellipse(230,360,ex30,e30);
ellipse(350,350,ex70,e70);
ellipse(150,450,ex30,e30);
ellipse(250,450,ex70,e70);
ellipse(50,550,ex50,e50);
ellipse(150,550,ex40,e40);
ellipse(50,650,ex50,e50);
ellipse(180,650,ex20,e50);
ellipse(580,640,ex30,e30);
ellipse(20,720,ex20,e20);
ellipse(150,770,ex30,e30);

//all light orange ellipses
fill(hLO,sLO,bLO);
ellipseMode(CENTER);
ellipse(130,160,ex80,e80);
ellipse(770,180,ex60,e40);
ellipse(70,280,ex60,e40);
ellipse(120,280,ex40,e40);
ellipse(680,380,ex40,e40);
ellipse(770,430,ex60,e60);
ellipse(310,590,ex20,e20);
ellipse(420,580,ex40,e40);
ellipse(570,530,ex60,e60);
ellipse(650,550,ex100,e100);
ellipse(230,670,ex60,e60);
ellipse(470,630,ex60,e60);
ellipse(770,630,ex60,e60);
ellipse(350,750,ex60,e60);
ellipse(450,750,ex40,e40);
ellipse(680,680,ex40,e40);

//all deep orange ellipses
fill(hDeO,sDeO,bDeO);
ellipseMode(CENTER);
ellipse(620,250,ex50,e50);
ellipse(740,270,ex30,e30);
ellipse(770,370,ex60,e60);
ellipse(580,780,ex40,e40);

//all orange ellipses
fill(hO,sO,bO);
ellipseMode(CENTER);
ellipse(90,310,ex20,e20);
ellipse(120,320,ex40,e40);
ellipse(380,450,ex40,e40);
ellipse(290,590,ex20,e20);
ellipse(680,620,ex40,e40);

//makes ellipse diameters grow along x and y axis
ex100=map(mouseY,0,height,100,80);
ex80=map(mouseY,0,height,80,100);
ex70=map(mouseY,0,height,70,90);
ex60=map(mouseY,0,height,60,80);
ex50=map(mouseY,0,height,50,70);
ex40=map(mouseY,0,height,40,60);
ex30=map(mouseY,0,height,30,50);
ex20=map(mouseY,0,height,20,40);


 if (mouseX<width/2) {
    bDO=bDO+1;
    bMB=bMB+1;
    bLO=bLO+1;
    bDeO=bDeO+1;
    bO=bO+1;
  }
  else {
    bDO=bDO-1;
    bMB=bMB-1;
    bLO=bLO-1;
    bDeO=bDeO-1;
    bO=bO-1;
  }
  
 if (mouseY<height/2) {
    sDO=sDO+1;
    sMB=sMB+1;
    sLO=sLO+1;
    sDeO=sDeO+1;
    sO=sO+1;
  }
  else {
    sDO=sDO-1;
    sMB=sMB-1;
    sLO=sLO-1;
    sDeO=sDeO-1;
    sO=sO-1;
  }
  
  bDO=constrain(bDO,50,90);
  bMB=constrain(bMB,50,90);
  bLO=constrain(bLO,50,90);
  bDeO=constrain(bDeO,50,90);
  bO=constrain(bO,50,90);
  sDO=constrain(sDO,50,90);
  sMB=constrain(sMB,50,90);
  sLO=constrain(sLO,50,90);
  sDeO=constrain(sDeO,50,90);
  sO=constrain(sO,50,90);

}



