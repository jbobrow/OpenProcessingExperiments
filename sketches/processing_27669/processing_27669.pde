
PImage img;
PImage img2;
PImage img3;
PImage img2_L;
PImage img2_R;
PImage img3_L;
PImage img3_R;
PImage crop;
PImage crop2;
PImage crop3;
PImage crop4;

PImage fish1;
PImage fish2;
PImage fish3;
PImage fish1b;
PImage fish2b;
PImage fish3b;
PFont font;

float buffer = 640;
float x = -106;
float x2 = 640 - 106;

//gradient modifications
float x3 = x - 106; // bar gradient of 50% grey on the left (bar1)
float x4 = x + 106; // bar gradient of 50% grey on the right (bar1) (correct)
float x5 = x2 - 106; // bar gradient of 50% grey on the left (bar2)
float x6 = x2 + 106; // bar gradient of 50% grey on the right (bar2) (correct)

float speed = 0.1; //scroll speed 
int barWidth = 106;
float xFish1 = 600; //FISH 1 (original 640 +42)
float xFish2 = -55; //FISH 2
float xFish3 = 640; //FISH 3 (original start point 640+69)
float speedFish1 = 0.5;
float speedFish2 = 0.5;
float speedFish3 = 0.5;


//font customization variables
int largeSizeFont = 24;
int regSizeFont = 18;
int r = 237;
int g = 23;
int b = 93;

int r1 = 255;
int g1 = 255;
int b1 = 255;



