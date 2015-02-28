
// Thanks to Mimi and Benjamin for code help

color bg = color(138, 186, 184);
color bg2 = color(166, 142, 93);

int card = 1;

boolean move = true;

int b1x = 458;
int b1y = 400;
int b1w = 150;
int b1h = 50;

int b2x = 50;
int b2y = 240;
int b2w = 150;
int b2h = 200;

int b3x = 440;
int b3y = 240;
int b3w = 150;
int b3h = 200;

int ex = 90;
int ey = 200;
int ew = 100;
int eh = 100;

int wx = 90;
int wy = 300;
int ww = 100;
int wh = 100;

int cx = 245;
int cy = 240;
int cw = 150;
int ch = 200;

PFont font; 
PImage mancrown, boots2, princess, fist, knife, run, sword, crow, fly, gargoyle, guys, cat, ogre, basket, door, wolf1, openingman, bread, rocks, hop, boots, east, west, riding, riding2;


void setup(){
  size(640, 480);
  smooth();
  font = loadFont("ArnoPro-Regular-58.vlw");
  openingman = loadImage("man.png");
  mancrown = loadImage("mancrown.png");
  bread = loadImage("breadloaf.png");
  hop = loadImage("hop1.png");
  rocks = loadImage("rocks.png");
  boots = loadImage("boots.png");
  boots2 = loadImage("boots2.png");
  east = loadImage("pointer.png");
  west = loadImage("pointerleft.png");
  riding = loadImage("redflip.png");
  riding2 = loadImage("red.png");
  wolf1 = loadImage("wolf1.png");
  door = loadImage("doorway.png");
  basket = loadImage("basket.png");
  ogre = loadImage("ogre.png");
  cat = loadImage("cat.png");
  fly = loadImage("fly.png");
  guys = loadImage("guys.png");
  gargoyle = loadImage("gargoyle.png");
  crow = loadImage("crow.png");
  sword = loadImage("sword2.png");
  run = loadImage("hoprun.png");
  knife = loadImage("knife.png");
  fist = loadImage("fist.png");
  princess = loadImage("princess.png");

  textFont(font);
}

void draw(){
  if (card == 1){
    cardOne ();
  }
  else if (card == 2){
    cardTwo();
  }
  else if (card == 3){
    cardThree();
  }
  else if (card == 4){
    cardFour();
  }
  else if (card == 5){
    cardFive();
  }
  else if (card == 6){
    cardSix();
  }
  else if (card == 7){
    cardSeven();
  }
  else if (card == 8){
    cardEight();
  }
  else if (card == 9){
    cardNine();
  }
  else if (card == 10){
    cardTen();
  }
  else if (card == 11){
    cardEleven();
  }
  else if (card == 12){
    cardTwelve();
  }
  else if (card == 13){
    cardThirteen();     
  }
  else if (card == 14){
    cardFourteen();
  }
  else if (card == 15){
    cardFifteen();
  }
  else if (card == 16){
    cardSixteen();
  }
  else if (card == 17){
    cardSeventeen();
  }
  else if (card == 18){
    cardEighteen();
  }
  else if (card == 19){
    cardNineteen();
  }
  else if (card == 20){
    cardTwenty();
  }
  else if (card == 21){
    cardTwentyone();
  }
  else if (card == 22){
    cardTwentytwo();
  }
  else if (card == 23){
    cardTwentythree();
  }
  else if (card == 24){
    cardTwentyfour();
  }
  else if (card == 25){
    cardTwentyfive();
  }
  else if (card == 26){
    cardTwentysix();
  }
  else if (card == 27){
    cardTwentyseven();
  }
  println(card);
}


//CLICKING

