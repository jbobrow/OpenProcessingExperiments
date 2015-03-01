
/* Facebook , Suerim Kim
Click 'Like' to start this program, and continue clicking until you get the final response. 
To start agian, please press 'r'.
*/

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;
PImage img13;
PImage img14;
PImage img15;
PImage img16;
PImage img17;

int xpos = 255;
int ypos = 356;
int iwid = 340;
int ihei = 70;
int ry = 270;

int mouseclick = 0;

Tear myTear1;
Tear myTear2;
Tear myTear3;
Tear myTear4;
Tear myTear5;
Tear myTear6;
Tear myTear7;
Tear myTear8;
Tear myTear9;
Tear myTear10;

void setup () {
  size (720,720);
  background (255);
  img1 = loadImage(" facebooktotal1.png");
  img2 = loadImage(" facebooktshirt.png");
  img3 = loadImage(" facebookbelly.png");
  img4 = loadImage(" facebooktop.png");
  img5 = loadImage("facebookbg5.png");
  img6 = loadImage("1hentaireply.png");
  img7 = loadImage("2gamnarareply.png");
  img8 = loadImage("3baenarareply.png");
  img9 = loadImage("4hentaitworeply.png");
  img10 = loadImage("5makmalhae.png");
  img11 = loadImage("6hentaithree.png");
  img12 = loadImage("7malmakhae2.png");
  img13 = loadImage("8hentaifour.png");
  img14 = loadImage("9doumakhae.png");
  img15 = loadImage("91sluut.png");
  img16 = loadImage("92passingby.png");
  img17 = loadImage("93lastreply.png");
  

   myTear1 = new Tear(color(203,228,237),311,205,2);
   myTear2 = new Tear(color(203,228,237),330,189,2);
   myTear3 = new Tear(color(203,228,237),311,205,2);
   myTear4 = new Tear(color(203,228,237),330,189,2);
   myTear5 = new Tear(color(203,228,237),311,205,2);
   myTear6 = new Tear(color(203,228,237),330,189,2);
   myTear7 = new Tear(color(203,228,237),311,205,2);
   myTear8 = new Tear(color(203,228,237),330,189,2);
   myTear9 = new Tear(color(203,228,237),311,205,2);
   myTear10 = new Tear(color(203,228,237),330,189,2);
}
 

void draw () {
 // println (mouseX,"/",mouseY,".",mouseclick);
  image (img1,0,0,720,406);

 if (mouseclick >=7 ) {
 image (img6, xpos, ypos, iwid, ihei); 
}
 if (mouseclick >=15 ) {
 image (img7, xpos, ypos+ihei, iwid, ihei);
}
 if (mouseclick >=20 ) {
 image (img8, xpos, ypos+2*ihei, iwid, ihei);
}
 if (mouseclick >=30 ) {
 image (img2,0,0,720,406); 
} 
 if (mouseclick >=35 ) {
 image (img9, xpos, ypos+3*ihei, iwid, ihei);
 }
 if (mouseclick >=43 ) {
 image (img3, 0,0,720,406);
 }
 if (mouseclick >=48 ) {
 image (img4, 0,0,720,406);
}
 if (mouseclick >=50 ) {
 image (img10,xpos, ypos+4*ihei, iwid, ihei); 
 }
 if (mouseclick >=54 ) {
 myTear1.move();
 myTear1.display();
 myTear2.move();
 myTear2.display();
 }
 if (mouseclick >=58 ){
 image (img11,0, ypos+4*ihei, iwid,ihei);
 }
 if (mouseclick >=59 ){
 myTear3.move();
 myTear3.display();
 myTear4.move();
 myTear4.display();
 rectMode(CORNERS);
 rect(275,ry,575,323);
 }
 if (mouseclick >=62) {
 image (img12,0, ypos+3*ihei, iwid,ihei);
 rectMode(CORNERS);
 rect(275,ry,575,323);
 }
 if (mouseclick >=64) {
 image (img13,0, ypos+2*ihei,iwid,ihei);
 rectMode(CORNERS);
 rect(275,ry,575,323);
 }
 if (mouseclick >=65) {
 image (img14,0, ypos+ihei, iwid, ihei);
 rectMode(CORNERS);
 rect(275,ry,575,323);
 }
 if (mouseclick >=69) {
 rectMode(CORNERS);
 rect(275,ry,575,323);
 image (img5, 0,0,720,406);
 image (img15,0, ry, iwid, ihei);

 }
 if (mouseclick >=70) {
 myTear5.move();
 myTear5.display();
 myTear6.move();
 myTear6.display();
 rectMode(CORNERS);
 rect(275,ry,575,323);
}

 if (mouseclick >=71) {
 rectMode(CORNERS);
 rect(275,ry,575,323);
 image (img16,0,ry-ihei,iwid,ihei);
 
 }
 if (mouseclick >=73) {
 myTear7.move();
 myTear7.display();
 myTear8.move();
 myTear8.display();
 rectMode(CORNERS);
 rect(275,ry-70,575,323);
 }
 if (mouseclick >=75) {
 myTear9.move();
 myTear9.display();
 myTear10.move();
 myTear10.display();
 rectMode(CORNERS);
 rect(275,ry-100,575,323);
}
 if (mouseclick >=77) {
 rectMode(CORNERS);
 rect(275,ry-120,575,323);
 image (img17,ihei,ypos-2*ihei,width,height/2);
}
}
void mousePressed(){
  if ((mouseButton == LEFT)&& mouseX<287 && mouseX>262 && mouseY<353 && mouseY >333) {
    mouseclick= mouseclick+1;
  } 
}  
void keyPressed() {
  if (key == 'r') {
    mouseclick = 0;
    setup();
    newStart();
  }
}
void newStart() {
  size (720,720);
  background(255);
}


class Tear {
  color c;
  int xpos;
  int ypos;
  int yspeed;

  Tear() {
    c= color(203,228,237);
    xpos = 311;
    ypos = 205;
    yspeed = 1;
  }
  Tear (color cl, int xp, int yp,int sp) {
    c= cl;
    xpos = xp;
    ypos = yp;
    yspeed = sp;
  }
  void display() {
    noStroke();
    fill (c);
    ellipse(xpos,ypos,10,10);
  }
  void move() {
    ypos=ypos+yspeed;
    if(ypos >318) {
      yspeed = 0; 
    }
 }
}


