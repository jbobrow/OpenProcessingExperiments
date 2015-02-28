
//created by z3335374 | Chris hogben
// Background illustration and carrots by me. Icons purchased on Vectorstock.com.

Carrot carrot1, carrot2, carrot3, carrot4, carrot5, carrot6, carrot7, carrot8;
playData data1;
Sun sunSet;

ParticleSystem ps;

//Creates a timer
Timer timer;

//Fonts
PFont futura, cartoon, bold;

// decalring external asset names
  PImage backdrop,water,waterhover,waterdown,decon,deconOver,deconDown,bgNight,endGame,startGame,foreground;

//setting variables
boolean gameStart = false;
int timePassed = 0;
int alpha2 = 0;
int carrotsPicked = 0;
int carrotDead = 0;
int minPick = 400; //the minimum ammount of time before carrot can be picked
int maxDeath = 1300;
float carrotPrice = 1.60; //users can improve the soil quality to increase value of carrots. Increasing soil quality reduces risk of infection.
int soilQuality = 4; // strong chance of infection.
int canPick = 0;
int isOneInfected = 0;
int decontaminated = 1; // when decomtamination is bought this goes to 0 to reset it.
//int infectionTime = 450;  //if they can't afford a cure for the infection, it will clear up after ~14 seconds.
//int infectionCount = 0; // So no more than 3 infections occur (or specified number
//int infectionDelay = 400; //so that you can't be infected straight away.

void setup () {
  size (952,664);
  smooth();
  ps = new ParticleSystem(1, new PVector(width/2,height/2,0));
  backdrop = loadImage("backdrop.png");
  water = loadImage("water.png");
  waterhover = loadImage("water-hover.png");
  waterdown = loadImage("water-down.png");
  decon = loadImage("decontaminate.png");
  deconOver  = loadImage("decontaminate-over.png");
  deconDown  = loadImage("decontaminate-down.png");
  bgNight = loadImage("backdrop-night.png");
  endGame = loadImage("endgame-board.png");
  startGame = loadImage("backdrop-start.png");
  foreground = loadImage("backdrop-foreground.png");
  carrot1 = new Carrot();
  carrot2 = new Carrot();
  carrot3 = new Carrot();
  carrot4 = new Carrot();
  carrot5 = new Carrot();
  carrot6 = new Carrot();
  carrot7 = new Carrot();
  carrot8 = new Carrot();
  data1 = new playData();
  sunSet = new Sun();
  frameRate(30);

  //font
  futura = loadFont ("Futura-Medium-48.vlw");
  textFont(futura);
  cartoon = loadFont ("CartoonistKooky-48.vlw");
  textFont(cartoon);
  bold = loadFont ("CartoGothicStd-Bold-48.vlw");
  textFont(bold);

  timer = new Timer(120000); //2 Minutes
  timer.start();
  
}