void setup() {
  background(0);
  size(640, 480);
  smooth ();
  img = loadImage("imgGREYworld_1.png");
  img2 = loadImage("blueyellow4_2.png");
  img3 = loadImage("blueyellow4_2_copy.png"); 
     img2_L = loadImage("blueyellow5_dark.png"); // SIDE GRAIDENT bar 1, left
      img2_R = loadImage("blueyellow5_dark2.png");// SIDE GRAIDENT bar 1, right
       img3_L = loadImage("blueyellow5_dark3.png");// SIDE GRAIDENT bar 2, left
        img3_R = loadImage("blueyellow5_dark4.png");// SIDE GRAIDENT bar 2, right

  font = loadFont("AtomicClockRadio-48.vlw");
  fish1 = loadImage("fish_1.png");
  fish2 = loadImage("fish_2.png");
  fish3 = loadImage("fish_3.png");
  fish1b = loadImage("fish_1b.png");
  fish2b = loadImage("fish_2b.png");
  fish3b = loadImage("fish_3b.png");
  

}
void draw () {
  image(img, 0, 0);



//adjusting current time attempt_1
//TIME parameters 
float h = hour();
float m = minute();
float s = second();
float currentTime = s + (m*60) + (h*60*60);
float noon = 43200; //in seconds
float twentyFour = 86400; // in seconds
float offset = ((noon - currentTime)/twentyFour)* width;

// REAL TIME (take out x += speed when I want the real/current time)
x = 76 - 53 + offset;
x2 = 76 - 53 + offset + width; // one cycle later

 
  
  //FIRST BAR 
 //x -= speed;
  if (x < -106) { // restart after the second one has made full motion
    x = width*2 - 106; //original was just barWidth, but i want to restart from negative position 1 (+width)
  }
  crop = img2.get((int)x+barWidth + 640, 0, barWidth, 480); //the first co-ordinate cannot be a float use (int) to cast original intx+106
  image(crop, x, 0);
 
 
 
//SHADOW BAR 1 - left (WORKING)
  crop = img2_L.get((int)x +barWidth + 640 - 106, 0, barWidth, 480); //the first co-ordinate cannot be a float use (int) to cast original intx+106
  image(crop, x - 106, 0);
  
  
  
 //SHADOW BAR 1 - right (WORKING)
  crop = img2_R.get((int)x+barWidth + 640 + 106, 0, barWidth, 480); //the first co-ordinate cannot be a float use (int) to cast original intx+106
  image(crop, x + 106, 0);
  


  //SECOND BAR 2.0 (WORKING)

  //x2 -= speed;
  if (x2 < -106) { // restart after the second one has made full motion
    x2 = width*2 - 106; //original was just barWidth, but i want to restart from negative position 1 (+width)
  }
  crop2 = img3.get((int)x2+barWidth + 640 , 0, barWidth, 480); //the first co-ordinate cannot be a float use (int) to cast original intx+106

  image(crop2, x2, 0);


  //SHADOW BAR 2 - left (WORKING)
  crop = img3_L.get((int)x2 + 640, 0, barWidth, 480); //the first co-ordinate cannot be a float use (int) to cast original intx+106
  image(crop, x2 - 106, 0);
  
  
  
   //SHADOW BAR 2 - right (WORKING)
  crop = img2_R.get((int)x2 + 640 + barWidth*2 , 0, barWidth, 480); //the first co-ordinate cannot be a float use (int) to cast original intx+106
  image(crop, x2 + 106, 0);



  // SFO text attempt_1

  if((x > -15) && (x < 55) || (x2 > -15) && (x2 < 55)) { 
    
    if(s % 2 == 0){
       textFont(font, largeSizeFont); 
       fill(r1, g1, b1);  
       text("SFO", 56, 169);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("SFO", 56, 169);
  }
  //london

  if((x > 220) && (x < 291) || (x2 > 220) && (x2 < 291)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("LHR", 290, 150); 
    }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("LHR", 290, 150);
  }

  //DXB

  if((x > 299) && (x < 370) || (x2 > 299) && (x2 < 370)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("DXB", 369, 206);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("DXB", 369, 206);
  }

  //Hong Kong

  if((x > 421) && (x < 492) || (x2 > 421) && (x2 < 492)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("HKG", 491, 221);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("HKG", 491, 221);
  }

  //Chicago

  if((x > 50) && (x < 120) || (x2 > 50) && (x2 < 120)) {   
    
    if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("ORD", 119, 165);
    }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("ORD", 119, 165);
  }

  //Los Angeles

  if((x > -12) && (x < 58) || (x2 > -12) && (x2 < 58)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("LAX", 57, 191);
    }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("LAX", 57, 191);
  }
  //Detroit

  if((x > 57) && (x < 127) || (x2 > 57) && (x2 < 127)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("DET", 126, 187);
    }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("DET", 126, 187);
  }
  //washington 

  if((x > 95) && (x < 166) || (x2 > 95) && (x2 < 166)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("DCA", 165, 190);
    }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("DCA", 165, 190);
  }
  //New York

  if((x > 99) && (x < 170) || (x2 > 99) && (x2 < 170)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("JFK", 168, 171);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("JFK", 168, 171);
  }
  //ireland

  if((x > 181) && (x < 249) || (x2 > 181) && (x2 < 249)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("DUB", 248, 141);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("DUB", 248, 141);
  }
  //london

  if((x > 220) && (x < 291) || (x2 > 220) && (x2 < 291)) {   
    if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("LHR", 290, 150);
    }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("LHR", 290, 150);
  }
  //paris

  if((x > 200) && (x < 270) || (x2 > 200) && (x2 < 270)) {   
    if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("CDG", 269, 168);
    }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("CDG", 269, 168);
  }
  //milan

  if((x > 226) && (x < 295) || (x2 > 226) && (x2 < 295)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("MXP", 294, 187);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("MXP", 294, 187);
  }
  //beijing

  if((x > 418) && (x < 487) || (x2 > 418) && (x2 < 487)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("PEK", 486, 183);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("PEK", 486, 183);
  }
  //shanghai

  if((x > 431) && (x < 503) || (x2 > 431) && (x2 < 503)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("PVG", 501, 203);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("PVG", 501, 203);
  }
  //japan

  if((x > 474) && (x < 546) || (x2 > 474) && (x2 < 546)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("NRT", 545, 183);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("NRT", 545, 183);
  }
  //melbourne

  if((x > 457) && (x < 546) || (x2 > 457) && (x2 < 546)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("MLB", 545, 355);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("MLB", 545, 355);
  }
  //sydney

  if((x > 510) && (x < 579) || (x2 > 510) && (x2 < 579)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("SYD", 578, 333);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("SYD", 578, 333);
  }
  //brasillia

  if((x > 123) && (x < 194) || (x2 > 123) && (x2 < 194)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("BSB", 192, 290);
    }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("BSB", 192, 290);
  }
  //rio de j.

  if((x > 139) && (x < 209) || (x2 > 139) && (x2 < 209)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("GIG", 208, 312);
    }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("GIG", 208, 312);
  }
  //capetown

  if((x > 254) && (x < 323) || (x2 > 254) && (x2 < 323)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("CPT", 322, 327);
    }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("CPT", 322, 327);
  }
  //sierra leone

  if((x > 191) && (x < 261) || (x2 > 191) && (x2 < 261)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("SRK", 260, 237);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("SRK", 260, 237);
  }

  //mumbai

  if((x > 357) && (x < 428) || (x2 > 357) && (x2 < 428)) {   
     if(s % 2 == 0){
    textFont(font, largeSizeFont); 
    fill(r1, g1, b1); 
    text("BOM", 428, 225);
     }
  }
  else {
    textFont(font, regSizeFont); 
    fill (r, g, b);
    text("BOM", 428, 225);
  }


  /*
//FISH 1 (<--)
   xFish1 -= speedFish1;
   if (xFish1 < -42) {
   xFish1 = 640+42;
   }
   image(fish1, xFish1, 420);
   */

  //fish 1 inside (working) (<--)

  if((x < xFish1) && (x + 106 - 42 > xFish1) || (x2 < xFish1) && (x2 + 106 - 42 > xFish1)) {   
    image(fish1, xFish1, 380);
  }
  else {
    image(fish1b, xFish1, 380);
  }
  xFish1 -= speedFish1;
  if (xFish1 < -42 ) {
    xFish1 = 640 +42;
  }


  //fish 2 inside (working) (-->)

  if((x < xFish2) && (x + 106 - 55 > xFish2) || (x2 < xFish2) && (x2 + 106 - 55 > xFish2)) {   
    image(fish2, xFish2, 20);
  }
  else {
    image(fish2b, xFish2, 20);
  }
  xFish2 += speedFish2;
  if (xFish2 > width + 55 ) {
    xFish2 = -55;
  }

