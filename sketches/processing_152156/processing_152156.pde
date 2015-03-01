
//fonts
PFont font, font2, font3, font4, font5;

//strarting page
int page=0;

//ints portals page 7
int px=120;
int px2=300;
int px3=480;
int py=370;
int r=65;
int r2=110;

//ints portals page 8
int px4=558;
int py2=260;
int px5=156;
int py3=51;
int r3=13;

//ints portals page 9
int px6=280;
int px7=320;
int r4=60;
int r5=45;

//angle spheres page 9
float angle= 0.0;

//ints portals page 10
int px8=269;
int px9=329;
int py4=370;
int r6=20;

//ints bird1 page 11
int px10=280;
int py5=180;
int px11=201;
int py6=101;
int px12=240;
int py7=420;

//ints bird2 page 11
int px13=140;
int py8=520;
int px14=210;
int py9=430;
int px15=230;
int py10=510;

//ints bird3 page 11
int px16=450;
int py11=500;
int px17=377;
int py12=400;
int px18=570;
int py13=200;

//ints bird4 page 11
int px19=270;
int py14=264;
int px20=320;
int py15=317;
int px21=300;
int py16=290;

//ints bird5 page 11
int px22=520;
int px23=549;
int py17=341;
int px24=506;
int py18=414;

//ints bird6 page 11
int px25=360;
int px26=470;
int px27=350;
int py19=380;

//speed birds page 11
float speed=10;

//ints portals page 11
int py20=325;
int r7=10;
int r8=6;

//ints portals page 12
int px28=300;
int py21=262;
int r9=15;

//ints portal page 13
int pf=300;
int rf=72;

//ints page 14
int px29=477;
int py22=521;
int Y=160;
int Y2=310;
int pf2=300;
int rf2=270;

void setup(){
  size(600, 600);
  smooth();
  font=loadFont("ARDARLING-48.vlw"); //entity font
  font2=loadFont("Chiller-Regular-48.vlw"); //Dreamland font
  font3=loadFont("ErasITC-Medium-48.vlw"); //speaker font
  font4=loadFont("FootlightMTLight-48.vlw"); //you font
  font5=loadFont("TimesNewRomanPSMT-48.vlw"); //page 12 faces font
}

