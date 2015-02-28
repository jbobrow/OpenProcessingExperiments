
// Processing Race game: Race 2 Finish
// Gino Kelleners 1073796 CMD1B

// Aanvullingen:  - Geluid/Jaren '80 game muziek
//                - Gebruik gemaakt van plaatjes: Achtergrond en ook levens en 3 race auto's
//                - Instructiescherm, pauzeerscherm en Game over scherm
//                - Spel is gebaseerd op 3 levels
//                - Tijdens de game wordt ook de score bijgehouden
//                - 3 Levens in de vorm van hartjes
//                - printline als je ge'HIT' wordt door de auto
//                - Bij level 3 komt een 4e auto erbij

Car otherCar1;         //car 1 declareren
Car otherCar2;         //car 2 declareren
Car otherCar3;         //car 3 declareren
Car otherCar4;         //car 4 declareren

float positieX = 520;     //x positie van race auto
float positieY = 160;     //y positie van race auto
int rectB = 50;           //breedte van race auto
int rectH = 50;           //hoogte van race auto
int counter = 0;          //telt de score op
int lives = 3;            //3 levens per spel (na 3 keer botsen game over)
int level = 1;            //level van het spel, bij level omhoog auto's komen sneller
int screenNumber;         //welk scherm in beeld komt
boolean[] keys;           //pijltjestoetsen
PImage backgroundImage;   //initialise afbeeldingen
PImage carImage;          //Formule 1 Marlboro
PImage carImage2;         //Formule 1 Pirelli         
PImage carImage3;         //Formule 1 Benetton
PImage carImage4;         //Formule 1 Canon
PImage levens;            //Hart staat voor aantal levens
PImage start;             //Custom startscherm met instructies
PImage pause;             //Als op spatiebalk gedrukt wordt pauzeerd het spel met dit scherm
PImage gameover;          //Gameover screen
PFont f;                  //Lettertype level en score

import ddf.minim.*;    //initialise muziek
Minim minim;
AudioPlayer player;

void setup() {
  size(1100,650);      //grootte van het spel
   
  backgroundImage = loadImage("images/racetrack.jpg"); //inladen van afbeeldingen
  carImage = loadImage("images/car.png");
  carImage2 = loadImage("images/car2.png");
  carImage3 = loadImage("images/car3.png");
  carImage4 = loadImage("images/car4.png");
  levens = loadImage("images/leven.png");             //linksboven 3 hartjes
  start = loadImage("images/start.png");              //Start menu
  pause = loadImage("images/pause.png");              //Pauze menu
  gameover = loadImage("images/gameover.png");        //Game Over
  f = createFont("Courier New Bold",12,true);
  
  minim = new Minim(this);      //inladen van muziek
  player = minim.loadFile("music/ractrack_audio2.mp3");
  player.loop();
  
  keys=new boolean[2];  //pijltjestoetsen links en rechts
  keys[0]=false;
  keys[1]=false;
  
  otherCar1 = new Car(456,0,2); //auto 1 initieren
  otherCar2 = new Car(250,0,3); //auto 2 initieren
  otherCar3 = new Car(730,0,1); //auto 3 initieren
  otherCar4 = new Car(560,0,4); //auto 4 initieren
}