void mousePressed() {
  if (card == 1) {
    if (overButton(b1x, b1y, b1w, b1h) == true){
      card = 2;
    }
  }
  if (card == 2){
    if(overButton(b1x, b1y, b1w, b1h) == true){
      card = 3;
    }
  }
  if (card == 3){
    if (overButton(b2x, b2y, b2w, b2h) == true){
      card = 4;
    }
    else if (overButton(b3x, b3y, b3w, b3h) == true){
      card = 5;
    }    

  }
  if (card == 5) {
    if (overButton(ex, ey, ew, eh) == true){
      card = 6;
    }
    else if (overButton(wx, wy, ww, wh) == true){
      card = 7;
    }
  }
  if (card == 4){
    if(overButton(b3x, b3y, b3w, b3h) == true){
      card = 8;
    }
    else if (overButton(b2x, b2y, b2w, b2h) == true){
      card = 9;
    }
  }
  if (card == 6){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      card = 27;
    }
    else if (overButton(b3x, b3y, b3w, b3h) == true){
      card = 26;
    }
  }

  if (card == 8){
    if(overButton(b1x, b1y, b1w, b1h) == true){
      card = 1;
    }
  }

  if (card == 9){
    if(overButton(b1x, b1y, b1w, b1h) == true){
      card = 10;
    }
  }

  if (card == 10){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      card = 11;
    }
    else if(overButton(b3x, b3y, b3w, b3h) ==true){
      card = 12;
    }

  }
  if (card == 11){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      card = 16;
    }
    else if(overButton(b3x, b3y, b3w, b3h) == true){
      card = 7;
    }
  }
  if (card == 12){
    if(overButton(b1x, b1y, b1w, b1h) == true){
      card = 13;
    }
  }
  if (card == 13){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      card = 14;
    }
    else if(overButton(b3x, b3y, b3w, b3h) == true){
      card = 15;
    }
  }

  if (card == 15){
    if(overButton(b1x, b1y, b1w, b1h) == true){
      card = 1;
    }
  }
  if (card == 7){
    if(overButton(b1x, b1y, b1w, b1h) == true){
      card = 17;
    }
  }
  if (card == 16){
    if(overButton(b1x, b1y, b1w, b1h) == true){
      card = 18;
    }
  }
  if (card == 18){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      card = 19;
    }
    else if(overButton(b3x, b3y, b3w, b3h) == true){
      card = 20;
    }
  }
  if (card == 20){
    if(overButton(b1x, b1y, b1w, b1h) == true){
      card = 18;
    }
  }
  if (card == 19){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      card = 21;
    }
    else if(overButton(cx, cy, cw, ch) == true){
      card = 22;
    }
    else if(overButton(b3x, b3y, b3w, b3h) == true){
      card = 23;
    }
  }
  if (card == 17){
    if(overButton(b2x, b2y, b2w, b2h) == true){
      card = 24;
    }
    else if(overButton(b3x, b3y, b3w, b3h) == true){
      card = 25;
    }
  }

  if (card == 25 || card == 24 || card == 21 || card == 22 || card == 23 || card == 14 || card == 27 || card == 26){
    if (overButton(b1x, b1y, b1w, b1h) == true){
      card = 1;
    }
  }

}

//BUTTON BOOLEAN


boolean overButton(int x, int y, int w, int h){
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && move) {
    move = false;
    return true; 
  }
  else {
    return false; 
  }
}

//mouse released

void mouseReleased(){
  move = true;
}


//CARD 1 = INTRO CARD 1

void cardOne(){
  smooth();
  background(bg);

  image(openingman, 40, 180);

  fill(0);
  textSize(28);
  text("ONCE UPON A TIME...", 280, 200);
  textSize(18);
  text("THERE WAS A BOY NAMED", 280, 220);
  textSize(38);
  text("HOP O' MY THUMB.", 280, 253);

  fill(255);
  textSize(20);
  text("CONTINUE...", 480, 420);
}

//CARD 2 = SECOND INTRO CARD

void cardTwo(){
  smooth();
  background(bg);

  image(openingman, 40, 180);

  fill(0);
  textSize(18);
  text("FOR THIS ADVENTURE", 280, 170);
  textSize(45);
  text("YOU ARE HOP.", 280, 205);
  textSize(28);
  text("YOU WILL NEED TO USE", 280, 230);
  textSize(58);
  text("YOUR WIT", 280, 273);
  textSize(18);
  text("TO GUIDE YOU TO YOUR FATE.", 280, 292);

  fill(255);
  textSize(20);
  text("BEGIN?", 480, 420);  
}

//CARD 3 = DECISION #1

