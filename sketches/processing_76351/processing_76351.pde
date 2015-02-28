
import sprites.*;

Sprite wario;

int value=0;
int numFrames = 92; 
int frame=0;
int timer=15;
int timeLast=0;
float bx=50;
float by=307;
float bxx=420;
float toplugX=100;
float toplugY=324;
float handleX=120;
float handleY=339;
float cargoX=110;
float cargoY=336;
float playerposX=100;
float playerposY=327;
float MeteorX=150;
float MeteorXX=152;
float MeteorY=112;

float MeteorY2=110;
float MeteorX2=300;

float MeteorX0=76;
float MeteorY0=110;

float MeteorY3=110;
float MeteorX3=230;

float PebbleX=254;
float PebbleY=196;
float WarioX=110;
float WarioY=340;
float z=0;
PImage[] images = new PImage[numFrames];
PImage img;
PImage img2;
PImage img3;
PImage winner;
PImage lose;
PImage bg;
PImage keya;
PFont font;
PImage img6;
boolean b=true;

void setup() {
  
  bg = loadImage("bg 5.gif");
  frameRate(30);
  background(255);
  timeLast=second();
  font = loadFont("Bauhaus93-48.vlw");
  textFont(font, 32);
  text("WARIOOO", 20, 50);
  size(500, 500);
  fill(155); 
  rect(100, 280, 319, 140); 
  wario = new Sprite(this, "wariowalk1.png", 1, 1, 50);
  wario.setXY(WarioX,WarioY);
  wario.startImageAnim(-1, 2, 1.8);

  registerPre(this);

  fill(255, 255, 0);
  rect(418, 307, 150, 113);


  img3 = loadImage("wario2.png");
  img = loadImage("keya.png");
  img6 = loadImage("deya.png");

  images[0]  = loadImage("1(201).jpg");
  images[1]  = loadImage("1(200).jpg");
  images[2]  = loadImage("1(199).jpg");
  images[3]  = loadImage("1(198).jpg");
  images[4]  = loadImage("1(197).jpg");
  images[5]  = loadImage("1(196).jpg");
  images[6]  = loadImage("1(195).jpg");
  images[7]  = loadImage("1(194).jpg");
  images[8]  = loadImage("1(201).jpg");
  images[9]  = loadImage("1(200).jpg");
  images[10]  = loadImage("1(199).jpg");
  images[11]  = loadImage("1(198).jpg");
  images[12]  = loadImage("1(197).jpg");
  images[13]  = loadImage("1(196).jpg");
  images[14]  = loadImage("1(195).jpg");
  images[15]  = loadImage("1(194).jpg");
  images[16]  = loadImage("1(193).jpg");
  images[17]  = loadImage("1(192).jpg");
  images[18]  = loadImage("1(191).jpg");
  images[19]  = loadImage("1(190).jpg");
  images[20]  = loadImage("1(189).jpg");
  images[21]  = loadImage("1(188).jpg");
  images[22]  = loadImage("1(187).jpg");
  images[23]  = loadImage("1(186).jpg");
  images[24]  = loadImage("1(185).jpg");
  images[25]  = loadImage("1(184).jpg");
  images[26]  = loadImage("1(183).jpg");
  images[27]  = loadImage("1(182).jpg");
  images[28]  = loadImage("1(181).jpg");
  images[29]  = loadImage("1(180).jpg");
  images[30]  = loadImage("1(179).jpg");
  images[31]  = loadImage("1(178).jpg");
  images[32]  = loadImage("1(177).jpg");
  images[33]  = loadImage("1(176).jpg");
  images[34]  = loadImage("1(175).jpg");
  images[35]  = loadImage("1(174).jpg");
  images[36]  = loadImage("1(199).jpg");
  images[37]  = loadImage("1(198).jpg");
  images[38]  = loadImage("1(197).jpg");
  images[39]  = loadImage("1(196).jpg");
  images[40]  = loadImage("1(195).jpg");
  images[41]  = loadImage("1(194).jpg");
  images[42]  = loadImage("1(193).jpg");
  images[43]  = loadImage("1(192).jpg");
  images[44]  = loadImage("1(191).jpg");
  images[45]  = loadImage("1(190).jpg");
  images[46]  = loadImage("1(189).jpg");
  images[47]  = loadImage("1(188).jpg");
  images[48]  = loadImage("1(187).jpg");
  images[49]  = loadImage("1(186).jpg");
  images[50]  = loadImage("1(185).jpg");
  images[51]  = loadImage("1(184).jpg");
  images[52]  = loadImage("1(183).jpg");
  images[53]  = loadImage("1(182).jpg");
  images[54]  = loadImage("1(181).jpg");
  images[55]  = loadImage("1(180).jpg");
  images[56]  = loadImage("1(179).jpg");
  images[57]  = loadImage("1(178).jpg");
  images[58]  = loadImage("1(177).jpg");
  images[59]  = loadImage("1(176).jpg");
  images[60]  = loadImage("1(175).jpg");
  images[61]  = loadImage("1(174).jpg");
  images[62]  = loadImage("1(199).jpg");
  images[63]  = loadImage("1(198).jpg");
  images[64]  = loadImage("1(197).jpg");
  images[65]  = loadImage("1(196).jpg");
  images[66]  = loadImage("1(195).jpg");
  images[67]  = loadImage("1(194).jpg");
  images[68] = loadImage("1(193).jpg");
  images[69]  = loadImage("1(192).jpg");
  images[70]  = loadImage("1(191).jpg");
  images[71]  = loadImage("1(190).jpg");
  images[72]  = loadImage("1(189).jpg");
  images[73]  = loadImage("1(188).jpg");
  images[74]  = loadImage("1(187).jpg");
  images[75]  = loadImage("1(186).jpg");
  images[76]  = loadImage("1(185).jpg");
  images[77]  = loadImage("1(184).jpg");
  images[78]  = loadImage("1(183).jpg");
  images[79]  = loadImage("1(182).jpg");
  images[80]  = loadImage("1(181).jpg");
  images[81]  = loadImage("1(180).jpg");
  images[82]  = loadImage("1(179).jpg");
  images[83]  = loadImage("1(178).jpg");
  images[84]  = loadImage("1(177).jpg");
  images[85]  = loadImage("1(176).jpg");
  images[86]  = loadImage("1(175).jpg");
  images[87]  = loadImage("1(174).jpg");
  images[88]  = loadImage("1(173).jpg");
  images[89]  = loadImage("1(172).jpg");
  images[90]  = loadImage("1(171).jpg");
  images[91]  = loadImage("1(170).jpg");

  img2 = loadImage("wario1.png");

  
} //end of void setup


