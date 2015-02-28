
int selector;
char card_1;
char card_2; 
char card_3; 
char card_4;

void setup() {
  size(400, 600);
  smooth();
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  //Grab a # from 1 to 13, rounded down to the nearest INT


  selector= floor(random(1, 14));
  if (selector == 11) {
    card_1 = 'J' ;
    card_2 = 'J';
    card_3 = 'J';
    card_4 = 'J';
  } 
 
  else if (selector == 12) {
    card_1 = 'Q';
    card_2 = 'Q';
    card_3 = 'Q';
    card_4 = 'Q';
  } 
  else if (selector == 13) {
    card_1 = 'K'; 
    card_2 = 'K';
    card_2 = 'K';
    card_3 = 'K';
  } 
  else {
    card_1 = (char)(selector+48); //else, use the char 
    card_2 = (char)(selector+48); 
    card_3 = (char)(selector+48); 
    card_4 = (char)(selector+48);
  }                                //representation of the #

  println(selector + ", " + card_1 + ", " + card_2 + ", " + card_3+ ", " + card_4);
}
 


void draw() {
  background(0);
  fill(240);
  rect(130, 180, 120, 180, 10);
  rect(280, 180, 120, 180, 10);
  rect(130, 380, 120, 180, 10);
  rect(280, 380, 120, 180, 10);

  fill(50);
  text(card_1, 130, 180); 
  text(card_2/16+1, 280, 180);
  text(card_3/20+3, 130, 380);
  text(card_4/12+6, 280, 380);

}