void cardThree(){
  background(bg);

  fill(0);
  textSize(18);
  text("YOUR FAMILY HAS BECOME VERY POOR,", 150, 100);
  text("WITH BARELY ENOUGH FOOD TO EAT.", 153, 120);
  text("ONE NIGHT, YOU OVERHEAR YOUR MOTHER AND FATHER", 80, 140);
  text("PLOTTING TO LOSE YOU AND YOUR SIX BROTHERS", 105, 160);
  text("DEEP IN THE WOODS!", 220, 180);
  textSize(28);
  fill(255);
  text("YOU WILL LEAVE A TRAIL OF...", 130, 250);
  textSize(18);
  text("BREAD CRUMBS", 430, 320);
  text("PEBBLES", 110, 320);

  image(bread, 360, 330);
  image(rocks, 60, 330);
}

//CARD 4 = HAVING CHOSEN PEBBLES.

void cardFour(){
  background(bg);

  fill(0);
  textSize(38);
  text("YOUR PATH IS SAVED!", 130, 100);
  textSize(18);
  text("YOU CAN FIND YOUR WAY HOME.", 180, 130);
  text("WOULD YOU LIKE TO GO HOME OR EXPLORE?", 130, 150);
  fill(255);
  text("GO TO TOWN.", 90, 370);
  text("GO HOME.", 450, 370);

  image(hop, 230, 180);

}

//CARD 5 = HAVING SELECTED BREAD

void cardFive(){
  background(bg);

  fill(0);
  textSize(38);
  text("YOUR PATH IS RUINED!", 120, 100);
  textSize(18);
  text("YOU AND YOUR BROTHERS HAVE GOTTEN SEPARATED.", 100, 130);
  text("TO YOUR SURPRISE, A DAPPER-LOOKING CAT", 130, 150);
  text("WALKS BY. HE GIVES YOU TWO CHOICES:", 145, 170);
  image(boots, 320, 200);
  image(east, 100, 200);
  fill(255);
  text("FOLLOW HIM EAST", 60, 270);
  image(west, 90, 320);
  text("HEAD WEST", 100, 390);
}

// CARD 6 = HAVING CHOSEN EAST

void cardSix(){
  background (bg);
  fill(0);
  image(boots2, 170, 130, 300, 450);
  textSize(18);
  text("HE INTRODUCES HIMSELF AS PUSS IN BOOTS.", 130, 40);
  text("ON HIS WAY TO RESCUE A PRINCESS, HE WILL HELP YOU GET HOME IF YOU", 10, 60);
  textSize(38);
  text("HELP HIM FIRST.", 170, 90);  
  textSize(18);
  fill(255);
  text("WILL YOU HELP HIM RESCUE THE PRINCESS?", 130, 120);
  image(princess, 35, 280);
  text("YOU DON'T", 480, 320);
  text("ASSOCIATE", 480, 340);
  text("WITH", 500, 360);
  text("TALKING CATS.", 465, 380);
  text("BE A HERO!", 60, 260);
}

//card 17, woods 2

void cardSeventeen(){

  background(bg);
  fill(0);
  image(crow, 240, 190);
  textSize(18);
  text("YOU CAN HEAR YOUR BROTHERS", 180, 60);
  text("DO YOU FOLLOW THE", 220, 95);
  textSize(28);
  text("CALLING YOUR NAME.", 175, 80);
  text("YOUR VERY OWN FOOTSTEPS?", 130, 145);
  textSize(38);
  text("SOUND OF THEIR VOICES, OR", 60, 123); 
  fill(255);
  textSize(18);
  text("WHICH IS REAL...", 240, 180);
  text("FOLLOW YOUR", 60, 350); 
  text("FOOTSTEPS", 72, 370); 
  text("FOLLOW YOUR", 450, 350);
  text("BROTHERS VOICES", 432, 370);

}




//CARD 8 = "GO HOME"

void cardEight(){

  background(bg2);

  fill(0);
  textSize(18);
  text("YOU FIND YOUR WAY HOME AND ", 280, 200);  
  textSize(32);
  text("FOREVER RESENT", 280, 230);
  textSize(40);
  text("YOUR PARENTS.", 280, 265);
  fill(255);
  textSize(28);
  text("START OVER?", 430, 420);
  image(openingman, 40, 180);
}

//CARD 9 = GO TO TOWN.