void pre() {
  S4P.updateTime();
  S4P.updateSprites();
}




void draw() {
  
  imageMode(CORNER); ///MAKES IT SO WARIO DOESN'T OVERLAP
  image(bg,0,0,width,height); 
  /////boundray////
  rect(bx,by,50,50);
  
  rect(50,240,50,50);
  rect(50,170,50,50);
  rect(50,100,50,50);
  ////boundrary/////
  
  fill(random(28),random(193),random(14));
  rect(420,307,50,50);
  
  rect(playerposX,playerposY,20,20);
  fill(233,332,0);
  rect(toplugX,toplugY,20,4);
  fill(193,14,161);
  
  fill(random(144),random(11),random(135));
  ellipse(cargoX,cargoY,15,15);
  
  fill(random(213),random(24),random(135));
  ellipse(cargoX,cargoY,10,10);
  fill(random(24),random(135),random(213));
  ellipse(cargoX,cargoY,5,5);
  
  

  
  
  if (timer>0) {  
    game();
  }


  S4P.drawSprites();
  frame = frame + 1;
  if (frame>=numFrames-1) {
    frame=0;
  }





  image(img3, 100, 450);
  image(img2, 460, 192);
  image(images[frame], 260, 200);
  image(img, 335,440);
  image(img6, 420,440);






  //////////////////////
  /////LAVA ROCK////////
  //////////////////////

  PebbleY = PebbleY - 10;

  fill(random(219), random(7), random(35));
  ellipse(PebbleX, PebbleY, 10, 10);
  fill(144, 85, 7);
  ellipse(PebbleX, PebbleY, 5, 5);


  ////////////////////
  //END LAVA ROCK/////
  ////////////////////

  ////////////////////
  //AVOID THE ROCK////
  ///////////////////

  MeteorY = MeteorY +6;

  fill(random(219), random(7), random(35));
  ellipse(MeteorX, MeteorY, 25, 25);
  fill(144, 85, 7);
  ellipse(MeteorX, MeteorY, 20, 20);

  
  if (b=true) {
  MeteorY2=MeteorY2 +8;
  
  fill(random(219), random(7),random(35));
  ellipse(MeteorX2, MeteorY2, 25, 25);
  fill(144, 85, 7);
  ellipse(MeteorX2, MeteorY2, 20, 20);
  
  if (MeteorY2==374) {
    MeteorY2=94;
  }

  }
  
  
  MeteorY3=MeteorY3 +10;
  
  fill(random(219), random(7),random(35));
  ellipse(MeteorX3, MeteorY3, 25, 25);
  fill(144, 85, 7);
  ellipse(MeteorX3, MeteorY3, 20, 20);
  
  if (MeteorY3==380) {
    MeteorY3=90;
  }


  
  ///////////////////////////
  //ROCKS YOU SHOULD AVOID///
  //////////////////////////


  if (PebbleY==106
    ) {
    PebbleY=196;
  }


  if (MeteorY==382) {
    MeteorY=112;
  }

  fill(random(171),(19),(188));
  text("SAVE YOUR CARGO. RUN! ", 100, 40);
  println(mouseX + " : " + mouseY);
  
  
  if (timer==0) {
    noLoop();
    winner = loadImage("lose.png");
    image(winner, 200, 200);
  }
  
  if(MeteorY >= playerposY && MeteorX < playerposX+18 && MeteorX > playerposX-18) {
   noLoop();
   lose = loadImage("lose.png");
   image(lose, 190,200);
  } 
  
   if(MeteorY2 >= playerposY && MeteorX2 < playerposX+18 && MeteorX2 > playerposX-18) {
   noLoop();
   lose = loadImage("lose.png");
   image(lose, 190,200);
  } 
  
  if(MeteorY3 >= playerposY && MeteorX3 < playerposX+18 && MeteorX3 > playerposX-18) {
   noLoop();
   lose = loadImage("lose.png");
   image(lose, 190,200);
  } 
  
  if(bx < playerposX+50 && bx > playerposX-50) {
   noLoop();
   lose = loadImage("lose.png");
   image(lose, 190,200);
  } 
  
  if(bxx < playerposX+20 && bxx > playerposX-20) {
   noLoop();
   lose = loadImage("WINNER.png");
   image(lose, 190,200);
  } 
////////////////////////////////
///SQUARE PLAYER////////////////






  
} // end of void draw


