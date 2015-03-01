
//PImage img;
float x, y;     // koordinati nosa Shuttle
float[] xm=new float [15];    // massiv koordinati x meteoritov
float[] ym=new float [xm.length];   // massiv koordinati y meteoritov
int r = 35;  //radius meteorita
float xmars=0, ymars=0, mastab = 1;
int col = 181;  // krasniy cvet v texte
float ymmm=-3550; // proba
float pct=0.0;
void setup() {
  size(1900, 540);
  frameRate(1000);
  //img = loadImage("123.jpg");
  x=width/2;
  y=height/4*3-80;
  for (int i=0; i < xm.length; i++) {         //sozdanie kagdogo meteorita
    xm[i] = (int)random(1, width/r/9)*9*r;    //zadaem slychainyu koordinaty x meteoritov (9*r - eto 9 radiusov megdu meteoritami)
    ym[i] = map(i, 0, xm.length, -3100, -350);  //zadaem koordinaty y meteoritov (vsato is primera str154)
    // chislo "i" iz diapazona ot 0 do kol-vo meteoritov preobrazuet v chislo ot -2100 do 100
  }
}
void draw() {   
  int timer = millis();
  //image(img, 0, 0);
  background(0, 0, 31);
  ///////////////////////////////////////////////////////////////////////////////////////     MARS
  pushMatrix(); 
  translate(465, 270);
  scale(0.5);

  pushMatrix();       //MARS
  translate(500, -330);
  scale(mastab);
  strokeWeight(2); //mars - vneshniy kontur
  stroke(0);
  fill(219, 59, 39);  //krasniy
  ellipse (xmars, ymars, 140, 140);  //  mars
  strokeWeight(1); //krater marsa - vneshniy kontur
  stroke(26);
  line(xmars-52, ymars-30, xmars-45, ymars-41);  //  liniy  kratera marsa 1
  line(xmars-41, ymars-27, xmars-42, ymars-21);  
  line(xmars-31, ymars-29, xmars-29, ymars-23); 
  line(xmars-23, ymars-34, xmars-20, ymars-29); 
  line(xmars-11, ymars-49, xmars-6, ymars-48); 
  line(xmars-18, ymars-54, xmars-8, ymars-53);
  line(xmars+24, ymars-42, xmars+11, ymars-39);  //  liniy  kratera marsa 2
  line(xmars+12, ymars-34, xmars+6, ymars-32);
  line(xmars+11, ymars-26, xmars+5, ymars-22);
  line(xmars+13, ymars-18, xmars+8, ymars-14);
  line(xmars+18, ymars-13, xmars+14, ymars-6);
  line(xmars+24, ymars-8, xmars+23, ymars-3);
  line(xmars+34, ymars-5, xmars+34, ymars);
  line(xmars+43, ymars-9, xmars+44, ymars-3);
  line(xmars+46, ymars-18, xmars+48, ymars-14);
  line(xmars+45, ymars-28, xmars+49, ymars-22);
  line(xmars+17, ymars-67, xmars+19, ymars-63);  //  krivie liniy marsa
  line(xmars+19, ymars-63, xmars+7, ymars-57);
  line(xmars+7, ymars-57, xmars+7, ymars-48);
  line(xmars+7, ymars-44, xmars-3, ymars-38);
  line(xmars-7, ymars-32, xmars-12, ymars-26);
  ellipse (xmars-12, ymars-18, 4, 8);
  line(xmars-13, ymars-10, xmars-16, ymars-4);
  line(xmars-16, ymars-4, xmars-26, ymars+2);
  line(xmars-26, ymars+2, xmars-28, ymars+10);
  line(xmars-22, ymars+22, xmars-22, ymars+28);
  line(xmars-22, ymars+28, xmars-8, ymars+40);
  line(xmars-8, ymars+40, xmars-10, ymars+52);
  line(xmars-10, ymars+52, xmars-4, ymars+58);
  line(xmars-1, ymars+62, xmars+9, ymars+70);
  ellipse (xmars+9, ymars+56, 8, 4);
  arc (xmars+16, ymars+22, 8, 22, QUARTER_PI, HALF_PI+QUARTER_PI); 
  stroke(0);
  pushMatrix();
  translate(xmars-30, ymars-43);  //  krater marsa 1
  rotate (-PI/6);
  ellipse (0, 0, 36, 16); 
  noStroke();
  ellipse (0, -8, 18, 7); //  rasriv elipsa kratera marsa 1
  popMatrix();
  pushMatrix();
  translate(xmars+29, ymars-25);  //  krater marsa 2
  rotate (PI/3);
  stroke(0);
  ellipse (0, 0, 36, 25);  
  noStroke();
  ellipse (-8, -10, 22, 12); //  rasriv elipsa kratera marsa 2
  popMatrix();
  stroke(0);   //  krater marsa 3
  arc (xmars-48, ymars+10, 19, 26, PI, PI+QUARTER_PI); // arka kratera marsa 3
  arc (xmars-48, ymars+10, 19, 27, PI+HALF_PI+QUARTER_PI, TWO_PI); // arka kratera marsa 3
  ellipse (xmars-48, ymars+10, 14, 21);  //  krater marsa 3
  noStroke();
  ellipse (xmars-44, ymars+2, 8, 14); //  rasriv elipsa kratera marsa 3
  pushMatrix();
  translate(xmars-2, ymars+9);  //  krater marsa 4
  rotate (-PI/5);
  stroke(0);
  arc (0, 0, 34, 22, PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI); // arka kratera marsa 4
  ellipse (0, 0, 28, 16); 
  noStroke();
  ellipse (8, -3, 18, 12); //  rasriv elipsa kratera marsa 4
  popMatrix(); 
  stroke(0);  //  krater marsa 5
  arc (xmars+58, ymars+6, 18, 22, PI, PI+QUARTER_PI); // arka kratera marsa 5
  ellipse (xmars+58, ymars+6, 9, 18);  //  krater marsa 5
  noStroke();
  ellipse (xmars+61, ymars+4, 7, 12); //  rasriv elipsa kratera marsa 5
  pushMatrix();
  translate(xmars-25, ymars+45);  //  krater marsa 6
  rotate (PI/4);
  stroke(0);
  ellipse (0, 0, 22, 12); 
  noStroke();
  ellipse (7, 0, 6, 18); //  rasriv elipsa kratera marsa 6
  popMatrix(); 
  pushMatrix();
  translate(xmars+40, ymars+35);  //  krater marsa 7
  rotate (-PI/4);
  stroke(0);
  ellipse (0, 0, 22, 10); 
  arc (0, 0, 16, 5, PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI); // arka kratera marsa 7
  noStroke();
  ellipse (9, -2, 10, 6); //  rasriv elipsa kratera marsa 7
  popMatrix(); 
  popMatrix(); 
  /////////////////////////////////////////////////////////////////////////////////////////    SHUTLLE
  strokeWeight(1); //Shuttle - vneshniy kontur
  fill(255);
  stroke(0);
  beginShape(); //Shuttle - vneshniy kontur
  vertex(x, y); //Shuttle - vneshniy kontur - leviy
  bezierVertex(x-2, y+2, x-6, y+6, x-10, y+24); 
  bezierVertex(x-28, y+114, x-30, y+120, x-38, y+130);
  bezierVertex(x-60, y+150, x-64, y+154, x-68, y+162);
  bezierVertex(x-70, y+170, x-72, y+184, x-70, y+184);
  bezierVertex(x-66, y+184, x-64, y+186, x, y+186);
  bezierVertex(x, y+186, x+64, y+186, x+66, y+184); //Shuttle - vneshniy kontur - praviy
  bezierVertex(x+70, y+184, x+72, y+184, x+70, y+170);
  bezierVertex(x+68, y+162, x+64, y+154, x+60, y+150);
  bezierVertex(x+38, y+130, x+30, y+120, x+28, y+114);
  bezierVertex(x+10, y+24, x+6, y+6, x+2, y+2); 
  vertex(x, y); 
  endShape();
  beginShape(); //Shuttle - linia - leviy
  vertex(x-16, y+80);
  bezierVertex(x-20, y+108, x-23, y+128, x-30, y+138);
  bezierVertex(x-40, y+146, x-44, y+154, x-44, y+172); 
  endShape();
  beginShape(); //Shuttle - linia - praviy
  vertex(x+16, y+80);
  bezierVertex(x+20, y+108, x+23, y+128, x+30, y+138);  
  bezierVertex(x+40, y+146, x+44, y+154, x+44, y+172); 
  endShape();
  line(x-16, y+50, x-16, y+160); //Shuttle - korpus
  line(x+16, y+50, x+16, y+160); //Shuttle - korpus
  strokeWeight(6); //Shuttle - nignya linia na kriliax
  line(x-68, y+176, x+70, y+176);
  strokeWeight(4); //Shuttle - okna
  line(x-3, y+12, x+3, y+12); //Shuttle - okna - pervoe verxnee
  line(x-3, y+18, x+3, y+18); //Shuttle - okna - vtoroe verxnee
  line(x-6, y+34, x-1, y+32); //Shuttle - okna - tretie levoe
  line(x+1, y+32, x+6, y+34); //Shuttle - okna - tretie pravoe 
  line(x-8, y+42, x-7, y+38); //Shuttle - okna - chetvertoe nignee levoe
  line(x+8, y+42, x+7, y+38); //Shuttle - okna - chetvertoe nignee pravoe
  noFill();
  strokeWeight(1); //Shuttle - linii obiema na korpuse
  bezier(x-12, y+26, x-6, y+20, x+6, y+20, x+12, y+26);
  bezier(x-16, y+50, x-6, y+46, x+6, y+46, x+16, y+50);
  bezier(x-16, y+78, x-6, y+74, x+6, y+74, x+16, y+78);
  bezier(x-16, y+106, x-6, y+102, x+6, y+102, x+16, y+106);
  bezier(x-16, y+132, x-6, y+128, x+6, y+128, x+16, y+132);
  bezier(x-16, y+160, x-6, y+156, x+6, y+156, x+16, y+160);
  fill(255);
  beginShape(); //Shuttle - dvigatel - leviy
  vertex(x-16, y+160);
  bezierVertex(x-18, y+168, x-24, y+180, x-22, y+192);
  vertex(x-1, y+192);
  bezierVertex(x-1, y+192, x-1, y+174, x-3, y+160);
  vertex(x-16, y+160);
  endShape();
  beginShape(); //Shuttle - dvigatel - praviy
  vertex(x+16, y+160);
  bezierVertex(x+18, y+168, x+24, y+180, x+22, y+192);
  vertex(x+1, y+192);
  bezierVertex(x+1, y+192, x+1, y+174, x+3, y+160);
  vertex(x+16, y+160);
  endShape();
  strokeWeight(6); //Shuttle - nigniy ogon
  stroke(241, 0, 0);
  line(x-17, y+194, x-6, y+194);
  line(x+17, y+194, x+6, y+194); 
  ////////////////////////////////////////////////////////////////////////////////////////    TAIMER
  strokeWeight(10);    // taimer nachala igry
  stroke(col, 0, 0);
  fill(col, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(50);
  ellipseMode(CENTER);
  noFill();
  if (timer < 2000) {
    text("3", width/2, 0);
    ellipse(width/2, 3, 90, 90);
  } else if (timer < 3000) {
    text("2", width/2, 0);
    ellipse(width/2, 3, 90, 90);
  } else if (timer < 4000) {
    text("1", width/2, 0);
    ellipse(width/2, 3, 90, 90);
  } else if (timer < 5000) {
    text("0", width/2, 0);
    ellipse(width/2, 3, 90, 90);
  } else {
    for (int i = 0; i < xm.length; i++) { //obnovlenie i risovanie kagdogo meteorita
      ///////////////////////////////////////////////////////////////////////////////////     METEORIT
      strokeWeight(2); //meteorit - vneshniy kontur
      fill(229, 229, 249);  //beliy
      stroke(0);
      beginShape(); //meteorit - vneshniy kontur
      curveVertex(xm[i]+13, ym[i]-33);
      curveVertex(xm[i]+13, ym[i]-33);
      curveVertex(xm[i]+18, ym[i]-30); 
      curveVertex(xm[i]+20, ym[i]-27); 
      curveVertex(xm[i]+40, ym[i]-19); 
      curveVertex(xm[i]+43, ym[i]-13); 
      curveVertex(xm[i]+47, ym[i]-8); 
      curveVertex(xm[i]+50, ym[i]+5); 
      curveVertex(xm[i]+52, ym[i]+11); 
      curveVertex(xm[i]+50, ym[i]+15); 
      curveVertex(xm[i]+51, ym[i]+22); 
      curveVertex(xm[i]+42, ym[i]+32); 
      curveVertex(xm[i]+37, ym[i]+33); 
      curveVertex(xm[i]+30, ym[i]+37); 
      curveVertex(xm[i]+15, ym[i]+39); 
      curveVertex(xm[i]+5, ym[i]+41);
      curveVertex(xm[i]-12, ym[i]+35);
      curveVertex(xm[i]-23, ym[i]+25);
      curveVertex(xm[i]-32, ym[i]+23);
      curveVertex(xm[i]-40, ym[i]+18);
      curveVertex(xm[i]-50, ym[i]+10);
      curveVertex(xm[i]-51, ym[i]+2);
      curveVertex(xm[i]-49, ym[i]-5);
      curveVertex(xm[i]-45, ym[i]-10);
      curveVertex(xm[i]-35, ym[i]-17);
      curveVertex(xm[i]-28, ym[i]-30);
      curveVertex(xm[i]-25, ym[i]-32); 
      curveVertex(xm[i]-23, ym[i]-35); 
      curveVertex(xm[i]-10, ym[i]-40); 
      curveVertex(xm[i]-2, ym[i]-38); 
      curveVertex(xm[i]+13, ym[i]-33);
      curveVertex(xm[i]+13, ym[i]-33); 
      endShape();
      line(xm[i]-35, ym[i]-17, xm[i]-26, ym[i]-20);  // tochka 25
      line(xm[i]-25, ym[i]-32, xm[i]-16, ym[i]-34);  // tochka 27
      line(xm[i]+15, ym[i]+39, xm[i]+24, ym[i]+33);  // tochka 14
      line(xm[i]-23, ym[i]+25, xm[i]-33, ym[i]+15);  // tochka 17
      line(xm[i]+20, ym[i]-27, xm[i]+25, ym[i]-22);  // tochka 3
      strokeWeight(1); // arka kratera meteorita
      stroke(48);
      arc (xm[i]+5, ym[i]+23, 23, 19, PI+QUARTER_PI, TWO_PI); // arka kratera meteorita 1
      arc (xm[i]+5, ym[i]+23, 23, 19, HALF_PI, HALF_PI+QUARTER_PI); // arka kratera meteorita 1
      arc (xm[i]+25, ym[i]-11, 16, 18, PI, PI+HALF_PI); // arka kratera meteorita 2
      arc (xm[i]+25, ym[i]-11, 16, 18, TWO_PI, TWO_PI+QUARTER_PI); // arka kratera meteorita 2
      arc (xm[i]-31, ym[i]+6, 18, 14, PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI); // arka kratera meteorita 3
      strokeWeight(2); // krater meteorita
      stroke(0);
      ellipse (xm[i]+5, ym[i]+23, 16, 11); // krater meteorita 1
      ellipse (xm[i]+25, ym[i]-11, 9, 11); // krater meteorita 2
      ellipse (xm[i]-31, ym[i]+6, 11, 8); // krater meteorita 3
      fill(62, 62, 92); // teni v kratere
      noStroke();
      ellipse (xm[i]+4, ym[i]+22, 11, 7); // teni v kratere meteorita 1
      ellipse (xm[i]+25, ym[i]-13, 7, 5); // teni v kratere meteorita 2
      ellipse (xm[i]-32, ym[i]+5, 7, 4); // teni v kratere meteorita 3
      fill(202, 202, 232);   // teni svetlie
      ellipse (xm[i]-1, ym[i]-21, 11, 6); // teni svetlie meteorita 1
      ellipse (xm[i]-14, ym[i]+15, 7, 8); // teni svetlie meteorita 2
      ellipse (xm[i]+37, ym[i]+13, 6, 12); // teni svetlie meteorita 3
      noFill();
      ellipse (100, ymmm, 10, 10);//PROBA
      float rast1 = dist(xm[i], ym[i], x, y); // rasstoyanie ot nosa Shuttle do centra meteorita
      float rast2 = dist(xm[i], ym[i], x-20, y+48);
      float rast3 = dist(xm[i], ym[i], x+20, y+48);
      float rast4 = dist(xm[i], ym[i], x+30, y+96);
      float rast5 = dist(xm[i], ym[i], x-30, y+96);
      float rast6 = dist(xm[i], ym[i], x+50, y+140);
      float rast7 = dist(xm[i], ym[i], x-50, y+140);
      if (rast1>r && rast2>r && rast3>r && rast4>r && rast5>r && rast6>r && rast7>r) { 
        ym[i]+=1; // dvigenie meteoritov 
        ymmm+=0.07; // dvigenie proby
        if (ymmm>100) {
          mastab+=0.005; // kogda proba po Y bolshe 100 - na ekrane, MARS yvelichivaetsa
          x=x+((500-x)*pct);
          y=y+((-330-y)*pct);
          pct+=0.0000005;
        }
        if ((x < width-90) && (keyPressed ) && (keyCode == 39)) x+=0.5; // dvigenie Shuttle vpravo
        if ((x > 90) && (keyPressed ) && (keyCode == 37)) x-=0.5; // dvigenie Shuttle vlevo
        if (mastab>11) {
          fill(141, 180, 227);
          textAlign(CENTER, CENTER);
          textSize(150);
          text("МИССИЯ ВЫПОЛНЕНА!", width/2, -280); // missia vipolnena!
          stop();
        }
      } else {
        fill(col, 0, 0);
        textAlign(CENTER, CENTER);
        textSize(150);
        text("КОНЕЦ ИГРЫ!", width/2, 0); // igra zakoncheha!
        stop();
      }
    }
  }
  popMatrix();
}