void cardNine(){
  background(bg);
  fill(0);
  textSize(18);
  text("LESS ADVENTUROUS, YOUR BROTHERS HEAD HOME.", 100, 120);
  text("ON THE WAY TO TOWN, YOU RUN INTO A YOUNG GIRL", 90, 140); 
  textSize(28);
  text("WITH A BASKET OF GOODS.", 130, 165);
  fill(255);
  textSize(20);
  text("CONTINUE...", 480, 420);
  image(riding, -30, 120);
}

//CARD 10, RED RIDING HOOD.

void cardTen(){

  background(bg);
  fill(0);
  textSize(18);
  text("'HELLO,' SAYS THE GIRL.", 225, 120);
  textSize(38);
  text("'MY NAME IS RED RIDING HOOD.'", 35, 150);
  textSize(18);
  text("RED WAS ON THE WAY TO HER GRANDMOTHERS, BUT SHE TELLS YOU", 30, 170);
  textSize(28);
  text("THAT SHE IS SCARED TO TRAVEL ON HER OWN.", 20, 195);
  fill(255);
  textSize(18);
  text("WILL YOU GO WITH HER?", 220, 240);
  image(riding2, 230, 240, 247, 450);
  image(hop, 200, 340, 100, 143);
  text("NO WAY!", 80, 340);
  text("YOU KNOW HOW", 43, 360);
  text("THIS STORY", 65, 380);
  text("ENDS.", 93, 400);
  text("BUT OF COURSE!", 440, 360);
  textSize(10);
  text("(WHAT A GENTLEMAN)", 456, 375);
}

//CARD 11, no way!

void cardEleven(){
  background(138, 186, 184);
  fill(0);
  textSize(18);
  text("YOU AVOIDED A PARTICLUARLY FRIGHTFUL DEMISE...", 100, 100);
  text("(POOR RED.)", 270, 120);
  textSize(38);
  text("NOW...WHICH WAY WAS HOME?", 50, 155);
  fill(255);
  textSize(18);
  text("CAN YOU REMEMBER FROM WHENCE YOU CAME?", 115, 175);
  text("THIS WAY.", 70, 320);
  text("DEFINITELY.", 60, 340);
  text("ER...THAT WAY.", 450, 320);
  text("I THINK.", 480, 340);
  image(west, 60, 360);
  image(east, 470, 360);
  image(rocks, 165, 360, 130, 90);
  image(hop, 245, 210);
}

//CARD 12, OF course!

void cardTwelve(){

  background(bg);
  fill(255);
  image(wolf1, -40, 160);
  textSize(48);
  text("BY THE BEARD OF ZEUS!", 55, 50);
  fill(0);
  textSize(28);
  text("IT LOOKS LIKE A CERTAIN WOLF", 100, 75);
  textSize(18);
  text("WAS ON THE HUNT FOR RED RIDING HOOD!", 120, 95);
  text("HE WAS PLANNING ON POSING AS HER GRANDMOTHER, BUT", 70, 115);
  text("YOU GOT THERE FIRST!", 200, 135);
  fill(255);
  text("CONTINUE...", 480, 420);
  image(door, 420, 150);
}

//CARD 13, continued from 12

void cardThirteen(){
  background(bg);
  fill(0);
  textSize(18);
  text("QUICK! WHAT ARE YOU GOING TO DO?", 155, 100);
  textSize(28);
  text("TRY TO BRIBE THE WOLF WITH RED'S GOODS", 30, 125);
  textSize(18);
  text("OR", 310, 143);
  textSize(28);
  text("QUIETLY BACK OUT THE DOOR!", 110, 165);
  text("MAYBE HE HASN'T NOTICED YOU YET...", 70, 190);
  image(basket, 75, 260);
  fill(255);
  textSize(18);
  text("BRIBERY...", 85, 250);
  text("BACK OUT!", 455, 250);
  image(hop, 420, 260, 140, 183);
  textSize(58);
  text("OR", 265, 350);

} 

//card 14, ending for bribing wolf END CARD

void cardFourteen(){
  background(bg2);
  fill(0);
  image(openingman, 40, 180);
  textSize(28);
  text("THE WOLF SHOWED", 280, 200);
  textSize(38);
  text("NO MERCY.", 280, 230);
  textSize(18);
  text("YOU AND RED RIDING HOOD", 280, 248);
  textSize(38);
  text("WERE EATEN ALIVE.", 280, 278);
  fill(255);
  textSize(28);
  text("START OVER?", 430, 420);
}

