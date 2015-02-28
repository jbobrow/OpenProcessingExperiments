
final int StatMenu = 0;
final int StatPlayerOne = 1;
final int StatPlayerTwo = 2;
final int StatFine = 3;
//
int StatGame;
//
int howManyIsHeRemoving  ;


void setup(){
  size(910,600);
  StatGame=StatMenu;
}

void draw(){
  
  background(0); 
  
  switch (StatGame){
  case StatMenu:
    Menu();
    break;
  case StatPlayerOne:
    PlayerOne();
    break;
  case StatPlayerTwo:
    PlayerTwo();
    break;
  case StatFine:
    Fine();
    break;
  default:
    println("Hai dimenticato uno Stato");
    break;
   }//switch
}//funzione

void Menu(){
  textSize(30);
  text("1 Player",20,150);
  text("2 Player",20,200);
  textSize(30);
  text("[Press to go]",150,150);
  text("[Press to go]",150,200);
}

void PlayerOne(){
text("PlayerOne", 30,30);
    text(howManyIsHeRemoving,200,100);
  text("Remove 1 ",120,200);
  text("Remove 2 ",220,200);
  text("Remove 3 ",320,200);
}

void PlayerTwo(){
       print("second");
       text("PlayerTwo", 30,30);
}

void Fine(){
}

void mousePressed(){
  switch(StatGame){
  case StatMenu:
    mousePressedMenu();
    break;
  case StatPlayerOne:
    mousePressedPlayerOne();
    break;
  case StatPlayerTwo:
    mousePressedPlayerTwo();
    break;
  case StatFine:
    mousePressedFine();
    break;
  default:
    println("Hai dimenticato uno Stato");
    break;
}//switch
}//funzione

void mousePressedMenu(){
  if(mouseX>150 && mouseX<420 && mouseY>120 &&  mouseY<150){
    StatGame = StatPlayerOne;
  }
   else if (mouseX>150 && mouseX<450 && mouseY>150 &&  mouseY<200){
     StatGame = StatPlayerTwo;
   }
}

void mousePressedPlayerOne(){
  if(mouseX>120 && mouseX<220 && mouseY>100&&  mouseY<300){

    howManyIsHeRemoving = 1;
  }
 
   else if (mouseX>220 && mouseX<320 && mouseY>100 &&  mouseY<300){

    howManyIsHeRemoving = 2;
   }
   
   else if (mouseX>320 && mouseX<420 && mouseY>100 &&  mouseY<300){

    howManyIsHeRemoving = 3;
   }
}

void mousePressedPlayerTwo(){
}

void mousePressedFine(){
}
