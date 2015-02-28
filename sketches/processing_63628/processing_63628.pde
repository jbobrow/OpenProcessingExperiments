
//Pelaajan sijainnit

int playerX = 368;
int playerY = 198;

//Huoneet

boolean room1 = false;
boolean room2 = false;
boolean room3 = false;
boolean room4 = false;

//Muuta tarpeellista

boolean playerMoved = false;

//Kerrotaan paljonko pelaaja liikkuu pikseleina

int playerMove = 20;

//Pelin kuvat

PImage room_1;
PImage player;
PImage quest;

//Asetukset ym pakolliset jutut

void setup () {

//Kuvien lataus  

room_1 = loadImage("room_1.PNG");
player = loadImage("player.PNG");
quest = loadImage("quest.PNG");

//Ikkunan koko ja taustakuva

size(500,500);
background(room_1);

}

//Taalla tehdaan kaikki mika nakyy ruudulla ja vahan muutakin

void draw () {
  
    // Tehdaan seinat
  
  if (playerX == 448 && playerY == 238 || playerX == 428 && playerY == 258 || playerX == 408 && playerY == 278 || playerX == 388 && playerY == 298 || playerX == 368 && playerY == 318 || playerX == 348 && playerY == 338 || playerX == 328 && playerY == 358 || playerX == 308 && playerY == 378 || playerX == 288 && playerY == 398 || playerX == 268 && playerY == 418 || playerX == 248 && playerY == 438) {
   playerX = playerX - playerMove; 
   playerY = playerY - playerMove;
  }
  
  if (playerX == 468 && playerY == 218) {
  playerX = playerX - playerMove; 
  playerY = playerY - playerMove;
  playerY = playerY + playerMove; 
  playerX = playerX - playerMove;
  }
  
  if (playerX == 208 && playerY == 438 || playerX == 188 && playerY == 418 || playerX == 168 && playerY == 398|| playerX == 148 && playerY == 378 || playerX == 128 && playerY == 358 || playerX == 108 && playerY == 338 || playerX == 88 && playerY == 318 || playerX == 68 && playerY == 298 || playerX == 48 && playerY == 278 || playerX == 28 && playerY == 258 || playerX == 8 && playerY == 238) {
  playerY = playerY - playerMove; 
  playerX = playerX + playerMove;
  }
  
  if (playerX == 228 && playerY == 458) {
  playerX = playerX - playerMove; 
  playerY = playerY - playerMove;
  playerY = playerY - playerMove; 
  playerX = playerX + playerMove;
  }
  
  if (playerX == 8 && playerY == 198 || playerX == 28 && playerY == 178 || playerX == 48 && playerY == 158 || playerX == 68 && playerY == 138 || playerX == 88 && playerY == 118 || playerX == 108 && playerY == 98 || playerX == 128 && playerY == 78 || playerX == 148 && playerY == 58 || playerX == 168 && playerY == 38 || playerX == 188 && playerY == 18 || playerX == 208 && playerY == -2) {
  playerX = playerX + playerMove; 
  playerY = playerY + playerMove;
  }
  
  if (playerX == -12 && playerY == 218) {
  playerX = playerX + playerMove; 
  playerY = playerY + playerMove; 
  playerY = playerY - playerMove; 
  playerX = playerX + playerMove; 
  }
  
  if (playerX == 248 && playerY == -2 || playerX == 268 && playerY == 18 || playerX == 288 && playerY == 38 || playerX == 308 && playerY == 58 || playerX == 328 && playerY == 78 || playerX == 348 && playerY == 98 || playerX == 368 && playerY == 118 || playerX == 388 && playerY == 138 || playerX == 408 && playerY == 158 || playerX == 428 && playerY == 178 || playerX == 448 && playerY == 198) {
  playerY = playerY + playerMove; 
  playerX = playerX - playerMove;
  }
  
  if (playerX == 228 && playerY == -22) {
  playerX = playerX + playerMove; 
  playerY = playerY + playerMove;
  playerY = playerY + playerMove; 
  playerX = playerX - playerMove;
  }
  
  //Pyyhitaan kaikki turha pois

image(room_1,0,0);
//image(player,392,298); 
  //Luodaan pelaaja ja annetaan sijanti.

image(player, playerX, playerY);

  //Tehdaan alkutervehdys pelaajalle
  
if (!(playerMoved == true)) {  
if (playerX == 368 && playerY == 198) {
image(quest,100,50);
fill(0, 0, 0);
text ("Tervetuloa pelaamaan BlockRooms betaa!",110,70);
text ("Ohjaa laatikkoa nappaimilla W, A, S ja D.",110,95);
}
}
}
  //Taalla tehdaan kontrollit

void keyPressed () {

  //Liikuttaminen sivusuunnassa
 
if (key =='a' || key =='A') {
 playerX = playerX - playerMove; 
 playerY = playerY - playerMove;
 if (playerMoved == false) {
 playerMoved = true;
 }
}

if (key =='d' || key =='D') {
 playerX = playerX + playerMove; 
 playerY = playerY + playerMove;
 if (playerMoved == false) {
 playerMoved = true;
 }
 }

  //Liikuttaminen Pystysuunnassa
  
if (key =='w' || key =='W') {
 playerY = playerY - playerMove; 
 playerX = playerX + playerMove;
 if (playerMoved == false) {
 playerMoved = true;
 }
}

if (key =='s' || key =='S') {
 playerY = playerY + playerMove; 
 playerX = playerX - playerMove;
 if (playerMoved == false) {
 playerMoved = true;
 }
}

}