//Card 15, other END for red riding hood

void cardFifteen(){
  background(bg2);
  fill(0);
  image(openingman, 40, 180);
  textSize(28);
  text("THAT WAS CLOSE...", 280, 200);
  textSize(38);
  text("BUT YOU MADE IT ", 280, 230);
  textSize(48);
  text("OUT ALIVE.", 280, 265);
  textSize(18);
  text("(RED DIDN'T.)", 280, 283);
  textSize(38);
  text("YOU RUN HOME.", 280, 314);
  fill(255);
  textSize(28);
  text("START OVER?", 430, 420);
}

//Card Seven, troubled Woods card 1

void cardSeven(){
  background(bg);
  fill(0);
  image(cat, 20, 240);
  image(crow, 250, 180);
  image(guys, 140, 290);
  image(fly, 10, -5, 160, 100);
  textSize(18);
  text("YOU HAVE REACHED THE", 210, 80);
  textSize(38);
  text("TROUBLED WOODS.", 150, 110);
  textSize(18);
  text("SURROUNDED BY STRANGE CREATURES, YOU FIND YOURSELF", 60, 130);
  text("IN A LOST PART OF THE WOODS, A PLACE THAT PLAYS TRICKS ON", 35, 150);
  textSize(28);
  text("ONE'S CONSCIENCE.", 190, 175);
  fill(255);
  textSize(20);
  text("CONTINUE...", 480, 420);
}

//CARD 16 OGRE 1

void cardSixteen(){
  background(bg);
  fill(0);
  image(ogre, -40, 130);
  textSize(18);
  text("YOU'VE REACHED A HOUSE...", 200, 40);
  textSize(28);
  text("BUT IT BELONGS TO A HORRIBLE OGRE!", 60, 65);
  textSize(18);
  text("(MAYBE YOU SHOULD HAVE STUCK WITH RED...)", 115, 85);
  text("HE'S BEEN DRINKING AND SMELLS YOUR WHEREABOUTS EASILY.", 55, 105);
  fill(255);
  textSize(20);
  text("CONTINUE...", 480, 420); 

}

//card 18, OGRE 2

void cardEighteen(){
  background(bg);
  fill(0);
  textSize(18);
  text("YOU DON'T HAVE MUCH TIME...WILL YOU", 140, 80);
  textSize(48);
  text("RUN?", 260, 120);
  textSize(18);
  text("OR WILL YOU BE BRAVE AND", 200, 140);
  textSize(38);
  text("FIGHT...TO THE DEATH?", 110, 170);
  image(sword, 140, 210);
  fill(255);
  textSize(18);
  text("(CONSIDER THIS A TEST OF COURAGE.)", 150, 190);
  text("HEROES", 90, 350); 
  text("FIGHT TO THE", 60, 370);
  text("DEATH!",90, 390);
  text("RUN!", 495, 350);
  text("ARE YOU OUT", 460, 370);
  text("OF YOUR MIND?!", 450, 390);

}

//CARD 20, how uncourageous

void cardTwenty(){
  background(bg); 
  fill(0);
  textSize(28);
  text("REALLY?", 260, 70);
  fill(255);
  text("LET'S TRY THIS AGAIN.", 180, 145);
  fill(0);
  textSize(38);
  text("HOW UNCOURAGEOUS OF YOU.", 45, 100);
  image(run, 220, 150);
  fill(255);
  textSize(20);
  text("TRY AGAIN...", 480, 420);


}

//CARD 19, CHOICES FOR OGRE

void cardNineteen(){
  background(bg);
  fill(0);
  textSize(18);
  text("WHICH WEAPON WILL YOU CHOOSE? PICK WISELY...", 105, 60);
  textSize(38);
  text("A KNIFE, YOUR FISTS,", 130, 90); 
  textSize(18);
  text("OR SOME OF THAT BREAD FROM EARLIER...", 140, 110);
  text("IT IS NOW STALE ENOUGH TO BE SOMEWHAT OF A WEAPON.", 70, 130);
  fill(255);
  textSize(28);
  text("YOU ONLY HAVE ONE SHOT...", 125, 155);
  textSize(18);
  text("KNIFE", 100, 240);
  text("FISTS", 300, 240);
  text("BREAD", 500, 240);
  image(knife, 20, 200);
  image(fist, 250, 250);
  image(bread, 420, 300);
}

