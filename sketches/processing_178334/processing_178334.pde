
//declare variables
//image variables have i at the end of them for clarity
PImage foxi;
PImage butterflyi;
PImage ducki;
PImage back;
PImage treefishi;
PImage snakei;
PImage owli;
PImage otteri;
PImage otterfishi;
PImage squirreli;
PImage muskrati;
PImage lilypaddragonflyi;
PImage beaveri;
PImage ferreti;
PImage turtlei;
PImage mouseonei;
PImage mousetwoi;
PImage mousethreei;
PImage mousefouri;
PImage rightbutterflyi;
PImage cranei;
PImage flowerbutterflyi;
PImage berrysonbushi;
PImage berrysinwateri;
PImage berryfishi;
PImage nofoxi;
PImage noleftbutterflyi;
PImage nopostmousei;
PImage nosquirreli;
PImage nobeaveri;
PImage nowatermousei; 
PImage notreemousei;
PImage norightmousei;
PImage nootterfishi;
PImage norightbutterflyi;
PImage starti;
PImage finishi;

//int variables to mark an object as having been clicked on

int mouse1 = 0;
int mouse2 = 0;
int mouse3 = 0;
int mouse4 = 0;
int crane = 0;
int ferret = 0;
int otter = 0;
int owl = 0;
int muskrat = 0;
int beaver = 0;
int snake = 0;
int fox = 0;
int duck = 0;
int squirell = 0;
int turtle = 0;
int butterfly = 0;
int rightbutterfly = 0;
int flowerbutterfly = 0;
int berryfish = 0;
int treefish = 0;
int berrys = 0;
int lilypaddragonfly = 0;
int otterfish = 0;
int berrysinwater = 0;
int start = 0;
int finish = 0;

//setup code determines the size and assigns image files to PImages
void setup() {
  size(1280, 720);
  starti = loadImage("start.png");
  finishi = loadImage("finish.png");
  back = loadImage("basebackgroung.png");
  //because the image files already have the upper left origin point in their name they will be
 //be displayed in the correct position when their origin coordinates are 0,0 

  foxi = loadImage("28,285,fox.png");
  cranei = loadImage("1124,324,crane.png");
  ducki = loadImage("28,384,duck.png");
  butterflyi = loadImage("108,203,butterfly.png");
  snakei = loadImage("264,556,snake.png");
  treefishi = loadImage("416,441treefish.png");
  owli = loadImage("431,263,owl.png");
  otteri = loadImage("454,552,otter.png");
  otterfishi = loadImage("623,616,otterfish.png");
  squirreli = loadImage("626,49,squirell.png");
  muskrati = loadImage("796,466,muskrat.png");
  lilypaddragonflyi = loadImage("830,582,lilypaddragonfly.png");
  ferreti = loadImage("957,371,ferret.png");
  beaveri = loadImage("964,482,beaver.png");
  turtlei = loadImage("1116,622,turtle.png");
  flowerbutterflyi = loadImage("1132,556,flowerbutterfly.png");
  rightbutterflyi = loadImage("1045,111,rightbutterfly.png");
  mouseonei = loadImage("976,424,mouse1.png");
  mousetwoi = loadImage("991,420,mouse2.png");
  mousethreei = loadImage("1012,422,mouse3.png");
  mousefouri = loadImage("996,431mouse4.png");
  berrysonbushi = loadImage("265,320,berrysonbush.png");
  berrysinwateri = loadImage("249,319,berrysinwater.png");
  berryfishi = loadImage("242,319,berrysfishinwater.png");
  nofoxi = loadImage("24,254,nofox.png");
  noleftbutterflyi = loadImage("147,174,noleftbutterfly.png");
  nopostmousei = loadImage("163,258,nopostmouse.png");
  nosquirreli = loadImage("604,40,nosquirell.png");
  nobeaveri = loadImage("1024,418,nobeaver.png");
  nowatermousei = loadImage("962,696,nowatermouse.png");
  notreemousei = loadImage("279,90,notreemouse.png");
  norightmousei = loadImage("1197,472,norightmouse.png");
  nootterfishi = loadImage("683,609,nootterfish.png");
  norightbutterflyi = loadImage("1092,87,norightbutterfly.png");
  
  }