void keyPressed()
{
  if ((keyPressed == true) && (key == 'd')) {
    playerposX=playerposX+5;
    toplugX=toplugX+5;
    handleX=handleX+5;
    cargoX=cargoX+5;
    wario.setVelXY(100, 0);
    wario.startImageAnim(-1, 7, 0.1);
  }
  else {
    wario.setVelXY(0, 0);
    wario.startImageAnim(-1, 0, 0.1);
  }
  
  
   if ((keyPressed == true) && (key == 'w')) {
     loop();
     timer=14;
     playerposX=100;
     toplugX=100;
     cargoX=110;
     wario.setXY(WarioX,WarioY);
     
   }
  
  
  
  
  
  
  if ((keyPressed == true) && (key == 'a')) {
    playerposX=playerposX-5;
    toplugX=toplugX-5;
    handleX=handleX-5;
    cargoX=cargoX-5;
    wario.setVelXY(-100, 0);
    wario.startImageAnim(-1, 15, 0.1);
  }
}

void game() { //this is a method that holds much of the game
  if (second()!=timeLast) { //this sees if a second has passed
    timeLast=second(); //if a second has passed then we update the timeLast variable
    timer-=1; //this makes the timer countdown by one
  }


  fill(random(255),random(120),random(124));
  text("Timer: "+timer, 7, 80); //this draws the timer text and the timer variable
  
}

void Clicked() 
{
  if (value > 0) {
    value = 0; }
    else { 
    timer=15;
    loop();
}
}




