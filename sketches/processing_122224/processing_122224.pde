

//Global Vars
int s2X=1100;
int page2=0;
int sX=500;
int s5X=2600;
int s5VX=0;
int fOV=20;
int sVX=0;
int s3X=-1600;
int s2VX=0;
int s3VX=0;
int s4X=-2100;
int s4VX=0;
int fO=255;
int begY=-100;
int begX=-100;
int s6X=3200;
int s6VX=0;
int s7X=-3700;
int s7VX=0;
int s8X=-4300;
int s8VX=0;
int s9X=4500;
int s9VX=0;
int s0X=4900;
int s0VX=0;
int mW=5;
int mVW=1;
int pC=#FF3131;
int bX11=540;
int bX12=580;
int bX13=560;
int bY11=465;
int bY12=465;
int bY13=485;
int page=0;
int bV=1;
int p3VY=3;
int p4VY=4;
int p5VY=5;
int p3X=400;
int p3Y=175;
int p4X=100;
int p5Y=300;
int p5X=250;
int p4Y=0;
int gain=0;
int bX21=540;
int bX22=580;
int bX23=560;
int bY21=465;
int bY22=465;
int bY23=485;
int bX21a=20;
int bX22a=60;
int bX23a=40;
int bY21a=485;
int bY22a=485;
int bY23a=465;
int pW=100;
int pVW=0;
int rW1=400;
int rW2=100;
int rVW2=0;
int rVW1=0;
int pVX=0;
int pVY=0;
int p2X=400;
int p2Y=175;
int pX=400;
int pY=175;
int scene=0;
int tX=-200;
int tVX=20;
int starX=0;
int starY=-80;
int starVX=20;
int starVY=20;
int aX=100;
int a2X=200;
int a3X=300;
int a4X=400;
int aY=100;
int a2Y=200;
int a3Y=300;
int a4Y=400;
int gf=#388140;
int gfT=#C1D11B;
int b=0;
int pikaX1=650;
int pikaVX1=8;
int pikaX2=-50;
int pikaY2=-50;
int pikaVX2=3;
int pikaVY2=3;
int pikaX3=250;
int pikaY3=600;
int pikaVY3=3;
PFont myFont = createFont("Verdana", 12);
int garyX=-100;
int ashX=700;
int ashVX=-9;
int garyVX=9;
int rW=200;
int b2=0;
int b2V=0;
int b3=0;
int b3V=0;
int gary2X=700;
int gary2VX=10;
int bX31=540;
int bX32=580;
int bX33=560;
int bY31=465;
int bY32=465;
int bY33=485;
int  gary1=#000000;
int  gary2=#000000;
int  gary3=#000000;
int  gary4=#000000;
int  gary5=#000000;
int  gary6=#000000;
int  gary7=#000000;
int  gary8=#000000;
int  gary9=#000000;
int  rC=#00FF00;
int  ash1=#000000;
int  ash2=#000000;
int  ash3=#000000;
int  ash4=#000000;
int  ash5=#000000;