void draw() {
    for(int i = 0; i < player.bufferSize() - 1; i++) //Audio
    {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
    line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
  }
  
  image(backgroundImage,0,0);        //achtergrond
  
 
  if(screenNumber == 0){                //test om te kijken welk scherm gedisplayed moet worden
  otherCar1.displayInstructions();      //startscherm met instructies
  }
  else if(screenNumber == 1){          
  otherCar1.displayRaceCar();          //aanroepen van de objecten
  otherCar1.drive();      
  otherCar1.display();
  otherCar1.testRandCar1();
  otherCar2.drive2();
  otherCar2.display2();
  otherCar2.testRandCar2();
  otherCar3.drive3();
  otherCar3.display3();
  otherCar3.testRandCar3();
  otherCar4.drive4();
  otherCar4.display4();
  otherCar4.testRandCar4();
  gameOver();
}  
else if(screenNumber == 2) {
   otherCar1.displayPause(); 
}
  if(keyCode == ' ') {      // Spatie drukken voor pauze
    screenNumber = 2;
}
}

 class Car {           //class aangemaakt voor de Cars
  float xpos;
  float ypos;
  float yspeed;
 
  //de otherCars zijn arguments bepalen door wat ingevuld wordt bij de setup.
  Car(float tempXpos, float tempYpos, float tempYspeed) { 
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = tempYspeed;
}

void displayRaceCar(){
 rectMode(CENTER);        //teken race auto
  fill(0,0,0);
  stroke(0);
  rect(positieX,positieY+330,rectH,rectB-46);          //voor wielstangen
  rect(positieX,positieY+424,rectH,rectB-45);          //achter wielstangen
  fill(255,255,0);
  stroke(55,55,255);
  rect(positieX,positieY+308,rectH+14,rectB-39);       //voor vleugel neus
  rect(positieX,positieY+446,rectH+25,rectB-36);       //achter vleugel
  fill(255,255,0);
  stroke(255,255,0);
  rect(positieX,positieY+353,rectH-19,rectB+30);       //romp vuurtuig voor
  rect(positieX,positieY+302,rectH-26,rectB-37);       //romp vuurtuig voor 2
  rect(positieX,positieY+385,rectH+10,rectB-4);        //romp vuurtuig achter
  rect(positieX,positieY+429,rectH-7,rectB-9);         //romp vuurtuig achter 2
  fill(0,0,0);
  stroke(0);
  rect(positieX-36,positieY+424,rectH-29,rectB-23);    //achterwiel links
  rect(positieX+36,positieY+424,rectH-29,rectB-23);    //achterwiel rechts
  rect(positieX-31,positieY+330,rectH-30,rectB-25);    //voorwiel links
  rect(positieX+30,positieY+330,rectH-30,rectB-25);    //voorwiel rechts
  fill(55,55,255);
  stroke(55,55,255);
  rect(positieX,positieY+317,rectH-48,rectB-36);        //voor race nummer
  rect(positieX+35,positieY+447,rectH-49,rectB-43);     //letter c van camel
  rect(positieX+32,positieY+442,rectH-43,rectB-49);     //letter c van camel
  rect(positieX+32,positieY+450,rectH-43,rectB-49);     //letter c van camel
  rect(positieX+17,positieY+450,rectH-42,rectB-49);     //letter a van camel  
  rect(positieX+21,positieY+445,rectH-49,rectB-43);     //letter a van camel  
  rect(positieX+14,positieY+445,rectH-49,rectB-43);     //letter a van camel
  rect(positieX+18,positieY+445,rectH-44,rectB-49);     //letter a van camel  
  rect(positieX+0,positieY+450,rectH-39,rectB-49);      //letter m van camel  
  rect(positieX+5,positieY+445,rectH-49,rectB-43);      //letter m van camel  
  rect(positieX-5,positieY+445,rectH-49,rectB-43);      //letter m van camel
  rect(positieX+0,positieY+445,rectH-49,rectB-43);      //letter m van camel
  rect(positieX+-16,positieY+450,rectH-43,rectB-49);    //letter e van camel  
  rect(positieX+-13,positieY+446,rectH-49,rectB-41);    //letter e van camel  
  rect(positieX-16,positieY+446,rectH-43,rectB-49);     //letter e van camel
  rect(positieX+-16,positieY+442,rectH-43,rectB-49);    //letter e van camel
  rect(positieX+-31,positieY+442,rectH-43,rectB-49);    //letter l van camel
  rect(positieX+-28,positieY+446,rectH-49,rectB-41);    //letter l van camel
  rect(positieX+10,positieY+341,rectH-43,rectB-49);     //letter e van elf  
  rect(positieX+13,positieY+341,rectH-49,rectB-41);     //letter e van elf 
  rect(positieX+10,positieY+337,rectH-43,rectB-49);     //letter e van elf 
  rect(positieX+10,positieY+345,rectH-43,rectB-49);     //letter e van elf 
  rect(positieX+0,positieY+337,rectH-43,rectB-49);      //letter l van elf 
  rect(positieX+3,positieY+341,rectH-49,rectB-41);      //letter l van elf
  rect(positieX+-10,positieY+345,rectH-43,rectB-49);    //letter f van elf 
  rect(positieX+-7,positieY+341,rectH-49,rectB-41);     //letter f van elf 
  rect(positieX+-10,positieY+341,rectH-43,rectB-49);    //letter f van elf   
  rect(positieX+-1,positieY+395,rectH-32,rectB-49);     //zitplek racer 
  rect(positieX+-9,positieY+383,rectH-49,rectB-30);     //zitplek racer  
  rect(positieX+8,positieY+383,rectH-49,rectB-30);      //zitplek racer 
} 




void displayInstructions() //beginsscherm start game met shift
{
  image(start,0,0);        //image wordt weergegeven vanuit linkse bovenhoek

  if(keyCode == SHIFT)
  {
    screenNumber = 1;
  }
}
void displayPause() //pauze menu resume game met shift
{
  image(pause,0,0);      //image wordt weergegeven vanuit linkse bovenhoek
  if(keyCode == SHIFT)
  {
    screenNumber = 1;
  }
}

void display() {              
  image(carImage,xpos,ypos); //90x160 afbeelding gemaakt van raceauto in photoshop
  fill(255);
  textFont(f,30);
  text("Level " +level,855,80);          //plaatst rechtsboven level
  text("Score " +counter, 855, 40);      //plaatst rechtsboven score
}

void drive() {
  ypos = ypos + yspeed;
  if (ypos > height) {
  counter = counter+10;        //Auto komt door, krijg je 10 punten
  ypos = -100;
  xpos = random(240,730);      //auto's verschijnen verschillend op de x as
  yspeed = random(1,4);        //snelheid van auto's varieerd per level
}
  if ((counter>=150) && (counter<300)) {   //bij score 150 komen auto's sneller
  level = 2;                               //bij score 150, kom je in level 2
  yspeed = random(2,6);
}
  else if (counter > 300){                 //bij score 300 komen auto's nog sneller
  level = 3;                               //bij score 300, kom je in level 3 + 1 extra auto spel wordt dus moeilijker
  yspeed = random(4,8);
}
}
void testRandCar1() {                      //code geschreven voor botsen, als auto geraakt wordt krijg je een HIT
    if (ypos > 320 && xpos > positieX-100 && xpos < positieX+20) {    //test geschreven voor het botsen
      ypos =-100;
      lives = lives -1;
      println("HIT");
}
}

void display2() {              
  image(carImage2,xpos,ypos); //90x160 afbeelding gemaakt in photoshop
}

void drive2() {
  ypos = ypos + yspeed;
  if (ypos > height) {
  counter = counter+10;        //Auto komt door, krijg je 10 punten
  ypos = -100;
  xpos = random(240,730);
  yspeed = random(2,3);
}
  if ((counter>=150) && (counter<300)) {   //bij score 150 komen auto's sneller   
  yspeed = random(3,5);
}
  else if (counter > 300){                 //bij score 300 komen auto's nog sneller
  yspeed = random(5,8);
}
}
void testRandCar2() {                      //code geschreven voor botsen, als auto geraakt wordt krijg je een HIT
    if (ypos > 320 && xpos > positieX-100 && xpos < positieX+20) {
      ypos =-100;
      lives = lives -1;
      println("HIT");
}
}
void display3() {              
  image(carImage3,xpos,ypos); //90x160 afbeelding gemaakt in photoshop
}

void drive3() {
  ypos = ypos + yspeed;
  if (ypos > height) {
  counter = counter+10;        //Auto komt door, krijg je 10 punten
  ypos = -100;
  xpos = random(240,730);
  yspeed = random(2,3);
}
  if ((counter>=150) && (counter<300)) {   //bij score 150 komen auto's sneller    
  yspeed = random(3,5);
}
  else if (counter > 300){                  //bij score 300 komen auto's nog sneller
  yspeed = random(5,8);
}
}

void testRandCar3() {                    //code geschreven voor botsen, als auto geraakt wordt krijg je een HIT
    if (ypos > 320 && xpos > positieX-100 && xpos < positieX+20) {
      ypos =-100;
      lives = lives -1;
      println("HIT");
}
}
void display4(){                //Komt een extra auto bij het halen van level 3
if (counter > 300){
  image(carImage4,xpos,ypos);
  }
}
void drive4() {
  ypos = ypos + yspeed;
  if (ypos > height) {
  counter = counter+20;        //4e Auto komt door, krijg je 20 punten
  ypos = -100;
  xpos = random(238,735);      //auto's verschijnen verschillend op de x as
}
else if (counter > 300){                  //bij score 300 komen auto's nog sneller
  yspeed = random(6,9);
}
}
void testRandCar4() {   //code geschreven voor botsen, als auto geraakt wordt krijg je een HIT
    if (counter > 300){
    if (ypos > 320 && xpos > positieX-100 && xpos < positieX+20) {
      ypos =-100;
      lives = lives -1;
      println("HIT");
}
}
}
}