/*
  //fish 3 inside  (<--)

  if((x < xFish3) && (x + 106 - 69 > xFish3) || (x2 < xFish3) && (x2 + 106 - 69 > xFish3)) {   
    image(fish3, xFish3, 420);
  }
  else {
    image(fish3b, xFish3, 420);
  }
  xFish3 -= speedFish3;
  if (xFish3 < 0 ) {
    xFish3 = 640 + 69;
  }

*/

  //fish 3_2 inside (<--)

  if((x < xFish3) && (x + 106 - 69 > xFish3) || (x2 < xFish3) && (x2 + 106 - 69 > xFish3)) {   
    image(fish3, xFish3, 400);
  }
  else {
    image(fish3b, xFish3, 400);
  }
  xFish3 -= speedFish3;
  if (xFish3 < -69 ) {
    xFish3 = 640 + 69;
  }
/*
  //fish 4 (mirror if fish1) (<--)

  if((x < xFish4) && (x + 106 - 42 > xFish4) || (x2 < xFish4) && (x2 + 106 - 42 > xFish4)) {   
    image(fish1, xFish4, 450);
  }
  else {
    image(fish1b, xFish4, 450);
  }
  xFish4 -= speedFish1;
  if (xFish4 < 0 ) {
    xFish4 = 640 +42;
  }


  //fish 5 inside (mirror of fish2) (-->)

  if((x < xFish5) && (x + 106 - 55 > xFish5) || (x2 < xFish5) && (x2 + 106 - 55 > xFish5)) {   
    image(fish2, xFish5, 35);
  }
  else {
    image(fish2b, xFish5, 35);
  }
  xFish5 += speedFish2;
  if (xFish5 > width + 55 ) {
    xFish5 = -55;
  }


  //fish 6 inside (mirror of fish 3) (<--)

  if((x < xFish6) && (x + 106 - 69 > xFish6) || (x2 < xFish6) && (x2 + 106 - 69 > xFish3)) {   
    image(fish3, xFish6, 380);
  }
  else {
    image(fish3b, xFish6, 380);
  }
  xFish6 -= speedFish3;
  if (xFish6 < 0 ) {
    xFish6 = 640 + 69;
  }
*/
}