//checks to see if an int is 1 if it is draws the corresponding PImage variable to the screen
void draw() {
  //displays instructions
  image(starti, 0, 0);
  //starts game
 if(start == 1)image(back, 0, 0); 
 
if(fox == 1){ image(foxi, 0, 0); image(nofoxi, 0, 0);}
if(otter == 1){ image(otteri, 0, 0);}
if(crane == 1){ image(cranei, 0, 0); }
if(mouse1 == 1){ image(mouseonei, 0, 0); image(nopostmousei, 0, 0);}
if(mouse2 == 1){ image(mousetwoi, 0, 0); image(notreemousei, 0, 0);}
if(mouse3 == 1){ image(mousethreei, 0, 0); image(nowatermousei, 0, 0);}
if(mouse4 == 1){ image(mousefouri, 0, 0); image(norightmousei, 0, 0);}
if(butterfly == 1){ image(butterflyi, 0, 0); image(noleftbutterflyi, 0, 0);}
if(beaver == 1){ image(beaveri, 0, 0); image(nobeaveri, 0, 0);}
if(muskrat == 1){ image(muskrati, 0, 0);}
if(turtle == 1){ image(turtlei, 0, 0);}
if(ferret == 1){ image(ferreti, 0, 0);}
if(flowerbutterfly == 1){ image(flowerbutterflyi, 0, 0);}
if(rightbutterfly == 1){ image(rightbutterflyi, 0, 0); image(norightbutterflyi, 0, 0);}
if(squirell == 1){ image(squirreli, 0, 0); image(nosquirreli, 0, 0);}
if(lilypaddragonfly == 1){ image(lilypaddragonflyi, 0, 0);}
if(otterfish == 1){ image(otterfishi, 0, 0); image(nootterfishi, 0, 0);}
if(owl == 1){ image(owli, 0, 0);}
if(treefish == 1){ image(treefishi, 0, 0);}
if(snake == 1){ image(snakei, 0, 0);}
if(duck == 1){ image(ducki, 0, 0);}
if(berrys == 1){ image(berrysinwateri, 0, 0);}
if(berryfish == 1){ image(berryfishi, 0, 0);}
//checks to see if all animals have been found if they have displays wend screen
if((fox == 1) && (crane == 1) && (berryfish == 1) && (butterfly == 1) && (flowerbutterfly == 1) && (treefish == 1) && (owl == 1) && (squirell == 1) && (muskrat == 1) && (lilypaddragonfly == 1)
&& (rightbutterfly == 1) && (ferret == 1) && (beaver == 1) && (duck == 1) && (snake == 1) && (turtle == 1) && (otter == 1)){ image(finishi, 0, 0);}
}  
  

//everytime the mouse is clicked the code checks the mouse coordinates to see if it happened in one of 
//the clickable areas if it did it changes the corresponding int to 1, several can only change to one
//if other ints are already one e.g otter
void mouseClicked(){
if(( mouseX > 28 ) && ( mouseX < 53 ) && (mouseY > 269) && (mouseY < 280)){ fox = 1;}
if((mouseX > 1166) && (mouseX < 1180) && (mouseY > 323) && (mouseY < 342)){ crane = 1;}
if((mouseX > 249 ) && (mouseX < 298 ) && (mouseY > 375 ) && (mouseY < 400 ) && (berrys == 1)){ berrysinwater = 1;}
if((mouseX > 249 ) && (mouseX < 298 ) && (mouseY > 375 ) && (mouseY < 400 ) && (berrysinwater == 1)){ berryfish = 1;}
if((mouseX > 152 ) && (mouseX < 166 ) && (mouseY > 181 ) && (mouseY < 192 )){ butterfly = 1;}
if((mouseX > 287 ) && (mouseX < 307 ) && (mouseY > 95 ) && (mouseY < 108 )){ mouse2 = 1;}
if((mouseX > 431 ) && (mouseX < 442 ) && (mouseY > 466 ) && (mouseY < 494 )){ treefish = 1;}
if((mouseX > 439 ) && (mouseX < 453 ) && (mouseY > 278 ) && (mouseY < 306 )){ owl = 1;}
if((mouseX > 604 ) && (mouseX < 620 ) && (mouseY > 43 ) && (mouseY < 60 )){ squirell = 1;}
if((mouseX > 795 ) && (mouseX < 845 ) && (mouseY > 371 ) && (mouseY < 419 )){ muskrat = 1;}
if((mouseX > 846 ) && (mouseX < 871 ) && (mouseY > 590 ) && (mouseY < 616 )){ lilypaddragonfly = 1;}
if((mouseX > 973 ) && (mouseX < 997 ) && (mouseY > 700 ) && (mouseY < 713 )){ mouse3 = 1;}
if((mouseX > 971 ) && (mouseX < 995 ) && (mouseY > 372 ) && (mouseY < 392 ) && (mouse1 == 1) && (mouse2 == 1) && (mouse3 == 1) && (mouse4 == 1)){ ferret = 1;}
if((mouseX > 1020 ) && (mouseX < 1037 ) && (mouseY > 418 ) && (mouseY < 442 )){ beaver = 1;}
if((mouseX > 1092 ) && (mouseX < 1112 ) && (mouseY > 105 ) && (mouseY < 120 )){ rightbutterfly = 1;}
if((mouseX > 1143 ) && (mouseX < 1161 ) && (mouseY > 560 ) && (mouseY < 584 )){ flowerbutterfly = 1;}
if((mouseX > 1199 ) && (mouseX < 1210 ) && (mouseY > 479 ) && (mouseY < 492 )){ mouse4 = 1;}
if((mouseX > 690 ) && (mouseX < 719 ) && (mouseY > 621 ) && (mouseY < 640 )){ otterfish = 1;}
if((mouseX > 265 ) && (mouseX < 321 ) && (mouseY > 319 ) && (mouseY < 366 )){ berrys = 1;}
if((mouseX > 182 ) && (mouseX < 208 ) && (mouseY > 266 ) && (mouseY < 307 )){ mouse1 = 1;}
if((mouseX > 58 ) && (mouseX < 80 ) && (mouseY > 392 ) && (mouseY < 412 )){ duck = 1;}
if((mouseX > 284 ) && (mouseX < 296 ) && (mouseY > 661 ) && (mouseY < 708 )){ snake = 1;}
if((mouseX > 525 ) && (mouseX < 542 ) && (mouseY > 668 ) && (mouseY < 694 ) && (otterfish == 1)){ otter = 1;}
if((mouseX > 1124 ) && (mouseX < 1142 ) && (mouseY > 685 ) && (mouseY < 698 )){ turtle = 1;}

}
//checks to see if user has clicked and started game
void mouseReleased(){
  start = 1;
}