void gameOver() {
  if (lives == 3) {
  image(levens,72,20);              //levens linksboven in beeld
  image(levens,102,20);              //levens linksboven in beeld
  image(levens,132,20);              //levens linksboven in beeld
}
  if (lives == 2) {
  image(levens,72,20);              //levens linksboven in beeld
  image(levens,102,20);              //levens linksboven in beeld
}
  if (lives == 1) {
  image(levens,72,20);              //levens linksboven in beeld
}
  if (lives == 0) {
    image(gameover,0,0);            //Geen levens meer, dan game over scherm
    noLoop();
}
}
void keyPressed(){
if (key == CODED) {
    if (keyCode == LEFT) {
      keys[0]=true;
      positieX = positieX - 20;        //linkse pijltjestoets positieX-20
}   if (keyCode == RIGHT) {
      keys[1]=true;
      positieX = positieX + 20;        //rechtse pijltjestoets positieX+20
} 
if (positieX > 850){                  //raceauto kan niet van de weg af rechts
      positieX = 850;
    }
if (positieX < 230){                  //raceauto kan niet van de weg af links
    positieX = 230;
}
}
}
void keyReleased()              //instellen als pijltjestoets wordt losgelaten
{
  if (keyCode == LEFT)
      keys[0]=false;
      if (keyCode == RIGHT)
      keys[1]=false;
   
if (keyCode == ENTER){          //bij gameover scherm, druk enter voor nieuw spel
    lives =3;
    counter = 0;
    player.close();
    setup();
    loop();
  }
}

 
//Veel plezier met het spelen van de Game: ..Race 2 Finish.. made by Gino Kelleners









