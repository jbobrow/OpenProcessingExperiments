
// Thanks to Mimi and Benjamin for code help

color bg = color(138, 186, 184);

int card = 1;

int b1x = 478;
int b1y = 400;
int b1w = 100;
int b1h = 50;

int b2x = 100;
int b2y = 350;
int b2w = 100;
int b2h = 50;

int b3x = 440;
int b3y = 350;
int b3w = 100;
int b3h = 50;

int ex = 90;
int ey = 200;
int ew = 100;
int eh = 100;

int wx = 90;
int wy = 300;
int ww = 100;
int wh = 100;

PFont font; 
PImage openingman, bread, rocks, hop, boots, east, west;


void setup(){
  size(640, 480);
  smooth();
  font = loadFont("ArnoPro-Regular-58.vlw");
  openingman = loadImage("man.png");
  bread = loadImage("breadloaf.png");
  hop = loadImage("hop1.png");
  rocks = loadImage("rocks.png");
  boots = loadImage("boots.png");
  east = loadImage("pointer.png");
  west = loadImage("pointerleft.png");
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
  }else if (card == 4){
      cardFour();
  }else if (card == 5){
      cardFive();
  }//else if (card == 6){
  //    cardSix();
  //  }else if (card == 7){
  //    cardSeven();
  //  }else if (card == 8){
  //    cardEight();
  //  }else if (card == 9){
  //    cardNine();
  //  }else if (card == 10){
  //    cardTen();
  //  }else if (card == 11){
  //    cardEleven();
  //  }else if (card == 12){
  //    cardTwelve();
  //  }else if (card == 13){
  //    cardThirteen();
  //     
  //  }
  println(card);
}


//CLICKING

void mousePressed() {
  if (card == 1) {
    if (overButton(b1x, b1y, b1w, b1h) == true){
      card = 2;
    }
  }
  else if (card == 2){
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
}

//BUTTON BOOLEAN


boolean overButton(int x, int y, int w, int h){
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true; 
  }
  else {
    return false; 
  }
}


//CARD 1 = INTRO CARD 1

void cardOne(){
  smooth();
  background(bg);

  image(openingman, 80, 200);

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

  image(openingman, 80, 200);

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
  text("EXPLORE!", 100, 370);
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
  text("TO YOUR SURPRISE, A FAMILIAR-LOOKING CAT", 130, 150);
  text("FINDS YOU. HE GIVES YOU TWO CHOICES:", 145, 170);
  image(boots, 320, 200);
  image(east, 100, 200);
  fill(255);
  text("EAST", 110, 270);
  image(west, 90, 320);
  text("WEST", 110, 390);
}

// CARD 6 = HAVING CHOSEN EAST

//void cardSix(){
//  background (bg);
//  textSize(18);
//  text(
//  

