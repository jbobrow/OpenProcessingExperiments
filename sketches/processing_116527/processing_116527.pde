
/*
Project 1
Steven Enns
senns13153@ecuad.ca
Oct. 21, 2013
Create a fun and interesting Clock!
*/

PShape d0;      // Dice Shape 
PShape d1;
PShape d2;
PShape d3;
PShape d4;
PShape d5;
PShape d6;
PShape d7;
PShape d8;
PShape d9;
PShape d10;
PShape d11;
PShape d12;


int s1;        // Time 
int s2;
int m1;
int m2;
int h;

int s1X;       // Position 
int s1Y;
int s2X;
int s2Y;
int m1X;
int m1Y;
int m2X;
int m2Y;
int h1X;
int h1Y;
int h2X;
int h2Y;

void setup () {
    size(1000, 300);
  background(255);
  smooth();


  d0=loadShape("die0.svg");      // SVG images
  d1=loadShape("die1.svg");
  d2=loadShape("die2.svg");
  d3=loadShape("die3.svg");
  d4=loadShape("die4.svg");
  d5=loadShape("die5.svg");
  d6=loadShape("die6.svg");
  d7=loadShape("die7.svg");
  d8=loadShape("die8.svg");
  d9=loadShape("die9.svg");


  s1X = 650;                 // Positions
  s1Y = 100;
  s2X = 750;
  s2Y = 100;
  m1X = 350;
  m1Y = 100;
  m2X = 450;
  m2Y = 100;
  h1X = 50;
  h1Y = 100;
  h2X = 150;
  h2Y = 100;
}

void draw() {
  background(255);
  m1 = minute();
  m2 = minute();
  h = hour();
  s1 = second();
  s2 = second();

  

  if (h>12 && h<23) {        // 24 Time Conversion
    h=h-12;
  }



  if (h==1) {               // Hour 
    shape(d0, h1X, h1Y);
    shape(d1, h2X, h2Y);
  }
  if (h==2) {
    shape(d0, h1X, h1Y);
    shape(d2, h2X, h2Y);
  }
  if (h==3) {
    shape(d0, h1X, h1Y);
    shape(d3, h2X, h2Y);
  }
  if (h==4) {
    shape(d0, h1X, h1Y);
    shape(d4, h2X, h2Y);
  }
  if (h==5) {
    shape(d0, h1X, h1Y);
    shape(d5, h2X, h2Y);
  }
  if (h==6) {
    shape(d0, h1X, h1Y);
    shape(d6, h2X, h2Y);
  }
  if (h==7) {
    shape(d0, h1X, h1Y);
    shape(d7, h2X, h2Y);
  }
  if (h==8) {
    shape(d0, h1X, h1Y);
    shape(d8, h2X, h2Y);
  }
  if (h==9) {
    shape(d0, h1X, h1Y);
    shape(d9, h2X, h2Y);
  }
  if (h==10) {
    shape(d1, h1X, h1Y);
    shape(d0, h2X, h2Y);
  }
  if (h==11) {
    shape(d1, h1X, h1Y);
    shape(d1, h2X, h2Y);
  }
  if (h==12) {
    shape(d1, h1X, h1Y);
    shape(d2, h2X, h2Y);
  }

  

  if (m1>=0 && m1<=9) {            // Minute 1 
    shape(d0, m1X, m1Y);
  }
  if (m1>=10 && m1<=19) {
    shape(d1, m1X, m1Y);
  }
  if (m1>=20 && m1<=29) {
    shape(d2, m1X, m1Y);
  }
  if (m1>=30 && m1<=39) {
    shape(d3, m1X, m1Y);
  }
  if (m1>=40 && m1<=49) {
    shape(d4, m1X, m1Y);
  }
  if (m1>=50 && m1<=59) {
    shape(d5, m1X, m1Y);
  }


  if (m2==0 || m2==10 || m2==20 || m2==30 || m2==40 || m2==50) {            // Minute 2 
    shape(d0, m2X, m2Y);
  }
  if (m2==1 || m2==11 || m2==21 || m2==31 || m2==41 || m2==51) {
    shape(d1, m2X, m2Y);
  }
  if (m2==2 || m2==12 || m2==22 || m2==32 || m2==42 || m2==52) {
    shape(d2, m2X, m2Y);
  }
  if (m2==3 || m2==13 || m2==23 || m2==33 || m2==43 || m2==53) {
    shape(d3, m2X, m2Y);
  }
  if (m2==4 || m2==14 || m2==24 || m2==34 || m2==44 || m2==54) {
    shape(d4, m2X, m2Y);
  }
  if (m2==5 || m2==15 || m2==25 || m2==35 || m2==45 || m2==55) {
    shape(d5, m2X, m2Y);
  }
  if (m2==6 || m2==16 || m2==26 || m2==36 || m2==46 || m2==56) {
    shape(d6, m2X, m2Y);
  }
  if (m2==7 || m2==17 || m2==27 || m2==37 || m2==47 || m2==57) {
    shape(d7, m2X, m2Y);
  }
  if (m2==8 || m2==18 || m2==28 || m2==38 || m2==48 || m2==58) {
    shape(d8, m2X, m2Y);
  }
  if (m2==9 || m2==19 || m2==29 || m2==39 || m2==49 || m2==59) {
    shape(d9, m2X, m2Y);
  }
  
  
  
  if (s1>=0 && s1<=9) {            // Second 1 
    shape(d0, s1X, s1Y);
  }
  if (s1>=10 && s1<=19) {
    shape(d1, s1X, s1Y);
  }
  if (s1>=20 && s1<=29) {
    shape(d2, s1X, s1Y);
  }
  if (s1>=30 && s1<=39) {
    shape(d3, s1X, s1Y);
  }
  if (s1>=40 && s1<=49) {
    shape(d4, s1X, s1Y);
  }
  if (s1>=50 && s1<=59) {
    shape(d5, s1X, s1Y);
  }
  
  
  
   if (s2==0 || s2==10 || s2==20 || s2==30 || s2==40 || s2==50) {         // Second 2 
    shape(d0, s2X, s2Y);
  }
  if (s2==1 || s2==11 || s2==21 || s2==31 || s2==41 || s2==51) {
    shape(d1, s2X, s2Y);
  }
  if (s2==2 || s2==12 || s2==22 || s2==32 || s2==42 || s2==52) {
    shape(d2, s2X, s2Y);
  }
  if (s2==3 || s2==13 || s2==23 || s2==33 || s2==43 || s2==53) {
    shape(d3, s2X, s2Y);
  }
  if (s2==4 || s2==14 || s2==24 || s2==34 || s2==44 || s2==54) {
    shape(d4, s2X, s2Y);
  }
  if (s2==5 || s2==15 || s2==25 || s2==35 || s2==45 || s2==55) {
    shape(d5, s2X, s2Y);
  }
  if (s2==6 || s2==16 || s2==26 || s2==36 || s2==46 || s2==56) {
    shape(d6, s2X, s2Y);
  }
  if (s2==7 || s2==17 || s2==27 || s2==37 || s2==47 || s2==57) {
    shape(d7, s2X, s2Y);
  }
  if (s2==8 || s2==18 || s2==28 || s2==38 || s2==48 || s2==58) {
    shape(d8, s2X, s2Y);
  }
  if (s2==9 || s2==19 || s2==29 || s2==39 || s2==49 || s2==59) {
    shape(d9, s2X, s2Y);
  }
}