void draw(){
  if(page==0){
    background(250);
    fill(234, 28, 125); //speaker's speaking
    textFont(font3);
    textSize(25);
    text("You are half-asleep, still in Dreamland...", 50, 100);
    text("Here you met a strange entity, which really does", 50, 200);
    text("fancy you.", 50, 300);
    text("Now that you are waking up,", 50, 400);
    text("it's time for goodbyes...", 50, 500);
  }
  if(page==1){
    background(250);
    strokeWeight(1.5); //entity
    fill(155);
    rect(200, 160, 200, 200);
    fill(255);
    rect(210, 170, 180, 180);
    fill(165);
    rect(220,180, 160, 160);
    fill(0, 255, 0);
    rect(277, 238, 45, 45);
    line(300, 70, 300, 450);
    line(210, 410, 270, 410);
    line(330, 410, 390, 410);
    line(240, 410, 240, 420);
    line(360, 410, 360, 420);
    line(300, 260, 200, 90);
    line(300, 260, 400, 90);
    line(300, 260, 240, 410);
    line(300, 260, 360, 410);
    fill(150);
    triangle(290, 480, 300, 450, 310, 480);
    fill(255, 0, 0);
    ellipse(250, 120, 30, 20);
    ellipse(350, 120, 30, 20);
    fill(0, 0, 255);
    ellipse(300, 50, 15, 10);
    ellipse(240, 430, 5, 10);
    ellipse(360, 430, 5, 10);
    fill(25); //entity's speaking
    textFont(font);
    textSize(20);
    text("Please don't leave...why go to a world that makes you tired?", 50, 520);
    text("It's much better staying here...with me.", 50, 540);
  }
  if(page==2){
    background(250);
    strokeWeight(1.5); //entity
    fill(155);
    rect(200, 160, 200, 200);
    fill(255);
    rect(210, 170, 180, 180);
    fill(165);
    rect(220,180, 160, 160);
    fill(0, 255, 0);
    rect(277, 238, 45, 45);
    line(300, 70, 300, 450);
    line(210, 410, 270, 410);
    line(330, 410, 390, 410);
    line(240, 410, 240, 420);
    line(360, 410, 360, 420);
    line(300, 260, 200, 90);
    line(300, 260, 400, 90);
    line(300, 260, 240, 410);
    line(300, 260, 360, 410);
    fill(150);
    triangle(290, 480, 300, 450, 310, 480);
    fill(255, 0, 0);
    ellipse(250, 120, 30, 20);
    ellipse(350, 120, 30, 20);
    fill(0, 0, 255);
    ellipse(300, 50, 15, 10);
    ellipse(240, 430, 5, 10);
    ellipse(360, 430, 5, 10);
    fill(5, 146, 157); //you're speaking
    textFont(font4);
    textSize(20);
    text("Sorry...the real world, with real people, is waiting for me.", 50, 520);
    text("I just can't spend my whole life with a dream.", 50, 540);
  }
  if(page==3){
    background(250);
    strokeWeight(1.5); //entity
    fill(155);
    rect(200, 160, 200, 200);
    fill(255);
    rect(210, 170, 180, 180);
    fill(165);
    rect(220,180, 160, 160);
    fill(0, 255, 0);
    rect(277, 238, 45, 45);
    line(300, 70, 300, 450);
    line(210, 410, 270, 410);
    line(330, 410, 390, 410);
    line(240, 410, 240, 420);
    line(360, 410, 360, 420);
    line(300, 260, 200, 90);
    line(300, 260, 400, 90);
    line(300, 260, 240, 410);
    line(300, 260, 360, 410);
    fill(150);
    triangle(290, 480, 300, 450, 310, 480);
    fill(random(235, 255), random(0, 0), random(0, 0));
    ellipse(250, 120, 30, 20);
    ellipse(350, 120, 30, 20);
    fill(0, 0, 255);
    ellipse(300, 50, 15, 10);
    ellipse(240, 430, 5, 10);
    ellipse(360, 430, 5, 10);
    fill(25); //entity's speaking
    textFont(font);
    textSize(20);
    text("...are you suggesting I'm not real? Such as my feelings?", 50, 520);
    fill(5, 146, 157); //you
    textFont(font4);
    textSize(20);
    text("...", 50, 570);
  }
  if(page==4){
    background(250);
    strokeWeight(1.5); //entity
    fill(155);
    rect(200, 160, 200, 200);
    fill(255);
    rect(210, 170, 180, 180);
    fill(165);
    rect(220,180, 160, 160);
    fill(random(0, 0), random(205, 255), random(0, 0));
    rect(277, 238, 45, 45);
    line(300, 70, 300, 450);
    line(210, 410, 270, 410);
    line(330, 410, 390, 410);
    line(240, 410, 240, 420);
    line(360, 410, 360, 420);
    line(300, 260, 200, 90);
    line(300, 260, 400, 90);
    line(300, 260, 240, 410);
    line(300, 260, 360, 410);
    fill(150);
    triangle(290, 480, 300, 450, 310, 480);
    fill(random(235, 255), random(0, 0), random(0, 0));
    ellipse(250, 120, 30, 20);
    ellipse(350, 120, 30, 20);
    fill(random(0, 0), random(0, 0), random(225, 255));
    ellipse(300, 50, 15, 10);
    ellipse(240, 430, 5, 10);
    ellipse(360, 430, 5, 10);
    fill(25); //entity's speaking
    textFont(font);
    textSize(20);
    text("Do you really think I'm so powerless I can't make you stay", 50, 520);
    text("if I want?", 50, 540);
    fill(5, 146, 157);
    textFont(font4); //you're speaking
    textSize(20);
    text("I do.", 50, 570);
  }
  if(page==5){
    background(0);
    strokeWeight(1.5); //angry entity
    fill(random(80, 180), random(80, 180), random(80, 180));
    rect(random(150, 250), random(130, 190), random(195, 205), random(195, 205));
    fill(random(50, 155), random(50, 155), random(50, 155));
    rect(random(190, 230), random(150, 190), random(175, 185), random(175, 185));
    fill(random(140, 240), random(140, 240), random(140, 240));
    rect(random(210, 240), random(170, 200), random(155, 165), random(55, 165));
    fill(0, random(0, 230), 0);
    rect(random(237, 317), random(198, 278), random(40, 50), random(40, 50));
    line(random(235, 365), random(60, 80), random(235, 365), random(440, 460));
    line(random(205, 215), random(390, 430), random(265, 275), random(390, 430));
    line(random(325, 335), random(390, 430), random(385, 395), random(390, 430));
    line(random(190, 290), random(360, 460), random(190, 290), random(370, 470));
    line(random(310, 410), random(360, 460), random(310, 410), random(370, 470));
    line(random(300, 400), random(260, 460), random(200, 300), random(90, 290));
    line(random(300, 400), random(260, 460), random(400, 500), random(90, 290));
    line(random(200, 300), random(160, 260), random(140, 240), random(310, 410));
    line(random(200, 300), random(160, 260), random(260, 360), random(310, 410));
    fill(random(0, 150), random(0, 150), random(0, 150));
    triangle(random(0, 400), random(0, 550), random(100, 500), random(0, 550), random(200, 600), random(0, 550));
    fill(random(0, 240), 0, 0);
    ellipse(random(245, 255), random(115, 125), random(28, 32), random(19, 21));
    ellipse(random(345, 355), random(115, 125), random(28, 32), random(19, 21));
    fill(0, 0, random(0, 255));
    ellipse(300, 50, random(5, 25), random(0, 20));
    ellipse(random(240, 360), 430, 5, 10);
    ellipse(random(240,360), 430, 5, 10);
    fill(230); //entity's shouts
    textFont(font);
    textSize(20);
    text("YOU FOOL! I WON'T LET YOU GO ANYWHERE!", 50, 520);
    text("EVEN IF YOU TRY, I'LL CATCH YOU!", 50, 540);
  }
  if(page==6){
    background(5);
    fill(234, 28, 125); //speaker's giving instructions
    textFont(font3);
    textSize(20);
    text("HURRY! That entity got crazy and won't let you leave.", 50, 100);
    text("Explore your mind through the portals and", 50, 150);
    text("find the room with the DOOR", 50, 200);
    text("to real world, but be careful:", 50, 250);
    text("Dreamland will both help and deceive you,", 50, 300);
    text("showing or hiding the portals.", 50, 350);
    text("If the Nightmare catches you,", 50, 400);
    text("you won't ever wake up. He's looking for you...", 50, 450);
    text("Don't waste time!", 50, 500);
  }
  if(page==7){
    background(5);
    strokeWeight(2); //faces
    stroke(0);
    fill(150);
    ellipse(px, 320, 130, 290);
    ellipse(px2, 320, 130, 290);
    ellipse(px3, 320, 130, 290);
    fill(247, 255, 41); //eyes...
    rect(80, 220, 10, 10); //...1
    rect(150, 220, 10, 10);
    triangle(275, 225, 280, 220, 268, 220);//...2
    triangle(335, 225, 340, 220, 328, 220);
    quad(460, 215, 465, 220, 460, 225, 455, 220); //...3
    quad(505, 215, 510, 220, 505, 225, 500, 220);
    fill(random(200, 230), random(0, 25), random(0, 25)); //mouths portals
    ellipse(px, py, r, r2);
    ellipse(px2, py, r, r2);
    ellipse(px3, py, r, r2);
    textFont(font2); //Dreamland advice
    textSize(50);
    fill(250);
    text("BE EATEN!", 160, 130);
    //millis
    if(millis()>240000){
      strokeWeight(1.5);
      fill(random(80, 180), random(80, 180), random(80, 180));
      rect(random(150, 250), random(130, 190), random(195, 205), random(195, 205));
      fill(random(50, 155), random(50, 155), random(50, 155));
      rect(random(190, 230), random(150, 190), random(175, 185), random(175, 185));
      fill(random(140, 240), random(140, 240), random(140, 240));
      rect(random(210, 240), random(170, 200), random(155, 165), random(55, 165));
      fill(0, random(0, 230), 0);
      rect(random(237, 317), random(198, 278), random(40, 50), random(40, 50));
      line(random(235, 365), random(60, 80), random(235, 365), random(440, 460));
      line(random(205, 215), random(390, 430), random(265, 275), random(390, 430));
      line(random(325, 335), random(390, 430), random(385, 395), random(390, 430));
      line(random(190, 290), random(360, 460), random(190, 290), random(370, 470));
      line(random(310, 410), random(360, 460), random(310, 410), random(370, 470));
      line(random(300, 400), random(260, 460), random(200, 300), random(90, 290));
      line(random(300, 400), random(260, 460), random(400, 500), random(90, 290));
      line(random(200, 300), random(160, 260), random(140, 240), random(310, 410));
      line(random(200, 300), random(160, 260), random(260, 360), random(310, 410));
      fill(random(0, 150), random(0, 150), random(0, 150));
      triangle(random(0, 400), random(0, 550), random(100, 500), random(0, 550), random(200, 600), random(0, 550));
      fill(random(0, 240), 0, 0);
      ellipse(random(245, 255), random(115, 125), random(28, 32), random(19, 21));
      ellipse(random(345, 355), random(115, 125), random(28, 32), random(19, 21));
      fill(0, 0, random(0, 255));
      ellipse(300, 50, random(5, 25), random(0, 20));
      ellipse(random(240, 360), 430, 5, 10);
      ellipse(random(240,360), 430, 5, 10);
      fill(255, 0, 0);
      textSize(50);
      text("HERE YOU ARE!", 120, 500);
    }
    if(millis()>242000){
      background(random(0, 50));
      strokeWeight(1.5);
      fill(255);
      rect(200, 160, 200, 200);
      rect(210, 170, 180, 180);
      rect(220,180, 160, 160);
      rect(277, 238, 45, 45);
      line(300, 70, 300, 450);
      line(210, 410, 270, 410);
      line(330, 410, 390, 410);
      line(240, 410, 240, 420);
      line(360, 410, 360, 420);
      line(300, 260, 200, 90);
      line(300, 260, 400, 90);
      line(300, 260, 240, 410);
      line(300, 260, 360, 410);
      triangle(290, 480, 300, 450, 310, 480);
      ellipse(250, 120, 30, 20);
      ellipse(350, 120, 30, 20);
      ellipse(300, 50, 15, 10);
      ellipse(240, 430, 5, 10);
      ellipse(360, 430, 5, 10);
      textSize(15);
      text("You were so confused...now that I stopped you, we can", 50, 510);
      text("stay together, here in the loveliest nest, your head...", 50, 540);
      text("...FOREVER.", 50, 570);
    }
  }
  if(page==8){
    background(255, 87, 3);
    strokeWeight(1); //background
    for(int x=0; x<=width; x+=13){
      for(int y=0; y<=height; y+=13){
        fill(27, 11, 219);
        ellipse(x, y, 13, 13);
      }
    }
    textFont(font2); //hours
    fill(250);
    textSize(40);
    text("0", 150, 100);
    text("10", 350, 400);
    text("20", 200, 510);
    textSize(55);
    text("1", 40, 120);
    text("11", 425, 271);
    text("21", 310, 140);
    textSize(62);
    text("2", 65, 389);
    text("12", 194, 435);
    text("22", 416, 482);
    textSize(35);
    text("3", 344, 552);
    text("13", 550, 490);
    text("23", 95, 196);
    textSize(90);
    text("4", 90, 489);
    text("14", 460, 125);
    text("24", 170, 64);
    textSize(118);
    text("5", 545, 120);
    text("6", 10, 590);
    text("7", 28, 321);
    text("8", 524, 322);
    text("9", 423, 178);
    textSize(44);
    text("15", 530, 450);
    text("16", 124, 280);
    text("17", 380, 576);
    text("18", 221, 167);
    text("19", 445, 380);
    strokeWeight(5); //clock
    stroke(211, 106, 19);
    line(300, 300, mouseX, mouseY); //line1
    stroke(0);
    float mx=mouseX/2+300;
    line(300, 300, mx, mouseY); //line2
    strokeWeight(1); //portals
    fill(random(10, 40), random(0, 75), random(190, 245));
    ellipse(px4, py2, r3, r3);
    fill(random(15, 75), random(0, 55), random(190, 245));
    ellipse(px5, py3, r3, r3); //fake portals
    ellipse(325, 403, r3, r3);
    ellipse(26, 325, r3, r3);
    ellipse(442, 39, r3, r3);
    ellipse(273, 481, r3, r3);
    //millis
    if(millis()>240000){
      strokeWeight(1.5);
      fill(random(80, 180), random(80, 180), random(80, 180));
      rect(random(150, 250), random(130, 190), random(195, 205), random(195, 205));
      fill(random(50, 155), random(50, 155), random(50, 155));
      rect(random(190, 230), random(150, 190), random(175, 185), random(175, 185));
      fill(random(140, 240), random(140, 240), random(140, 240));
      rect(random(210, 240), random(170, 200), random(155, 165), random(55, 165));
      fill(0, random(0, 230), 0);
      rect(random(237, 317), random(198, 278), random(40, 50), random(40, 50));
      line(random(235, 365), random(60, 80), random(235, 365), random(440, 460));
      line(random(205, 215), random(390, 430), random(265, 275), random(390, 430));
      line(random(325, 335), random(390, 430), random(385, 395), random(390, 430));
      line(random(190, 290), random(360, 460), random(190, 290), random(370, 470));
      line(random(310, 410), random(360, 460), random(310, 410), random(370, 470));
      line(random(300, 400), random(260, 460), random(200, 300), random(90, 290));
      line(random(300, 400), random(260, 460), random(400, 500), random(90, 290));
      line(random(200, 300), random(160, 260), random(140, 240), random(310, 410));
      line(random(200, 300), random(160, 260), random(260, 360), random(310, 410));
      fill(random(0, 150), random(0, 150), random(0, 150));
      triangle(random(0, 400), random(0, 550), random(100, 500), random(0, 550), random(200, 600), random(0, 550));
      fill(random(0, 240), 0, 0);
      ellipse(random(245, 255), random(115, 125), random(28, 32), random(19, 21));
      ellipse(random(345, 355), random(115, 125), random(28, 32), random(19, 21));
      fill(0, 0, random(0, 255));
      ellipse(300, 50, random(5, 25), random(0, 20));
      ellipse(random(240, 360), 430, 5, 10);
      ellipse(random(240,360), 430, 5, 10);
      fill(255, 0, 0);
      textSize(50);
      text("HERE YOU ARE!", 120, 500);
    }
    if(millis()>242000){
      background(random(0, 50));
      strokeWeight(1.5);
      fill(255);
      rect(200, 160, 200, 200);
      rect(210, 170, 180, 180);
      rect(220,180, 160, 160);
      rect(277, 238, 45, 45);
      line(300, 70, 300, 450);
      line(210, 410, 270, 410);
      line(330, 410, 390, 410);
      line(240, 410, 240, 420);
      line(360, 410, 360, 420);
      line(300, 260, 200, 90);
      line(300, 260, 400, 90);
      line(300, 260, 240, 410);
      line(300, 260, 360, 410);
      triangle(290, 480, 300, 450, 310, 480);
      ellipse(250, 120, 30, 20);
      ellipse(350, 120, 30, 20);
      ellipse(300, 50, 15, 10);
      ellipse(240, 430, 5, 10);
      ellipse(360, 430, 5, 10);
      textSize(15);
      text("You were so confused...now that I stopped you, we can", 50, 510);
      text("stay together, here in the loveliest nest, your head...", 50, 540);
      text("...FOREVER.", 50, 570);
    }
  }
  if(page==9){
    //millis
    if(millis()>240000){
      strokeWeight(1.5);
      fill(random(80, 180), random(80, 180), random(80, 180));
      rect(random(150, 250), random(130, 190), random(195, 205), random(195, 205));
      fill(random(50, 155), random(50, 155), random(50, 155));
      rect(random(190, 230), random(150, 190), random(175, 185), random(175, 185));
      fill(random(140, 240), random(140, 240), random(140, 240));
      rect(random(210, 240), random(170, 200), random(155, 165), random(55, 165));
      fill(0, random(0, 230), 0);
      rect(random(237, 317), random(198, 278), random(40, 50), random(40, 50));
      line(random(235, 365), random(60, 80), random(235, 365), random(440, 460));
      line(random(205, 215), random(390, 430), random(265, 275), random(390, 430));
      line(random(325, 335), random(390, 430), random(385, 395), random(390, 430));
      line(random(190, 290), random(360, 460), random(190, 290), random(370, 470));
      line(random(310, 410), random(360, 460), random(310, 410), random(370, 470));
      line(random(300, 400), random(260, 460), random(200, 300), random(90, 290));
      line(random(300, 400), random(260, 460), random(400, 500), random(90, 290));
      line(random(200, 300), random(160, 260), random(140, 240), random(310, 410));
      line(random(200, 300), random(160, 260), random(260, 360), random(310, 410));
      fill(random(0, 150), random(0, 150), random(0, 150));
      triangle(random(0, 400), random(0, 550), random(100, 500), random(0, 550), random(200, 600), random(0, 550));
      fill(random(0, 240), 0, 0);
      ellipse(random(245, 255), random(115, 125), random(28, 32), random(19, 21));
      ellipse(random(345, 355), random(115, 125), random(28, 32), random(19, 21));
      fill(0, 0, random(0, 255));
      ellipse(300, 50, random(5, 25), random(0, 20));
      ellipse(random(240, 360), 430, 5, 10);
      ellipse(random(240,360), 430, 5, 10);
      fill(255, 0, 0);
      textSize(50);
      text("HERE YOU ARE!", 120, 500);
    }
    if(millis()>242000){
      background(random(0, 50));
      strokeWeight(1.5);
      fill(255);
      rect(200, 160, 200, 200);
      rect(210, 170, 180, 180);
      rect(220,180, 160, 160);
      rect(277, 238, 45, 45);
      line(300, 70, 300, 450);
      line(210, 410, 270, 410);
      line(330, 410, 390, 410);
      line(240, 410, 240, 420);
      line(360, 410, 360, 420);
      line(300, 260, 200, 90);
      line(300, 260, 400, 90);
      line(300, 260, 240, 410);
      line(300, 260, 360, 410);
      triangle(290, 480, 300, 450, 310, 480);
      ellipse(250, 120, 30, 20);
      ellipse(350, 120, 30, 20);
      ellipse(300, 50, 15, 10);
      ellipse(240, 430, 5, 10);
      ellipse(360, 430, 5, 10);
      textSize(15);
      text("You were so confused...now that I stopped you, we can", 50, 510);
      text("stay together, here in the loveliest nest, your head...", 50, 540);
      text("...FOREVER.", 50, 570);
    }
    background(255);
    fill(0);
    textFont(font2); //Dreamland advice
    textSize(30);
    text("The DOOR is in the rainbow", 20, 50);
    fill(random(235, 255)); //portal to page 8
    ellipse(px6, px6, r4, r4);
    fill(random(0, 20)); //portal to page 7
    ellipse(px7, px7, r5, r5);
    translate(300, 300); //rotating spheres
    rotate(angle);
    angle+=0.005;
    fill(random(133, 153), 0, random(235, 255));
    ellipse(0, 150, 75, 75); 
    translate(170, -75);
    fill(random(235, 255), 0, 0);
    ellipse(0, 120, 125, 125);
    translate(-100, 50);
    fill(random(65, 85), 0, random(120, 140));
    ellipse(0, 0, 75, 75);
    fill(random(235, 255), random(131, 151), 0);
    ellipse(-240, 50, 45, 45);
    fill(0, 0, random(235, 255));
    ellipse(-310, -70, 80, 80);
    fill(random(235, 255), random(237, 255), 0);
    ellipse(-190, -50, 15, 15);
    fill(0, random(155, 175), random(0, 16));
    ellipse(-45, -180, 100, 100);
  }
  if(page==10){
    background(224, 9, 41);
    for(int x=0; x<=width; x+=13){ //background
      for(int y=0; y<=height; y+=13){
        fill(6, 111, 13);
        ellipse(x, y, 13, 13);
      }
    }
    fill(227, 212, 94); //Newton's Pendulum
    strokeWeight(1.5);
    quad(200, 400, 400, 400, 450, 500, 150, 500);
    rect(200, 150, 25, 250);
    rect(375, 150, 25, 250);
    strokeWeight(3);
    line(200, 150, 400, 150);
    strokeWeight(1.2); //spheres
    for(int x = 239; x < 370; x += 30){
      float mx = mouseX / 30;
      float offsetA = random(-mx, mx);
      float offsetB = random(-mx, mx);
      line(x + offsetA, 150, x - offsetB, 360);
    }
    fill(232, 230, 183);
    for(int px8=239; px8<370; px8+=60) {
    float mx = mouseX / 20;
    float offsetA = random(-mx, mx);
    float offsetB = random(-mx, mx);
    ellipse(px8+offsetA, py4, 20, 20);
  }
  fill(random(200, 95), random(200, 180), random(140, 265)); //spheres portals
  for(int px9=269; px9< 370; px9+= 60){
    float mx=mouseX/20;
    float offsetA = random(-mx, mx);
    float offsetB = random(-mx, mx);
    ellipse(px9+offsetA, py4, r6, r6);
  }
  fill(240); //Dreamland
  textFont(font2);
  textSize(60);
  text("I need stability", 120, 100);
  //millis
  if(millis()>240000){
    strokeWeight(1.5);
    fill(random(80, 180), random(80, 180), random(80, 180));
    rect(random(150, 250), random(130, 190), random(195, 205), random(195, 205));
    fill(random(50, 155), random(50, 155), random(50, 155));
    rect(random(190, 230), random(150, 190), random(175, 185), random(175, 185));
    fill(random(140, 240), random(140, 240), random(140, 240));
    rect(random(210, 240), random(170, 200), random(155, 165), random(55, 165));
    fill(0, random(0, 230), 0);
    rect(random(237, 317), random(198, 278), random(40, 50), random(40, 50));
    line(random(235, 365), random(60, 80), random(235, 365), random(440, 460));
    line(random(205, 215), random(390, 430), random(265, 275), random(390, 430));
    line(random(325, 335), random(390, 430), random(385, 395), random(390, 430));
    line(random(190, 290), random(360, 460), random(190, 290), random(370, 470));
    line(random(310, 410), random(360, 460), random(310, 410), random(370, 470));
    line(random(300, 400), random(260, 460), random(200, 300), random(90, 290));
    line(random(300, 400), random(260, 460), random(400, 500), random(90, 290));
    line(random(200, 300), random(160, 260), random(140, 240), random(310, 410));
    line(random(200, 300), random(160, 260), random(260, 360), random(310, 410));
    fill(random(0, 150), random(0, 150), random(0, 150));
    triangle(random(0, 400), random(0, 550), random(100, 500), random(0, 550), random(200, 600), random(0, 550));
    fill(random(0, 240), 0, 0);
    ellipse(random(245, 255), random(115, 125), random(28, 32), random(19, 21));
    ellipse(random(345, 355), random(115, 125), random(28, 32), random(19, 21));
    fill(0, 0, random(0, 255));
    ellipse(300, 50, random(5, 25), random(0, 20));
    ellipse(random(240, 360), 430, 5, 10);
    ellipse(random(240,360), 430, 5, 10);
    fill(255, 0, 0);
    textSize(50);
    text("HERE YOU ARE!", 120, 500);
  }
  if(millis()>242000){
    background(random(0, 50));
    strokeWeight(1.5);
    fill(255);
    rect(200, 160, 200, 200);
    rect(210, 170, 180, 180);
    rect(220,180, 160, 160);
    rect(277, 238, 45, 45);
    line(300, 70, 300, 450);
    line(210, 410, 270, 410);
    line(330, 410, 390, 410);
    line(240, 410, 240, 420);
    line(360, 410, 360, 420);
    line(300, 260, 200, 90);
    line(300, 260, 400, 90);
    line(300, 260, 240, 410);
    line(300, 260, 360, 410);
    triangle(290, 480, 300, 450, 310, 480);
    ellipse(250, 120, 30, 20);
    ellipse(350, 120, 30, 20);
    ellipse(300, 50, 15, 10);
    ellipse(240, 430, 5, 10);
    ellipse(360, 430, 5, 10);
    textSize(15);
    text("You were so confused...now that I stopped you, we can", 50, 510);
    text("stay together, here in the loveliest nest, your head...", 50, 540);
    text("...FOREVER.", 50, 570);
  }
}
if(page==11){
 background(235);
 textFont(font2); //Dreamland
 textSize(random(35, 45));
 fill(8, 32, 9);
 text("you are just like caged birds", 50, 100);
 noStroke(); //birds
 px10+=random(-speed, speed);
 px11+=random(-speed, speed);
 px12+=random(-speed, speed);
 px13+=random(-speed, speed);
 px14+=random(-speed, speed);
 px15+=random(-speed, speed);
 px16+=random(-speed, speed);
 px17+=random(-speed, speed);
 px18+=random(-speed, speed);
 px19+=random(-speed, speed);
 px20+=random(-speed, speed);
 px21+=random(-speed, speed);
 px22+=random(-speed, speed);
 px23+=random(-speed, speed);
 px24+=random(-speed, speed);
 px25+=random(-speed, speed);
 px26+=random(-speed, speed);
 px27+=random(-speed, speed);
 py5+=random(-speed, speed);
 py6+=random(-speed, speed);
 py7+=random(-speed, speed);
 py8+=random(-speed, speed);
 py9+=random(-speed, speed);
 py10+=random(-speed, speed);
 py11+=random(-speed, speed);
 py12+=random(-speed, speed);
 py13+=random(-speed, speed);
 py14+=random(-speed, speed);
 py15+=random(-speed, speed);
 py16+=random(-speed, speed);
 py17+=random(-speed, speed);
 py18+=random(-speed, speed);
 py19+=random(-speed, speed);
 fill(255, 0, 0);
 triangle(px10, py5, px11, py6, px12, py7);
 fill(41, 123, 252);
 triangle(px13, py8, px14, py9, px15, py10);
 fill(0, 255, 0);
 triangle(px16, py11, px17, py12, px18, py13);
 fill(242, 12, 185);
 triangle(px19, py14, px20, py15, px21, py16);
 fill(0, 0, 255);
 triangle(px22, py17, px23, py18, px24, py19);
 fill(234, 242, 12);
 triangle(px25, px26, px26, px25, px27, py19);
 for(int x=0; x<=width; x+=13){ //background cage
      for(int y=0; y<=height; y+=13){
        strokeWeight(2);
        stroke(0);
        line(x, y, x, 10);
      }
    }
    fill(157, 175, 167); //key
    rect(random(275, 279), 280, 30, 30);
    rect(random(282, 286), 311, 10, 40);
    rect(300, 325, 16, 8); //portal1
    rect(300, 335, 18, 9); //portal2
    ellipse(random(291, 295), 305, r7, r7);
    ellipse(random(289, 293), 300, r8, r8);
    //millis
    if(millis()>240000){
      strokeWeight(1.5);
      fill(random(80, 180), random(80, 180), random(80, 180));
      rect(random(150, 250), random(130, 190), random(195, 205), random(195, 205));
      fill(random(50, 155), random(50, 155), random(50, 155));
      rect(random(190, 230), random(150, 190), random(175, 185), random(175, 185));
      fill(random(140, 240), random(140, 240), random(140, 240));
      rect(random(210, 240), random(170, 200), random(155, 165), random(55, 165));
      fill(0, random(0, 230), 0);
      rect(random(237, 317), random(198, 278), random(40, 50), random(40, 50));
      line(random(235, 365), random(60, 80), random(235, 365), random(440, 460));
      line(random(205, 215), random(390, 430), random(265, 275), random(390, 430));
      line(random(325, 335), random(390, 430), random(385, 395), random(390, 430));
      line(random(190, 290), random(360, 460), random(190, 290), random(370, 470));
      line(random(310, 410), random(360, 460), random(310, 410), random(370, 470));
      line(random(300, 400), random(260, 460), random(200, 300), random(90, 290));
      line(random(300, 400), random(260, 460), random(400, 500), random(90, 290));
      line(random(200, 300), random(160, 260), random(140, 240), random(310, 410));
      line(random(200, 300), random(160, 260), random(260, 360), random(310, 410));
      fill(random(0, 150), random(0, 150), random(0, 150));
      triangle(random(0, 400), random(0, 550), random(100, 500), random(0, 550), random(200, 600), random(0, 550));
      fill(random(0, 240), 0, 0);
      ellipse(random(245, 255), random(115, 125), random(28, 32), random(19, 21));
      ellipse(random(345, 355), random(115, 125), random(28, 32), random(19, 21));
      fill(0, 0, random(0, 255));
      ellipse(300, 50, random(5, 25), random(0, 20));
      ellipse(random(240, 360), 430, 5, 10);
      ellipse(random(240,360), 430, 5, 10);
      fill(255, 0, 0);
      textSize(50);
      text("HERE YOU ARE!", 120, 500);
    }
    if(millis()>242000){
      background(random(0, 50));
      strokeWeight(1.5);
      fill(255);
      rect(200, 160, 200, 200);
      rect(210, 170, 180, 180);
      rect(220,180, 160, 160);
      rect(277, 238, 45, 45);
      line(300, 70, 300, 450);
      line(210, 410, 270, 410);
      line(330, 410, 390, 410);
      line(240, 410, 240, 420);
      line(360, 410, 360, 420);
      line(300, 260, 200, 90);
      line(300, 260, 400, 90);
      line(300, 260, 240, 410);
      line(300, 260, 360, 410);
      triangle(290, 480, 300, 450, 310, 480);
      ellipse(250, 120, 30, 20);
      ellipse(350, 120, 30, 20);
      ellipse(300, 50, 15, 10);
      ellipse(240, 430, 5, 10);
      ellipse(360, 430, 5, 10);
      textSize(15);
      text("You were so confused...now that I stopped you, we can", 50, 510);
      text("stay together, here in the loveliest nest, your head...", 50, 540);
      text("...FOREVER.", 50, 570);
    }
  }
  if(page==12){
    background(255, 247, 11);
    for(int x=0; x<=width; x+=13){ //background
      for(int y=0; y<=height; y+=13){
        fill(111, 23, 99);
        ellipse(x, y, 13, 13);
      }
    }
    strokeWeight(2); //body
    stroke(0);
    fill(random(0, 15), random(0, 0), random(200, 250));
    rect(240, 130, 110, 110);
    rect(210, 230, 180, 150);
    rect(202, 380, 195, 195);
    fill(0); //shoes
    rect(192, 531, 35, 45);
    rect(370, 531, 35, 45);
    strokeWeight(10); //arms
    stroke(180, 33, 33);
    line(210, 245, 150, 125);
    line(390, 245, 445, 125);
    strokeWeight(1); //buttons
    stroke(180, 33, 33);
    fill(96, 250, 138);
    ellipse(300, 242, 15, 15);
    ellipse(px28, py21, r9, r9);
    ellipse(300, 282, 15, 15);
    stroke(0); //puppet's speaking
    fill(240);
    textFont(font2);
    textSize(80);
    text("PLEASE", 170, 60);
    textSize(50);
    text("GIVE ME A FACE!", 110, 105);
    if(keyPressed){ //faces
      textFont(font5);
      if((key == 'h') || (key == 'H')){ //happy
        strokeWeight(2);
        fill(0);
        textSize(50);
        text(":)", 280, 195);
      }
      if((key == 'd') || (key == 'D')){ //laugh
        strokeWeight(2);
        fill(0);
        textSize(50);
        text(":D", 275, 195);
     }
     if(key == 's' ){
        strokeWeight(2);
        fill(0);
        textSize(50);
        text(":|", 280, 195);
     }
     if(key == 'S'){
        strokeWeight(2);
        fill(0);
        textSize(50);
        text(":(", 275, 195);
     }
     if((key == 'p') || (key == 'P')) { //:P
        strokeWeight(2);
        fill(0);
        textSize(50);
        text(":P", 275, 195);
     }
     if((key == 'x') || (key == 'X')) { //XD
        strokeWeight(2);
        fill(0);
        textSize(50);
        text("XD", 260, 200);
     }
     if((key == 't') || (key == 'T')) { //crying
        strokeWeight(2);
        fill(0);
        textSize(50);
        text("T_T", 250, 195);
      }
    }
    //millis
    if(millis()>240000){
      strokeWeight(1.5);
      fill(random(80, 180), random(80, 180), random(80, 180));
      rect(random(150, 250), random(130, 190), random(195, 205), random(195, 205));
      fill(random(50, 155), random(50, 155), random(50, 155));
      rect(random(190, 230), random(150, 190), random(175, 185), random(175, 185));
      fill(random(140, 240), random(140, 240), random(140, 240));
      rect(random(210, 240), random(170, 200), random(155, 165), random(55, 165));
      fill(0, random(0, 230), 0);
      rect(random(237, 317), random(198, 278), random(40, 50), random(40, 50));
      line(random(235, 365), random(60, 80), random(235, 365), random(440, 460));
      line(random(205, 215), random(390, 430), random(265, 275), random(390, 430));
      line(random(325, 335), random(390, 430), random(385, 395), random(390, 430));
      line(random(190, 290), random(360, 460), random(190, 290), random(370, 470));
      line(random(310, 410), random(360, 460), random(310, 410), random(370, 470));
      line(random(300, 400), random(260, 460), random(200, 300), random(90, 290));
      line(random(300, 400), random(260, 460), random(400, 500), random(90, 290));
      line(random(200, 300), random(160, 260), random(140, 240), random(310, 410));
      line(random(200, 300), random(160, 260), random(260, 360), random(310, 410));
      fill(random(0, 150), random(0, 150), random(0, 150));
      triangle(random(0, 400), random(0, 550), random(100, 500), random(0, 550), random(200, 600), random(0, 550));
      fill(random(0, 240), 0, 0);
      ellipse(random(245, 255), random(115, 125), random(28, 32), random(19, 21));
      ellipse(random(345, 355), random(115, 125), random(28, 32), random(19, 21));
      fill(0, 0, random(0, 255));
      ellipse(300, 50, random(5, 25), random(0, 20));
      ellipse(random(240, 360), 430, 5, 10);
      ellipse(random(240,360), 430, 5, 10);
      fill(255, 0, 0);
      textSize(50);
      text("HERE YOU ARE!", 120, 500);
    }
    if(millis()>242000){
      background(random(0, 50));
      strokeWeight(1.5);
      fill(255);
      rect(200, 160, 200, 200);
      rect(210, 170, 180, 180);
      rect(220,180, 160, 160);
      rect(277, 238, 45, 45);
      line(300, 70, 300, 450);
      line(210, 410, 270, 410);
      line(330, 410, 390, 410);
      line(240, 410, 240, 420);
      line(360, 410, 360, 420);
      line(300, 260, 200, 90);
      line(300, 260, 400, 90);
      line(300, 260, 240, 410);
      line(300, 260, 360, 410);
      triangle(290, 480, 300, 450, 310, 480);
      ellipse(250, 120, 30, 20);
      ellipse(350, 120, 30, 20);
      ellipse(300, 50, 15, 10);
      ellipse(240, 430, 5, 10);
      ellipse(360, 430, 5, 10);
      textSize(15);
      text("You were so confused...now that I stopped you, we can", 50, 510);
      text("stay together, here in the loveliest nest, your head...", 50, 540);
      text("...FOREVER.", 50, 570);
    }
  }
  if(page==13){
    background(245, 228, 37);
    fill(0); //Dreamland advice
    textSize(30);
    text("The DOOR plays hide and seek", 65, 80);
    text("How do you open your eyes?", 101, 520);
    fill(random(0, 100));
    ellipse(px29, py22, r7, r7);
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(pf2, pf2, rf2, 210);
    noStroke();
    fill(245, 228, 37);
    rect(160, Y, 280, 150);
    if((keyPressed) && (key==CODED)){
      if(keyCode==UP){
        Y--;
      }
    }
    rect(160, Y2, 280, 150);
    if((keyPressed) && (key==CODED)){
    if(keyCode==UP){
      Y2++;
    }
  }
  //millis
    if(millis()>240000){
      strokeWeight(1.5);
      fill(random(80, 180), random(80, 180), random(80, 180));
      rect(random(150, 250), random(130, 190), random(195, 205), random(195, 205));
      fill(random(50, 155), random(50, 155), random(50, 155));
      rect(random(190, 230), random(150, 190), random(175, 185), random(175, 185));
      fill(random(140, 240), random(140, 240), random(140, 240));
      rect(random(210, 240), random(170, 200), random(155, 165), random(55, 165));
      fill(0, random(0, 230), 0);
      rect(random(237, 317), random(198, 278), random(40, 50), random(40, 50));
      line(random(235, 365), random(60, 80), random(235, 365), random(440, 460));
      line(random(205, 215), random(390, 430), random(265, 275), random(390, 430));
      line(random(325, 335), random(390, 430), random(385, 395), random(390, 430));
      line(random(190, 290), random(360, 460), random(190, 290), random(370, 470));
      line(random(310, 410), random(360, 460), random(310, 410), random(370, 470));
      line(random(300, 400), random(260, 460), random(200, 300), random(90, 290));
      line(random(300, 400), random(260, 460), random(400, 500), random(90, 290));
      line(random(200, 300), random(160, 260), random(140, 240), random(310, 410));
      line(random(200, 300), random(160, 260), random(260, 360), random(310, 410));
      fill(random(0, 150), random(0, 150), random(0, 150));
      triangle(random(0, 400), random(0, 550), random(100, 500), random(0, 550), random(200, 600), random(0, 550));
      fill(random(0, 240), 0, 0);
      ellipse(random(245, 255), random(115, 125), random(28, 32), random(19, 21));
      ellipse(random(345, 355), random(115, 125), random(28, 32), random(19, 21));
      fill(0, 0, random(0, 255));
      ellipse(300, 50, random(5, 25), random(0, 20));
      ellipse(random(240, 360), 430, 5, 10);
      ellipse(random(240,360), 430, 5, 10);
      fill(255, 0, 0);
      textSize(50);
      text("HERE YOU ARE!", 120, 500);
    }
    if(millis()>242000){
      background(random(0, 50));
      strokeWeight(1.5);
      fill(255);
      rect(200, 160, 200, 200);
      rect(210, 170, 180, 180);
      rect(220,180, 160, 160);
      rect(277, 238, 45, 45);
      line(300, 70, 300, 450);
      line(210, 410, 270, 410);
      line(330, 410, 390, 410);
      line(240, 410, 240, 420);
      line(360, 410, 360, 420);
      line(300, 260, 200, 90);
      line(300, 260, 400, 90);
      line(300, 260, 240, 410);
      line(300, 260, 360, 410);
      triangle(290, 480, 300, 450, 310, 480);
      ellipse(250, 120, 30, 20);
      ellipse(350, 120, 30, 20);
      ellipse(300, 50, 15, 10);
      ellipse(240, 430, 5, 10);
      ellipse(360, 430, 5, 10);
      textSize(15);
      text("You were so confused...now that I stopped you, we can", 50, 510);
      text("stay together, here in the loveliest nest, your head...", 50, 540);
      text("...FOREVER.", 50, 570);
    }
  }
  if(page==14){
   background(250);
   fill(234, 28, 125); //speaker's speaking
   textFont(font3);
   textSize(30);
   text("YOU ESCAPED!", 200, 100);
   textSize(20);
   text("You finally reached the edge of your sleeping mind", 30, 200);
   text("and now you're waking up.", 30, 300);
   text("That entity won't catch you, and just like Dreamland...", 30, 400);
   text("...he's fading.", 30, 500);
 }
 }