//CARD 21, KNIFE

void cardTwentyone(){

  background(bg2);
  fill(0);
  image(openingman, 40, 180);
  textSize(28);
  text("SUCCESS! YOU ARE", 280, 200);
  textSize(38);
  text("A BIG DEAL.", 280, 230);
  textSize(18);
  text("YOU LOOT THE OGRE'S RICHES", 280, 248);
  textSize(38);
  text("AND HEAD HOME.", 280, 278);
  fill(255);
  textSize(28);
  text("START OVER?", 430, 420);

}

//card 22, fists.


void cardTwentytwo(){

  background(bg2);
  fill(0);
  image(openingman, 40, 180);
  textSize(38);
  text("TRAGEDY...", 280, 200);
  textSize(18);
  text("YOUR VALIANT EFFORTS ARE", 280, 220);
  textSize(28);
  text("APPRECIATED, BUT IT", 280, 245);
  textSize(38);
  text("WASN'T ENOUGH.", 280, 275);
  textSize(18);
  text("(YOU DIED.)", 280, 292);
  fill(255);
  textSize(28);
  text("START OVER?", 430, 420);

}

//card 23, bread picked from ogre

void cardTwentythree(){

  background(bg2);
  fill(0);
  image(openingman, 40, 180);
  textSize(18);
  text("THE OGRE APPRECIATES YOUR", 280, 200);
  textSize(38);
  text("SENSE OF HUMOR.", 280, 230);
  textSize(18);
  text("HE FEELS BAD FOR YOU AND", 280, 248);
  textSize(28);
  text("LETS YOU GO.", 280, 270);
  fill(255);
  textSize(28);
  text("START OVER?", 430, 420);

}

//Card twentySeven, 

void cardTwentyseven(){
  background(bg2);
  fill(0);
  image(mancrown, 25, 130);
  textSize(18);
  text("YOU AND BOOTS SAVE THE PRINCESS", 280, 160);
  text("GIVEN A GOLDEN", 280, 200);
  text("YOU ARE BOTH HEROES,", 280, 247);
  text("AND BOOTS TOOK YOU HOME.", 280, 265);
  textSize(28);
  text("AND HAVE EACH BEEN", 280, 183);
  textSize(38);
  text("KNIGHT'S CROWN.", 280, 230);
  fill(255);
  textSize(28);
  text("START OVER?", 430, 420);
}

//card 24

void cardTwentyfour(){

  background(bg2);
  fill(0);
  image(openingman, 40, 180);
  textSize(18);
  text("YOU NARROWLY ESCAPE!", 280, 190);
  text("HELD THE TRUTH IN THOSE WOODS.", 280, 225);
  textSize(28);
  text("ONLY YOUR FOOTPRINTS", 280, 210);
  textSize(38);
  text("YOU CAN FIND", 280, 255);
  text("THE WAY HOME.", 280, 285);
  fill(255);
  textSize(28);
  text("START OVER?", 430, 420);

}

//card 25, woods ending 1

void cardTwentyfive(){

  background(bg2);
  fill(0);
  image(openingman, 40, 180);
  textSize(18);
  text("THEIR VOICES WERE MERELY", 280, 160);
  textSize(38);
  text("AN ILLUSION.", 280, 190); 
  text("FOREVER.", 280, 260);
  textSize(28);
  text("YOU REMAIN LOST", 280, 210);
  text("IN THE WOODS", 280, 232);
  fill(255);
  textSize(28);
  text("START OVER?", 430, 420);

}

//card 26, dont associate with...

void cardTwentysix(){

  background(bg2);
  fill(0);
  image(openingman, 40, 180);
  textSize(18);
  text("BOOTS IS INCREDIBLY OFFENDED", 280, 180);
  textSize(28);
  text("AND LEAVES YOU LOST.", 280, 203);
  text("FINDING HOME...", 280, 251);
  textSize(38);
  text("GOOD LUCK", 280, 230);
  fill(255);
  textSize(28);
  text("START OVER?", 430, 420);
}