void draw () {
  
  if (gameStart == false) {
    image(startGame,0,0,width,height);
    //reset all variables if game restarted
    timePassed = 0;
    alpha2 = 0;
    carrotsPicked = 0;
    carrotDead = 0;
    minPick = 400; //the minimum ammount of time before carrot can be picked
    maxDeath = 1300;
    carrotPrice = 1.60; //users can improve the soil quality to increase value of carrots. Increasing soil quality reduces risk of infection.
 
    
  } else {
  if (timer.isFinished()) { //END GAME
    image(backdrop,0,0,width,height);
    image(foreground,0,0,width,height);
    tint(255,alpha2);
    image(bgNight,0,0,width,height);
    tint(255,255);
    alpha2 = alpha2 + 5;
    image(endGame,0,0,width,height);
    data1.details(carrotsPicked, carrotPrice, carrotDead);
  } else {  //MAIN GAME
 
    // I'm wrapping the main game in an if statement. If the timer is done, the game will end.
    //Background image
    image (backdrop,0,0,width,height);
    
    sunSet.move(); //moves the sun through the sky.
    image(foreground,0,0,width,height);
    data1.details(carrotsPicked, carrotPrice, carrotDead);
 

  //Create Carrots
  carrot1.draw(50,minPick,maxDeath,soilQuality,isOneInfected,decontaminated);
  carrot1.age(true);
  carrot1.cashAnim(50);
  carrot2.draw(150,minPick,maxDeath,soilQuality,isOneInfected,decontaminated);
  carrot2.age(true);
  carrot2.cashAnim(150);
  carrot3.draw(250,minPick,maxDeath,soilQuality,isOneInfected,decontaminated);
  carrot3.age(true);
  carrot3.cashAnim(250);
  carrot4.draw(350,minPick,maxDeath,soilQuality,isOneInfected,decontaminated);
  carrot4.age(true);
  carrot4.cashAnim(350);
  carrot5.draw(450,minPick,maxDeath,soilQuality,isOneInfected,decontaminated);
  carrot5.age(true);
  carrot5.cashAnim(450);
  carrot6.draw(550,minPick,maxDeath,soilQuality,isOneInfected,decontaminated);
  carrot6.age(true);
  carrot6.cashAnim(550);
  carrot7.draw(650,minPick,maxDeath,soilQuality,isOneInfected,decontaminated);
  carrot7.age(true);
  carrot7.cashAnim(650);
  carrot8.draw(750,minPick,maxDeath,soilQuality,isOneInfected,decontaminated);
  carrot8.age(true);
  carrot8.cashAnim(750);
  
  
  
//  if (timePassed >= 3345) {
//      tint(255,alpha2);
//      image(bgNight,0,0,width,height);
//      tint(255,255);
//      alpha2++;
//    }
//    timePassed++;
    
      //Water to increase speed
    if ((mouseX >= 0 && mouseX <= 170)  && (mouseY >= 0 && mouseY <= 60))  {
    image(waterhover,0,0);
  } else {
    image(water,0,0);
  }   
     
 if ((mouseX >= 200 && mouseX <= 460)  && (mouseY >= 0 && mouseY <= 76))  {
    image(deconOver,200,0);
  } else if (isOneInfected >= 1) { //tansparent if carrots aren't infected.
    image(decon,200,0);
  } else {
    tint(255,70);
    image(decon,200,0);
    tint(255,255);
  }
  
  if (mousePressed) {
    if ((mouseX >= 200 && mouseX <= 460)  && (mouseY >= 0 && mouseY <= 76)) {
     tint(255,120);
    image(deconDown,200,0);
    tint(255,255);
    data1.money4decon(isOneInfected);
    print(isOneInfected);
      }
    if ((mouseX >= 600 && mouseX <= 900)  && (mouseY >= 0 && mouseY <= 60)) {
    tint(255,60);
    image(waterdown,600,0);
    tint(255,255);
    data1.money4grass(soilQuality,carrotPrice);
  }
  }
  
//  ps.run();
//  ps.addParticle(mouseX,mouseY);

} // main game

  
  
}
}


void mousePressed() {
  
  if (gameStart == false) {

    gameStart = true;

  } else {
  
   if (timer.isFinished()) { //END GAME
   
   if ((mouseX >= 318 && mouseX <= 641)  && (mouseY >= 540 && mouseY <= 582)) {
    gameStart = false;
    timer = new Timer(120000); //2 Minutes
    timer.start();
   }
  } else {  //MAIN GAME

  if ((mouseX >= 70 && mouseX <= 110)  && (mouseY >= 510 && mouseY <= 635)) {
    carrot1.pick(50);
  }
  if ((mouseX >= 177 && mouseX <= 217)  && (mouseY >= 510 && mouseY <= 635)) {
    carrot2.pick(150);
  }
  if ((mouseX >= 273 && mouseX <= 313)  && (mouseY >= 510 && mouseY <= 635)) {
    carrot3.pick(250);
  }
  if ((mouseX >= 372 && mouseX <= 412)  && (mouseY >= 510 && mouseY <= 635)) {
    carrot4.pick(350);
  }
  if ((mouseX >= 474 && mouseX <= 514)  && (mouseY >= 510 && mouseY <= 635)) {
    carrot5.pick(450);
  }
  if ((mouseX >= 572 && mouseX <= 612)  && (mouseY >= 510 && mouseY <= 635)) {
    carrot6.pick(550);
  }
  if ((mouseX >= 673 && mouseX <= 713)  && (mouseY >= 510 && mouseY <= 635)) {
    carrot7.pick(650);
  }
  if ((mouseX >= 770 && mouseX <= 815)  && (mouseY >= 510 && mouseY <= 635)) {
    carrot8.pick(750);
  }
  if ((mouseX >= 0 && mouseX <= 170)  && (mouseY >= 0 && mouseY <= 60)) {
    tint(255,60);
    image(waterdown,0,0);
    tint(255,255);
    data1.money4Water();
  }
//  if ((mouseX >= 200 && mouseX <= 460)  && (mouseY >= 0 && mouseY <= 76)) {
//     tint(255,120);
//    image(deconDown,200,0);
//    tint(255,255);
//    data1.money4decon();
//      }
    }
  }
}