void mousePressed(){
  if(page==0){
    page=1;
  }
  else if(page==1){
    page=2;
  }
  else if(page==2){
    page=3;
  }
  else if(page==3){
    page=4;
  }
  else if(page==4){
    page=5;
  }
  else if(page==5){
    page=6;
  }
  else if(page==6){
    page=7;
  }
  if(page==7){
    float d=dist(mouseX, mouseY, px, py);
    if (d<r){
    page=int(random(8, 10));
  }
  float d2=dist(mouseX, mouseY, px2, py);
  if(d2<r){
    page=int(random(10, 12));
  }
  float d3=dist(mouseX, mouseY, px3, py);
  if(d3<r){
    page=int(random(12, 14));
  }
}
if(page==8){
  float d=dist(mouseX, mouseY, px4, py2);
  if (d<r3){
    page=9;
  }
  float d2=dist(mouseX, mouseY, px5, py3);
  if(d2<r3){
    page=7;
  }
}
if(page==9){
  float d=dist(mouseX, mouseY, px6, px6);
  if(d<r4){
    page=8;
  }
  float d2=dist(mouseX, mouseY, px7, px7);
  if(d2<r5){
    page=7;
  }
}
if(page==10){
  float d=dist(mouseX, mouseY, px8, py4);
  if(d<r6){
    page=7;
  }
  float d2=dist(mouseX, mouseY, px9, py4);
  if(d2<r6){
    page=11;
  }
}
if(page==11){
  float d=dist(mouseX, mouseY, random(291, 295), 305);
  if(d<r7){
    page=7;
  }
  float d2=dist(mouseX, mouseY, random(289, 293), 300);
  if(d2<r8){
    page=10;
  }
}
if(page==12){
  float d=dist(mouseX, mouseY, px28, py21);
  if(d<r9){
    page=7;
  }
}
if(page==13){
  float d=dist(mouseX, mouseY, pf, pf);
  if(d<rf){
    page=14;
  }
  float d2=dist(mouseX, mouseY, px29, py22);
  if(d2<r7){
    page=7;
  }
}
}




