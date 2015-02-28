
//images 
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;



PFont Universe;
String t1 = "AH "; 
String t2 = "BEEP "; 
String t3 = "BANG "; 
String t4 = "BOM ";
String t5 = "BOMPA BOM "; 
String t6 = "BRA ";
String t7 = "CLANG "; 
String t8 = "DA ";
String t9 = "DO "; 
String t10 = "DO DUT DO DUN";
String t11 = "GOO GOO G'JOOB "; 
String t12 = "HELA HELA HELLOWA ";
String t13 = "HEY"; 
String t14 = "HI ";
String t15 = "HU "; 
String t16 = "JO ";
String t17 = "JUBA JUB "; 
String t18 = "LA "; 
String t19 = "MM "; 
String t20 = "OB-LA-DI OB-LA-DA ";
String t21 = "OH "; 
String t22 = "OW ";
String t23 = "PA LUM"; 
String t24= "UH ";
String t25 = "WOAH "; 
String t26 = "WOH";
String t27 = "WOW "; 
String t28 = "WU ";
String t29 = "YEAH"; 
String t30 = "YEH ";
String t31 = "VIEW ALL ";



int y= 40;
int a =22;

boolean stepCheck1 = false;
boolean stepCheck2 = false;
boolean stepCheck3 = false;
boolean stepCheck4 = false;
boolean stepCheck5 = false;
boolean stepCheck6 = false;
boolean stepCheck7 = false;
boolean stepCheck8 = false;
boolean stepCheck9 = false;
boolean stepCheck10 = false;
boolean stepCheck11 = false;
boolean stepCheck12 = false;

void setup() {
  size(1280, 720);

  smooth();
  background(0);
  img= loadImage ("sfondonero.png");
  img2= loadImage ("woh+obladi.png");
  img3= loadImage ("LA.png");
  img4= loadImage ("WOH.png");
  img5= loadImage ("totalecolore.png");

  smooth();
  Universe = loadFont("Univers-Light-10.vlw");
  textFont(Universe, 14);
}

