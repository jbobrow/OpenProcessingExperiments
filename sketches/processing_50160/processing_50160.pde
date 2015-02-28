
PFont font;
PFont font2;
PFont font3;
PFont font4;

float sd=1;

int z=96;

int h=128;
int a=78;

int hh=100;
int ha=49;
int ah=45;
int aa=46;

int hhh=45;
int hha=35;
int hah=29;
int haa=24;
int ahh=33;
int aha=14;
int aah=24;
int aaa=17;

int hhhh=20;
int hhha=13;
int hhah=9;
int hhaa=9;
int hahh=12;
int haha=8;
int haah=8;
int haaa=5;
int ahhh=12;
int ahha=10;
int ahah=5;
int ahaa=10;
int aahh=4;
int aaha=9;
int aaah=2;
int aaaa=9;

float nh=49.4;
float na=31.8;

float nhh=23.1;
float nha=13.5;
float nah=13.9;
float naa=11.1;

float nhhh=7.8;
float nhha=5.3;
float nhah=4.9;
float nhaa=3.7;
float nahh=5.5;
float naha=2.9;
float naah=3.7;
float naaa=2.8;


void setup() {
  smooth();
  size(700, 700);
  font = createFont("Helvetica", 20);
  font2 = createFont("Helvetica", 15);
  font3 = createFont("Helvetica", 10);
  font4 = createFont("Helvetica", 7);
  textFont(font);
  textAlign(CENTER);
  
  background(255);
  
  /***0-0***/
  fill(200);
  strokeWeight(nh/sd);
  line(350, 350, 350, 220);
  strokeWeight(na/sd);
  line(350, 250, 350, 480);
  strokeWeight(1);
  ellipse(350, 350, z, z);
  fill(255);
  text("0-0", 350, 357);
  
  /***1-0***/
  fill(200);
  strokeWeight(nhh/sd);
  line(350, 220, 225, 145);
  strokeWeight(nha/sd);
  line(350, 220, 475, 145);
  strokeWeight(1);
  ellipse(350, 220, h, h);
  fill(255);
  text("1-0", 350, 227);
  
  /***0-1***/
  fill(200);
  strokeWeight(nah/sd);
  line(350, 480, 225, 555);
  strokeWeight(naa/sd);
  line(350, 480, 475, 555);
  strokeWeight(1);
  ellipse(350, 480, a, a);
  fill(255);
  text("0-1", 350, 487);
  
  /***2-0***/
  fill(200);
  strokeWeight(nhhh/sd);
  line(225, 145, 165, 85);
  strokeWeight(nhha/sd);
  line(225, 145, 285, 85);
  strokeWeight(1);
  ellipse(225, 145, hh, hh);
  fill(255);
  text("2-0", 225, 145);
  
  /***1-1***/
  fill(200);
  strokeWeight(nhah/sd);
  line(475, 145, 415, 85);
  strokeWeight(nhaa/sd);
  line(475, 145, 535, 85);
  strokeWeight(1);
  ellipse(475, 145, ha, ha); 
  fill(255);
  text("1-1", 475, 150);
  
  /***1-1***/
  fill(200);
  strokeWeight(nahh/sd);
  line(225, 555, 165, 615);
  strokeWeight(naha/sd);
  line(225, 555, 285, 615);
  strokeWeight(1);
  ellipse(225, 555, ah, ah);
  fill(255);
  text("1-1", 225, 560);
  
  /***0-2***/
  fill(200);
  strokeWeight(naah/sd);
  line(475, 555, 415, 615);
  strokeWeight(naaa/sd);
  line(475, 555, 535, 615);
  strokeWeight(1);
  ellipse(475, 555, aa, aa);
  fill(255);
  text("0-2", 475, 560);
  
  /***3-0***/
  textFont(font2);
  fill(200);
  strokeWeight(hhhh/10*sd);
  line(165, 85, 140, 45);
  strokeWeight(hhha/10*sd);
  line(165, 85, 190, 45);
  strokeWeight(1);
  ellipse(165, 85, hhh, hhh);
  fill(255);
  text("3-0", 165, 88);
  
  /***2-1***/
  fill(200);
  strokeWeight(hhah/10*sd);
  line(285, 85, 260, 45);
  strokeWeight(hhaa/10*sd);
  line(285, 85, 310, 45);
  strokeWeight(1);
  ellipse(285, 85, hha, hha);
  fill(255);
  text("2-1", 285, 88);
  
  /***1-2***/
  textFont(font3);
  fill(200);
  strokeWeight(aahh/10*sd);
  line(415, 615, 390, 655);
  strokeWeight(aaha/10*sd);
  line(415, 615, 440, 655);
  strokeWeight(1);
  ellipse(415, 615, aah, aah);
  fill(255);
  text("1-2", 415, 620);
  
  /***0-3***/
  fill(200);
  strokeWeight(aaah/10*sd);
  line(535, 615, 510, 655);
  strokeWeight(aaaa/10*sd);
  line(535, 615, 560, 655);
  strokeWeight(1);
  ellipse(535, 615, aaa, aaa);  
  fill(255);
  text("0-3", 535, 618);
  
  /***2-1***/
  textFont(font2);
  fill(200);
  strokeWeight(hahh/10*sd);
  line(415, 85, 390, 45);
  strokeWeight(haha/10*sd);
  line(415, 85, 440, 45);
  strokeWeight(1);
  ellipse(415, 85, hah, hah);  
  fill(255);
  text("2-1", 415, 88);
  
  /***1-2***/
  fill(200);
  strokeWeight(haah/10*sd);
  line(535, 85, 510, 45);
  strokeWeight(haaa/10*sd);
  line(535, 85, 560, 45);
  strokeWeight(1);
  ellipse(535, 85, haa, haa);
  fill(255);
  text("1-2", 535, 90);
  
  /***2-1***/
  fill(200);
  strokeWeight(ahhh/10*sd);
  line(165, 615, 140, 655);
  strokeWeight(ahha/10*sd);
  line(165, 615, 190, 655);
  strokeWeight(1);
  ellipse(165, 615, ahh, ahh);
  fill(255);
  text("2-1", 165, 620);
  
  /***1-2***/
  textFont(font4);
  fill(200);
  strokeWeight(ahah/10*sd);
  line(285, 615, 260, 655);
  strokeWeight(ahaa/10*sd);
  line(285, 615, 310, 655);
  strokeWeight(1);
  ellipse(285, 615, aha, aha);
  fill(255);
  text("1-2", 285, 618);
  
  /***4-0***/
  fill(200);
  textFont(font2);
  ellipse(140, 45, hhhh, hhhh);
  fill(0);
  text("4-0", 140, 25);
  
  /***3-1***/
  fill(200);
  ellipse(190, 45, hhha, hhha);
  fill(0);
  text("3-1", 190, 25);
  
  /***3-1***/
  fill(200);
  ellipse(260, 45, hhah, hhah);
  fill(0);
  text("3-1", 260, 25);
  
  /***2-2***/
  fill(200);
  ellipse(310, 45, hhaa, hhaa);
  fill(0);
  text("2-2", 310, 25); 
  
  /***2-2***/
  fill(200);
  ellipse(390, 655, aahh, aahh);
  fill(0);
  text("2-2", 390, 675);
  
  /***1-3***/
  fill(200);
  ellipse(440, 655, aaha, aaha);
  fill(0);
  text("1-3", 440, 675);
  
  /***1-3***/
  fill(200);
  ellipse(510, 655, aaah, aaah);
  fill(0);
  text("1-3", 510, 675);
  
  /***0-4***/
  fill(200);
  ellipse(560, 655, aaaa, aaaa);
  fill(0);
  text("0-4", 560, 675);
  
  /***3-1***/
  fill(200);
  ellipse(390, 45, hahh, hahh);
  fill(0);
  text("3-1",390, 25);
  
  /***2-2***/
  fill(200);
  ellipse(440, 45, haha, haha); 
  fill(0);
  text("2-2", 440, 25);
  
  /***2-2***/
  fill(200);
  ellipse(510, 45, haah, haah);
  fill(0);
  text("2-2", 510, 25);
  
  /***1-3***/
  fill(200);
  ellipse(560, 45, haaa, haaa); 
  fill(0);
  text("1-3", 560, 25);
  
  /***3-1***/
  fill(200);
  ellipse(140, 655, ahhh, ahhh);
  fill(0);
  text("3-1", 140, 675);
  
  /***2-2***/
  fill(200);
  ellipse(190, 655, ahha, ahha); 
  fill(0);
  text("2-2", 190, 675);
  
  /***2-2***/
  fill(200);
  ellipse(260, 655, ahah, ahah);
  fill(0);
  text("2-2", 260, 675);
  
  /***1-3***/
  fill(200);
  ellipse(310, 655, ahaa, ahaa);
  fill(0);
  text("1-3", 310, 675);
  
  textFont(font);
  line(550, 350, 650, 350);
  text("HOME", 600, 333);
  text("AWAY", 600, 383);
  fill(0);
  line(600, 300, 600, 250);
  triangle(600, 240, 585, 260, 615, 260);
  line(600, 400, 600, 450);
  triangle(600, 460, 585, 440, 615, 440); 
  
  textFont(font2);
  text("Created By Ford Bohrmann", 130, 350);
  text("@SoccerStatistic", 130, 370);
}

void draw() {


}