void setup() {
  size(600, 500);
  frameRate(30);
}
void draw() {



  buttons();
  b=b+bV; 

  background(#FFFFFF);



  //health color
  if (rW<130&&rW>70) {
    rC=#FFFF00;
  }
  if (rW<70&&rW>0) {
    rC=#FF0000;
  }
  b2=b2+b2V;
  b3=b3+b3V;
  stroke(5);
  background(#FFFFFF);
  if (page2==1) {
    //motion
    garyX=garyX+garyVX;
    ashX=ashX+ashVX;
    if (garyX>505) {
      garyVX=0;
      gary1=#C62800;
      gary2=#FFFFFF;
      gary3=#FF0000;
      gary4=#FFFF00;
      gary5=#C62800;
      gary6=#5A0300;
      gary7=#CB8500;
      gary8=#FFEA29;
      gary9=#F00800;
    }
    if (ashX<110) {
      ashVX=0;
      ash1=#FFE043;
      ash2=#FF3F21;
      ash3=#FFDF3E;
      ash4=#FF1515;
      ash5=#FFFFFF;
    }

    //gary
    fill(gary1);
    //chest
    rect(garyX-30, 50, 65, 75);
    //shirt design

    fill(gary2);
    ellipse(garyX+20, 110, 15, 15);

    fill(gary3);
    ellipse(garyX+20, 110, 5, 5);
    //necklce
    line(garyX+2, 80, garyX-10, 50);
    line(garyX+2, 80, garyX+14, 50);

    fill(gary4);
    ellipse(garyX+2, 80, 10, 10);

    //arms

    fill(gary5);
    rect(garyX-50, 50, 20, 70);
    rect(garyX+35, 50, 20, 70);
    //legs

    fill(gary6);
    rect(garyX-30, 125, 30, 60);
    rect(garyX+5, 125, 30, 60);
    //shoes

    fill(gary7);
    ellipse(garyX-18, 190, 40, 15);
    ellipse(garyX+20, 190, 40, 15);
    //head

    fill(gary8);
    ellipse(garyX, 30, 50, 45);
    //eyes
    fill(#000000);
    ellipse(garyX-9, 28, 5, 5);
    ellipse(garyX+10, 28, 5, 5);
    //nose
    ellipse(garyX+2, 34, 2, 2);
    //mouth
    line(garyX-2, 45, garyX+5, 42);
    line(garyX+5, 42, garyX+7, 40);
    line(garyX+8, 40, garyX+10, 37);
    //hair

    fill(gary9);
    beginShape();
    vertex(garyX-30, 0);
    vertex(garyX+25, 10);
    vertex(garyX+25, 20);
    vertex(garyX-25, 17);
    vertex(garyX-30, 0);
    endShape();

    //ash
    //head

    fill(ash1);
    ellipse(ashX, 250, 100, 100);
    //hair
    fill(#000000);
    ellipse(ashX-30, 250, 45, 60);
    ellipse(ashX+10, 230, 70, 30);
    //eye
    ellipse(ashX+45, 245, 10, 10);
    //mouth
    line(ashX+45, 265, ashX+40, 265);
    line(ashX+40, 265, ashX+35, 263);
    //back

    fill(ash2);
    rect(ashX-60, 275, 120, 125);
    //arm 

    fill(ash3);
    beginShape();
    vertex(ashX+60, 280);
    vertex(ashX+95, 280);
    vertex(ashX+95, 355);
    vertex(ashX+150, 355);
    vertex(ashX+150, 382);
    vertex(ashX+63, 382);
    vertex(ashX+60, 280);
    endShape();
    //hat
    noStroke();

    fill(ash4);
    ellipse(ashX, 205, 100, 20);
    beginShape();
    vertex(ashX-50, 205);
    vertex(ashX+50, 205);
    vertex(ashX+55, 235);
    vertex(ashX+75, 235);
    vertex(ashX+75, 240);
    vertex(ashX-55, 240);
    vertex(ashX-50, 205);
    endShape();
    //poke ball
    ellipse(ashX+170, 370, 40, 40);
    fill(#000000);
    rect(ashX+150, 368, 40, 5);

    fill(ash5);
    ellipse(ashX+170, 370, 10, 10);

    stroke(5);
    //text box
    fill(#FFFFFF);
    rect(10, 400, 580, 90);
    fill(#000000);
    textFont(myFont, 30);
    text("Gary wants", 20, 430);
    text("to fight!", 20, 460);
    //button to procced 
    triangle(bX31, bY31, bX32, bY32, bX33, bY33);
  }
  if (page2==2) {
    //eevve stats
    text("EEVEE", 50, 50);
    text("HP:", 50, 80);
    fill(rC);
    rect(110, 55, 200, 30);
    //eevee
    //legs
    fill(#CC7F32);
    ellipse(415, 160, 20, 75);
    ellipse(445, 162, 20, 70);
    ellipse(500, 160, 20, 70);
    ellipse(510, 162, 20, 70);

    //body
    fill(#CC7F32);
    ellipse(455, 125, 160, 60);

    //neck
    fill(#eaeaea);
    ellipse(400, 120, 60, 50);
    ellipse(460, 120, 60, 50);
    ellipse(430, 130, 70, 60);
    //tail
    ellipse(530, 85, 30, 100);
    fill(#CC7F32);
    ellipse(530, 95, 40, 80);
    //ears
    ellipse(410, 30, 13, 80);
    ellipse(450, 30, 13, 80);
    fill(#000000);
    ellipse(410, 30, 5, 50);
    ellipse(450, 30, 5, 50);
    //head
    fill(#CC7F32);
    ellipse(430, 80, 90, 70);
    //eyes
    fill(#000000);
    ellipse(420, 75, 7, 7);
    ellipse(440, 75, 7, 7);
    //nose
    ellipse(428, 88, 7, 3);
    //mouth
    line(425, 100, 435, 100);
    line(435, 100, 440, 97);
    line(440, 97, 445, 94);

    //pikachu stats
    fill(#000000);
    text("PIKACHU", 340, 350);
    text("HP:", 340, 380);
    fill(#00FF00);
    rect(400, 355, 200, 30);
    //pikachu
    noStroke();
    fill(#FFFF00);
    //head+body
    ellipse(165, 380, 150, 210);
    ellipse(175, 320, 140, 90);
    //hand
    ellipse(220, 360, 100, 20);
    //ears
    ellipse(160, 275, 20, 100);
    ellipse(195, 270, 20, 100);
    //ear tops
    fill(#000000);
    ellipse(160, 235, 10, 20);
    ellipse(195, 230, 10, 20);
    //cheek
    fill(#FF0000);
    ellipse(220, 325, 15, 15);
    //tail 
    fill(#CD661D);
    rect(55, 385, 40, 20);
    rect(35, 365, 35, 20);
    fill(#FFFF00);
    rect(15, 350, 35, 20);
    rect(10, 330, 20, 25);
    rect(0, 300, 20, 35);
    //back
    fill(#EE8833);
    triangle(90, 355, 190, 365, 90, 375);
    stroke(5);
    //text box
    fill(#FFFFFF);
    rect(10, 400, 580, 90);
    fill(#000000);
    textFont(myFont, 30);
    text("Gary sent out EEVEE", 20, 430);
    text("Go! PIKACHU!", 20, 460);
    //button to procced 
    triangle(bX31, bY31, bX32, bY32, bX33, bY33);
  }
  if (page2==3) {
    //eevve stats
    text("EEVEE", 50, 50);
    text("HP:", 50, 80);
    fill(rC);
    rect(110, 55, rW, 30);
    //eevee
    //legs
    fill(#CC7F32);
    ellipse(415, 160, 20, 75);
    ellipse(445, 162, 20, 70);
    ellipse(500, 160, 20, 70);
    ellipse(510, 162, 20, 70);

    //body
    fill(#CC7F32);
    ellipse(455, 125, 160, 60);

    //neck
    fill(#eaeaea);
    ellipse(400, 120, 60, 50);
    ellipse(460, 120, 60, 50);
    ellipse(430, 130, 70, 60);
    //tail
    ellipse(530, 85, 30, 100);
    fill(#CC7F32);
    ellipse(530, 95, 40, 80);
    //ears
    ellipse(410, 30, 13, 80);
    ellipse(450, 30, 13, 80);
    fill(#000000);
    ellipse(410, 30, 5, 50);
    ellipse(450, 30, 5, 50);
    //head
    fill(#CC7F32);
    ellipse(430, 80, 90, 70);
    //eyes
    fill(#000000);
    ellipse(420, 75, 7, 7);
    ellipse(440, 75, 7, 7);
    //nose
    ellipse(428, 88, 7, 3);
    //mouth
    line(425, 100, 435, 100);
    line(435, 100, 440, 97);
    line(440, 97, 445, 94);
    //mouth
    //pikachu stats
    fill(#000000);
    text("PIKACHU", 340, 350);
    text("HP:", 340, 380);
    fill(#00FF00);
    rect(400, 355, 200, 30);
    //pikachu
    noStroke();
    fill(#FFFF00);
    //head+body
    ellipse(165, 380, 150, 210);
    ellipse(175, 320, 140, 90);
    //hand
    ellipse(220, 360, 100, 20);
    //ears
    ellipse(160, 275, 20, 100);
    ellipse(195, 270, 20, 100);
    //ear tops
    fill(#000000);
    ellipse(160, 235, 10, 20);
    ellipse(195, 230, 10, 20);
    //cheek
    fill(#FF0000);
    ellipse(220, 325, 15, 15);
    //tail 
    fill(#CD661D);
    rect(55, 385, 40, 20);
    rect(35, 365, 35, 20);
    fill(#FFFF00);
    rect(15, 350, 35, 20);
    rect(10, 330, 20, 25);
    rect(0, 300, 20, 35);
    //back
    fill(#EE8833);
    triangle(90, 355, 190, 365, 90, 375);
    stroke(5);
    //text box
    fill(#FFFFFF);
    rect(10, 400, 580, 90);
    rect(20, 405, 200, 30);
    rect(20, 445, 230, 30);
    fill(#000000);
    textFont(myFont, 30);
    text("Thunder Bolt               -----------", 20, 430);
    text("Thunder Shock            -----------", 20, 470);
  }
  if (page2==99) {
    b2V=1;
    //eevve stats
    text("EEVEE", 50, 50);
    text("HP:", 50, 80);
    fill(rC);
    rect(110, 55, rW, 30);
    //eevee
    //legs
    fill(#CC7F32);
    ellipse(415, 160, 20, 75);
    ellipse(445, 162, 20, 70);
    ellipse(500, 160, 20, 70);
    ellipse(510, 162, 20, 70);

    //body
    fill(#CC7F32);
    ellipse(455, 125, 160, 60);

    //neck
    fill(#eaeaea);
    ellipse(400, 120, 60, 50);
    ellipse(460, 120, 60, 50);
    ellipse(430, 130, 70, 60);
    //tail
    ellipse(530, 85, 30, 100);
    fill(#CC7F32);
    ellipse(530, 95, 40, 80);
    //ears
    ellipse(410, 30, 13, 80);
    ellipse(450, 30, 13, 80);
    fill(#000000);
    ellipse(410, 30, 5, 50);
    ellipse(450, 30, 5, 50);
    //head
    fill(#CC7F32);
    ellipse(430, 80, 90, 70);
    //eyes
    fill(#000000);
    ellipse(420, 75, 7, 7);
    ellipse(440, 75, 7, 7);
    //nose
    ellipse(428, 88, 7, 3);
    //mouth
    line(425, 100, 435, 100);
    line(435, 100, 440, 97);
    line(440, 97, 445, 94);
    //mouth
    //pikachu stats
    fill(#000000);
    text("PIKACHU", 340, 350);
    text("HP:", 340, 380);
    fill(#00FF00);
    rect(400, 355, 200, 30);
    //pikachu
    noStroke();
    fill(#FFFF00);
    //head+body
    ellipse(165, 380, 150, 210);
    ellipse(175, 320, 140, 90);
    //hand
    ellipse(220, 360, 100, 20);
    //ears
    ellipse(160, 275, 20, 100);
    ellipse(195, 270, 20, 100);
    //ear tops
    fill(#000000);
    ellipse(160, 235, 10, 20);
    ellipse(195, 230, 10, 20);
    //cheek
    fill(#FF0000);
    ellipse(220, 325, 15, 15);
    //tail 
    fill(#CD661D);
    rect(55, 385, 40, 20);
    rect(35, 365, 35, 20);
    fill(#FFFF00);
    rect(15, 350, 35, 20);
    rect(10, 330, 20, 25);
    rect(0, 300, 20, 35);
    //back
    fill(#EE8833);
    triangle(90, 355, 190, 365, 90, 375);
    stroke(5);
    //health bar
    if (rW<1) {
      rW=0;
      page2=999;
    }
    if (b2>0&&b2<70) {
      if (b2>1&&b2<40) {
        rW=rW-2;
      }
      //lighting bolt
      fill(#FFFF00);
      beginShape();
      vertex(500, 200);
      vertex(400, 175);
      vertex(500, 150);
      vertex(400, 125);
      vertex(500, 100);
      vertex(400, 75);
      vertex(500, 50);
      vertex(400, 25);
      vertex(500, 0);
      vertex(515, 0);
      vertex(415, 25);
      vertex(515, 50);
      vertex(415, 75);
      vertex(515, 100);
      vertex(415, 125);
      vertex(515, 150);
      vertex(415, 175);
      vertex(515, 200);
      vertex(500, 200);
      endShape();

      //text box
      fill(#FFFFFF);
      rect(10, 400, 580, 90);
      fill(#000000);
      textFont(myFont, 30);
      text("PIKACHU used Thunderbolt!", 20, 430);
    }
    if (b2>69&&b2<130) {
      //text box
      fill(#FFFFFF);
      rect(10, 400, 580, 90);
      fill(#000000);
      textFont(myFont, 30);
      text("Enemy EEVEE used Tail Whip!", 20, 430);
    }
    if (b2>129&&b2<160) {
      //text box
      fill(#FFFFFF);
      rect(10, 400, 580, 90);
      fill(#000000);
      textFont(myFont, 30);
      text("But, it failed!", 20, 430);
    }
    if (b2==159) {
      b2=0;
      b2V=0;
      page2=3;
    }
  }


























  if (page2==101) {
    b3V=1;
    //eevve stats
    text("EEVEE", 50, 50);
    text("HP:", 50, 80);
    fill(rC);
    rect(110, 55, rW, 30);
    //eevee
    //legs
    fill(#CC7F32);
    ellipse(415, 160, 20, 75);
    ellipse(445, 162, 20, 70);
    ellipse(500, 160, 20, 70);
    ellipse(510, 162, 20, 70);

    //body
    fill(#CC7F32);
    ellipse(455, 125, 160, 60);

    //neck
    fill(#eaeaea);
    ellipse(400, 120, 60, 50);
    ellipse(460, 120, 60, 50);
    ellipse(430, 130, 70, 60);
    //tail
    ellipse(530, 85, 30, 100);
    fill(#CC7F32);
    ellipse(530, 95, 40, 80);
    //ears
    ellipse(410, 30, 13, 80);
    ellipse(450, 30, 13, 80);
    fill(#000000);
    ellipse(410, 30, 5, 50);
    ellipse(450, 30, 5, 50);
    //head
    fill(#CC7F32);
    ellipse(430, 80, 90, 70);
    //eyes
    fill(#000000);
    ellipse(420, 75, 7, 7);
    ellipse(440, 75, 7, 7);
    //nose
    ellipse(428, 88, 7, 3);
    //mouth
    line(425, 100, 435, 100);
    line(435, 100, 440, 97);
    line(440, 97, 445, 94);
    //mouth
    //pikachu stats
    fill(#000000);
    text("PIKACHU", 340, 350);
    text("HP:", 340, 380);
    fill(#00FF00);
    rect(400, 355, 200, 30);
    //pikachu
    noStroke();
    fill(#FFFF00);
    //head+body
    ellipse(165, 380, 150, 210);
    ellipse(175, 320, 140, 90);
    //hand
    ellipse(220, 360, 100, 20);
    //ears
    ellipse(160, 275, 20, 100);
    ellipse(195, 270, 20, 100);
    //ear tops
    fill(#000000);
    ellipse(160, 235, 10, 20);
    ellipse(195, 230, 10, 20);
    //cheek
    fill(#FF0000);
    ellipse(220, 325, 15, 15);
    //tail 
    fill(#CD661D);
    rect(55, 385, 40, 20);
    rect(35, 365, 35, 20);
    fill(#FFFF00);
    rect(15, 350, 35, 20);
    rect(10, 330, 20, 25);
    rect(0, 300, 20, 35);
    //back
    fill(#EE8833);
    triangle(90, 355, 190, 365, 90, 375);
    stroke(5);
    if (rW<1) {
      rW=0;
      page2=999;
    }
    if (b3>0&&b3<70) {
      if (b3>1&&b3<40) {
        rW=rW-2;
      }
      //thundershock
      fill(#000000, random(255));
      ellipse(460, 120, 150, 150);
      fill(color(random(256)), random(255));
      ellipse(460, 120, 150, 150);
      //text box
      fill(#FFFFFF);
      rect(10, 400, 580, 90);
      fill(#000000);
      textFont(myFont, 30);
      text("PIKACHU used Thundershock!", 20, 430);
    }
    if (b3>69&&b3<130) {
      //text box
      fill(#FFFFFF);
      rect(10, 400, 580, 90);
      fill(#000000);
      textFont(myFont, 30);
      text("Enemy EEVEE used Roar!", 20, 430);  
      stroke(5);
      line(300, 25, 325, 50);
      line(325, 50, 300, 75);
      line(300, 75, 325, 100);
      line(325, 100, 300, 125);
      line(300, 125, 325, 150);
      line(325, 150, 300, 175);
      line(300, 175, 325, 200);
      line(325, 200, 300, 225);
    }
    if (b3>129&&b3<160) {
      //text box
      fill(#FFFFFF);
      rect(10, 400, 580, 90);
      fill(#000000);
      textFont(myFont, 30);
      text("PIKACHU's defense fell!", 20, 430);
    }
    if (b3==159) {
      b3=0;
      b3V=0;
      page2=3;
    }
  }


  if (page2==999) {
    //eevve stats
    text("EEVEE", 50, 50);
    text("HP:", 50, 80);
    fill(#00FF00);
    rect(110, 55, rW, 30);
    //pikachu stats
    fill(#000000);
    text("PIKACHU", 340, 350);
    text("HP:", 340, 380);
    fill(#00FF00);
    rect(400, 355, 200, 30);
    //pikachu
    noStroke();
    fill(#FFFF00);
    //head+body
    ellipse(165, 380, 150, 210);
    ellipse(175, 320, 140, 90);
    //hand
    ellipse(220, 360, 100, 20);
    //ears
    ellipse(160, 275, 20, 100);
    ellipse(195, 270, 20, 100);
    //ear tops
    fill(#000000);
    ellipse(160, 235, 10, 20);
    ellipse(195, 230, 10, 20);
    //cheek
    fill(#FF0000);
    ellipse(220, 325, 15, 15);
    //tail 
    fill(#CD661D);
    rect(55, 385, 40, 20);
    rect(35, 365, 35, 20);
    fill(#FFFF00);
    rect(15, 350, 35, 20);
    rect(10, 330, 20, 25);
    rect(0, 300, 20, 35);
    //back
    fill(#EE8833);
    triangle(90, 355, 190, 365, 90, 375);
    stroke(5);
    //text box
    fill(#FFFFFF);
    rect(10, 400, 580, 90);
    fill(#000000);
    textFont(myFont, 30);
    text("Enemy EEVEE fainted!", 20, 430);
    text("Ash Defeated Gary!", 20, 460);
    //button to procced 
    triangle(bX31, bY31, bX32, bY32, bX33, bY33);
  }
  if (page2==1000) {
    gary2X=gary2X-gary2VX;
    //eevve stats
    fill(#000000);
    text("EEVEE", 50, 50);
    text("HP:", 50, 80);
    fill(#00FF00);
    rect(110, 55, rW, 30);
    //pikachu stats
    fill(#000000);
    text("PIKACHU", 340, 350);
    text("HP:", 340, 380);
    fill(#00FF00);
    rect(400, 355, 200, 30);
    //pikachu
    noStroke();
    fill(#FFFF00);
    //head+body
    ellipse(165, 380, 150, 210);
    ellipse(175, 320, 140, 90);
    //hand
    ellipse(220, 360, 100, 20);
    //ears
    ellipse(160, 275, 20, 100);
    ellipse(195, 270, 20, 100);
    //ear tops
    fill(#000000);
    ellipse(160, 235, 10, 20);
    ellipse(195, 230, 10, 20);
    //cheek
    fill(#FF0000);
    ellipse(220, 325, 15, 15);
    //tail 
    fill(#CD661D);
    rect(55, 385, 40, 20);
    rect(35, 365, 35, 20);
    fill(#FFFF00);
    rect(15, 350, 35, 20);
    rect(10, 330, 20, 25);
    rect(0, 300, 20, 35);
    //back
    fill(#EE8833);
    triangle(90, 355, 190, 365, 90, 375);
    stroke(5);
    //text box
    fill(#FFFFFF);
    rect(10, 400, 580, 90);
    fill(#000000);
    textFont(myFont, 30);
    text("Ash Defeated Gary!", 20, 430);
    text("Gary: What? Unbelievable!", 20, 460);
    //button to procced 
    triangle(bX31, bY31, bX32, bY32, bX33, bY33);
    //gary


    if (gary2X<500) {
      gary2VX=0;
    }
    gary1=#C62800;
    gary2=#FFFFFF;
    gary3=#FF0000;
    gary4=#FFFF00;
    gary5=#C62800;
    gary6=#5A0300;
    gary7=#CB8500;
    gary8=#FFEA29;
    gary9=#F00800;
    fill(gary1);
    //chest
    rect(gary2X-30, 50, 65, 75);
    //shirt design

    fill(gary2);
    ellipse(gary2X+20, 110, 15, 15);

    fill(gary3);
    ellipse(gary2X+20, 110, 5, 5);
    //necklce
    line(gary2X+2, 80, gary2X-10, 50);
    line(gary2X+2, 80, gary2X+14, 50);

    fill(gary4);
    ellipse(gary2X+2, 80, 10, 10);

    //arms

    fill(gary5);
    rect(gary2X-50, 50, 20, 70);
    rect(gary2X+35, 50, 20, 70);
    //legs

    fill(gary6);
    rect(gary2X-30, 125, 30, 60);
    rect(gary2X+5, 125, 30, 60);
    //shoes

    fill(gary7);
    ellipse(gary2X-18, 190, 40, 15);
    ellipse(gary2X+20, 190, 40, 15);
    //head

    fill(gary8);
    ellipse(gary2X, 30, 50, 45);
    //eyes
    fill(#000000);
    ellipse(gary2X-9, 28, 5, 5);
    ellipse(gary2X+10, 28, 5, 5);
    //nose
    ellipse(gary2X+2, 34, 2, 2);
    //mouth
    line(gary2X-2, 45, gary2X+5, 42);
    line(gary2X+5, 42, gary2X+7, 40);
    line(gary2X+8, 40, gary2X+10, 37);
    //hair

    fill(gary9);
    beginShape();
    vertex(gary2X-30, 0);
    vertex(gary2X+25, 10);
    vertex(gary2X+25, 20);
    vertex(gary2X-25, 17);
    vertex(gary2X-30, 0);
    endShape();
  }

  if (page2==1001) {
    fill(#000000);
    rect(0, 0, 600, 600);
    fill(#FFFFFF);
    textFont(myFont, 100);
    text("FIN", 225, 250);
  }




  if (page==2) {
    welcometotheworldofpokemon1();
  } 
  if (page==3) {
    welcometotheworldofpokemon2();
  } 
  if (page==4) {
    welcometotheworldofpokemon3();
  }
  if (page==5) {
    welcometotheworldofpokemon4();
  }
  if (page==6) {
    welcometotheworldofpokemon5();
  }
  if (page==7) {
    welcometotheworldofpokemon6();
  }

  if (20<b&&b<100) {
    fill(#000000);
    textFont(myFont, 30);
    text("Â©1995-1999   Nintendo", 60, 160);
    text("Â©1995-1999   Creatures inc.", 60, 200);
    text("Â©1995-1999   GAME FREAK inc.", 60, 240);
  }
  if (100<b&&b<130) {
    gf= color(random(256), random(256), random(256));
    gfT= color(random(256), random(256), random(256));
  }
  if (100<b&&b<180) {
    textFont(myFont, 30);
    //noStroke();
    noStroke();
    fill(gfT);
    ellipse(300, 180, 40, 80);
    fill(#FFFFFF);
    ellipse(303, 180, 30, 60);
    fill(gfT);
    ellipse(310, 180, 20, 40);
    fill(#FFFFFF);
    ellipse(307, 180, 10, 20);
    fill(gfT);
    triangle(270, 220, 300, 220, 300, 210);
    triangle(330, 220, 300, 220, 300, 210);
    fill(gf);
    text("GAME FREAK", 200, 260);
    star();
    stroke(5);
  }
  noStroke();
  if (185<b&&b<190) {
    fill(#000000);
    ellipse(300, 250, 40, 30);
    //feet
    ellipse(290, 270, 10, 10);
    ellipse(310, 270, 10, 10);
    //ears
    ellipse(290, 230, 5, 20);
    ellipse(310, 230, 5, 20);
    beginShape();
    vertex(300, 250);
    vertex(280, 230);
    vertex(305, 220);
    vertex(295, 230);
    vertex(305, 250);
    vertex(300, 250);
    endShape();
    //body
    ellipse(300, 255, 40, 30);
  }
  if (189<b&&b<195) {
    fill(#000000);
    ellipse(300, 245, 40, 30);
    //feet
    ellipse(285, 260, 20, 15);
    ellipse(315, 260, 20, 15);
    //ears
    ellipse(290, 230, 5, 20);
    ellipse(310, 230, 5, 20);
    beginShape();
    vertex(300, 250);
    vertex(320, 230);
    vertex(295, 220);
    vertex(305, 230);
    vertex(295, 250);
    vertex(300, 250);
    endShape();
    //body
    ellipse(300, 255, 40, 30);
  }
  if (194<b&&b<200) {
    fill(#000000);
    ellipse(300, 250, 40, 30);
    //feet
    ellipse(290, 270, 10, 10);
    ellipse(310, 270, 10, 10);
    //ears
    ellipse(290, 230, 5, 20);
    ellipse(310, 230, 5, 20);
    beginShape();
    vertex(300, 250);
    vertex(280, 230);
    vertex(305, 220);
    vertex(295, 230);
    vertex(305, 250);
    vertex(300, 250);
    endShape();
    //body
    ellipse(300, 255, 40, 30);
  }
  if (199<b&&b<205) {
    fill(#000000);
    ellipse(300, 245, 40, 30);
    //feet
    ellipse(285, 260, 20, 15);
    ellipse(315, 260, 20, 15);
    //ears
    ellipse(290, 230, 5, 20);
    ellipse(310, 230, 5, 20);
    beginShape();
    vertex(300, 250);
    vertex(320, 230);
    vertex(295, 220);
    vertex(305, 230);
    vertex(295, 250);
    vertex(300, 250);
    endShape();
    //body
    ellipse(300, 255, 40, 30);
  }
  if (204<b&&b<210) {
    fill(#000000);
    ellipse(300, 250, 40, 30);
    //feet
    ellipse(290, 270, 10, 10);
    ellipse(310, 270, 10, 10);
    //ears
    ellipse(290, 230, 5, 20);
    ellipse(310, 230, 5, 20);
    beginShape();
    vertex(300, 250);
    vertex(280, 230);
    vertex(305, 220);
    vertex(295, 230);
    vertex(305, 250);
    vertex(300, 250);
    endShape();
    //body
    ellipse(300, 255, 40, 30);
  }
  if (209<b&&b<215) {
    fill(#000000);
    ellipse(300, 245, 40, 30);
    //feet
    ellipse(285, 260, 20, 15);
    ellipse(315, 260, 20, 15);
    //ears
    ellipse(290, 230, 5, 20);
    ellipse(310, 230, 5, 20);
    beginShape();
    vertex(300, 250);
    vertex(320, 230);
    vertex(295, 220);
    vertex(305, 230);
    vertex(295, 250);
    vertex(300, 250);
    endShape();
    //body
    ellipse(300, 255, 40, 30);
  } 
  if (214<b&&b<220) {
    fill(#000000);
    ellipse(300, 250, 40, 30);
    //feet
    ellipse(290, 270, 10, 10);
    ellipse(310, 270, 10, 10);
    //ears
    ellipse(290, 230, 5, 20);
    ellipse(310, 230, 5, 20);
    beginShape();
    vertex(300, 250);
    vertex(280, 230);
    vertex(305, 220);
    vertex(295, 230);
    vertex(305, 250);
    vertex(300, 250);
    endShape();
    //body
    ellipse(300, 255, 40, 30);
  }



  if (220<b&&b<370) {


    pikaX1=pikaX1-pikaVX1;
    if (pikaX1<250) {
      pikaVX1=0;
    }
    //noStroke();
    //tail
    fill(#D67C0D);
    rect(pikaX1+35, 270, 40, 10);
    rect(pikaX1+65, 260, 10, 10);
    fill(#FFFF00);
    rect(pikaX1+65, 250, 30, 10);
    rect(pikaX1+85, 230, 10, 20);
    rect(pikaX1+85, 220, 40, 20);

    fill(#FFFF00);

    ellipse(pikaX1, 200, 85, 70);
    ellipse(pikaX1-15, 150, 15, 45);
    ellipse(pikaX1+15, 155, 15, 50);
    //ear tops
    fill(#000000);
    ellipse(pikaX1-15, 135, 10, 20);
    ellipse(pikaX1+15, 135, 10, 20);


    fill(#FF0000);
    ellipse(pikaX1-22, 203, 10, 10);
    ellipse(pikaX1+22, 205, 10, 10);
    fill(#000000);
    ellipse(pikaX1-18, 192, 10, 10);
    ellipse(pikaX1+18, 192, 10, 10);
    fill(#000000);
    ellipse(pikaX1, 210, 20, 7);

    fill(#FFFF00);

    rect(pikaX1-42, 220, 85, 70);
    //nose
    fill(#000000);
    ellipse(pikaX1, 200, 5, 5);
    fill(#FFFF00);
    //hand
    ellipse(pikaX1-45, 220, 60, 15);
    ellipse(pikaX1+45, 220, 60, 15);
    //feet
    ellipse(pikaX1-35, 285, 15, 60);
    ellipse(pikaX1+35, 285, 15, 60);

    //air friction
    fill(#61F7DA);
    beginShape();
    vertex(aX, aY);
    vertex(aX+70, aY);
    vertex(aX+90, aY+10);
    vertex(aX+70, aY+20);
    vertex(aX, aY+20);
    vertex(aX-20, aY+10);
    vertex(aX, aY);
    endShape();

    beginShape();
    vertex(a2X, a2Y);
    vertex(a2X+70, a2Y);
    vertex(a2X+90, a2Y+10);
    vertex(a2X+70, a2Y+20);
    vertex(a2X, a2Y+20);
    vertex(a2X-20, a2Y+10);
    vertex(a2X, a2Y);
    endShape();

    beginShape();
    vertex(a3X, a3Y);
    vertex(a3X+70, a3Y);
    vertex(a3X+90, a3Y+10);
    vertex(a3X+70, a3Y+20);
    vertex(a3X, a3Y+20);
    vertex(a3X-20, a3Y+10);
    vertex(a3X, a3Y);
    endShape();

    beginShape();
    vertex(a4X, a4Y);
    vertex(a4X+70, a4Y);
    vertex(a4X+90, a4Y+10);
    vertex(a4X+70, a4Y+20);
    vertex(a4X, a4Y+20);
    vertex(a4X-20, a4Y+10);
    vertex(a4X, a4Y);
    endShape();

    //air friction motion
    aX=aX+20;
    a2X=a2X+20;
    a3X=a3X+20;
    a4X=a4X+20;
    if (aX>700) {
      aX=-100;
      aY=((int)random(480));
    }
    if (a2X>700) {
      a2X=-100;
      a2Y=((int)random(480));
    }
    if (a3X>700) {
      a3X=-100;
      a3Y=((int)random(480));
    }
    if (a4X>700) {
      a4X=-100;
      a4Y=((int)random(480));
    }
  }

  if (369<b&&b<375) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(330, 220);
    vertex(300, 200);
    vertex(320, 180);
    vertex(290, 160);
    vertex(280, 170);
    vertex(310, 180);
    vertex(290, 200);
    vertex(320, 220);
    vertex(290, 250);
    endShape();
    //body
    ellipse(300, 260, 70, 60);
    //feet
    ellipse(280, 280, 30, 20);
    ellipse(320, 280, 30, 20);
    //hands
    ellipse(280, 295, 25, 15);
    ellipse(320, 295, 25, 15);
    //ears
    ellipse(280, 240, 10, 50);
    ellipse(320, 240, 10, 50);
    //head
    ellipse(300, 270, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 260, 7, 7);
    ellipse(310, 260, 7, 7);
    //nose
    ellipse(300, 280, 6, 4);
    //ear tops
    ellipse(280, 222, 10, 15);
    ellipse(320, 222, 10, 15);
  }

  if (374<b&&b<380) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(270, 220);
    vertex(300, 200);
    vertex(280, 180);
    vertex(310, 160);
    vertex(320, 170);
    vertex(290, 180);
    vertex(310, 200);
    vertex(280, 220);
    vertex(310, 250);
    endShape();
    //body
    ellipse(300, 270, 70, 60);
    //feet
    ellipse(280, 300, 30, 20);
    ellipse(320, 300, 30, 20);
    //hands
    ellipse(280, 275, 25, 15);
    ellipse(320, 275, 25, 15);
    //ears
    ellipse(280, 220, 10, 50);
    ellipse(320, 220, 10, 50);
    //head
    ellipse(300, 250, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 240, 7, 7);
    ellipse(310, 240, 7, 7);
    //nose
    ellipse(300, 260, 6, 4);
    //ear tops
    ellipse(280, 202, 10, 15);
    ellipse(320, 202, 10, 15);
  }


  if (379<b&&b<385) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(330, 220);
    vertex(300, 200);
    vertex(320, 180);
    vertex(290, 160);
    vertex(280, 170);
    vertex(310, 180);
    vertex(290, 200);
    vertex(320, 220);
    vertex(290, 250);
    endShape();
    //body
    ellipse(300, 260, 70, 60);
    //feet
    ellipse(280, 280, 30, 20);
    ellipse(320, 280, 30, 20);
    //hands
    ellipse(280, 295, 25, 15);
    ellipse(320, 295, 25, 15);
    //ears
    ellipse(280, 240, 10, 50);
    ellipse(320, 240, 10, 50);
    //head
    ellipse(300, 270, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 260, 7, 7);
    ellipse(310, 260, 7, 7);
    //nose
    ellipse(300, 280, 6, 4);
    //ear tops
    ellipse(280, 222, 10, 15);
    ellipse(320, 222, 10, 15);
  }


  if (384<b&&b<390) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(270, 220);
    vertex(300, 200);
    vertex(280, 180);
    vertex(310, 160);
    vertex(320, 170);
    vertex(290, 180);
    vertex(310, 200);
    vertex(280, 220);
    vertex(310, 250);
    endShape();
    //body
    ellipse(300, 270, 70, 60);
    //feet
    ellipse(280, 300, 30, 20);
    ellipse(320, 300, 30, 20);
    //hands
    ellipse(280, 275, 25, 15);
    ellipse(320, 275, 25, 15);
    //ears
    ellipse(280, 220, 10, 50);
    ellipse(320, 220, 10, 50);
    //head
    ellipse(300, 250, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 240, 7, 7);
    ellipse(310, 240, 7, 7);
    //nose
    ellipse(300, 260, 6, 4);
    //ear tops
    ellipse(280, 202, 10, 15);
    ellipse(320, 202, 10, 15);
  }
  if (389<b&&b<395) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(330, 220);
    vertex(300, 200);
    vertex(320, 180);
    vertex(290, 160);
    vertex(280, 170);
    vertex(310, 180);
    vertex(290, 200);
    vertex(320, 220);
    vertex(290, 250);
    endShape();
    //body
    ellipse(300, 260, 70, 60);
    //feet
    ellipse(280, 280, 30, 20);
    ellipse(320, 280, 30, 20);
    //hands
    ellipse(280, 295, 25, 15);
    ellipse(320, 295, 25, 15);
    //ears
    ellipse(280, 240, 10, 50);
    ellipse(320, 240, 10, 50);
    //head
    ellipse(300, 270, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 260, 7, 7);
    ellipse(310, 260, 7, 7);
    //nose
    ellipse(300, 280, 6, 4);
    //ear tops
    ellipse(280, 222, 10, 15);
    ellipse(320, 222, 10, 15);
  }
  if (394<b&&b<400) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(270, 220);
    vertex(300, 200);
    vertex(280, 180);
    vertex(310, 160);
    vertex(320, 170);
    vertex(290, 180);
    vertex(310, 200);
    vertex(280, 220);
    vertex(310, 250);
    endShape();
    //body
    ellipse(300, 270, 70, 60);
    //feet
    ellipse(280, 300, 30, 20);
    ellipse(320, 300, 30, 20);
    //hands
    ellipse(280, 275, 25, 15);
    ellipse(320, 275, 25, 15);
    //ears
    ellipse(280, 220, 10, 50);
    ellipse(320, 220, 10, 50);
    //head
    ellipse(300, 250, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 240, 7, 7);
    ellipse(310, 240, 7, 7);
    //nose
    ellipse(300, 260, 6, 4);
    //ear tops
    ellipse(280, 202, 10, 15);
    ellipse(320, 202, 10, 15);
  }
  if (399<b&&b<405) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(330, 220);
    vertex(300, 200);
    vertex(320, 180);
    vertex(290, 160);
    vertex(280, 170);
    vertex(310, 180);
    vertex(290, 200);
    vertex(320, 220);
    vertex(290, 250);
    endShape();
    //body
    ellipse(300, 260, 70, 60);
    //feet
    ellipse(280, 280, 30, 20);
    ellipse(320, 280, 30, 20);
    //hands
    ellipse(280, 295, 25, 15);
    ellipse(320, 295, 25, 15);
    //ears
    ellipse(280, 240, 10, 50);
    ellipse(320, 240, 10, 50);
    //head
    ellipse(300, 270, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 260, 7, 7);
    ellipse(310, 260, 7, 7);
    //nose
    ellipse(300, 280, 6, 4);
    //ear tops
    ellipse(280, 222, 10, 15);
    ellipse(320, 222, 10, 15);
  }
  if (404<b&&b<410) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(270, 220);
    vertex(300, 200);
    vertex(280, 180);
    vertex(310, 160);
    vertex(320, 170);
    vertex(290, 180);
    vertex(310, 200);
    vertex(280, 220);
    vertex(310, 250);
    endShape();
    //body
    ellipse(300, 270, 70, 60);
    //feet
    ellipse(280, 300, 30, 20);
    ellipse(320, 300, 30, 20);
    //hands
    ellipse(280, 275, 25, 15);
    ellipse(320, 275, 25, 15);
    //ears
    ellipse(280, 220, 10, 50);
    ellipse(320, 220, 10, 50);
    //head
    ellipse(300, 250, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 240, 7, 7);
    ellipse(310, 240, 7, 7);
    //nose
    ellipse(300, 260, 6, 4);
    //ear tops
    ellipse(280, 202, 10, 15);
    ellipse(320, 202, 10, 15);
  }

  if (409<b&&b<415) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(330, 220);
    vertex(300, 200);
    vertex(320, 180);
    vertex(290, 160);
    vertex(280, 170);
    vertex(310, 180);
    vertex(290, 200);
    vertex(320, 220);
    vertex(290, 250);
    endShape();
    //body
    ellipse(300, 260, 70, 60);
    //feet
    ellipse(280, 280, 30, 20);
    ellipse(320, 280, 30, 20);
    //hands
    ellipse(280, 295, 25, 15);
    ellipse(320, 295, 25, 15);
    //ears
    ellipse(280, 240, 10, 50);
    ellipse(320, 240, 10, 50);
    //head
    ellipse(300, 270, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 260, 7, 7);
    ellipse(310, 260, 7, 7);
    //nose
    ellipse(300, 280, 6, 4);
    //ear tops
    ellipse(280, 222, 10, 15);
    ellipse(320, 222, 10, 15);
  }
  if (414<b&&b<420) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(270, 220);
    vertex(300, 200);
    vertex(280, 180);
    vertex(310, 160);
    vertex(320, 170);
    vertex(290, 180);
    vertex(310, 200);
    vertex(280, 220);
    vertex(310, 250);
    endShape();
    //body
    ellipse(300, 270, 70, 60);
    //feet
    ellipse(280, 300, 30, 20);
    ellipse(320, 300, 30, 20);
    //hands
    ellipse(280, 275, 25, 15);
    ellipse(320, 275, 25, 15);
    //ears
    ellipse(280, 220, 10, 50);
    ellipse(320, 220, 10, 50);
    //head
    ellipse(300, 250, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 240, 7, 7);
    ellipse(310, 240, 7, 7);
    //nose
    ellipse(300, 260, 6, 4);
    //ear tops
    ellipse(280, 202, 10, 15);
    ellipse(320, 202, 10, 15);
  }
  if (419<b&&b<425) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(330, 220);
    vertex(300, 200);
    vertex(320, 180);
    vertex(290, 160);
    vertex(280, 170);
    vertex(310, 180);
    vertex(290, 200);
    vertex(320, 220);
    vertex(290, 250);
    endShape();
    //body
    ellipse(300, 260, 70, 60);
    //feet
    ellipse(280, 280, 30, 20);
    ellipse(320, 280, 30, 20);
    //hands
    ellipse(280, 295, 25, 15);
    ellipse(320, 295, 25, 15);
    //ears
    ellipse(280, 240, 10, 50);
    ellipse(320, 240, 10, 50);
    //head
    ellipse(300, 270, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 260, 7, 7);
    ellipse(310, 260, 7, 7);
    //nose
    ellipse(300, 280, 6, 4);
    //ear tops
    ellipse(280, 222, 10, 15);
    ellipse(320, 222, 10, 15);
  }
  if (424<b&&b<430) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(270, 220);
    vertex(300, 200);
    vertex(280, 180);
    vertex(310, 160);
    vertex(320, 170);
    vertex(290, 180);
    vertex(310, 200);
    vertex(280, 220);
    vertex(310, 250);
    endShape();
    //body
    ellipse(300, 270, 70, 60);
    //feet
    ellipse(280, 300, 30, 20);
    ellipse(320, 300, 30, 20);
    //hands
    ellipse(280, 275, 25, 15);
    ellipse(320, 275, 25, 15);
    //ears
    ellipse(280, 220, 10, 50);
    ellipse(320, 220, 10, 50);
    //head
    ellipse(300, 250, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 240, 7, 7);
    ellipse(310, 240, 7, 7);
    //nose
    ellipse(300, 260, 6, 4);
    //ear tops
    ellipse(280, 202, 10, 15);
    ellipse(320, 202, 10, 15);
  }
  if (429<b&&b<435) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(330, 220);
    vertex(300, 200);
    vertex(320, 180);
    vertex(290, 160);
    vertex(280, 170);
    vertex(310, 180);
    vertex(290, 200);
    vertex(320, 220);
    vertex(290, 250);
    endShape();
    //body
    ellipse(300, 260, 70, 60);
    //feet
    ellipse(280, 280, 30, 20);
    ellipse(320, 280, 30, 20);
    //hands
    ellipse(280, 295, 25, 15);
    ellipse(320, 295, 25, 15);
    //ears
    ellipse(280, 240, 10, 50);
    ellipse(320, 240, 10, 50);
    //head
    ellipse(300, 270, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 260, 7, 7);
    ellipse(310, 260, 7, 7);
    //nose
    ellipse(300, 280, 6, 4);
    //ear tops
    ellipse(280, 222, 10, 15);
    ellipse(320, 222, 10, 15);
  }
  if (434<b&&b<440) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(270, 220);
    vertex(300, 200);
    vertex(280, 180);
    vertex(310, 160);
    vertex(320, 170);
    vertex(290, 180);
    vertex(310, 200);
    vertex(280, 220);
    vertex(310, 250);
    endShape();
    //body
    ellipse(300, 270, 70, 60);
    //feet
    ellipse(280, 300, 30, 20);
    ellipse(320, 300, 30, 20);
    //hands
    ellipse(280, 275, 25, 15);
    ellipse(320, 275, 25, 15);
    //ears
    ellipse(280, 220, 10, 50);
    ellipse(320, 220, 10, 50);
    //head
    ellipse(300, 250, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 240, 7, 7);
    ellipse(310, 240, 7, 7);
    //nose
    ellipse(300, 260, 6, 4);
    //ear tops
    ellipse(280, 202, 10, 15);
    ellipse(320, 202, 10, 15);
  }
  if (439<b&&b<445) {
    stroke(5);
    fill(#FF1C1C);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(330, 220);
    vertex(300, 200);
    vertex(320, 180);
    vertex(290, 160);
    vertex(280, 170);
    vertex(310, 180);
    vertex(290, 200);
    vertex(320, 220);
    vertex(290, 250);
    endShape();
    //body
    ellipse(300, 260, 70, 60);
    //feet
    ellipse(280, 280, 30, 20);
    ellipse(320, 280, 30, 20);
    //hands
    ellipse(280, 295, 25, 15);
    ellipse(320, 295, 25, 15);
    //ears
    ellipse(280, 240, 10, 50);
    ellipse(320, 240, 10, 50);
    //head
    ellipse(300, 270, 70, 50);
    //face
    fill(#000000);
    //eyes
    ellipse(290, 260, 7, 7);
    ellipse(310, 260, 7, 7);
    //nose
    ellipse(300, 280, 6, 4);
    //ear tops
    ellipse(280, 222, 10, 15);
    ellipse(320, 222, 10, 15);
  }




  if (445<b&&b<580) {
    fill(#0000FF);
    rect(0, 100, 600, 600);
    //noStroke();
    fill(#FFFF00);
    //head
    ellipse(pikaX2, pikaY2, 95, 65);
    //ears
    ellipse(pikaX2-25, pikaY2-30, 15, 80); 
    ellipse(pikaX2+25, pikaY2-20, 15, 80);
    //ear tops
    fill(#000000);
    ellipse(pikaX2-25, pikaY2-65, 10, 15);
    ellipse(pikaX2+25, pikaY2-55, 10, 15);
    //body
    fill(#FFFF00);
    rect(pikaX2-50, pikaY2+5, 95, 70);
    //face
    fill(#000000);
    ellipse(pikaX2-20, pikaY2-10, 12, 12);
    ellipse(pikaX2+20, pikaY2-10, 12, 12);
    //cheeks
    fill(#FF0000);
    ellipse(pikaX2-25, pikaY2+9, 12, 12);
    ellipse(pikaX2+25, pikaY2+9, 12, 12);
    //mouth
    fill(#000000);
    ellipse(pikaX2, pikaY2+14, 14, 10);
    //hand
    fill(#FFFF00);
    ellipse(pikaX2+50, pikaY2+30, 50, 15);
    //tail
    fill(#DE8A0B);
    rect(pikaX2-85, pikaY2+60, 35, 10);
    rect(pikaX2-85, pikaY2+40, 10, 20);
    fill(#FFFF00);
    rect(pikaX2-105, pikaY2+30, 30, 10);
    rect(pikaX2-105, pikaY2+10, 10, 30);
    rect(pikaX2-135, pikaY2, 40, 20);
    //pikachu's surfboard
    fill(#27EBFF);
    ellipse(pikaX2-5, pikaY2+75, 130, 40);
    //motion
    pikaX2=pikaX2+pikaVX2;
    pikaY2=pikaY2+pikaVY2;
    if (pikaX2>250) {
      pikaVX2=0;
    }
    if (pikaY2>250) {
      pikaVY2=0;
    }
  }

  if (580<b&&b<585) {
    stroke(5);
    fill(#FFFF00);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(250, 180);
    vertex(310, 150);
    vertex(260, 120);
    vertex(310, 100);
    vertex(320, 120);
    vertex(280, 125);
    vertex(330, 150);
    vertex(270, 180);
    vertex(310, 250);
    endShape();
    //feet
    fill(#F0EC00);
    ellipse(255, 330, 50, 30);
    ellipse(345, 330, 50, 30);
    //body
    ellipse(300, 280, 160, 110);
    //hands
    fill(#FFFF00);
    ellipse(255, 300, 40, 30);
    ellipse(350, 300, 40, 30);
    //ears
    ellipse(250, 180, 20, 90);
    ellipse(350, 180, 20, 90);
    //head
    ellipse(300, 250, 150, 110);
    //eyes
    fill(#000000);
    ellipse(270, 240, 15, 15);
    ellipse(330, 240, 15, 15);
    //nose
    ellipse(300, 255, 5, 5);
    //mouth
    ellipse(300, 280, 33, 5);
    //ear tops
    ellipse(250, 150, 10, 30);
    ellipse(350, 150, 10, 30);
    //cheeks
    fill(#FF0000);
    ellipse(255, 270, 17, 17);
    ellipse(345, 270, 17, 17);
  }
  if (584<b&&b<590) {
    stroke(5);
    fill(#FFFF00);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(350, 180);
    vertex(290, 150);
    vertex(340, 120);
    vertex(290, 100);
    vertex(280, 120);
    vertex(320, 125);
    vertex(270, 150);
    vertex(330, 180);
    vertex(290, 250);
    endShape();
    //feet
    fill(#F0EC00);
    ellipse(255, 310, 50, 30);
    ellipse(345, 310, 50, 30);
    //body
    ellipse(300, 260, 160, 110);
    //hands
    fill(#FFFF00);
    ellipse(255, 320, 40, 30);
    ellipse(350, 320, 40, 30);
    //ears
    ellipse(250, 200, 20, 90);
    ellipse(350, 200, 20, 90);
    //head
    ellipse(300, 270, 150, 110);
    //eyes
    fill(#000000);
    ellipse(270, 260, 15, 15);
    ellipse(330, 260, 15, 15);
    //nose
    ellipse(300, 275, 5, 5);
    //mouth
    ellipse(300, 300, 33, 5);
    //ear tops
    ellipse(250, 170, 10, 30);
    ellipse(350, 170, 10, 30);
    //cheeks
    fill(#FF0000);
    ellipse(255, 290, 17, 17);
    ellipse(345, 290, 17, 17);
  }
  if (589<b&&b<595) {
    stroke(5);
    fill(#FFFF00);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(250, 180);
    vertex(310, 150);
    vertex(260, 120);
    vertex(310, 100);
    vertex(320, 120);
    vertex(280, 125);
    vertex(330, 150);
    vertex(270, 180);
    vertex(310, 250);
    endShape();
    //feet
    fill(#F0EC00);
    ellipse(255, 330, 50, 30);
    ellipse(345, 330, 50, 30);
    //body
    ellipse(300, 280, 160, 110);
    //hands
    fill(#FFFF00);
    ellipse(255, 300, 40, 30);
    ellipse(350, 300, 40, 30);
    //ears
    ellipse(250, 180, 20, 90);
    ellipse(350, 180, 20, 90);
    //head
    ellipse(300, 250, 150, 110);
    //eyes
    fill(#000000);
    ellipse(270, 240, 15, 15);
    ellipse(330, 240, 15, 15);
    //nose
    ellipse(300, 255, 5, 5);
    //mouth
    ellipse(300, 280, 33, 5);
    //ear tops
    ellipse(250, 150, 10, 30);
    ellipse(350, 150, 10, 30);
    //cheeks
    fill(#FF0000);
    ellipse(255, 270, 17, 17);
    ellipse(345, 270, 17, 17);
  }
  if (594<b&&b<600) {
    stroke(5);
    fill(#FFFF00);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(350, 180);
    vertex(290, 150);
    vertex(340, 120);
    vertex(290, 100);
    vertex(280, 120);
    vertex(320, 125);
    vertex(270, 150);
    vertex(330, 180);
    vertex(290, 250);
    endShape();
    //feet
    fill(#F0EC00);
    ellipse(255, 310, 50, 30);
    ellipse(345, 310, 50, 30);
    //body
    ellipse(300, 260, 160, 110);
    //hands
    fill(#FFFF00);
    ellipse(255, 320, 40, 30);
    ellipse(350, 320, 40, 30);
    //ears
    ellipse(250, 200, 20, 90);
    ellipse(350, 200, 20, 90);
    //head
    ellipse(300, 270, 150, 110);
    //eyes
    fill(#000000);
    ellipse(270, 260, 15, 15);
    ellipse(330, 260, 15, 15);
    //nose
    ellipse(300, 275, 5, 5);
    //mouth
    ellipse(300, 300, 33, 5);
    //ear tops
    ellipse(250, 170, 10, 30);
    ellipse(350, 170, 10, 30);
    //cheeks
    fill(#FF0000);
    ellipse(255, 290, 17, 17);
    ellipse(345, 290, 17, 17);
  } 
  if (599<b&&b<605) {
    stroke(5);
    fill(#FFFF00);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(250, 180);
    vertex(310, 150);
    vertex(260, 120);
    vertex(310, 100);
    vertex(320, 120);
    vertex(280, 125);
    vertex(330, 150);
    vertex(270, 180);
    vertex(310, 250);
    endShape();
    //feet
    fill(#F0EC00);
    ellipse(255, 330, 50, 30);
    ellipse(345, 330, 50, 30);
    //body
    ellipse(300, 280, 160, 110);
    //hands
    fill(#FFFF00);
    ellipse(255, 300, 40, 30);
    ellipse(350, 300, 40, 30);
    //ears
    ellipse(250, 180, 20, 90);
    ellipse(350, 180, 20, 90);
    //head
    ellipse(300, 250, 150, 110);
    //eyes
    fill(#000000);
    ellipse(270, 240, 15, 15);
    ellipse(330, 240, 15, 15);
    //nose
    ellipse(300, 255, 5, 5);
    //mouth
    ellipse(300, 280, 33, 5);
    //ear tops
    ellipse(250, 150, 10, 30);
    ellipse(350, 150, 10, 30);
    //cheeks
    fill(#FF0000);
    ellipse(255, 270, 17, 17);
    ellipse(345, 270, 17, 17);
  }
  if (604<b&&b<610) {
    stroke(5);
    fill(#FFFF00);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(350, 180);
    vertex(290, 150);
    vertex(340, 120);
    vertex(290, 100);
    vertex(280, 120);
    vertex(320, 125);
    vertex(270, 150);
    vertex(330, 180);
    vertex(290, 250);
    endShape();
    //feet
    fill(#F0EC00);
    ellipse(255, 310, 50, 30);
    ellipse(345, 310, 50, 30);
    //body
    ellipse(300, 260, 160, 110);
    //hands
    fill(#FFFF00);
    ellipse(255, 320, 40, 30);
    ellipse(350, 320, 40, 30);
    //ears
    ellipse(250, 200, 20, 90);
    ellipse(350, 200, 20, 90);
    //head
    ellipse(300, 270, 150, 110);
    //eyes
    fill(#000000);
    ellipse(270, 260, 15, 15);
    ellipse(330, 260, 15, 15);
    //nose
    ellipse(300, 275, 5, 5);
    //mouth
    ellipse(300, 300, 33, 5);
    //ear tops
    ellipse(250, 170, 10, 30);
    ellipse(350, 170, 10, 30);
    //cheeks
    fill(#FF0000);
    ellipse(255, 290, 17, 17);
    ellipse(345, 290, 17, 17);
  }
  if (609<b&&b<615) {
    stroke(5);
    fill(#FFFF00);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(250, 180);
    vertex(310, 150);
    vertex(260, 120);
    vertex(310, 100);
    vertex(320, 120);
    vertex(280, 125);
    vertex(330, 150);
    vertex(270, 180);
    vertex(310, 250);
    endShape();
    //feet
    fill(#F0EC00);
    ellipse(255, 330, 50, 30);
    ellipse(345, 330, 50, 30);
    //body
    ellipse(300, 280, 160, 110);
    //hands
    fill(#FFFF00);
    ellipse(255, 300, 40, 30);
    ellipse(350, 300, 40, 30);
    //ears
    ellipse(250, 180, 20, 90);
    ellipse(350, 180, 20, 90);
    //head
    ellipse(300, 250, 150, 110);
    //eyes
    fill(#000000);
    ellipse(270, 240, 15, 15);
    ellipse(330, 240, 15, 15);
    //nose
    ellipse(300, 255, 5, 5);
    //mouth
    ellipse(300, 280, 33, 5);
    //ear tops
    ellipse(250, 150, 10, 30);
    ellipse(350, 150, 10, 30);
    //cheeks
    fill(#FF0000);
    ellipse(255, 270, 17, 17);
    ellipse(345, 270, 17, 17);
  }
  if (614<b&&b<620) {
    stroke(5);
    fill(#FFFF00);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(350, 180);
    vertex(290, 150);
    vertex(340, 120);
    vertex(290, 100);
    vertex(280, 120);
    vertex(320, 125);
    vertex(270, 150);
    vertex(330, 180);
    vertex(290, 250);
    endShape();
    //feet
    fill(#F0EC00);
    ellipse(255, 310, 50, 30);
    ellipse(345, 310, 50, 30);
    //body
    ellipse(300, 260, 160, 110);
    //hands
    fill(#FFFF00);
    ellipse(255, 320, 40, 30);
    ellipse(350, 320, 40, 30);
    //ears
    ellipse(250, 200, 20, 90);
    ellipse(350, 200, 20, 90);
    //head
    ellipse(300, 270, 150, 110);
    //eyes
    fill(#000000);
    ellipse(270, 260, 15, 15);
    ellipse(330, 260, 15, 15);
    //nose
    ellipse(300, 275, 5, 5);
    //mouth
    ellipse(300, 300, 33, 5);
    //ear tops
    ellipse(250, 170, 10, 30);
    ellipse(350, 170, 10, 30);
    //cheeks
    fill(#FF0000);
    ellipse(255, 290, 17, 17);
    ellipse(345, 290, 17, 17);
  }
  if (619<b&&b<625) {
    stroke(5);
    fill(#FFFF00);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(250, 180);
    vertex(310, 150);
    vertex(260, 120);
    vertex(310, 100);
    vertex(320, 120);
    vertex(280, 125);
    vertex(330, 150);
    vertex(270, 180);
    vertex(310, 250);
    endShape();
    //feet
    fill(#F0EC00);
    ellipse(255, 330, 50, 30);
    ellipse(345, 330, 50, 30);
    //body
    ellipse(300, 280, 160, 110);
    //hands
    fill(#FFFF00);
    ellipse(255, 300, 40, 30);
    ellipse(350, 300, 40, 30);
    //ears
    ellipse(250, 180, 20, 90);
    ellipse(350, 180, 20, 90);
    //head
    ellipse(300, 250, 150, 110);
    //eyes
    fill(#000000);
    ellipse(270, 240, 15, 15);
    ellipse(330, 240, 15, 15);
    //nose
    ellipse(300, 255, 5, 5);
    //mouth
    ellipse(300, 280, 33, 5);
    //ear tops
    ellipse(250, 150, 10, 30);
    ellipse(350, 150, 10, 30);
    //cheeks
    fill(#FF0000);
    ellipse(255, 270, 17, 17);
    ellipse(345, 270, 17, 17);
  }
  if (624<b&&b<630) {
    stroke(5);
    fill(#FFFF00);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(350, 180);
    vertex(290, 150);
    vertex(340, 120);
    vertex(290, 100);
    vertex(280, 120);
    vertex(320, 125);
    vertex(270, 150);
    vertex(330, 180);
    vertex(290, 250);
    endShape();
    //feet
    fill(#F0EC00);
    ellipse(255, 310, 50, 30);
    ellipse(345, 310, 50, 30);
    //body
    ellipse(300, 260, 160, 110);
    //hands
    fill(#FFFF00);
    ellipse(255, 320, 40, 30);
    ellipse(350, 320, 40, 30);
    //ears
    ellipse(250, 200, 20, 90);
    ellipse(350, 200, 20, 90);
    //head
    ellipse(300, 270, 150, 110);
    //eyes
    fill(#000000);
    ellipse(270, 260, 15, 15);
    ellipse(330, 260, 15, 15);
    //nose
    ellipse(300, 275, 5, 5);
    //mouth
    ellipse(300, 300, 33, 5);
    //ear tops
    ellipse(250, 170, 10, 30);
    ellipse(350, 170, 10, 30);
    //cheeks
    fill(#FF0000);
    ellipse(255, 290, 17, 17);
    ellipse(345, 290, 17, 17);
  }
  if (629<b&&b<635) {
    stroke(5);
    fill(#FFFF00);
    //tail
    beginShape();
    vertex(300, 250);
    vertex(250, 180);
    vertex(310, 150);
    vertex(260, 120);
    vertex(310, 100);
    vertex(320, 120);
    vertex(280, 125);
    vertex(330, 150);
    vertex(270, 180);
    vertex(310, 250);
    endShape();
    //feet
    fill(#F0EC00);
    ellipse(255, 330, 50, 30);
    ellipse(345, 330, 50, 30);
    //body
    ellipse(300, 280, 160, 110);
    //hands
    fill(#FFFF00);
    ellipse(255, 300, 40, 30);
    ellipse(350, 300, 40, 30);
    //ears
    ellipse(250, 180, 20, 90);
    ellipse(350, 180, 20, 90);
    //head
    ellipse(300, 250, 150, 110);
    //eyes
    fill(#000000);
    ellipse(270, 240, 15, 15);
    ellipse(330, 240, 15, 15);
    //nose
    ellipse(300, 255, 5, 5);
    //mouth
    ellipse(300, 280, 33, 5);
    //ear tops
    ellipse(250, 150, 10, 30);
    ellipse(350, 150, 10, 30);
    //cheeks
    fill(#FF0000);
    ellipse(255, 270, 17, 17);
    ellipse(345, 270, 17, 17);
  }

  if (635<b&&b<810) {
    //motion
    pikaY3=pikaY3-pikaVY3;
    if (pikaY3<190) {
      pikaVY3=0;
    }
    //sky
    fill(#14A4DB);
    rect(0, 0, 700, 700);
    //ballons
    fill(#0B6486);
    ellipse(pikaX3-10, pikaY3-70, 60, 60);
    ellipse(pikaX3-40, pikaY3-60, 60, 60);
    ellipse(pikaX3+40, pikaY3-60, 60, 60);
    ellipse(pikaX3+70, pikaY3-40, 60, 60);
    //pikachu
    fill(#FFFF00);
    //feet
    ellipse(pikaX3+50, pikaY3+65, 30, 20);
    ellipse(pikaX3-10, pikaY3+65, 30, 20);
    //hand
    ellipse(pikaX3-60, pikaY3+25, 50, 18); 
    //tail
    fill(#E87F15);
    rect(pikaX3+70, pikaY3+40, 30, 10);
    rect(pikaX3+90, pikaY3+30, 30, 10);
    fill(#FFFF00);
    rect(pikaX3+110, pikaY3+20, 30, 10);
    rect(pikaX3+130, pikaY3, 20, 20);
    rect(pikaX3+140, pikaY3-20, 50, 30);
    //body
    fill(#FFFF00);
    ellipse(pikaX3+20, pikaY3+30, 120, 70);
    //hand
    ellipse(pikaX3+80, pikaY3+15, 50, 18);

    //ears
    ellipse(pikaX3-25, pikaY3-65, 15, 70);
    ellipse(pikaX3+25, pikaY3-65, 15, 70);
    //head
    ellipse(pikaX3, pikaY3, 110, 90);
    //ear tops
    fill(#000000);
    ellipse(pikaX3-25, pikaY3-92, 12, 15);
    ellipse(pikaX3+25, pikaY3-92, 12, 15);
    //eyes
    ellipse(pikaX3-25, pikaY3-10, 12, 12);
    ellipse(pikaX3+15, pikaY3-10, 12, 12);


    //nose
    ellipse(pikaX3-5, pikaY3+5, 5, 5);
    //mouth
    ellipse(pikaX3-5, pikaY3+25, 20, 10);
    //cheeks
    fill(#FF0000);
    ellipse(pikaX3-35, pikaY3+10, 15, 15);
    ellipse(pikaX3+25, pikaY3+10, 15, 15);
    //clouds
    fill(#FFFFFF);
    ellipse(400, 600, 300, 400);
    ellipse(100, 600, 300, 450);
    ellipse(250, 600, 300, 380);
    ellipse(500, 600, 300, 420);
    ellipse(0, 700, 300, 600);
    ellipse(600, 700, 300, 600);
    ellipse(400, 200, 70, 20);
    ellipse(50, 100, 120, 30);
  }
  if (810<b) {
    page=1;
    //noStroke();
    //ears
    fill(#FFFF00);
    ellipse(240, 300, 25, 200);
    ellipse(360, 300, 25, 200);
    //eartops
    fill(#000000);
    ellipse(240, 210, 12, 35);
    ellipse(360, 210, 12, 35);
    //head
    fill(#FFFF00);
    ellipse(300, 350, 200, 170);
    //body
    ellipse(300, 500, 200, 300);
    //hands
    ellipse(200, 430, 120, 30);
    ellipse(400, 430, 120, 30);
    //eyes
    fill(#522D08);
    ellipse(260, 330, 22, 22);
    ellipse(340, 330, 22, 22);
    //nose
    fill(#000000);
    ellipse(300, 350, 7, 7);
    //mouth
    fill(#5D0300);
    ellipse(300, 380, 33, 30);
    //cheeks
    fill(#FF0000);
    ellipse(230, 370, 25, 25);
    ellipse(370, 370, 25, 25);
    //tail
    fill(#BF1900);
    rect(400, 485, 50, 50);
    rect(440, 470, 60, 20);
    fill(#FFFF00);
    rect(480, 450, 60, 20);
    rect(520, 410, 80, 40);

    //pokemon
    //faling down
    tX=tX+tVX;
    if (tX>70) {
      tVX=0;
      //textbox
      fill(#0000FF);
      ellipse(300, 150, 200, 100);
      triangle(280, 190, 320, 190, 300, 230);
      fill(#FFFF00);
      textFont(myFont, 50);
      text("Pika!", 240, 170);
      fill(#000000);
      textFont(myFont, 25);
      text("click to begin", 220, 480);
    }
    fill(#0000FF);
    textFont(myFont, 80);
    text("PoKÃ©MoN", 125, tX);
  }
}

void buttons() {
  //button to proceed
  if (page>1) { 
    triangle(bX11, bY11, bX12, bY12, bX13, bY13);
    if (page>2) {
      //button to go back
      triangle(bX21a, bY21a, bX22a, bY22a, bX23a, bY23a);
    }
  }
}

void mousePressed() {
  if (page==1) {
    if (mouseX>X&&mouseX<X+600&&mouseY>Y&&mouseY<Y+500) {
      b=-10;
      bV=-10;
      page=page+1;
    }
  }
  if (page>0) {
    if (dist(mouseX, mouseY, bX11+20, bY11+10)<20) {

      page=page+1;
    }
  }
  if (page>0) {
    if (dist(mouseX, mouseY, bX21a+20, bY21a-10)<20) {
      page=page-1;
      if (page < 2) {
        page = 2;
      }
    }
  }
  if (dist(mouseX, mouseY, begX, begY)<70) {

    begX=-1000;
    begY=-1000;
    sVX=-25;
    s2VX=-25;
    s3VX=25;
    s4VX=25;
    s5VX=-25;
    s6VX=-25;
    s7VX=25;
    s8VX=25;
    s9VX=-25;
    s0VX=-25;
  }
  if (page2>0&&page2<3) {
    if (dist(mouseX, mouseY, bX31+20, bY31+10)<20) {
      page2=page2+1;
    }
  }
  if (page2>998&&page2<1002) {
    if (dist(mouseX, mouseY, bX31+20, bY31+10)<20) {
      page2=page2+1;
    }
  }
  if (page2==3) {
    if (mouseX>20&&mouseX<220&&mouseY>405&&mouseY<435) {
      page2=99;
    }
    if (mouseX>20&&mouseX<250&&mouseY>445&&mouseY<475) {
      page2=101;
    }
  }
}


void welcometotheworldofpokemon1() {
  stroke(5);
  //head
  fill(#FFCF6F);
  ellipse(255, 127, 40, 50);
  //eyes
  fill(#000000);
  ellipse(248, 123, 4, 4);
  ellipse(262, 123, 4, 4);
  //nose
  ellipse(252, 130, 2, 2);
  //mouth
  ellipse(255, 137, 15, mW);
  //motion of mouth; opening and closing
  mW=mW+mVW;
  if (mW>7) {
    mVW=-mVW;
  }
  if (mW<0) {
    mVW=-mVW;
  }
  //clothes
  fill(#DB6A0D);
  rect(230, 240, 25, 70);
  rect(255, 240, 25, 70);
  fill(#FFFFFF);
  rect(200, 150, 20, 75);
  rect(220, 150, 20, 120);
  fill(#FF0000);
  rect(240, 150, 30, 90);
  fill(#FFFFFF);
  rect(270, 150, 20, 120);
  rect(290, 150, 20, 75);
  //shoes
  fill(#3E40A5);
  ellipse(240, 310, 40, 10);
  ellipse(270, 310, 40, 10);
  //hair
  fill(#94B792);
  ellipse(255, 107, 32, 10);
  //pokeball
  fill(pC);
  ellipse(400, 175, 100, 100);
  fill(#000000);
  rect(350, 170, 100, 10);
  fill(#DEDEDE);
  ellipse(400, 175, 30, 30);

  //interaction
  if (dist(mouseX, mouseY, 400, 175)<50) {
    pC=color(random(256), random(256), random(256));
  }



  //text box
  fill(#FFFFFF);
  rect(10, 400, 580, 90);
  fill(#000000);
  textFont(myFont, 30);
  text("Hello there !", 20, 430);
  text("Welcome to the world of POKÃ©MON!", 20, 460);

  //button to procced 
  triangle(bX11, bY11, bX12, bY12, bX13, bY13);
}

void welcometotheworldofpokemon2() {
  stroke(5);
  background(#FFFFFF);
  //head
  fill(#FFCF6F);
  ellipse(255, 127, 40, 50);
  //eyes
  fill(#000000);
  ellipse(248, 123, 4, 4);
  ellipse(262, 123, 4, 4);
  //nose
  ellipse(252, 130, 2, 2);
  //mouth
  ellipse(255, 137, 15, mW);
  //motion of mouth; opening and closing
  mW=mW+mVW;
  if (mW>7) {
    mVW=-mVW;
  }
  if (mW<0) {
    mVW=-mVW;
  }
  //clothes
  fill(#DB6A0D);
  rect(230, 240, 25, 70);
  rect(255, 240, 25, 70);
  fill(#FFFFFF);
  rect(200, 150, 20, 75);
  rect(220, 150, 20, 120);
  fill(#FF0000);
  rect(240, 150, 30, 90);
  fill(#FFFFFF);
  rect(270, 150, 20, 120);
  rect(290, 150, 20, 75);
  //shoes
  fill(#3E40A5);
  ellipse(240, 310, 40, 10);
  ellipse(270, 310, 40, 10);
  //hair
  fill(#94B792);
  ellipse(255, 107, 32, 10);

  //text box
  fill(#FFFFFF);
  rect(10, 400, 580, 90);
  fill(#000000);
  textFont(myFont, 30);
  text("This world is inhabited", 20, 430);
  text("by creatures called POKÃ©MON!", 20, 460);

  //pokeball
  fill(#FF3131);
  ellipse(pX, pY, 100, 100);
  fill(#000000);
  rect(pX-50, pY-5, 100, 10);
  fill(#DEDEDE);
  ellipse(pX, pY, 30, 30);




  //interaction
  if (dist(mouseX, mouseY, pX, pY)<50) {
    //to start motion
    pVX=2;
    pVY=-3;
  }
  //motion
  pX=pX+pVX;
  pY=pY+pVY;
  //bounce
  if (pX>550) {
    pVX=-pVX;
  }
  if (pX<50) {
    pVX=-pVX;
  }
  if (pY>450) {
    pVY=-pVY;
  }
  if (pY<50) {
    pVY=-pVY;
  }

  //button to procced 
  fill(#000000);
  triangle(bX21, bY21, bX22, bY22, bX23, bY23);

  //button to go back
  triangle(bX21a, bY21a, bX22a, bY22a, bX23a, bY23a);
}

void welcometotheworldofpokemon3() {
  stroke(5);
  background(#FFFFFF);
  //head
  fill(#FFCF6F);
  ellipse(255, 127, 40, 50);
  //eyes
  fill(#000000);
  ellipse(248, 123, 4, 4);
  ellipse(262, 123, 4, 4);
  //nose
  ellipse(252, 130, 2, 2);
  //mouth
  ellipse(255, 137, 15, mW);
  //motion of mouth; opening and closing
  mW=mW+mVW;
  if (mW>7) {
    mVW=-mVW;
  }
  if (mW<0) {
    mVW=-mVW;
  }
  //clothes
  fill(#DB6A0D);
  rect(230, 240, 25, 70);
  rect(255, 240, 25, 70);
  fill(#FFFFFF);
  rect(200, 150, 20, 75);
  rect(220, 150, 20, 120);
  fill(#FF0000);
  rect(240, 150, 30, 90);
  fill(#FFFFFF);
  rect(270, 150, 20, 120);
  rect(290, 150, 20, 75);
  //shoes
  fill(#3E40A5);
  ellipse(240, 310, 40, 10);
  ellipse(270, 310, 40, 10);
  //hair
  fill(#94B792);
  ellipse(255, 107, 32, 10);

  //text box
  fill(#FFFFFF);
  rect(10, 400, 580, 90);
  fill(#000000);
  textFont(myFont, 30);
  text("POKÃ©MON trainers use", 20, 430);
  text("POKÃ©MON to battle!", 20, 460);

  //pokeball
  fill(#FF3131);
  ellipse(450, 175, pW, pW);
  fill(#000000);
  rect(rW1, 175-5, rW2, 10);
  fill(#DEDEDE);
  ellipse(450, 175, 30, 30);
  //size change
  pW=pW+pVW;
  rW1=rW1-rVW1;
  rW2=rW2+rVW2;

  //size bounce
  if (pW>275) {
    pVW=-pVW;
  }
  if (pW<100) {
    pVW=-pVW;
  }

  if (rW1<312) {
    rVW1=-rVW1;
    rVW2=-rVW2;
  }
  if (rW1>399) {
    rVW1=-rVW1;
    rVW2=-rVW2;
  }
  //interaction
  if (dist(mouseX, mouseY, 450, 175)<50) {
    pVW=2;
    rVW2=2;
    rVW1=1;
  }
  //button to procced 
  fill(#000000);
  triangle(bX21, bY21, bX22, bY22, bX23, bY23);

  //button to go back
  triangle(bX21a, bY21a, bX22a, bY22a, bX23a, bY23a);
}
void welcometotheworldofpokemon4() {
  stroke(5);
  background(#FFFFFF);
  //head
  fill(#FFCF6F);
  ellipse(255, 127, 40, 50);
  //eyes
  fill(#000000);
  ellipse(248, 123, 4, 4);
  ellipse(262, 123, 4, 4);
  //nose
  ellipse(252, 130, 2, 2);
  //mouth
  ellipse(255, 137, 15, mW);
  //motion of mouth; opening and closing
  mW=mW+mVW;
  if (mW>7) {
    mVW=-mVW;
  }
  if (mW<0) {
    mVW=-mVW;
  }
  //clothes
  fill(#DB6A0D);
  rect(230, 240, 25, 70);
  rect(255, 240, 25, 70);
  fill(#FFFFFF);
  rect(200, 150, 20, 75);
  rect(220, 150, 20, 120);
  fill(#FF0000);
  rect(240, 150, 30, 90);
  fill(#FFFFFF);
  rect(270, 150, 20, 120);
  rect(290, 150, 20, 75);
  //shoes
  fill(#3E40A5);
  ellipse(240, 310, 40, 10);
  ellipse(270, 310, 40, 10);
  //hair
  fill(#94B792);
  ellipse(255, 107, 32, 10);

  //text box
  fill(#FFFFFF);
  rect(10, 400, 580, 90);
  fill(#000000);
  textFont(myFont, 30);
  text("There are over ", 20, 430);
  text("150 POKÃ©MON!", 20, 460);

  //pokeball
  fill(#FF3131);
  ellipse(p2X, p2Y, 100, 100);
  fill(#000000);
  rect(p2X-50, p2Y-5, 100, 10);
  fill(#DEDEDE);
  ellipse(p2X, p2Y, 30, 30);

  //follow
  p2X=mouseX;
  p2Y=mouseY;
  //button to procced 
  fill(#000000);
  triangle(bX21, bY21, bX22, bY22, bX23, bY23);

  //button to go back
  triangle(bX21a, bY21a, bX22a, bY22a, bX23a, bY23a);
}

void welcometotheworldofpokemon5() {
  stroke(5);
  background(#FFFFFF);
  //head
  fill(#FFCF6F);
  ellipse(255, 127, 40, 50);
  //eyes
  fill(#000000);
  ellipse(248, 123, 4, 4);
  ellipse(262, 123, 4, 4);
  //nose
  ellipse(252, 130, 2, 2);
  //mouth
  ellipse(255, 137, 15, mW);
  //motion of mouth; opening and closing
  mW=mW+mVW;
  if (mW>7) {
    mVW=-mVW;
  }
  if (mW<0) {
    mVW=-mVW;
  }
  //clothes
  fill(#DB6A0D);
  rect(230, 240, 25, 70);
  rect(255, 240, 25, 70);
  fill(#FFFFFF);
  rect(200, 150, 20, 75);
  rect(220, 150, 20, 120);
  fill(#FF0000);
  rect(240, 150, 30, 90);
  fill(#FFFFFF);
  rect(270, 150, 20, 120);
  rect(290, 150, 20, 75);
  //shoes
  fill(#3E40A5);
  ellipse(240, 310, 40, 10);
  ellipse(270, 310, 40, 10);
  //hair
  fill(#94B792);
  ellipse(255, 107, 32, 10);

  //text box
  fill(#FFFFFF);
  rect(10, 400, 580, 90);
  fill(#000000);
  textFont(myFont, 30);
  text("Do you think you", 20, 430);
  text("can catch 'em all?", 20, 460);

  //pokeball
  fill(#FF3131);
  ellipse(p3X, p3Y, 100, 100);
  fill(#000000);
  rect(p3X-50, p3Y-5, 100, 10);
  fill(#DEDEDE);
  ellipse(p3X, p3Y, 30, 30);

  //falling
  p3Y=p3Y+p3VY;

  //score loss
  if (p3Y>650) {
    p3Y=-50;
    p3X=(50+(int)random(400));
  }
  if (dist(mouseX, mouseY, p3X, p3Y)<50) {
    p3Y=-50;
    p3X=(50+(int)random(400));
    gain=gain+1;
  }

  //pokeball
  fill(#FF3131);
  ellipse(p4X, p4Y, 100, 100);
  fill(#000000);
  rect(p4X-50, p4Y-5, 100, 10);
  fill(#DEDEDE);
  ellipse(p4X, p4Y, 30, 30);

  //falling
  p4Y=p4Y+p4VY;

  //score loss
  if (p4Y>650) {
    p4Y=-50;
    p4X=(50+(int)random(400));
  }
  if (dist(mouseX, mouseY, p4X, p4Y)<50) {
    p4Y=-50;
    p4X=(50+(int)random(400));
    gain=gain+1;
  }

  //pokeball
  fill(#FF3131);
  ellipse(p5X, p5Y, 100, 100);
  fill(#000000);
  rect(p5X-50, p5Y-5, 100, 10);
  fill(#DEDEDE);
  ellipse(p5X, p5Y, 30, 30);

  //falling
  p5Y=p5Y+p5VY;

  //score loss
  if (p5Y>650) {
    p5Y=-50;
    p5X=(50+(int)random(400));
  }
  if (dist(mouseX, mouseY, p5X, p5Y)<50) {
    p5Y=-50;
    p5X=(50+(int)random(400));
    gain=gain+1;
  }
  drawInteger(gain, 400, 100);

  //button to procced 
  fill(#000000);
  triangle(bX21, bY21, bX22, bY22, bX23, bY23);

  //button to go back
  triangle(bX21a, bY21a, bX22a, bY22a, bX23a, bY23a);
}
void welcometotheworldofpokemon6() {
  begY=250;
  begX=300;  
  stroke(5);
  background(#FFFFFF);
  bX11=0;
  bY11=0;
  bX21a=0;
  bY21a=0;
  //pokeball
  fill(#FF3131);
  ellipse(300, 250, 500, 500);
  fill(#000000);
  rect(50, 225, 500, 50);
  fill(#FFFFFF);
  ellipse(300, 250, 140, 140);
  fill(#8B8B8B, fO);
  ellipse(begX, begY, 140, 140);
  //fading
  fO=fO-fOV;
  if (fO<0) {
    fO=0;
    fOV=-1*fOV;
  }
  if (fO>255) {
    fO=255;
    fOV=-1*fOV;
  }
  //text box
  fill(#FFFFFF);
  rect(10, 400, 580, 90);
  fill(#000000);
  textFont(myFont, 30);
  text("      Do you think you got what", 20, 430);
  text("  it takes to be a pokemon master?", 20, 460);
  //transitioning
  rect(500, sX, 100, 500);
  sX=sX+sVX;
  if (sX==0) {
    sVX=0;
  }

  rect(s2X, 0, 600, 100);
  s2X=s2X+s2VX;
  if (s2X==0) {
    s2VX=0;
  }

  rect(0, s3X, 100, 500);
  s3X=s3X+s3VX;
  if (s3X==0) {
    s3VX=0;
  }

  rect(s4X, 400, 600, 100);
  s4X=s4X+s4VX;
  if (s4X==0) {
    s4VX=0;
  }
  rect(400, s5X, 100, 500);
  s5X=s5X+s5VX;
  if (s5X==0) {
    s5VX=0;
  }
  rect(s6X, 100, 600, 100);
  s6X=s6X+s6VX;
  if (s6X==0) {
    s6VX=0;
  }
  rect(100, s7X, 100, 500);
  s7X=s7X+s7VX;
  if (s7X==0) {
    s7VX=0;
  }
  rect(s8X, 300, 600, 100);
  s8X=s8X+s8VX;
  if (s8X==0) {
    s8VX=0;
  }
  rect(300, s9X, 100, 500);
  s9X=s9X+s9VX;
  if (s9X==0) {
    s9VX=0;
  }
  rect(s0X, 200, 600, 100);
  s0X=s0X+s0VX;
  if (s0X==0) {
    s0VX=0;
    page=-100;
    page2=1;
  }
}

void drawInteger(int num, int xPos, int yPos) {
  //12px tall, 12px wide, 5px space
  int j = 0;
  while (j < str (num).length() ) {

    //get a single digit
    int i = int(str(num).substring(j, j + 1));  

    //draw minus sign if negative
    if (j == 0 && num < 0) {
      line(xPos, yPos + 12, xPos + 12, yPos + 12);
      i=-1;
    }

    //draw digits
    if (i == 0) {
      line(xPos, yPos + 24, xPos + 12, yPos + 24);
      line(xPos, yPos, xPos + 12, yPos);
      line(xPos, yPos, xPos, yPos + 24);
      line(xPos + 12, yPos, xPos + 12, yPos + 24);
      line(xPos, yPos + 24, xPos + 12, yPos);
    }
    else if (i == 1) {
      line(xPos, yPos + 24, xPos + 12, yPos + 24);
      line(xPos + 6, yPos, xPos + 6, yPos + 24);
      line(xPos + 6, yPos, xPos, yPos + 4);
    }
    else if (i == 2) {
      line(xPos, yPos, xPos + 12, yPos);
      line(xPos + 12, yPos, xPos + 12, yPos + 12);
      line(xPos, yPos + 12, xPos + 12, yPos + 12);
      line(xPos, yPos + 12, xPos, yPos + 24);
      line(xPos, yPos + 24, xPos + 12, yPos + 24);
    }
    else if (i == 3) {
      line(xPos, yPos, xPos + 12, yPos);
      line(xPos + 12, yPos, xPos + 12, yPos + 24);
      line(xPos, yPos + 12, xPos + 12, yPos + 12);
      line(xPos, yPos + 24, xPos + 12, yPos + 24);
    }
    else if (i == 4) {
      line(xPos + 12, yPos, xPos + 12, yPos + 24);
      line(xPos, yPos, xPos, yPos +12);
      line(xPos, yPos + 12, xPos + 12, yPos + 12);
    }
    else if (i == 5) {
      line(xPos, yPos, xPos + 12, yPos);
      line(xPos, yPos, xPos, yPos + 12);
      line(xPos, yPos + 12, xPos + 12, yPos + 12);
      line(xPos + 12, yPos + 12, xPos + 12, yPos + 24);
      line(xPos, yPos + 24, xPos + 12, yPos + 24);
    }
    else if (i == 6) {
      line(xPos, yPos, xPos + 12, yPos);
      line(xPos, yPos, xPos, yPos + 24);
      line(xPos, yPos + 24, xPos + 12, yPos +24);
      line(xPos, yPos + 12, xPos + 12, yPos + 12);
      line(xPos + 12, yPos + 24, xPos + 12, yPos +12);
    }
    else if (i == 7) {
      line(xPos, yPos + 24, xPos + 12, yPos);
      line(xPos, yPos, xPos + 12, yPos);
    }
    else if (i == 8) {
      line(xPos, yPos + 24, xPos + 12, yPos+ 24);  
      line(xPos, yPos, xPos + 12, yPos);
      line(xPos, yPos + 12, xPos + 12, yPos +12);
      line(xPos, yPos, xPos, yPos + 24);
      line(xPos + 12, yPos, xPos + 12, yPos + 24);
    }
    else if (i == 9) {
      line(xPos + 12, yPos, xPos + 12, yPos + 24);
      line(xPos, yPos, xPos + 12, yPos);
      line(xPos, yPos, xPos, yPos + 12);
      line(xPos, yPos + 12, xPos + 12, yPos + 12);
    }

    j++;
    xPos += 12 + 5;
  }
}



void star() {

  stroke(#FFFF00);
  drawBurstLine(300, 300, 5, 10, 40, 0);

  stroke(#FFFF00);
  drawBurstLine(200, 100, 5, 30, 50, 0);

  starX=starX+starVX;
  starY=starY+starVY;
  fill(#FFFF00);
  stroke(#FFFF00);
  strokeWeight(3);
  drawBurstVertex(starX, starY, 5, 25, 50, 0);
}



void drawBurstLine(int x, int y, int sides, int innerRadius, int outerRadius, int angle) {

  float step, halfStep, qtrStep, start, dx, dy, cx, cy;
  step = (PI * 2) / sides;
  halfStep = step / 2;
  start = (angle / 180) * PI;



  dx = x + cos( start + (step * 1) - halfStep ) * innerRadius;
  dy = y - sin( start + (step * 1) - halfStep ) * innerRadius;
}





void drawBurstVertex(int x, int y, int sides, int innerRadius, int outerRadius, int angle) {

  float step, halfStep, qtrStep, start, dx, dy, cx, cy;
  step = (PI * 2) / sides;
  halfStep = step / 2;
  start = (angle / 180) * PI;

  beginShape();
  for (int i = 1; i <= sides; i++) {
    vertex(x + cos( start + (step * i) - halfStep ) * innerRadius, y - sin( start + (step * i) - halfStep ) * innerRadius);
    vertex( x + cos( start + (step * i) ) * outerRadius, y - sin( start + (step * i) ) * outerRadius);
  }
  endShape(CLOSE);
}





//http://www.youtube.com/watch?v=KdQXrRNDOMs