void draw() {

  println(mouseY);

// bottons list
  fill(50); 
  for (int y = 40; y <= height-40; y = y + 22) {
    ellipse (30, y, 16, 16);
    ellipse(1180, 680, 16, 16);
  }

  //ah
  if ((mouseX >22 && mouseX <38) && (mouseY >31 && mouseY < 48)) {
    fill(255, 247, 151);
    ellipse (30, 40, 16, 16);
    fill(255);
    text(t1, 45, y);
  }

  //beep
  if ((mouseX >22 && mouseX <38) && (mouseY >53 && mouseY < 69)) {
    fill(255, 243, 115);
    ellipse (30, 62, 16, 16);
    fill(255);
    text(t2, 45, y+a);
  }

  //bang
  if ((mouseX >22 && mouseX <38) && (mouseY >75 && mouseY < 91)) {
    fill(255, 196, 37);
    ellipse (30, 84, 16, 16);
    fill(255);
    text(t3, 45, y+a*2);
  }

  //bom
  if ((mouseX >22 && mouseX <38) && (mouseY >98 && mouseY < 114)) {
    fill(250, 166, 52);
    ellipse (30, 106, 16, 16);
    fill(255);
    text(t4, 45, y+a*3);
  }

  //bompa bom
  if ((mouseX >22 && mouseX <38) && (mouseY >120 && mouseY < 136)) {
    fill(244, 123, 32);
    ellipse (30, 128, 16, 16);
    fill(255);
    text(t5, 45, y+a*4);
  }



  //bra
  if ((mouseX >22 && mouseX <38) && (mouseY >142 && mouseY < 158)) {
    fill(244, 123, 32);
    ellipse (30, 150, 16, 16);
    fill(255);
    text(t6, 45, y+a*5);
  }

  //clangr
  if ((mouseX >22 && mouseX <38) && (mouseY >164 && mouseY < 180)) {
    fill(198, 6, 81);
    ellipse (30, 172, 16, 16);
    fill(255);
    text(t7, 45, y+a*6);
  }

  //da
  if ((mouseX >22 && mouseX <38) && (mouseY >186 && mouseY < 202)) {
    fill(238, 182, 212);
    ellipse (30, 194, 16, 16);
    fill(255);
    text(t8, 45, y+a*7);
  }

  //d0
  if ((mouseX >22 && mouseX <38) && (mouseY >208 && mouseY < 230)) {
    fill(214, 12, 140);
    ellipse (30, 216, 16, 16);
    fill(255);
    text(t9, 45, y+a*8);
  }


  //do dut
  if ((mouseX >22 && mouseX <38) && (mouseY >230 && mouseY < 246)) {
    fill(157, 51, 147);
    ellipse (30, 238, 16, 16);
    fill(255);
    text(t10, 45, y+a*9);
  }

  //goo goo
  if ((mouseX >22 && mouseX <38) && (mouseY >252 && mouseY < 268)) {
    fill(85, 41, 136);
    ellipse (30, 260, 16, 16);
    fill(255);
    text(t11, 45, y+a*10);
  }



  //hella hellowa
  if ((mouseX >22 && mouseX <38) && (mouseY >276 && mouseY < 289)) {
    fill(114, 205, 244);
    ellipse (30, 282, 16, 16);
    fill(255);
    text(t12, 45, y+a*11);
  }
  //hey
  if ((mouseX >22 && mouseX <38) && (mouseY >296 && mouseY < 312)) {
    fill(0, 157, 220);
    ellipse (30, 304, 16, 16);
    fill(255);
    text(t13, 45, y+a*12);
  }

  //hi
  if ((mouseX >22 && mouseX <38) && (mouseY >318&& mouseY < 334)) {
    fill(0, 84, 164);
    ellipse (30, 326, 16, 16);
    fill(255);
    text(t14, 45, y+a*13);
  }

  //hu
  if ((mouseX >22 && mouseX <38) && (mouseY >340&& mouseY < 362)) {
    fill(0, 153, 153);
    ellipse (30, 348, 16, 16);
    fill(255);
    text(t15, 45, y+a*14);
  }

  //jo
  if ((mouseX >22 && mouseX <38) && (mouseY >362&& mouseY < 378)) {
    fill(0, 146, 143);
    ellipse (30, 370, 16, 16);
    fill(255);
    text(t16, 45, y+a*15);
  }



  //juba jub
  if ((mouseX >22 && mouseX <38) && (mouseY >384 && mouseY < 400)) {
    fill(141, 198, 63);
    ellipse (30, 392, 16, 16);
    fill(255);
    text(t17, 45, y+a*16);
  }

  //la
  if ((mouseX >22 && mouseX <38) && (mouseY >406&& mouseY < 422)) {
    fill(73, 169, 66);
    ellipse (30, 414, 16, 16);
    fill(255);
    text(t18, 45, y+a*17);
  }

  //mm
  if ((mouseX >22 && mouseX <38) && (mouseY >428&& mouseY < 444)) {
    fill(0, 169, 79);
    ellipse (30, 436, 16, 16);
    fill(255);
    text(t19, 45, y+a*18);
  }



  //obladi oblada
  if ((mouseX >22 && mouseX <38) && (mouseY >448 && mouseY < 467)) {
    fill(0, 133, 63);
    ellipse (30, 458, 16, 16);
    fill(255);
    text(t20, 45, y+a*19);
  }

  //oh
  if ((mouseX >22 && mouseX <38) && (mouseY >470 && mouseY < 489)) {
    fill(0, 106, 81);
    ellipse (30, 480, 16, 16);
    fill(255);
    text(t21, 45, y+a*20);
  }


  //ow
  if ((mouseX >22 && mouseX <38) && (mouseY >494 && mouseY < 510)) {
    fill(159, 166, 23);
    ellipse (30, 502, 16, 16);
    fill(255);
    text(t22, 45, y+a*21);
  }

  //palum
  if ((mouseX >22 && mouseX <38) && (mouseY >516 && mouseY < 532)) {
    fill(254, 210, 157);
    ellipse (30, 524, 16, 16);
    fill(255);
    text(t23, 45, y+a*22);
  }

  //uh
  if ((mouseX >22 && mouseX <38) && (mouseY >538 && mouseY < 554)) {
    fill(211, 157, 96);
    ellipse (30, 546, 16, 16);
    fill(255);
    text(t24, 45, y+a*23);
  }
  //woah
  if ((mouseX >22 && mouseX <38) && (mouseY >560 && mouseY < 576)) {
    fill(136, 78, 0);
    ellipse (30, 568, 16, 16);
    fill(255);
    text(t25, 45, y+a*24);
  }

  //woh
  if ((mouseX >22 && mouseX <38) && (mouseY >582 && mouseY < 598)) {
    fill(117, 63, 0);
    ellipse (30, 590, 16, 16);
    fill(255);
    text(t26, 45, y+a*25);
  }

  //wow
  if ((mouseX >22 && mouseX <38) && (mouseY >604 && mouseY < 620)) {
    fill(119, 100, 65);
    ellipse (30, 612, 16, 16);
    fill(255);
    text(t27, 45, y+a*26);
  }

  //wu
  if ((mouseX >22 && mouseX <38) && (mouseY >626 && mouseY < 642)) {
    fill(171, 182, 171);
    ellipse (30, 634, 16, 16);
    fill(255);
    text(t28, 45, y+a*27);
  }

  //yeah
  if ((mouseX >22 && mouseX <38) && (mouseY >648 && mouseY < 664)) {
    fill(145, 145, 149);
    ellipse (30, 656, 16, 16);
    fill(255);
    text(t29, 45, y+a*28);
  }

  //yeh
  if ((mouseX >22 && mouseX <38) && (mouseY >670 && mouseY < 686)) {
    fill(106, 115, 123);
    ellipse (30, 678, 16, 16);
    fill(255);
    text(t30, 45, y+a*29);
  }

  //view all
  if ((mouseX >1172 && mouseX <1188) && (mouseY >672 && mouseY < 688)) {
    fill(255);
    ellipse(1180, 680, 16, 16);  
    fill(255);
    text(t31, 1200, y+a*29);
  }





  //PRESS HEY
  if ((mousePressed)&& (mouseX >22 && mouseX <38) && (mouseY >296 && mouseY < 312)) {
    if (stepCheck1 == false)
      stepCheck1 = true;
    else
      stepCheck1 = false;
  }

  if (stepCheck1 == true) {

    image (img, 0, 0);

    fill(0, 157, 220);
    ellipse (30, 304, 16, 16);
    fill(255);
    text(t13, 45, y+a*12);
  }
  else if (stepCheck2 == true) {
  }
  else {
    image (img, 0, 0);
  }


  //PRESS LA
  if ((mousePressed)&&(mouseX >22 && mouseX <38) && (mouseY >407 && mouseY < 422)) {
    if (stepCheck7 == false)
      stepCheck7 = true;
    else
      stepCheck7 = false;
  }

  if (stepCheck7 == true) {

    image (img3, 0, 0);

    fill(73, 169, 66);
    ellipse (30, 414, 16, 16);
    fill(255);
    text(t18, 45, y+a*17);
  }
  else if (stepCheck8 == true) {
  }
  else {
    image (img, 0, 0);
  }

  //PRESS HELA HELLOWA
  if ((mousePressed)&&(mouseX >22 && mouseX <38) && (mouseY >276 && mouseY < 289)) {
    if (stepCheck9 == false)
      stepCheck9 = true;
    else
      stepCheck9 = false;
  }

  if (stepCheck9 == true) {



    fill(114, 205, 244);
    ellipse (30, 281, 16, 16);
    fill(255);
    text(t12, 45, y+a*11);
  }
  else if (stepCheck10 == true) {
  }
  else {
  }





  //PRESS WOH
  if ((mousePressed)&&(mouseX >22 && mouseX <38) && (mouseY >580 && mouseY < 598)) {
    if (stepCheck5 == false)
      stepCheck5 = true;
    else
      stepCheck5 = false;
  }

  if (stepCheck5 == true) {

    image (img4, 0, 0);

    fill(117, 67, 0);
    ellipse (30, 590, 16, 16);
    fill(255);
    text(t26, 45, y+a*25);
  }
  else if (stepCheck6 == true) {
  }
  else {
  }

  //PRESS OBLADI OBLADA
  if ((mousePressed)&&(mouseX >22 && mouseX <38) && (mouseY >450 && mouseY < 467)) {
    if (stepCheck3 == false)
      stepCheck3 = true;
    else
      stepCheck3 = false;
  }

  if (stepCheck3 == true) {

    image (img2, 0, 0);

    fill(0, 133, 63);
    ellipse (30, 458, 16, 16);
    fill(255);
    text(t20, 45, y+a*19);
  }
  else if (stepCheck4 == true) {
  }
  else {
  }

  //PRESS VIEW ALL
  if ((mousePressed)&&(mouseX >1172 && mouseX <1188) && (mouseY >672 && mouseY < 688)) {
    if (stepCheck11 == false)
      stepCheck11 = true;
    else
      stepCheck11 = false;
  }

  if (stepCheck11 == true) {

    image (img5, 0, 0);

    fill(255);
    ellipse(1180, 680, 16, 16);  
    fill(255, 247, 151);
    ellipse (30, 40, 16, 16);
    fill(255, 243, 115);
    ellipse (30, 62, 16, 16);
    fill(255, 196, 37);
    ellipse (30, 84, 16, 16);
    fill(250, 166, 52);
    ellipse (30, 106, 16, 16);
    fill(244, 123, 32);
    ellipse (30, 128, 16, 16);
    fill(198, 6, 81);
    ellipse (30, 172, 16, 16);
    fill(238, 182, 212);
    ellipse (30, 194, 16, 16); 
    fill(244, 123, 32);
    ellipse (30, 150, 16, 16);
    fill(214, 12, 140);
    ellipse (30, 216, 16, 16);  
    fill(157, 51, 147);
    ellipse (30, 238, 16, 16);   
    fill(85, 41, 136);
    ellipse (30, 260, 16, 16);    
    fill(114, 205, 244);
    ellipse (30, 282, 16, 16);  
    fill(0, 157, 220);
    ellipse (30, 304, 16, 16); 
    fill(0, 84, 164);
    ellipse (30, 326, 16, 16); 
    fill(0, 153, 153);
    ellipse (30, 348, 16, 16); 
    fill(0, 146, 143);
    ellipse (30, 370, 16, 16);
    fill(141, 198, 63);
    ellipse (30, 392, 16, 16);
    fill(73, 169, 66);
    ellipse (30, 414, 16, 16);    
    fill(0, 169, 79);
    ellipse (30, 436, 16, 16);    
        fill(0, 133, 63);
    ellipse (30, 458, 16, 16);
        fill(0, 106, 81);
    ellipse (30, 480, 16, 16);
        fill(159, 166, 23);
    ellipse (30, 502, 16, 16);
     fill(254, 210, 157);
    ellipse (30, 524, 16, 16);   
        fill(211, 157, 96);
    ellipse (30, 546, 16, 16);
      fill(136, 78, 0);
    ellipse (30, 568, 16, 16); 
    fill(117, 63, 0);
    ellipse (30, 590, 16, 16);    
        fill(119, 100, 65);
    ellipse (30, 612, 16, 16);
        fill(171, 182, 171);
    ellipse (30, 634, 16, 16);
    fill(145, 145, 149);
    ellipse (30, 656, 16, 16);    
        fill(106, 115, 123);
    ellipse (30, 678, 16, 16);
    
    

    fill(255);
    text(t31, 1200, y+a*29);
  }
  else if (stepCheck12 == true) {
  }
  else {
  }


//Buttons Text


  y=48;
  fill (70);
  text(t1, 45, y);
  text(t2, 45, y+a);
  text(t3, 45, y+a*2);
  text(t4, 45, y+a*3);
  text(t5, 45, y+a*4);
  text(t6, 45, y+a*5);
  text(t7, 45, y+a*6);
  text(t8, 45, y+a*7);
  text(t9, 45, y+a*8);
  text(t10, 45, y+a*9);
  text(t11, 45, y+a*10);
  text(t12, 45, y+a*11);
  text(t13, 45, y+a*12);
  text(t14, 45, y+a*13);
  text(t15, 45, y+a*14);
  text(t16, 45, y+a*15);
  text(t17, 45, y+a*16);
  text(t18, 45, y+a*17);
  text(t19, 45, y+a*18);
  text(t20, 45, y+a*19);
  text(t21, 45, y+a*20);
  text(t22, 45, y+a*21);
  text(t23, 45, y+a*22);
  text(t24, 45, y+a*23);
  text(t25, 45, y+a*24);
  text(t26, 45, y+a*25);
  text(t27, 45, y+a*26);
  text(t28, 45, y+a*27);
  text(t29, 45, y+a*28);
  text(t30, 45, y+a*29);
  text(t31, 1200, y+a*29);
}


