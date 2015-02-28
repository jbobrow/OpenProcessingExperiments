
int number = 0;
int BKS = 150;
int RS = 100;
int GS = 100;
int BS = 100;
boolean SelectC = true;
PImage Bbird;
PImage Gbird;
PImage Rbird;
PImage Ybird;

void Choose(){
  // 4 Characters
  Bbird = loadImage("blue-bird.png");
  Gbird = loadImage("green-bird.png");
  Rbird = loadImage("red-bird.png");
  Ybird = loadImage("yellow-bird.png");
  
  fill(124,124,124);
  textAlign(CENTER);
  textSize(50);
  text("CHOOSE CHARACTER!", width/2, height/4);
  textSize(20);
  text("Use arrow keys to choose", width/2, height/2+120);
  text("Press Spacebar to select", width/2, height/2+150);
  select();
  rectMode(CENTER); 
  fill(0);
  Bbird.resize(BKS,BKS);
  image(Bbird,250,height/2);
  fill(255,0,0);
  Gbird.resize(RS,RS);
  image(Gbird,420,height/2);
  fill(0,255,0);
  Rbird.resize(GS,GS);
  image(Rbird,580,height/2);
  fill(0,0,255);
  Ybird.resize(BS,BS);
  image(Ybird,750,height/2);
}

//Decides which character it is on
void keyPressed() {
  if(SelectC == true){
    if(keyCode == RIGHT){
    if (number == 0){
      number = 1;
  } else if (number == 1) {
    number = 2;
  } else if(number == 2) {
    number = 3;
  } else if (number == 3) {
   number = 4;
}
  }
  if(keyCode == LEFT){
   if (number == 4){
    number = 3;
   } else if (number == 3){
     number = 2;
   } else if (number == 2){
     number = 1;
   }
  }
 }
  
  //Start the Game with your Character
     if(key == ' '){
       if(number > 0){
         SelectC = false;
       }
       if(number == 1){
    start = true; 
   } if(number == 2){
    start = true; 
   } if(number == 3){
    start = true; 
   } if(number == 4){
    start = true; 
   }
  }
}

//Changing size of images for Characters
void select(){
  if(number == 0){
    BKS = 100;
    RS = 100;
    GS = 100;
    BS = 100;
  }
 if (number == 1){
    BKS = 150;
    RS = 100;
    GS = 100;
    BS = 100;
 } else if (number == 2){
    BKS = 100;
    RS = 150;
    GS = 100;
    BS = 100;
 } else if (number == 3){
    BKS = 100;
    RS = 100;
    GS = 150;
    BS = 100;
 } else if (number == 4){
    BKS = 100;
    RS = 100;
    GS = 100;
    BS = 150;
 }
}


