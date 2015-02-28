
PImage Image1;
PImage Image2;
PImage Image3;
PImage Image4;
PImage Image5;
PImage Image6;
PImage Image7;
PImage Image8;
PImage Image9;
PImage Image10;
PImage Image11;
PImage Image12;
PImage Image13;
PImage Image14;
PImage Image15;
PImage Image16;
PImage Image17;
PImage Image18;
PImage Image19;
PImage Image20;
PImage Image21;
PImage Image22;
PImage Image23;
PImage Image24;
PImage Image25;
PImage Image26;
PImage Image27;
PImage Image30;

P1 startPage;

color RedColor, RedHighlight, RTextColor;
color PBColor, PBHighlight, PBSmallBoxes, PBBigBox, PButtonOuter, PBTextColor;
color GBColor, GBHighlight, GBSmallBoxes, GBBigBox, GButtonOuter, GBTextColor;
color TextColor, White, Background;
boolean RedOver = false;
boolean PurpleOver = false;
boolean GreenOver = false;
int RedX, RedY, RedSize;
int PurpleX, PurpleY, PurpleSize;
int RedPage, PurplePage, GreenPage, RedOff, PurpleOff, GreenOff, RedCounter, PurpleCounter, GreenCounter;
int BoxX, BoxY;
int GBoxX, GBoxY;
int Time, i, E, R, Y, sec1, sec2, sec3; 
int x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18;
int o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17, o18;
float TC2, TC3, TC4, TC5, TC6, TC7, TC8, TC9, TC10, TC11, TC12, TC13, TC14, TC15, TC16;
float TC17, TC18;
float P2F, P3F, P4F, P5F, P6F, P7F, P8F, P9F, P10F, P11F, P12F, P13F, P14F, P15F, P16F;
float P17F, P18F;
float Fade;


void setup() {

  smooth();
  size(1200, 800);

  startPage = new P1();

  sec1 = 735;
  sec2 = 735;
  sec3 = 116;

  RedOff = 0;
  PurpleOff = 0;
  GreenOff = 0;

  RedCounter = 0;
  PurpleCounter = 0;
  GreenCounter = 0;

  RedCounter = RedPage;
  PurpleCounter = PurplePage;
  GreenCounter = GreenPage;

  RedColor = color(155, 0, 0);        //Red Button's normal color
  RedHighlight = color(255, 0, 0);    //when the veiwer puts mouse over Red Button it turns this color
  RTextColor = color(155, 0, 0);        //Red Button's Text Color

  PBBigBox = color(41, 54, 136);         //Purple Button's Background color
  PBSmallBoxes = color(34, 48, 102);     //Purple Button's Small boxes color
  PButtonOuter = color(68, 34, 103);    //Purple Button's Outer ring around its Button's color
  PBColor = color(75, 25, 80);           //Purple Button's Normal Button Color
  PBTextColor = color(75, 25, 80);       //Purple Button's Text Color
  PBHighlight = color(190, 20, 190);      //Purple Button's Color when the viewer scrolls over it

  GBBigBox = color(26, 59, 109);         //Purple Button's Background color
  GBSmallBoxes = color(0, 86, 127);     //Purple Button's Small boxes color
  GButtonOuter = color(9, 85, 43);      //Purple Button's Outer ring around its Button's color
  GBColor = color(25, 65, 30);          //Green Button's Normal Button Color
  GBTextColor = color(25, 65, 30);        //Green Button's Text Color
  GBHighlight = color(0, 170, 20);       //Green Button's Color when the viewer scrolls over it

  TextColor = color(210, 107, 39);         //Color of Text
  White = color(255, 255, 255);            //White color used in text boxes
  Background = color(11, 20, 42);
  Fade = 255;                             //Fading Variable
  RedX = 408;
  RedY = 600;
  RedSize = 116;
  RedPage = 10;
  PurplePage = 0;
  GreenPage = 0;
  background(11, 20, 42);
  BoxX = 85;                     // Purple Button Control
  BoxY = 167;                    // X and Y Variables
  GBoxX = 425;                   // Green BUtton Control
  GBoxY = 167;                   // X and Y Variables
  Time = 0;                      //Time
  TC2 = 0.0;                       //Page 2 Button Talking Animations
  TC3 = 0.0;                       //Page 3 
  TC4 = 0.0;                       //Page 4 
  TC5 = 0.0;                       //Page 5 
  TC6 = 0.0;                       //Page 6 
  TC7 = 0.0;                       //Page 7 
  TC8 = 0.0;                       //Page 8 
  TC9 = 0.0;                       //Page 9 
  TC10 = 0.0;                      //Page 10 
  TC11 = 0.0;                      //Page 11 
  TC12 = 0.0;                      //Page 12 
  TC13 = 0.0;                      //Page 13 
  TC14 = 0.0;                      //Page 14 
  TC15 = 0.0;                      //Page 15 
  TC16 = 0.0;                      //Page 16 
  TC17 = 0.0;                      //Page 17 
  TC18 = 0.0;                      //Page 18 
  P2F = 0.0;                       //Page 2 Time and Fading
  P3F = 0.0;                       //Page 3 Time and Fading
  P4F = 0.0;                       //Page 4 Time and Fading
  P5F = 0.0;                       //Page 5 Time and Fading
  P6F = 0.0;                       //Page 6 Time and Fading
  P7F = 0.0;                       //Page 7 Time and Fading
  P8F = 0.0;                       //Page 8 Time and Fading
  P9F = 0.0;                       //Page 9 Time and Fading
  P10F = 0.0;                      //Page 10 Time and Fading
  P11F = 0.0;                      //Page 11 Time and Fading
  P12F = 0.0;                      //Page 12 Time and Fading
  P13F = 0.0;                      //Page 13 Time and Fading
  P14F = 0.0;                      //Page 14 Time and Fading
  P15F = 0.0;                      //Page 15 Time and Fading
  P16F = 0.0;                      //Page 16 Time and Fading
  P17F = 0.0;                      //Page 17 Time and Fading
  P18F = 0.0;                      //Page 18 Time and Fading
  i = 0;                         //Makes Time go forward
  //Loaded Images
  Image1 = loadImage("Image1.jpg");
  Image2 = loadImage("Image2.jpg");
  Image3 = loadImage("Image3.jpg");
  Image4 = loadImage("Image4.jpg"); 
  Image5 = loadImage("Image5.jpg"); 
  Image6 = loadImage("Image6.jpg");
  //Image7 = loadImage("Image7.jpg");
  //Image8 = loadImage("Image8.jpg"); 
  //Image9 = loadImage("Image9.jpg"); 
  //Image10 = loadImage("Image10.jpg");
  //Image11 = loadImage("Image11.jpg"); 
  //Image12 = loadImage("Image12.jpg");
  //Image13 = loadImage("Image13.jpg");
  //Image14 = loadImage("Image14.jpg");
  //Image15 = loadImage("Image15.jpg");
  //Image16 = loadImage("Image16.jpg");
  //Image17 = loadImage("Image17.jpg"); 
  //Image18 = loadImage("Image18.jpg");
  //Image19 = loadImage("Image19.jpg");
  //Image20 = loadImage("Image20.jpg");
  //Image21 = loadImage("Image21.jpg"); 
  //Image22 = loadImage("Image22.jpg");
  //Image23 = loadImage("Image23.jpg");
  //Image24 = loadImage("Image24.jpg");
  //Image25 = loadImage("Image25.jpg");
  //Image26 = loadImage("Image26.jpg");
  //Image27 = loadImage("Image27.jpg");
  //Image28 = loadImage("Image28.jpg");
  //Image29 = loadImage("Image29.jpg");
  //Image30 = loadImage("Image30.jpg");
}

void draw() {

  update(mouseX, mouseY);
  updateA(mouseX, mouseY);
  updateB(mouseX, mouseY);
  updateC(mouseX, mouseY);


  stroke(0);                                 //Purple Button Start
  strokeWeight(2);
  fill(PBBigBox);
  rect(BoxX - 2, BoxY - 2, 291, 275);
  fill(PBSmallBoxes);
  noStroke();
  rect(BoxX + 16, BoxY, 16, 16);
  rect(BoxX + 64, BoxY, 16, 16);
  rect(BoxX + 96, BoxY, 16, 16);
  rect(BoxX + 160, BoxY, 16, 16);
  rect(BoxX + 240, BoxY, 16, 16);
  rect(BoxX + 256, BoxY, 16, 16);
  rect(BoxX, BoxY + 16, 16, 16);
  rect(BoxX + 64, BoxY + 16, 16, 16);
  rect(BoxX + 112, BoxY + 16, 16, 16);
  rect(BoxX + 128, BoxY + 16, 16, 16);
  rect(BoxX + 176, BoxY + 16, 16, 16);
  rect(BoxX + 192, BoxY + 16, 16, 16);
  rect(BoxX + 224, BoxY + 16, 16, 16);
  rect(BoxX + 272, BoxY + 16, 16, 16);
  rect(BoxX + 16, BoxY + 32, 16, 16);
  rect(BoxX + 32, BoxY + 32, 16, 16);
  rect(BoxX + 144, BoxY + 32, 16, 16);
  rect(BoxX + 208, BoxY + 32, 16, 16);
  rect(BoxX, BoxY + 48, 16, 16);
  rect(BoxX + 48, BoxY + 48, 16, 16);
  rect(BoxX + 64, BoxY + 48, 16, 16);
  rect(BoxX + 80, BoxY + 48, 16, 16);
  rect(BoxX + 96, BoxY + 48, 16, 16);
  rect(BoxX + 128, BoxY + 48, 16, 16);
  rect(BoxX + 160, BoxY + 48, 16, 16);
  rect(BoxX + 208, BoxY + 48, 16, 16);
  rect(BoxX + 256, BoxY + 48, 16, 16);
  rect(BoxX + 16, BoxY + 64, 16, 16);
  rect(BoxX + 64, BoxY + 64, 16, 16);
  rect(BoxX + 112, BoxY + 64, 16, 16);
  rect(BoxX + 192, BoxY + 64, 16, 16);
  rect(BoxX + 256, BoxY + 64, 16, 16);
  rect(BoxX + 32, BoxY + 82, 16, 16);
  rect(BoxX + 48, BoxY + 82, 16, 16);
  rect(BoxX + 208, BoxY + 82, 16, 16);
  rect(BoxX + 272, BoxY + 82, 16, 16);
  rect(BoxX + 16, BoxY + 96, 16, 16);
  rect(BoxX + 64, BoxY + 96, 16, 16);
  rect(BoxX + 240, BoxY + 96, 16, 16);
  rect(BoxX + 256, BoxY + 96, 16, 16);
  rect(BoxX, BoxY + 112, 16, 16);
  rect(BoxX + 48, BoxY + 112, 16, 16);
  rect(BoxX + 224, BoxY + 112, 16, 16);
  rect(BoxX + 16, BoxY + 112, 16, 16);
  rect(BoxX + 64, BoxY + 112, 16, 16);
  rect(BoxX + 256, BoxY + 112, 16, 16);
  rect(BoxX + 32, BoxY + 128, 16, 16);
  rect(BoxX + 48, BoxY + 128, 16, 16);
  rect(BoxX + 224, BoxY + 128, 16, 16);
  rect(BoxX + 240, BoxY + 128, 16, 16); 
  rect(BoxX + 272, BoxY + 128, 16, 16);
  rect(BoxX + 16, BoxY + 144, 16, 16);
  rect(BoxX + 32, BoxY + 144, 16, 16);
  rect(BoxX + 64, BoxY + 144, 16, 16);
  rect(BoxX + 240, BoxY + 144, 16, 16);
  rect(BoxX + 272, BoxY + 144, 16, 16);
  rect(BoxX, BoxY + 160, 16, 16);
  rect(BoxX + 32, BoxY + 160, 16, 16);
  rect(BoxX + 272, BoxY + 160, 16, 16);
  rect(BoxX + 64, BoxY + 160, 16, 16);
  rect(BoxX + 208, BoxY + 160, 16, 16);
  rect(BoxX + 256, BoxY + 160, 16, 16);
  rect(BoxX + 272, BoxY + 160, 16, 16);
  rect(BoxX, BoxY + 176, 16, 16);
  rect(BoxX + 48, BoxY + 176, 16, 16);
  rect(BoxX + 208, BoxY + 176, 16, 16);
  rect(BoxX + 240, BoxY + 176, 16, 16);
  rect(BoxX + 16, BoxY + 192, 16, 16);
  rect(BoxX + 80, BoxY + 192, 16, 16);
  rect(BoxX + 112, BoxY + 192, 16, 16);
  rect(BoxX + 160, BoxY + 192, 16, 16);
  rect(BoxX + 176, BoxY + 192, 16, 16);
  rect(BoxX + 208, BoxY + 192, 16, 16);
  rect(BoxX + 256, BoxY + 192, 16, 16);
  rect(BoxX + 48, BoxY + 208, 16, 16);
  rect(BoxX + 64, BoxY + 208, 16, 16);
  rect(BoxX + 128, BoxY + 208, 16, 16);
  rect(BoxX + 160, BoxY + 208, 16, 16);
  rect(BoxX + 224, BoxY + 208, 16, 16);
  rect(BoxX + 240, BoxY + 208, 16, 16);
  rect(BoxX + 32, BoxY + 224, 16, 16);
  rect(BoxX + 80, BoxY + 224, 16, 16);
  rect(BoxX + 96, BoxY + 224, 16, 16);
  rect(BoxX + 192, BoxY + 224, 16, 16);
  rect(BoxX + 224, BoxY + 224, 16, 16);
  rect(BoxX + 256, BoxY + 224, 16, 16);
  rect(BoxX + 272, BoxY + 224, 16, 16);
  rect(BoxX + 16, BoxY + 240, 16, 16);
  rect(BoxX + 48, BoxY + 240, 16, 16);
  rect(BoxX + 112, BoxY + 240, 16, 16);
  rect(BoxX + 144, BoxY + 240, 16, 16);
  rect(BoxX + 192, BoxY + 240, 16, 16);
  rect(BoxX + 240, BoxY + 240, 16, 16);
  rect(BoxX, BoxY + 256, 16, 16);
  rect(BoxX + 48, BoxY + 256, 16, 16);
  rect(BoxX + 80, BoxY + 256, 16, 16);
  rect(BoxX + 144, BoxY + 256, 16, 16);
  rect(BoxX + 176, BoxY + 256, 16, 16);
  rect(BoxX + 208, BoxY + 256, 16, 16);
  rect(BoxX + 224, BoxY + 256, 16, 16);
  rect(BoxX + 240, BoxY + 256, 16, 16);
  rect(BoxX + 256, BoxY + 256, 16, 16);
  stroke(0);
  strokeWeight(1);
  fill(PButtonOuter);
  ellipse(BoxX + 148, BoxY + 130, 96, 96);   //Purple Button End

  stroke(0);                                 //Green Button Start
  strokeWeight(2);
  fill(GBBigBox);
  rect(GBoxX - 2, GBoxY - 2, 291, 275);
  fill(GBSmallBoxes);
  noStroke();
  rect(GBoxX + 16, GBoxY, 16, 16);
  rect(GBoxX + 64, GBoxY, 16, 16);
  rect(GBoxX + 96, GBoxY, 16, 16);
  rect(GBoxX + 160, GBoxY, 16, 16);
  rect(GBoxX + 240, GBoxY, 16, 16);
  rect(GBoxX + 256, GBoxY, 16, 16);
  rect(GBoxX, GBoxY + 16, 16, 16);
  rect(GBoxX + 64, GBoxY + 16, 16, 16);
  rect(GBoxX + 112, GBoxY + 16, 16, 16);
  rect(GBoxX + 128, GBoxY + 16, 16, 16);
  rect(GBoxX + 176, GBoxY + 16, 16, 16);
  rect(GBoxX + 192, GBoxY + 16, 16, 16);
  rect(GBoxX + 224, GBoxY + 16, 16, 16);
  rect(GBoxX + 272, GBoxY + 16, 16, 16);
  rect(GBoxX + 16, GBoxY + 32, 16, 16);
  rect(GBoxX + 32, GBoxY + 32, 16, 16);
  rect(GBoxX + 144, GBoxY + 32, 16, 16);
  rect(GBoxX + 208, GBoxY + 32, 16, 16);
  rect(GBoxX, GBoxY + 48, 16, 16);
  rect(GBoxX + 48, GBoxY + 48, 16, 16);
  rect(GBoxX + 64, GBoxY + 48, 16, 16);
  rect(GBoxX + 80, GBoxY + 48, 16, 16);
  rect(GBoxX + 96, GBoxY + 48, 16, 16);
  rect(GBoxX + 128, GBoxY + 48, 16, 16);
  rect(GBoxX + 160, GBoxY + 48, 16, 16);
  rect(GBoxX + 208, GBoxY + 48, 16, 16);
  rect(GBoxX + 256, GBoxY + 48, 16, 16);
  rect(GBoxX + 16, GBoxY + 64, 16, 16);
  rect(GBoxX + 64, GBoxY + 64, 16, 16);
  rect(GBoxX + 112, GBoxY + 64, 16, 16);
  rect(GBoxX + 192, GBoxY + 64, 16, 16);
  rect(GBoxX + 256, GBoxY + 64, 16, 16);
  rect(GBoxX + 32, GBoxY + 82, 16, 16);
  rect(GBoxX + 48, GBoxY + 82, 16, 16);
  rect(GBoxX + 208, GBoxY + 82, 16, 16);
  rect(GBoxX + 272, GBoxY + 82, 16, 16);
  rect(GBoxX + 16, GBoxY + 96, 16, 16);
  rect(GBoxX + 64, GBoxY + 96, 16, 16);
  rect(GBoxX + 240, GBoxY + 96, 16, 16);
  rect(GBoxX + 256, GBoxY + 96, 16, 16);
  rect(GBoxX, GBoxY + 112, 16, 16);
  rect(GBoxX + 48, GBoxY + 112, 16, 16);
  rect(GBoxX + 224, GBoxY + 112, 16, 16);
  rect(GBoxX + 16, GBoxY + 112, 16, 16);
  rect(GBoxX + 64, GBoxY + 112, 16, 16);
  rect(GBoxX + 256, GBoxY + 112, 16, 16);
  rect(GBoxX + 32, GBoxY + 128, 16, 16);
  rect(GBoxX + 48, GBoxY + 128, 16, 16);
  rect(GBoxX + 224, GBoxY + 128, 16, 16);
  rect(GBoxX + 240, GBoxY + 128, 16, 16); 
  rect(GBoxX + 272, GBoxY + 128, 16, 16);
  rect(GBoxX + 16, GBoxY + 144, 16, 16);
  rect(GBoxX + 32, GBoxY + 144, 16, 16);
  rect(GBoxX + 64, GBoxY + 144, 16, 16);
  rect(GBoxX + 240, GBoxY + 144, 16, 16);
  rect(GBoxX + 272, GBoxY + 144, 16, 16);
  rect(GBoxX, GBoxY + 160, 16, 16);
  rect(GBoxX + 32, GBoxY + 160, 16, 16);
  rect(GBoxX + 272, GBoxY + 160, 16, 16);
  rect(GBoxX + 64, GBoxY + 160, 16, 16);
  rect(GBoxX + 208, GBoxY + 160, 16, 16);
  rect(GBoxX + 256, GBoxY + 160, 16, 16);
  rect(GBoxX + 272, GBoxY + 160, 16, 16);
  rect(GBoxX, GBoxY + 176, 16, 16);
  rect(GBoxX + 48, GBoxY + 176, 16, 16);
  rect(GBoxX + 208, GBoxY + 176, 16, 16);
  rect(GBoxX + 240, GBoxY + 176, 16, 16);
  rect(GBoxX + 16, GBoxY + 192, 16, 16);
  rect(GBoxX + 80, GBoxY + 192, 16, 16);
  rect(GBoxX + 112, GBoxY + 192, 16, 16);
  rect(GBoxX + 160, GBoxY + 192, 16, 16);
  rect(GBoxX + 176, GBoxY + 192, 16, 16);
  rect(GBoxX + 208, GBoxY + 192, 16, 16);
  rect(GBoxX + 256, GBoxY + 192, 16, 16);
  rect(GBoxX + 48, GBoxY + 208, 16, 16);
  rect(GBoxX + 64, GBoxY + 208, 16, 16);
  rect(GBoxX + 128, GBoxY + 208, 16, 16);
  rect(GBoxX + 160, GBoxY + 208, 16, 16);
  rect(GBoxX + 224, GBoxY + 208, 16, 16);
  rect(GBoxX + 240, GBoxY + 208, 16, 16);
  rect(GBoxX + 32, GBoxY + 224, 16, 16);
  rect(GBoxX + 80, GBoxY + 224, 16, 16);
  rect(GBoxX + 96, GBoxY + 224, 16, 16);
  rect(GBoxX + 192, GBoxY + 224, 16, 16);
  rect(GBoxX + 224, GBoxY + 224, 16, 16);
  rect(GBoxX + 256, GBoxY + 224, 16, 16);
  rect(GBoxX + 272, GBoxY + 224, 16, 16);
  rect(GBoxX + 16, GBoxY + 240, 16, 16);
  rect(GBoxX + 48, GBoxY + 240, 16, 16);
  rect(GBoxX + 112, GBoxY + 240, 16, 16);
  rect(GBoxX + 144, GBoxY + 240, 16, 16);
  rect(GBoxX + 192, GBoxY + 240, 16, 16);
  rect(GBoxX + 240, GBoxY + 240, 16, 16);
  rect(GBoxX, GBoxY + 256, 16, 16);
  rect(GBoxX + 48, GBoxY + 256, 16, 16);
  rect(GBoxX + 80, GBoxY + 256, 16, 16);
  rect(GBoxX + 144, GBoxY + 256, 16, 16);
  rect(GBoxX + 176, GBoxY + 256, 16, 16);
  rect(GBoxX + 208, GBoxY + 256, 16, 16);
  rect(GBoxX + 224, GBoxY + 256, 16, 16);
  rect(GBoxX + 240, GBoxY + 256, 16, 16);
  rect(GBoxX + 256, GBoxY + 256, 16, 16);
  stroke(0);
  strokeWeight(1);
  fill(GButtonOuter);
  ellipse(GBoxX + 148, GBoxY + 130, 96, 96);                 //Green Button End



  if (RedOver) {                             //Switches Red Start
    fill(RedHighlight);
  } 
  else {
    fill(RedColor);
  }
  stroke(0);
  ellipse(RedX, RedY, RedSize, RedSize);        //Switches Red End

  if (PurpleOver) {                             //Switches Purple Start
    fill(PBHighlight);
  } 
  else {
    fill(PBColor);
  }
  stroke(0);
  ellipse(BoxX + 148, BoxY + 130, 80, 80);     //Switches Purple End

  if (GreenOver) {                             //Switches Green Start
    fill(GBHighlight);
  } 
  else {
    fill(GBColor);
  }
  stroke(0);
  ellipse(GBoxX + 148, GBoxY + 130, 80, 80);     //Switches Green End

  if (GButtonOuter == GBHighlight) {               //Fix for Outer Button Glitch Start   
    E = 1;
    R = 0;
  } 
  else if (PButtonOuter == PBHighlight) {
    E = 0;
    R = 1;
  }                                                //Fix for Outer Button Glitch End







  switch (R) {
  case 1:
    GButtonOuter = GBColor;
  }
  switch (E) {
  case 1:
    PButtonOuter = PBColor;
  }

  Time += 1;                                    //Talking Animation Variables Start

  if (x2 == 100) {                        
    TC2 = TC2 + 1.0;
    x2 = 0;
  }
  if (x3 == 100) {
    TC3 = TC3 + 1.0;
    x3 = 0;
  }
  if (x4 == 100) {
    TC4 = TC4 + 1.0;
    x4 = 0;
  }
  if (x5 == 100) {
    TC5 = TC5 + 1.0;
    x5 = 0;
  }
  if (x6 == 100) {
    TC6 = TC6 + 1.0;
    x6 = 0;
  }
  if (x7 == 100) {
    TC7 = TC7 + 1.0;
    x7 = 0;
  }
  if (x8 == 100) {
    TC8 = TC8 + 1.0;
    x8 = 0;
  }
  if (x9 == 100) {
    TC9 = TC9 + 1.0;
    x9 = 0;
  }
  if (x10 == 100) {
    TC10 = TC10 + 1.0;
    x10 = 0;
  }
  if (x11 == 100) {
    TC11 = TC11 + 1.0;
    x11 = 0;
  }
  if (x12 == 100) {
    TC12 = TC12 + 1.0;
    x12 = 0;
  }
  if (x13 == 100) {
    TC13 = TC13 + 0.10;
    x13 = 0;
  }
  if (x14 == 100) {
    TC14 = TC14 + 1.0;
    x14 = 0;
  }
  if (x15 == 100) {
    TC15 = TC15 + 1.0;
    x15 = 0;
  }
  if (x16 == 100) {
    TC16 = TC16 + 1.0;
    x16 = 0;
  }
  if (x17 == 100) {
    TC17 = TC17 + 1.0;
    x17 = 0;
  }
  if (x18 == 100) {
    TC18 = TC18 + 1.0;
    x18 = 0;
  }                                             //Talking Animation Variables End
}


void update(int x, int y) {
  if ( overCircle(RedX, RedY, RedSize) ) {
    RedOver = true;
  } 
  else {
    RedOver = false;
  }

  if ( overCircle(BoxX + 148, BoxY + 130, 80) ) {
    PurpleOver = true;
  } 
  else {
    PurpleOver = false;
  }

  if ( overCircle(GBoxX + 148, GBoxY + 130, 80) ) {
    GreenOver = true;
  } 
  else {
    GreenOver = false;
  }


  //----------------------------------------------------------------------------------------
  switch(RedPage) {
  case 10:                                //Page 1 Start
    background(Background);
    startPage.display();
    Fade = 255;
    RedX = 408;
    RedY = 600;
    BoxX = 85;
    BoxY = 167;
    GBoxX = 425;
    GBoxY = 167;
    RedSize = 116;
    RedX = 408;
    RedY = 600;
    RedCounter = 0;
    PurpleCounter = 0;
    GreenCounter = 0;
    TC2 = 0.0;                       //Page 2 Button Talking Animations
    TC3 = 0.0;                       //Page 3 
    TC4 = 0.0;                       //Page 4 
    TC5 = 0.0;                       //Page 5 
    TC6 = 0.0;                       //Page 6 
    TC7 = 0.0;                       //Page 7 
    TC8 = 0.0;                       //Page 8 
    TC9 = 0.0;                       //Page 9 
    TC10 = 0.0;                      //Page 10 
    TC11 = 0.0;                      //Page 11 
    TC12 = 0.0;                      //Page 12 
    TC13 = 0.0;                      //Page 13 
    TC14 = 0.0;                      //Page 14 
    TC15 = 0.0;                      //Page 15 
    TC16 = 0.0;                      //Page 16 
    TC17 = 0.0;                      //Page 17 
    TC18 = 0.0;                      //Page 18 
    P2F = 0.0;                       //Page 2 Time and Fading
    P3F = 0.0;                       //Page 3 Time and Fading
    P4F = 32.0;                       //Page 4 Time and Fading
    P5F = 0.0;                       //Page 5 Time and Fading
    P6F = 0.0;                       //Page 6 Time and Fading
    P7F = 0.0;                       //Page 7 Time and Fading
    P8F = 0.0;                       //Page 8 Time and Fading
    P9F = 0.0;                       //Page 9 Time and Fading
    P10F = 0.0;                      //Page 10 Time and Fading
    P11F = 0.0;                      //Page 11 Time and Fading
    P12F = 0.0;                      //Page 12 Time and Fading
    P13F = 0.0;                      //Page 13 Time and Fading
    P14F = 0.0;                      //Page 14 Time and Fading
    P15F = 0.0;                      //Page 15 Time and Fading
    P16F = 0.0;                      //Page 16 Time and Fading
    P17F = 0.0;                      //Page 17 Time and Fading
    P18F = 0.0;

    break;
    //Page 1 End
    //-----------------------------------------------------------------------------------------    

  case 1:                                    //Page2 Start
    smooth();
    background(Background);
    fill(255, 255, 255);
    noStroke();
    rect(800, 50, 390, 700);
    triangle(810, 750, 795, 755, 810, 735);
    fill(0, 0, 0);
    text("No Image", 920, 400);
    Fade = 255;
    fill(255, 255, 255);
    textSize(14);
    text("Page 2", 20, 20);
    text("Time", 20, 40);
    text(P2F, 58, 40);

    o2 += 1;                          //Things that need to increase over time Start
    x2 += 1;                          //Things that need to increase over time End

    if (o2 == 10) {                          //Time and Fading Variables Start
      P2F = P2F + 0.10;
      o2 = 0;
    }                                        //Time and Fading Variables End

    RedX = 735;
    RedY = 735;
    BoxY = 67;
    GBoxY = 67;
    if (TC2 <= 15.0) {                          //Talking Animation Start
      switch(x2) {
      case 20:
        PButtonOuter = PBHighlight;
        break;
      case 50:
        PButtonOuter = color(68, 34, 103);
        break;
      case 55:
        PButtonOuter = PBHighlight;
        break;
      case 75:
        PButtonOuter = color(68, 34, 103);
        break;
      }                                          //Talking Animation End
    }

    if ((P2F >= 0.0) && (P2F < 7.7)) {

      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 660, 260);
      textSize(32);
      Fade = 255;
      fill(PBTextColor, Fade);
      text("Purple Button", 350, 450);
      fill(GBTextColor, Fade);
      text("Green Button", 120, 500);
      fill(RTextColor, Fade);
      text("Red Button", 315, 550);
      fill(TextColor, Fade);
      text("Don't click on that loser at the bottom", 90, 400);
      text("and", 570, 450);
      text("of the screen,", 130, 450);
      text("command you not to...", 330, 500);
      text("just ignore", 140, 550);
      text("down at the", 490, 550);
      text("bottem of the screen he is not important.", 90, 600);
    }
    else if ((P2F >= 7.7) && (P2F < 7.8)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 200;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 660, 260);
      textSize(32);

      fill(PBTextColor, Fade);
      text("Purple Button", 350, 450);
      fill(GBTextColor, Fade);
      text("Green Button", 120, 500);
      fill(RTextColor, Fade);
      text("Red Button", 315, 550);
      fill(TextColor, Fade);
      text("Don't click on that loser at the bottom", 90, 400);
      text("and", 570, 450);
      text("of the screen,", 130, 450);
      text("command you not to...", 330, 500);
      text("just ignore", 140, 550);
      text("down at the", 490, 550);
      text("bottem of the screen he is not important.", 90, 600);
    } 
    else if ((P2F >= 7.8) && (P2F < 7.9)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 150;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 660, 260);
      textSize(32);

      fill(PBTextColor, Fade);
      text("Purple Button", 350, 450);
      fill(GBTextColor, Fade);
      text("Green Button", 120, 500);
      fill(RTextColor, Fade);
      text("Red Button", 315, 550);
      fill(TextColor, Fade);
      text("Don't click on that loser at the bottom", 90, 400);
      text("and", 570, 450);
      text("of the screen,", 130, 450);
      text("command you not to...", 330, 500);
      text("just ignore", 140, 550);
      text("down at the", 490, 550);
      text("bottem of the screen he is not important.", 90, 600);
    } 
    else if ((P2F >= 7.9) && (P2F < 8.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 100;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 660, 260);
      textSize(32);

      fill(PBTextColor, Fade);
      text("Purple Button", 350, 450);
      fill(GBTextColor, Fade);
      text("Green Button", 120, 500);
      fill(RTextColor, Fade);
      text("Red Button", 315, 550);
      fill(TextColor, Fade);
      text("Don't click on that loser at the bottom", 90, 400);
      text("and", 570, 450);
      text("of the screen,", 130, 450);
      text("command you not to...", 330, 500);
      text("just ignore", 140, 550);
      text("down at the", 490, 550);
      text("bottem of the screen he is not important.", 90, 600);
    } 
    else if ((P2F >= 8.0) && (P2F < 8.3)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 0;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 660, 260);
      textSize(32);

      fill(PBTextColor, Fade);
      text("Purple Button", 350, 450);
      fill(GBTextColor, Fade);
      text("Green Button", 120, 500);
      fill(RTextColor, Fade);
      text("Red Button", 315, 550);
      fill(TextColor, Fade);
      text("Don't click on that loser at the bottom", 90, 400);
      text("and", 570, 450);
      text("of the screen,", 130, 450);
      text("command you not to...", 330, 500);
      text("just ignore", 140, 550);
      text("down at the", 490, 550);
      text("bottem of the screen he is not important.", 90, 600);
    }
    else if ((P2F >= 8.3) && (P2F < 11.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 560, 180);
      textSize(32);

      fill(GBTextColor, Fade);
      text("Green Button", 210, 480);
      fill(TextColor, Fade);
      text("I mean you shouldn't pay attention", 90, 400);
      text("to such an inferior button, I mean", 90, 440);
      text("look at", 90, 480);
      text("and I; we are", 420, 480);
      text("clearly superior in every way...", 120, 520);
    }
    else if ((P2F >= 11.0) && (P2F < 16.7)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 560, 180);
      triangle(660, 330, 653, 570, 650, 570);
      rect(300, 560, 380, 140);
      textSize(32);

      fill(GBTextColor, Fade);
      text("Green Button", 210, 480);
      fill(TextColor, Fade);
      text("I mean you shouldn't pay attention", 90, 400);
      text("to such an inferior button, I mean", 90, 440);
      text("look at", 90, 480);
      text("and I; we are", 420, 480);
      text("clearly superior in every way...", 120, 520);
      text("ya we're way better, we", 310, 600);
      text("have awesome boxes", 330, 640);
      text("around us and...", 380, 680);
    }
    else if ((P2F >= 16.7) && (P2F < 16.8)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 200;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 560, 180);
      triangle(660, 330, 653, 570, 650, 570);
      rect(300, 560, 380, 140);
      textSize(32);

      fill(GBTextColor, Fade);
      text("Green Button", 210, 480);
      fill(TextColor, Fade);
      text("I mean you shouldn't pay attention", 90, 400);
      text("to such an inferior button, I mean", 90, 440);
      text("look at", 90, 480);
      text("and I; we are", 420, 480);
      text("clearly superior in every way...", 120, 520);
      text("ya we're way better, we", 310, 600);
      text("have awesome boxes", 330, 640);
      text("around us and...", 380, 680);
    }
    else if ((P2F >= 16.8) && (P2F < 16.9)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 150;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 560, 180);
      triangle(660, 330, 653, 570, 650, 570);
      rect(300, 560, 380, 140);
      textSize(32);

      fill(GBTextColor, Fade);
      text("Green Button", 210, 480);
      fill(TextColor, Fade);
      text("I mean you shouldn't pay attention", 90, 400);
      text("to such an inferior button, I mean", 90, 440);
      text("look at", 90, 480);
      text("and I; we are", 420, 480);
      text("clearly superior in every way...", 120, 520);
      text("ya we're way better, we", 310, 600);
      text("have awesome boxes", 330, 640);
      text("around us and...", 380, 680);
    }
    else if ((P2F >= 16.9) && (P2F < 17.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 100;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 560, 180);
      triangle(660, 330, 653, 570, 650, 570);
      rect(300, 560, 380, 140);
      textSize(32);

      fill(GBTextColor, Fade);
      text("Green Button", 210, 480);
      fill(TextColor, Fade);
      text("I mean you shouldn't pay attention", 90, 400);
      text("to such an inferior button, I mean", 90, 440);
      text("look at", 90, 480);
      text("and I; we are", 420, 480);
      text("clearly superior in every way...", 120, 520);
      text("ya we're way better, we", 310, 600);
      text("have awesome boxes", 330, 640);
      text("around us and...", 380, 680);
    }
    else if ((P2F >= 17.0) && (P2F < 17.3)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 0;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 560, 180);
      triangle(660, 330, 653, 570, 650, 570);
      rect(300, 560, 380, 140);
      textSize(32);

      fill(GBTextColor, Fade);
      text("Green Button", 210, 480);
      fill(TextColor, Fade);
      text("I mean you shouldn't pay attention", 90, 400);
      text("to such an inferior button, I mean", 90, 440);
      text("look at", 90, 480);
      text("and I; we are", 420, 480);
      text("clearly superior in every way...", 120, 520);
      text("ya we're way better, we", 310, 600);
      text("have awesome boxes", 330, 640);
      text("around us and...", 380, 680);
    }
    else if ((P2F >= 17.3) && (P2F < 20.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 560, 140);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 460, 440);
      fill(TextColor, Fade);
      text("And when we talk the sides of our", 160, 400);
      text("button light up,", 210, 440);
      text("doesn't have that", 300, 480);
    }
    else if ((P2F >= 20.0) && (P2F < 25.7)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 560, 140);
      triangle(110, 330, 103, 560, 100, 560);
      rect(80, 510, 560, 220);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 460, 440);
      fill(TextColor, Fade);
      text("And when we talk the sides of our", 160, 400);
      text("button light up,", 210, 440);
      text("doesn't have that", 300, 480);
      text("Now that we have proven how", 110, 550);
      text("awesome we are lets continue the", 90, 590);
      text("the test, click on me because I'm", 100, 630);
      text("obviously the most important", 130, 670);
      text("button here...", 240, 710);
    }
    else if ((P2F >= 25.7) && (P2F < 25.8)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 200;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 560, 140);
      triangle(110, 330, 103, 560, 100, 560);
      rect(80, 510, 560, 220);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 460, 440);
      fill(TextColor, Fade);
      text("And when we talk the sides of our", 160, 400);
      text("button light up,", 210, 440);
      text("doesn't have that", 300, 480);
      text("Now that we have proven how", 110, 550);
      text("awesome we are lets continue the", 90, 590);
      text("the test, click on me because I'm", 100, 630);
      text("obviously the most important", 130, 670);
      text("button here...", 240, 710);
    }
    else if ((P2F >= 25.8) && (P2F < 25.9)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 150;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 560, 140);
      triangle(110, 330, 103, 560, 100, 560);
      rect(80, 510, 560, 220);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 460, 440);
      fill(TextColor, Fade);
      text("And when we talk the sides of our", 160, 400);
      text("button light up,", 210, 440);
      text("doesn't have that", 300, 480);
      text("Now that we have proven how", 110, 550);
      text("awesome we are lets continue the", 90, 590);
      text("the test, click on me because I'm", 100, 630);
      text("obviously the most important", 130, 670);
      text("button here...", 240, 710);
    }
    else if ((P2F >= 25.9) && (P2F < 26.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 100;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 560, 140);
      triangle(110, 330, 103, 560, 100, 560);
      rect(80, 510, 560, 220);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 460, 440);
      fill(TextColor, Fade);
      text("And when we talk the sides of our", 160, 400);
      text("button light up,", 210, 440);
      text("doesn't have that", 300, 480);
      text("Now that we have proven how", 110, 550);
      text("awesome we are lets continue the", 90, 590);
      text("the test, click on me because I'm", 100, 630);
      text("obviously the most important", 130, 670);
      text("button here...", 240, 710);
    }
    else if ((P2F >= 26.0) && (P2F < 26.3)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 0;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 560, 140);
      triangle(110, 330, 103, 560, 100, 560);
      rect(80, 510, 560, 220);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 460, 440);
      fill(TextColor, Fade);
      text("And when we talk the sides of our", 160, 400);
      text("button light up,", 210, 440);
      text("doesn't have that", 300, 480);
      text("Now that we have proven how", 110, 550);
      text("awesome we are lets continue the", 90, 590);
      text("the test, click on me because I'm", 100, 630);
      text("obviously the most important", 130, 670);
      text("button here...", 240, 710);
    }
    else if ((P2F >= 26.3) && (P2F < 28.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 470, 140);
      textSize(32);

      fill(TextColor, Fade);
      text("What a load, I'm the one that", 160, 400);
      text("grades this IQ test, they", 190, 440);
      text("should be clicking on me!", 180, 480);
    }
    else if ((P2F >= 28.0) && (P2F < 30.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 470, 140);
      triangle(110, 330, 103, 560, 100, 560);
      rect(80, 510, 520, 140);
      textSize(32);

      fill(TextColor, Fade);
      text("What a load, I'm the one that", 160, 400);
      text("grades this IQ test, they", 190, 440);
      text("should be clicking on me!", 180, 480);
      text("Really because the last time I", 120, 550);
      text("checked I had a say in their final", 90, 590);
      text("grade as well...", 230, 630);
    }
    else if ((P2F >= 30.0) && (P2F < 37.7)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 470, 140);
      triangle(110, 330, 103, 560, 100, 560);
      rect(80, 510, 520, 140);
      triangle(615, 430, 613, 660, 610, 660);
      rect(150, 660, 510, 100);
      textSize(32);

      fill(TextColor, Fade);
      text("What a load, I'm the one that", 160, 400);
      text("grades this IQ test, they", 190, 440);
      text("should be clicking on me!", 180, 480);
      text("Really because the last time I", 120, 550);
      text("checked I had a say in their final", 90, 590);
      text("grade as well...", 230, 630);
      text("Your vote means nothing in the", 160, 700);
      text("long run, user click on me!", 190, 740);
    }
    else if ((P2F >= 37.7) && (P2F < 37.8)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 200;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 470, 140);
      triangle(110, 330, 103, 560, 100, 560);
      rect(80, 510, 520, 140);
      triangle(615, 430, 613, 660, 610, 660);
      rect(150, 660, 510, 100);
      textSize(32);

      fill(TextColor, Fade);
      text("What a load, I'm the one that", 160, 400);
      text("grades this IQ test, they", 190, 440);
      text("should be clicking on me!", 180, 480);
      text("Really because the last time I", 120, 550);
      text("checked I had a say in their final", 90, 590);
      text("grade as well...", 230, 630);
      text("Your vote means nothing in the", 160, 700);
      text("long run, user click on me!", 190, 740);
    }
    else if ((P2F >= 37.8) && (P2F < 37.9)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 150;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 470, 140);
      triangle(110, 330, 103, 560, 100, 560);
      rect(80, 510, 520, 140);
      triangle(615, 430, 613, 660, 610, 660);
      rect(150, 660, 510, 100);
      textSize(32);

      fill(TextColor, Fade);
      text("What a load, I'm the one that", 160, 400);
      text("grades this IQ test, they", 190, 440);
      text("should be clicking on me!", 180, 480);
      text("Really because the last time I", 120, 550);
      text("checked I had a say in their final", 90, 590);
      text("grade as well...", 230, 630);
      text("Your vote means nothing in the", 160, 700);
      text("long run, user click on me!", 190, 740);
    }
    else if ((P2F >= 37.9) && (P2F < 38.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 100;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 470, 140);
      triangle(110, 330, 103, 560, 100, 560);
      rect(80, 510, 520, 140);
      triangle(615, 430, 613, 660, 610, 660);
      rect(150, 660, 510, 100);
      textSize(32);

      fill(TextColor, Fade);
      text("What a load, I'm the one that", 160, 400);
      text("grades this IQ test, they", 190, 440);
      text("should be clicking on me!", 180, 480);
      text("Really because the last time I", 120, 550);
      text("checked I had a say in their final", 90, 590);
      text("grade as well...", 230, 630);
      text("Your vote means nothing in the", 160, 700);
      text("long run, user click on me!", 190, 740);
    }
    else if ((P2F >= 38.0) && (P2F < 38.3)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 0;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 470, 140);
      triangle(110, 330, 103, 560, 100, 560);
      rect(80, 510, 520, 140);
      triangle(615, 430, 613, 660, 610, 660);
      rect(150, 660, 510, 100);
      textSize(32);

      fill(TextColor, Fade);
      text("What a load, I'm the one that", 160, 400);
      text("grades this IQ test, they", 190, 440);
      text("should be clicking on me!", 180, 480);
      text("Really because the last time I", 120, 550);
      text("checked I had a say in their final", 90, 590);
      text("grade as well...", 230, 630);
      text("Your vote means nothing in the", 160, 700);
      text("long run, user click on me!", 190, 740);
    }
    else if ((P2F >= 38.3) && (P2F < 43.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 540, 220);
      textSize(32);

      fill(GBTextColor, Fade);
      text("Green Button,", 310, 400);
      fill(TextColor, Fade);
      text("Don't click on", 90, 400);
      text("who", 530, 400);
      text("knows where he's been; you'll", 110, 440);
      text("probably download some virus ", 100, 480);
      text("if you click on him...", 200, 520);
      text("you should click on me!", 160, 560);
    }
    else if ((P2F >= 43.0) && (P2F < 47.7)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 540, 220);
      triangle(660, 330, 653, 660, 650, 660);
      rect(250, 590, 430, 100);
      textSize(32);

      fill(GBTextColor, Fade);
      text("Green Button,", 310, 400);
      fill(TextColor, Fade);
      text("Don't click on", 90, 400);
      text("who", 530, 400);
      text("knows where he's been; you'll", 110, 440);
      text("probably download some virus ", 100, 480);
      text("if you click on him...", 200, 520);
      text("you should click on me!", 160, 560);
      text("LIES AND SLANDER!!!", 300, 630);
      text("My programing is flawless!", 260, 670);
    }
    else if ((P2F >= 47.7) && (P2F < 47.8)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 200;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 540, 220);
      triangle(660, 330, 653, 660, 650, 660);
      rect(250, 590, 430, 100);
      textSize(32);

      fill(GBTextColor, Fade);
      text("Green Button,", 310, 400);
      fill(TextColor, Fade);
      text("Don't click on", 90, 400);
      text("who", 530, 400);
      text("knows where he's been; you'll", 110, 440);
      text("probably download some virus ", 100, 480);
      text("if you click on him...", 200, 520);
      text("you should click on me!", 160, 560);
      text("LIES AND SLANDER!!!", 300, 630);
      text("My programing is flawless!", 260, 670);
    }
    else if ((P2F >= 47.8) && (P2F < 47.9)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 150;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 540, 220);
      triangle(660, 330, 653, 660, 650, 660);
      rect(250, 590, 430, 100);
      textSize(32);

      fill(GBTextColor, Fade);
      text("Green Button,", 310, 400);
      fill(TextColor, Fade);
      text("Don't click on", 90, 400);
      text("who", 530, 400);
      text("knows where he's been; you'll", 110, 440);
      text("probably download some virus ", 100, 480);
      text("if you click on him...", 200, 520);
      text("you should click on me!", 160, 560);
      text("LIES AND SLANDER!!!", 300, 630);
      text("My programing is flawless!", 260, 670);
    }
    else if ((P2F >= 47.9) && (P2F < 48.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 100;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 540, 220);
      triangle(660, 330, 653, 660, 650, 660);
      rect(250, 590, 430, 100);
      textSize(32);

      fill(GBTextColor, Fade);
      text("Green Button,", 310, 400);
      fill(TextColor, Fade);
      text("Don't click on", 90, 400);
      text("who", 530, 400);
      text("knows where he's been; you'll", 110, 440);
      text("probably download some virus ", 100, 480);
      text("if you click on him...", 200, 520);
      text("you should click on me!", 160, 560);
      text("LIES AND SLANDER!!!", 300, 630);
      text("My programing is flawless!", 260, 670);
    }
    else if ((P2F >= 48.0) && (P2F < 48.3)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 0;
      fill(White, Fade);
      triangle(110, 330, 103, 360, 100, 360);
      rect(80, 360, 540, 220);
      triangle(660, 330, 653, 660, 650, 660);
      rect(250, 590, 430, 100);
      textSize(32);

      fill(GBTextColor, Fade);
      text("Green Button,", 310, 400);
      fill(TextColor, Fade);
      text("Don't click on", 90, 400);
      text("who", 530, 400);
      text("knows where he's been; you'll", 110, 440);
      text("probably download some virus ", 100, 480);
      text("if you click on him...", 200, 520);
      text("you should click on me!", 160, 560);
      text("LIES AND SLANDER!!!", 300, 630);
      text("My programing is flawless!", 260, 670);
    }
    else if ((P2F >= 48.3) && (P2F < 53.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 630, 220);
      textSize(32);

      fill(TextColor, Fade);
      text("Where would I even get a virus!", 210, 400);
      text("We're trapped in this virtual", 230, 440);
      text("Nightmare! Forced to give an IQ", 200, 480);
      text("Test to complete strangers forever.", 180, 520);
      text("How would I know how smart you are!?", 160, 560);
    }
    else if ((P2F >= 53.0) && (P2F < 58.7)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 630, 220);
      triangle(110, 330, 113, 660, 110, 660);
      rect(80, 590, 530, 140);
      textSize(32);

      fill(TextColor, Fade);
      text("Where would I even get a virus!", 210, 400);
      text("We're trapped in this virtual", 230, 440);
      text("Nightmare! Forced to give an IQ", 200, 480);
      text("Test to complete strangers forever.", 180, 520);
      text("How would I know how smart you are!?", 160, 560);
      text("HAHAHA look at the cry baby,", 100, 630);
      text("lets call the wambulance...", 130, 670); 
      text("user click on me!", 200, 710);
    }
    else if ((P2F >= 58.7) && (P2F < 58.8)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 200;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 630, 220);
      triangle(110, 330, 113, 660, 110, 660);
      rect(80, 590, 530, 140);
      textSize(32);

      fill(TextColor, Fade);
      text("Where would I even get a virus!", 210, 400);
      text("We're trapped in this virtual", 230, 440);
      text("Nightmare! Forced to give an IQ", 200, 480);
      text("Test to complete strangers forever.", 180, 520);
      text("How would I know how smart you are!?", 160, 560);
      text("HAHAHA look at the cry baby,", 100, 630);
      text("lets call the wambulance...", 130, 670); 
      text("user click on me!", 200, 710);
    }
    else if ((P2F >= 58.8) && (P2F < 58.9)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 150;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 630, 220);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 630, 220);
      triangle(110, 330, 113, 660, 110, 660);
      rect(80, 590, 530, 140);
      textSize(32);

      fill(TextColor, Fade);
      text("Where would I even get a virus!", 210, 400);
      text("We're trapped in this virtual", 230, 440);
      text("Nightmare! Forced to give an IQ", 200, 480);
      text("Test to complete strangers forever.", 180, 520);
      text("How would I know how smart you are!?", 160, 560);
      text("HAHAHA look at the cry baby,", 100, 630);
      text("lets call the wambulance...", 130, 670); 
      text("user click on me!", 200, 710);
    }
    else if ((P2F >= 58.9) && (P2F < 59.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 100;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 630, 220);
      triangle(110, 330, 113, 660, 110, 660);
      rect(80, 590, 530, 140);
      textSize(32);

      fill(TextColor, Fade);
      text("Where would I even get a virus!", 210, 400);
      text("We're trapped in this virtual", 230, 440);
      text("Nightmare! Forced to give an IQ", 200, 480);
      text("Test to complete strangers forever.", 180, 520);
      text("How would I know how smart you are!?", 160, 560);
      text("HAHAHA look at the cry baby,", 100, 630);
      text("lets call the wambulance...", 130, 670); 
      text("user click on me!", 200, 710);
    }
    else if ((P2F >= 59.0) && (P2F < 59.3)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 0;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 630, 220);
      triangle(110, 330, 113, 660, 110, 660);
      rect(80, 590, 530, 140);
      textSize(32);

      fill(TextColor, Fade);
      text("Where would I even get a virus!", 210, 400);
      text("We're trapped in this virtual", 230, 440);
      text("Nightmare! Forced to give an IQ", 200, 480);
      text("Test to complete strangers forever.", 180, 520);
      text("How would I know how smart you are!?", 160, 560);
      text("HAHAHA look at the cry baby,", 100, 630);
      text("lets call the wambulance...", 130, 670); 
      text("user click on me!", 200, 710);
    }
    else if ((P2F >= 59.3) && (P2F < 65.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 600, 180);
      textSize(32);

      fill(PBTextColor, Fade);
      text("Purple Button's", 310, 480);
      fill(TextColor, Fade);
      text("You're a jerk, Fine thats the way you", 160, 400);
      text("want to play; hey user did you know", 160, 440);
      text("thats not", 160, 480);
      text("natural box", 550, 480);
      text("color; That's right he dyes his box!", 160, 520);
    }
    else if ((P2F >= 65.0) && (P2F < 71.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 600, 180);
      triangle(110, 330, 113, 660, 110, 660);
      rect(80, 550, 580, 220);
      textSize(32);

      fill(PBTextColor, Fade);
      text("Purple Button's", 310, 480);
      fill(TextColor, Fade);
      text("You're a jerk, Fine thats the way you", 160, 400);
      text("want to play; hey user did you know", 160, 440);
      text("thats not", 160, 480);
      text("natural box", 550, 480);
      text("color; That's right he dyes his box!", 160, 520);
      text("HEY! That was uncalled for, we", 120, 590);
      text("agreed that we would never speak", 110, 630);
      text("of that again! pshh... so what... I", 110, 670);
      text("dye my box, click on me, I'm the", 110, 710);
      text("best button here... click on me!", 130, 750);
    }
    else if ((P2F >= 71.0) && (P2F < 73.7)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 600, 180);
      triangle(110, 330, 113, 660, 110, 660);
      rect(80, 550, 580, 220);
      textSize(32);
      image(Image6, 800, 50);

      fill(PBTextColor, Fade);
      text("Purple Button's", 310, 480);
      fill(TextColor, Fade);
      text("You're a jerk, Fine thats the way you", 160, 400);
      text("want to play; hey user did you know", 160, 440);
      text("thats not", 160, 480);
      text("natural box", 550, 480);
      text("color; That's right he dyes his box!", 160, 520);
      text("HEY! That was uncalled for, we", 120, 590);
      text("agreed that we would never speak", 110, 630);
      text("of that again! pshh... so what... I", 110, 670);
      text("dye my box, click on me, I'm the", 110, 710);
      text("best button here... click on me!", 130, 750);
    }
    else if ((P2F >= 73.7) && (P2F < 73.8)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 200;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 600, 180);
      triangle(110, 330, 113, 660, 110, 660);
      rect(80, 550, 580, 220);
      textSize(32);
      image(Image6, 800, 50);

      fill(PBTextColor, Fade);
      text("Purple Button's", 310, 480);
      fill(TextColor, Fade);
      text("You're a jerk, Fine thats the way you", 160, 400);
      text("want to play; hey user did you know", 160, 440);
      text("thats not", 160, 480);
      text("natural box", 550, 480);
      text("color; That's right he dyes his box!", 160, 520);
      text("HEY! That was uncalled for, we", 120, 590);
      text("agreed that we would never speak", 110, 630);
      text("of that again! pshh... so what... I", 110, 670);
      text("dye my box, click on me, I'm the", 110, 710);
      text("best button here... click on me!", 130, 750);
    }
    else if ((P2F >= 73.8) && (P2F < 73.9)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 150;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 600, 180);
      triangle(110, 330, 113, 660, 110, 660);
      rect(80, 550, 580, 220);
      textSize(32);
      image(Image6, 800, 50);

      fill(PBTextColor, Fade);
      text("Purple Button's", 310, 480);
      fill(TextColor, Fade);
      text("You're a jerk, Fine thats the way you", 160, 400);
      text("want to play; hey user did you know", 160, 440);
      text("thats not", 160, 480);
      text("natural box", 550, 480);
      text("color; That's right he dyes his box!", 160, 520);
      text("HEY! That was uncalled for, we", 120, 590);
      text("agreed that we would never speak", 110, 630);
      text("of that again! pshh... so what... I", 110, 670);
      text("dye my box, click on me, I'm the", 110, 710);
      text("best button here... click on me!", 130, 750);
    }
    else if ((P2F >= 73.9) && (P2F < 74.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 100;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 600, 180);
      triangle(110, 330, 113, 660, 110, 660);
      rect(80, 550, 580, 220);
      textSize(32);
      image(Image6, 800, 50);

      fill(PBTextColor, Fade);
      text("Purple Button's", 310, 480);
      fill(TextColor, Fade);
      text("You're a jerk, Fine thats the way you", 160, 400);
      text("want to play; hey user did you know", 160, 440);
      text("thats not", 160, 480);
      text("natural box", 550, 480);
      text("color; That's right he dyes his box!", 160, 520);
      text("HEY! That was uncalled for, we", 120, 590);
      text("agreed that we would never speak", 110, 630);
      text("of that again! pshh... so what... I", 110, 670);
      text("dye my box, click on me, I'm the", 110, 710);
      text("best button here... click on me!", 130, 750);
    }
    else if ((P2F >= 74.0) && (P2F < 74.3)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 0;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 600, 180);
      triangle(110, 330, 113, 660, 110, 660);
      rect(80, 550, 580, 220);
      textSize(32);
      image(Image6, 800, 50);

      fill(PBTextColor, Fade);
      text("Purple Button's", 310, 480);
      fill(TextColor, Fade);
      text("You're a jerk, Fine thats the way you", 160, 400);
      text("want to play; hey user did you know", 160, 440);
      text("thats not", 160, 480);
      text("natural box", 550, 480);
      text("color; That's right he dyes his box!", 160, 520);
      text("HEY! That was uncalled for, we", 120, 590);
      text("agreed that we would never speak", 110, 630);
      text("of that again! pshh... so what... I", 110, 670);
      text("dye my box, click on me, I'm the", 110, 710);
      text("best button here... click on me!", 130, 750);
    }
    else if ((P2F >= 74.3) && (P2F < 77.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 600, 100);
      textSize(32);
      image(Image6, 800, 50);

      fill(RTextColor, Fade);
      text("Red Button", 160, 440);
      fill(TextColor, Fade);
      text("No one wants to click on you", 200, 400);
      text("Stop bothering the user...", 340, 440);
    }
    else if ((P2F >= 77.0) && (P2F < 80.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 600, 100);
      triangle(110, 330, 113, 500, 110, 500);
      rect(80, 470, 480, 60);
      textSize(32);
      image(Image6, 800, 50);

      fill(RTextColor, Fade);
      text("Red Button", 160, 440);
      fill(TextColor, Fade);
      text("No one wants to click on you", 200, 400);
      text("Stop bothering the user...", 340, 440);
      text("Hey is the user even here?", 90, 510);
    }
    else if ((P2F >= 80.0) && (P2F < 83.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 600, 100);
      triangle(110, 330, 113, 500, 110, 500);
      rect(80, 470, 480, 60);
      triangle(610, 430, 593, 560, 590, 560);
      rect(150, 540, 450, 100);
      textSize(32);
      image(Image6, 800, 50);

      fill(RTextColor, Fade);
      text("Red Button", 160, 440);
      fill(PBTextColor, Fade);
      text("Purple Button.", 365, 620);
      fill(TextColor, Fade);
      text("No one wants to click on you", 200, 400);
      text("Stop bothering the user...", 340, 440);
      text("Hey is the user even here?", 90, 510);
      text("Great, the user left, this is", 160, 580);
      text("All your fault", 160, 620);
    }
    else if ((P2F >= 83.0) && (P2F < 90.0)) {
      PBColor = color(75, 25, 80);
      PButtonOuter = color(68, 34, 103);
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P2F, 58, 40);
      noStroke();
      Fade = 255;
      fill(White, Fade);
      triangle(610, 330, 603, 360, 600, 360);
      rect(150, 360, 600, 100);
      triangle(110, 330, 113, 500, 110, 500);
      rect(80, 470, 480, 60);
      triangle(610, 430, 593, 560, 590, 560);
      rect(150, 540, 450, 100);
      triangle(120, 500, 113, 700, 110, 700);
      rect(80, 650, 490, 60);
      textSize(32);
      image(Image6, 800, 50);

      fill(RTextColor, Fade);
      text("Red Button", 160, 440);
      fill(PBTextColor, Fade);
      text("Purple Button.", 365, 620);
      fill(TextColor, Fade);
      text("No one wants to click on you", 200, 400);
      text("Stop bothering the user...", 340, 440);
      text("Hey is the user even here?", 90, 510);
      text("Great, the user left, this is", 160, 580);
      text("All your fault", 160, 620);
      text("Whatever just restart the Test.", 90, 690);
    }
    else if (P2F >= 90.0) {
      RedPage = 10;
    }
    break;                                    //Page 2 End

    //---------------------------------------------------------------------------------------------    

  case 2:                                     //Page 3 Start
    background(11, 20, 42);
    fill(255, 255, 255);
    noStroke();
    rect(800, 50, 390, 700);
    triangle(810, 750, 795, 755, 810, 735);
    fill(0, 0, 0);
    text("No Image", 920, 400);

    o3 += 1;                          //Things that need to increase over time Start
    x3 += 1;                          //Things that need to increase over time End


    if (o3 == 10) {                          //Time and Fading Variables Start
      P3F = P3F + 0.10;
      o3 = 0;
    }                                        //Time and Fading Variables End

    RedX = 735;
    RedY = 735;
    if (TC3 <= 15.0) {                          //Talking Animation Start
      switch(x3) {
      case 20:
        PButtonOuter = PBHighlight;
        break;
      case 50:
        PButtonOuter = color(68, 34, 103);
        break;
      case 55:
        PButtonOuter = PBHighlight;
        break;
      case 75:
        PButtonOuter = color(68, 34, 103);
        break;
      }                                          //Talking Animation End
    }
    if ((P3F >= 0.0) && (P3F < 14.7)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 3", 20, 20);
      text("Time", 20, 40);
      text(P3F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(110, 330, 103, 500, 100, 500);
      rect(20, 495, 750, 160);
      textSize(32);
      Fade = 255;

      fill(RTextColor, Fade);
      text("Red Button", 540, 535);
      fill(TextColor, Fade);
      text("Didn't I just tell you to ignore", 70, 535);
      text("remember angering the Buttons that", 90, 585);
      text("grade your IQ test is not a wise decision.", 80, 635);
    }
    else if ((P3F > 14.7) && (P3F < 14.8)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 3", 20, 20);
      text("Time", 20, 40);
      text(P3F, 58, 40);
      noStroke();
      Fade = 200;
      fill(White, Fade);
      triangle(110, 330, 103, 500, 100, 500);
      rect(20, 495, 750, 160);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 540, 535);
      fill(TextColor, Fade);
      text("Didn't I just tell you to ignore", 70, 535);
      text("remember angering the Buttons that", 90, 585);
      text("grade your IQ test is not a wise decision.", 80, 635);
    } 
    else if ((P3F > 14.8) && (P3F < 14.9)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 3", 20, 20);
      text("Time", 20, 40);
      text(P3F, 58, 40);
      noStroke();
      Fade = 150;
      fill(White, Fade);
      triangle(110, 330, 103, 500, 100, 500);
      rect(20, 495, 750, 160);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 540, 535);
      fill(TextColor, Fade);
      text("Didn't I just tell you to ignore", 70, 535);
      text("remember angering the Buttons that", 90, 585);
      text("grade your IQ test is not a wise decision.", 80, 635);
    } 
    else if ((P3F > 14.9) && (P3F < 15.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 3", 20, 20);
      text("Time", 20, 40);
      text(P3F, 58, 40);
      noStroke();
      Fade = 100;
      fill(White, Fade);
      triangle(110, 330, 103, 500, 100, 500);
      rect(20, 495, 750, 160);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 540, 535);
      fill(TextColor, Fade);
      text("Didn't I just tell you to ignore", 70, 535);
      text("remember angering the Buttons that", 90, 585);
      text("grade your IQ test is not a wise decision.", 80, 635);
    } 
    else if (P3F >= 15.0) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 3", 20, 20);
      text("Time", 20, 40);
      text(P3F, 58, 40);
      noStroke();
      Fade = 0;
      fill(White, Fade);
      triangle(110, 330, 103, 500, 100, 500);
      rect(20, 495, 750, 160);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 540, 535);
      fill(TextColor, Fade);
      text("Didn't I just tell you to ignore", 70, 535);
      text("remember angering the Buttons that", 90, 585);
      text("grade your IQ test is not a wise decision.", 80, 635);
    }
    break;                                                   //Page 3 End

    //-----------------------------------------------------------------------------------------      

    //Page 4 End

    //------------------------------------------------------------------------------------------------

    //Page 5 End
    //----------------------------------------------------------------------------------------

  case 4:
    background(11, 20, 42);                                  //Page 5 Start
    fill(255, 255, 255);
    noStroke();
    rect(800, 50, 390, 700);
    triangle(810, 750, 795, 755, 810, 735);
    fill(0, 0, 0);
    textSize(32);
    text("No Image", 920, 400);

    o5 += 1;                          //Things that need to increase over time Start
    x5 += 1;                          //Things that need to increase over time End

    if (o5 == 10) {                          //Time and Fading Variables Start
      P5F = P5F + 0.10;
      o5 = 0;
    }                                        //Time and Fading Variables End    

    RedX = 735;                           
    RedY = 735;                           
    if ((TC5 >= 0.0) && (TC5 < 7.0)) {             //Talking Animation Start
      switch(x5) {
      case 0:
        GButtonOuter = GBHighlight;
        break;
      case 5:
        GButtonOuter = color(25, 65, 30);
        break;
      case 15:
        GButtonOuter = GBHighlight;
        break;
      case 30:
        GButtonOuter = color(25, 65, 30);
        break;
      case 55:
        GButtonOuter = GBHighlight;
        break;
      case 80:
        GButtonOuter = color(25, 65, 30);
        break;
      }
    }
    else if ((TC5 > 6.0) && (TC5 < 13.0)) {
      switch(x5) {
      case 20:
        PButtonOuter = PBHighlight;
        break;
      case 50:
        PButtonOuter = color(68, 34, 103);
        break;
      case 55:
        PButtonOuter = PBHighlight;
        break;
      case 75:
        PButtonOuter = color(68, 34, 103);
        break;
      }
    }
    if ((TC5 >= 13.0) && (TC5 < 15.0)) {
      switch(x5) {
      case 0:
        GButtonOuter = GBHighlight;
        break;
      case 5:
        GButtonOuter = color(25, 65, 30);
        break;
      case 15:
        GButtonOuter = GBHighlight;
        break;
      case 30:
        GButtonOuter = color(25, 65, 30);
        break;
      case 55:
        GButtonOuter = GBHighlight;
        break;
      case 80:
        GButtonOuter = color(25, 65, 30);
        break;
      }
    }
    else if ((TC5 > 14.0) && (TC5 < 20.0)) {
      switch(x5) {
      case 20:
        PButtonOuter = PBHighlight;
        break;
      case 50:
        PButtonOuter = color(68, 34, 103);
        break;
      case 55:
        PButtonOuter = PBHighlight;
        break;
      case 75:
        PButtonOuter = color(68, 34, 103);
        break;
      }                                                //Talking Animation End
    }
    if ((P5F >= 0.0) && (P5F < 6.6)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 370, 600, 370);
      rect(40, 360, 700, 100);
      textSize(32);
      Fade = 255;

      fill(RTextColor, Fade);
      text("Red Button", 180, 420);
      fill(TextColor, Fade);
      text("Click on", 50, 420);
      text("again and I will fail you!", 360, 420);
    }
    else if ((P5F > 6.6) && (P5F < 6.7)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 370, 600, 370);
      rect(40, 360, 700, 100);
      textSize(32);
      Fade = 200;

      fill(RTextColor, Fade);
      text("Red Button", 180, 420);
      fill(TextColor, Fade);
      text("Click on", 50, 420);
      text("again and I will fail you!", 360, 420);
    }
    else if ((P5F > 6.7) && (P5F < 6.8)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 370, 600, 370);
      rect(40, 360, 700, 100);
      textSize(32);
      Fade = 150;

      fill(RTextColor, Fade);
      text("Red Button", 180, 420);
      fill(TextColor, Fade);
      text("Click on", 50, 420);
      text("again and I will fail you!", 360, 420);
    }
    else if ((P5F > 6.8) && (P5F < 6.9)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 370, 600, 370);
      rect(40, 360, 700, 100);
      textSize(32);
      Fade = 100;

      fill(RTextColor, Fade);
      text("Red Button", 180, 420);
      fill(TextColor, Fade);
      text("Click on", 50, 420);
      text("again and I will fail you!", 360, 420);
    }
    else if ((P5F > 6.9) && (P5F < 7.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 370, 600, 370);
      rect(40, 360, 700, 100);
      textSize(32);
      Fade = 0;

      fill(RTextColor, Fade);
      text("Red Button", 180, 420);
      fill(TextColor, Fade);
      text("Click on", 50, 420);
      text("again and I will fail you!", 360, 420);
    }
    else if ((P5F > 7.0) && (P5F < 13.6)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 380, 700, 150);
      textSize(32);
      Fade = 255;

      fill(TextColor, Fade);
      text("I'm sorry we have to be so stern with you,", 70, 420);
      text("but the lack of attention we are receiving", 70, 460);
      text("is very concerning to us... ", 220, 500);
    }
    else if ((P5F > 13.6) && (P5F < 13.7)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 380, 700, 150);
      textSize(32);
      Fade = 200;

      fill(TextColor, Fade);
      text("I'm sorry we have to be so stern with you,", 70, 420);
      text("but the lack of attention we are receiving", 70, 460);
      text("is very concerning to us... ", 220, 500);
    }
    else if ((P5F > 13.7) && (P5F < 13.8)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 380, 700, 150);
      textSize(32);
      Fade = 150;

      fill(TextColor, Fade);
      text("I'm sorry we have to be so stern with you,", 70, 420);
      text("but the lack of attention we are receiving", 70, 460);
      text("is very concerning to us... ", 220, 500);
    }
    else if ((P5F > 13.8) && (P5F < 13.9)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 380, 700, 150);
      textSize(32);
      Fade = 100;

      fill(TextColor, Fade);
      text("I'm sorry we have to be so stern with you,", 70, 420);
      text("but the lack of attention we are receiving", 70, 460);
      text("is very concerning to us... ", 220, 500);
    }
    else if ((P5F > 13.9) && (P5F < 14.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 380, 700, 150);
      textSize(32);
      Fade = 0;

      fill(TextColor, Fade);
      text("I'm sorry we have to be so stern with you,", 70, 420);
      text("but the lack of attention we are receiving", 70, 460);
      text("is very concerning to us... ", 220, 500);
    }
    else if ((P5F > 14.0) && (P5F < 16.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 550, 100);
      textSize(32);
      Fade = 255;

      fill(TextColor, Fade);
      text("This is boring, you're boring me...", 70, 420);
    }
    else if ((P5F > 16.0) && (P5F < 18.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 550, 100);
      triangle(660, 330, 663, 530, 660, 530);
      rect(220, 500, 500, 100);
      textSize(32);
      Fade = 255;

      fill(RTextColor, Fade);
      fill(TextColor, Fade);
      text("This is boring, you're boring me...", 70, 420);
      text("Did the user just leave?", 260, 540);
      text("What should we do now?", 260, 590);
    } 
    else if ((P5F > 18.0) && (P5F < 23.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 550, 100);
      triangle(660, 330, 663, 530, 660, 530);
      rect(220, 500, 500, 100);
      triangle(60, 380, 53, 720, 50, 720);
      rect(40, 640, 620, 90);
      textSize(32);
      Fade = 255;

      fill(RTextColor, Fade);
      text("Red Button", 50, 700);
      fill(TextColor, Fade);
      text("This is boring, you're boring me...", 70, 420);
      text("Did the user just leave?", 260, 540);
      text("What should we do now?", 260, 590);
      text("entertain us we're bored...", 230, 700);
    }                                                 
    else if ((P5F > 23.0) && (P5F < 29.0)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      RedX = sec1;                           
      RedY = sec2;
      sec1 -= 1;
    }
    else if ((P5F > 29.0) && (P5F < 30.5)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      RedX = sec1;                           
      RedY = sec2;
      sec2 -= 2;
    }
    else if ((P5F > 30.5) && (P5F < 36.4)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      RedX = sec1;                           
      RedY = sec2;
      sec1 += 1;
    }
    else if ((P5F > 36.4) && (P5F < 37.9)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      RedX = sec1;                           
      RedY = sec2;
      sec2 += 2;
    }
    else if ((P5F > 37.9) && (P5F < 40.0)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      RedX = sec1;                           
      RedY = sec2;
      sec1 -= 1.5;
    }
    else if ((P5F > 40.0) && (P5F < 42.0)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      RedX = sec1;                           
      RedY = sec2;
      sec2 -= 1;
    }
    else if ((P5F > 42.0) && (P5F < 44.0)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      RedX = sec1;                           
      RedY = sec2;
      RedSize = sec3;
      sec3 += 1;
    }
    else if ((P5F > 44.0) && (P5F < 47.0)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      RedX = sec1;                           
      RedY = sec2;
      RedSize = sec3;
      sec3 -= 1;
    }
    else if ((P5F > 47.0) && (P5F < 48.0)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      RedX = sec1;                           
      RedY = sec2;
      RedSize = sec3;
      sec3 += 1;
    }
    else if ((P5F > 48.0) && (P5F < 50.0)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      RedX = sec1;                           
      RedY = sec2;
      RedSize = sec3;
      sec1 += 1.5;
      sec2 += 1;
    }
    else if ((P5F > 50.0) && (P5F < 52.2)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      RedX = sec1;                           
      RedY = sec2;
      RedSize = sec3;
      sec1 += 1;
    }
    else if ((P5F > 52.2) && (P5F < 55.0)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 400, 60);
      textSize(32);

      fill(TextColor, Fade);
      text("Well... that was weird...", 60, 400);
    }
    else if ((P5F > 55.0) && (P5F < 58.0)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 400, 60);
      triangle(660, 330, 663, 430, 660, 430);
      rect(220, 430, 550, 60);
      textSize(32);

      fill(TextColor, Fade);
      text("Well... that was weird...", 60, 400);
      text("Ya, I've never seen that before...", 230, 470);
    }
    else if ((P5F > 58.0) && (P5F < 62.0)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 400, 60);
      triangle(660, 330, 663, 430, 660, 430);
      rect(220, 430, 550, 60);
      triangle(140, 370, 63, 510, 60, 510);
      rect(50, 500, 520, 100);
      textSize(32);

      fill(TextColor, Fade);
      text("Well... that was weird...", 60, 400);
      text("Ya, I've never seen that before...", 230, 470);
      text("Lets just restart the test and", 60, 540);
      text("pretend this never happened...", 60, 580);
    }
    else if ((P5F > 62.0) && (P5F < 70.0)) {
      fill(255, 255, 255);  
      textSize(14);        
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P5F, 58, 40);
      textSize(32);
      Fade = 255;
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 400, 60);
      triangle(660, 330, 663, 430, 660, 430);
      rect(220, 430, 550, 60);
      triangle(140, 370, 63, 510, 60, 510);
      rect(50, 500, 520, 100);
      triangle(640, 440, 663, 630, 660, 630);
      rect(420, 610, 330, 60);
      textSize(32);

      fill(TextColor, Fade);
      text("Well... that was weird...", 60, 400);
      text("Ya, I've never seen that before...", 230, 470);
      text("Lets just restart the test and", 60, 540);
      text("pretend this never happened...", 60, 580);
      text("Sounds good to me.", 430, 650);
    }
    else if (P5F >= 70.0) {
      RedPage = 10;
    }
    break;                                                   //Page 5 End

    //------------------------------------------------------------------------------------------                                 //Switches End
  }
} 









//========================================================================================
//========================================================================================
//========================================================================================








//RedPage 4 Start



void updateA(int x, int y) {
  switch (RedPage) {
  case 3:

    background(11, 20, 42);
    fill(255, 255, 255);
    noStroke();
    rect(800, 50, 390, 700);
    triangle(810, 750, 795, 755, 810, 735);
    fill(0, 0, 0);
    text("No Image", 920, 400);

    o4 += 1;                          //Things that need to increase over time Start
    x4 += 1;                          //Things that need to increase over time End

    if (o4 == 10) {                          //Time and Fading Variables Start
      P4F = P4F + 0.10;
      o4 = 0;
    }                                        //Time and Fading Variables End

    RedX = 735;
    RedY = 735;
    if (TC4 <= 5.0) {                          //Talking Animation Start
      switch(x4) {
      case 0:
        GButtonOuter = GBHighlight;
        break;
      case 5:
        GButtonOuter = color(25, 65, 30);
        break;
      case 15:
        GButtonOuter = GBHighlight;
        break;
      case 30:
        GButtonOuter = color(25, 65, 30);
        break;
      case 55:
        GButtonOuter = GBHighlight;
        break;
      case 80:
        GButtonOuter = color(25, 65, 30);
        break;
      }
    }
    else if ((TC4 >= 5.0) && (TC4 < 7.0)) {   
      image(Image1, 800, 50);
      switch(x4) {
      case 0:
        GButtonOuter = GBHighlight;
        break;
      case 5:
        GButtonOuter = color(25, 65, 30);
        break;
      case 15:
        GButtonOuter = GBHighlight;
        break;
      case 30:
        GButtonOuter = color(25, 65, 30);
        break;
      case 55:
        GButtonOuter = GBHighlight;
        break;
      case 80:
        GButtonOuter = color(25, 65, 30);
        break;
      }
    }
    else if ((TC4 > 6.0) && (TC4 < 10.0)) {
      image(Image1, 800, 50);
      switch(x4) {
      case 20:
        PButtonOuter = PBHighlight;
        break;
      case 50:
        PButtonOuter = color(68, 34, 103);
        break;
      case 55:
        PButtonOuter = PBHighlight;
        break;
      case 75:
        PButtonOuter = color(68, 34, 103);
        break;
      }
    }
    else if ((TC4 > 9.0) && (TC4 < 15.0)) { 
      image(Image2, 800, 50);
      switch(x4) {
      case 0:
        GButtonOuter = GBHighlight;
        break;
      case 5:
        GButtonOuter = color(25, 65, 30);
        break;
      case 15:
        GButtonOuter = GBHighlight;
        break;
      case 30:
        GButtonOuter = color(25, 65, 30);
        break;
      case 55:
        GButtonOuter = GBHighlight;
        break;
      case 80:
        GButtonOuter = color(25, 65, 30);
        break;
      }
    }
    else if ((TC4 > 14.0) && (TC4 < 18.0)) {
      image(Image2, 800, 50);
    }
    else if ((TC4 > 17.0) && (TC4 < 25.0)) {
      image(Image2, 800, 50);
      switch(x4) {
      case 20:
        PButtonOuter = PBHighlight;
        break;
      case 50:
        PButtonOuter = color(68, 34, 103);
        break;
      case 55:
        PButtonOuter = PBHighlight;
        break;
      case 75:
        PButtonOuter = color(68, 34, 103);
        break;
      }
    }
    else if ((TC4 > 24.5) && (TC4 < 29.0)) { 
      image(Image2, 800, 50);
      switch(x4) {
      case 0:
        GButtonOuter = GBHighlight;
        break;
      case 5:
        GButtonOuter = color(25, 65, 30);
        break;
      case 15:
        GButtonOuter = GBHighlight;
        break;
      case 30:
        GButtonOuter = color(25, 65, 30);
        break;
      case 55:
        GButtonOuter = GBHighlight;
        break;
      case 80:
        GButtonOuter = color(25, 65, 30);
        break;
      }
    }
    else if ((TC4 > 28.0) && (TC4 < 31.0)) {
      image(Image3, 800, 50);
      switch(x4) {
      case 20:
        PButtonOuter = PBHighlight;
        break;
      case 50:
        PButtonOuter = color(68, 34, 103);
        break;
      case 55:
        PButtonOuter = PBHighlight;
        break;
      case 75:
        PButtonOuter = color(68, 34, 103);
        break;
      }
    }
    else if ((TC4 > 30.0) && (TC4 < 32.0)) {
      image(Image3, 800, 50);
      switch(x4) {
      case 0:
        GButtonOuter = GBHighlight;
        break;
      case 5:
        GButtonOuter = color(25, 65, 30);
        break;
      case 15:
        GButtonOuter = GBHighlight;
        break;
      case 30:
        GButtonOuter = color(25, 65, 30);
        break;
      case 55:
        GButtonOuter = GBHighlight;
        break;
      case 80:
        GButtonOuter = color(25, 65, 30);
        break;
      }
    }
    else if ((TC4 > 31.0) && (TC4 < 35.0)) {
      image(Image3, 800, 50);
    }
    else if (TC4 > 34.5) {
      image(Image3, 800, 50);
      switch(x4) {
      case 0:
        GButtonOuter = color(25, 65, 30);
        PButtonOuter = color(68, 34, 103);
        break;
      }
    }                                          //Talking Animation End
    if ((P4F >= 0.0) && (P4F < 7.7)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 400, 600, 400);
      rect(20, 400, 750, 260);
      textSize(32);
      Fade = 255;

      fill(RTextColor, Fade);
      text("Red Button", 450, 435);
      text("Red Button", 560, 585);
      fill(PBTextColor, Fade);
      text("Purple Button", 80, 485);
      fill(TextColor, Fade);
      text("Please don't click on", 120, 435);
      text("again", 630, 435);
      text("gets violent if hes ignored", 300, 485);
      text("repeatedly, one time he glared angerly at", 65, 535);
      text("a user until their head exploded;", 45, 585);
      text("show the viewer the news article...", 125, 635);
    }
    else if ((P4F > 7.7) && (P4F < 7.8)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      noStroke();
      Fade = 200;
      fill(White, Fade);
      triangle(610, 330, 603, 400, 600, 400);
      rect(20, 400, 750, 260);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 450, 435);
      text("Red Button", 560, 585);
      fill(PBTextColor, Fade);
      text("Purple Button", 80, 485);
      fill(TextColor, Fade);
      text("Please don't click on", 120, 435);
      text("again", 630, 435);
      text("gets violent if hes ignored", 300, 485);
      text("repeatedly, one time he glared angerly at", 65, 535);
      text("a user until their head exploded;", 45, 585);
      text("show the viewer the news article...", 125, 635);
    } 
    else if ((P4F > 7.8) && (P4F < 7.9)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      noStroke();
      Fade = 150;
      fill(White, Fade);
      triangle(610, 330, 603, 400, 600, 400);
      rect(20, 400, 750, 260);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 450, 435);
      text("Red Button", 560, 585);
      fill(PBTextColor, Fade);
      text("Purple Button", 80, 485);
      fill(TextColor, Fade);
      text("Please don't click on", 120, 435);
      text("again", 630, 435);
      text("gets violent if hes ignored", 300, 485);
      text("repeatedly, one time he glared angerly at", 65, 535);
      text("a user until their head exploded;", 45, 585);
      text("show the viewer the news article...", 125, 635);
    } 
    else if ((P4F > 7.9) && (P4F < 8.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      stroke(Background);
      Fade = 100;
      fill(White, Fade);
      triangle(610, 330, 603, 400, 600, 400);
      rect(20, 400, 750, 260);
      textSize(32);

      fill(RTextColor, Fade);
      text("Red Button", 450, 435);
      text("Red Button", 560, 585);
      fill(PBTextColor, Fade);
      text("Purple Button", 80, 485);
      fill(TextColor, Fade);
      text("Please don't click on", 120, 435);
      text("again", 630, 435);
      text("gets violent if hes ignored", 300, 485);
      text("repeatedly, one time he glared angerly at", 65, 535);
      text("a user until their head exploded;", 45, 585);
      text("show the viewer the news article...", 125, 635);
    } 
    else if ((P4F >= 8.0) && (P4F < 9.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 370, 600, 370);
      rect(140, 360, 620, 100);
      textSize(32);
      Fade = 255;

      fill(TextColor, Fade);
      text("What was that? Thats not a real news ", 150, 400);
      text("article is it?", 350, 450);
    }
    else if ((P4F >= 9.0) && (P4F < 12.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      stroke(Background);
      Fade = 255;
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 370, 600, 370);
      rect(140, 360, 620, 100);
      triangle(130, 330, 63, 530, 60, 530);
      rect(40, 500, 620, 150);
      textSize(32);

      fill(TextColor, Fade);
      text("What was that? Thats not a real news ", 150, 400);
      text("article is it?", 350, 450);
      text("We didn't get our article posed on the", 50, 540);
      text("Huffington Post, it was on the Onion", 50, 590);
      text("News Network...", 250, 640);
    } 
    else if ((P4F >= 12.0) && (P4F < 16.7)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      stroke(Background);
      Fade = 255;
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 370, 600, 370);
      rect(140, 360, 620, 100);
      triangle(130, 330, 63, 530, 60, 530);
      rect(40, 500, 620, 150);
      triangle(740, 380, 653, 720, 650, 720);
      rect(40, 670, 620, 90);
      textSize(32);

      fill(TextColor, Fade);
      text("What was that? Thats not a real news ", 150, 400);
      text("article is it?", 350, 450);
      text("We didn't get our article posed on the", 50, 540);
      text("Huffington Post, it was on the Onion", 50, 590);
      text("News Network...", 250, 640);
      text("Whatever lets move on...", 150, 720);
    }
    else if ((P4F >= 16.7) && (P4F < 16.8)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      stroke(Background);
      Fade = 200;
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 370, 600, 370);
      rect(140, 360, 620, 100);
      triangle(130, 330, 63, 530, 60, 530);
      rect(40, 500, 620, 150);
      triangle(740, 380, 653, 720, 650, 720);
      rect(40, 670, 620, 90);
      textSize(32);

      fill(TextColor, Fade);
      text("What was that? Thats not a real news ", 150, 400);
      text("article is it?", 350, 450);
      text("We didn't get our article posed on the", 50, 540);
      text("Huffington Post, it was on the Onion", 50, 590);
      text("News Network...", 250, 640);
      text("Whatever lets move on...", 150, 720);
    }
    else if ((P4F >= 16.8) && (P4F < 16.9)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      stroke(Background);
      Fade = 150;
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 370, 600, 370);
      rect(140, 360, 620, 100);
      triangle(130, 330, 63, 530, 60, 530);
      rect(40, 500, 620, 150);
      triangle(740, 380, 653, 720, 650, 720);
      rect(40, 670, 620, 90);
      textSize(32);

      fill(TextColor, Fade);
      text("What was that? Thats not a real news ", 150, 400);
      text("article is it?", 350, 450);
      text("We didn't get our article posed on the", 50, 540);
      text("Huffington Post, it was on the Onion", 50, 590);
      text("News Network...", 250, 640);
      text("Whatever lets move on...", 150, 720);
    }
    else if ((P4F > 16.9) && (P4F < 17.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      stroke(Background);
      Fade = 100;
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 370, 600, 370);
      rect(140, 360, 620, 100);
      triangle(130, 330, 63, 530, 60, 530);
      rect(40, 500, 620, 150);
      triangle(740, 380, 653, 720, 650, 720);
      rect(40, 670, 620, 90);
      textSize(32);

      fill(TextColor, Fade);
      text("What was that? Thats not a real news ", 150, 400);
      text("article is it?", 350, 450);
      text("We didn't get our article posed on the", 50, 540);
      text("Huffington Post, it was on the Onion", 50, 590);
      text("News Network...", 250, 640);
      text("Whatever lets move on...", 150, 720);
    }
    else if ((P4F >= 17.0) && (P4F < 19.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      stroke(Background);
      Fade = 0;
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(610, 330, 603, 370, 600, 370);
      rect(140, 360, 620, 100);
      triangle(130, 330, 63, 530, 60, 530);
      rect(40, 500, 620, 150);
      triangle(740, 380, 653, 720, 650, 720);
      rect(40, 670, 620, 90);
      textSize(32);

      fill(TextColor, Fade);
      text("What was that? Thats not a real news ", 150, 400);
      text("article is it?", 350, 450);
      text("We didn't get our article posed on the", 50, 540);
      text("Huffington Post, it was on the Onion", 50, 590);
      text("News Network...", 250, 640);
      text("Whatever lets move on...", 150, 720);
    }
    else if ((P4F >= 19.0) && (P4F < 23.6)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 380, 650, 200);
      textSize(32);
      Fade = 255;

      fill(TextColor, Fade);
      text("Thats odd... after we stop talking the", 70, 450);
      text("page just changes by itself most of the", 70, 500);
      text("time...", 70, 550);
    }
    else if ((P4F >= 23.6) && (P4F < 23.7)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 380, 650, 200);
      textSize(32);
      Fade = 200;

      fill(TextColor, Fade);
      text("Thats odd... after we stop talking the", 70, 450);
      text("page just changes by itself most of the", 70, 500);
      text("time...", 70, 550);
    }
    else if ((P4F >= 23.7) && (P4F < 23.8)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 380, 650, 200);
      textSize(32);
      Fade = 150;

      fill(TextColor, Fade);
      text("Thats odd... after we stop talking the", 70, 450);
      text("page just changes by itself most of the", 70, 500);
      text("time...", 70, 550);
    }
    else if ((P4F >= 23.8) && (P4F < 23.9)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 380, 650, 200);
      textSize(32);
      Fade = 100;

      fill(TextColor, Fade);
      text("Thats odd... after we stop talking the", 70, 450);
      text("page just changes by itself most of the", 70, 500);
      text("time...", 70, 550);
    }
    else if ((P4F >= 23.9) && (P4F < 24.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 380, 650, 200);
      textSize(32);
      Fade = 0;

      fill(TextColor, Fade);
      text("Thats odd... after we stop talking the", 70, 450);
      text("page just changes by itself most of the", 70, 500);
      text("time...", 70, 550);
    }
    else if ((P4F >= 24.0) && (P4F < 26.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 570, 100);
      textSize(32);
      Fade = 255;

      fill(TextColor, Fade);
      text("well this is awkward...", 70, 400);
      text("I swear this doesn't happen a lot...", 70, 440);
    }
    else if ((P4F >= 26.0) && (P4F < 29.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 570, 100);
      triangle(660, 330, 663, 500, 660, 500);
      rect(220, 480, 530, 70);
      textSize(32);
      Fade = 255;

      fill(TextColor, Fade);
      text("well this is awkward...", 70, 400);
      text("I swear this doesn't happen a lot...", 70, 440);
      text("What should we do now?", 240, 520);
    } 
    else if ((P4F >= 29.0) && (P4F < 31.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 570, 100);
      triangle(660, 330, 663, 500, 660, 500);
      rect(220, 480, 530, 70);
      triangle(140, 400, 63, 600, 60, 600);
      rect(50, 570, 580, 70);
      textSize(32);
      Fade = 255;

      fill(TextColor, Fade);
      text("well this is awkward...", 70, 400);
      text("I swear this doesn't happen a lot...", 70, 440);
      text("What should we do now?", 240, 520);
      text("not sure... want to play kenect four?", 60, 610);
    }
    else if ((P4F >= 31.0) && (P4F < 32.6)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 570, 100);
      triangle(660, 330, 663, 500, 660, 500);
      rect(220, 480, 530, 70);
      triangle(140, 400, 63, 600, 60, 600);
      rect(50, 570, 580, 70);
      triangle(700, 500, 643, 670, 640, 670);
      rect(420, 660, 230, 70);
      textSize(32);
      Fade = 255;

      fill(TextColor, Fade);
      text("well this is awkward...", 70, 400);
      text("I swear this doesn't happen a lot...", 70, 440);
      text("What should we do now?", 240, 520);
      text("not sure... want to play kenect four?", 60, 610);
      text("ya sure...", 440, 700);
    }
    else if ((P4F >= 32.6) && (P4F < 32.7)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 570, 100);
      triangle(660, 330, 663, 500, 660, 500);
      rect(220, 480, 530, 70);
      triangle(140, 400, 63, 600, 60, 600);
      rect(50, 570, 580, 70);
      triangle(700, 500, 643, 670, 640, 670);
      rect(420, 660, 230, 70);
      textSize(32);
      Fade = 200;

      fill(TextColor, Fade);
      text("well this is awkward...", 70, 400);
      text("I swear this doesn't happen a lot...", 70, 440);
      text("What should we do now?", 240, 520);
      text("not sure... want to play kenect four?", 60, 610);
      text("ya sure...", 440, 700);
    }
    else if ((P4F >= 32.7) && (P4F < 32.8)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 570, 100);
      triangle(660, 330, 663, 500, 660, 500);
      rect(220, 480, 530, 70);
      triangle(140, 400, 63, 600, 60, 600);
      rect(50, 570, 580, 70);
      triangle(700, 500, 643, 670, 640, 670);
      rect(420, 660, 230, 70);
      textSize(32);
      Fade = 150;

      fill(TextColor, Fade);
      text("well this is awkward...", 70, 400);
      text("I swear this doesn't happen a lot...", 70, 440);
      text("What should we do now?", 240, 520);
      text("not sure... want to play kenect four?", 60, 610);
      text("ya sure...", 440, 700);
    }
    else if ((P4F >= 32.8) && (P4F < 32.9)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(White, Fade);
      triangle(140, 330, 63, 390, 60, 390);
      rect(50, 360, 570, 100);
      triangle(660, 330, 663, 500, 660, 500);
      rect(220, 480, 530, 70);
      triangle(140, 400, 63, 600, 60, 600);
      rect(50, 570, 580, 70);
      triangle(700, 500, 643, 670, 640, 670);
      rect(420, 660, 230, 70);
      textSize(32);
      Fade = 100;

      fill(TextColor, Fade);
      text("well this is awkward...", 70, 400);
      text("I swear this doesn't happen a lot...", 70, 440);
      text("What should we do now?", 240, 520);
      text("not sure... want to play kenect four?", 60, 610);
      text("ya sure...", 440, 700);
    }
    else if ((P4F >= 32.9) && (P4F < 33.0)) {
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
    }
    else if ((P4F >= 33.0) && (P4F <= 33.1)) {
      fill(255, 255, 255); 
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
    }
    else if ((P4F >= 33.1) && (P4F < 33.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 435, 50, 50);
    }
    else if ((P4F > 33.2) && (P4F < 33.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 490, 50, 50);
    }
    else if ((P4F > 33.3) && (P4F < 33.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F > 33.4) && (P4F < 33.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 600, 50, 50);
    }
    else if ((P4F > 33.5) && (P4F < 33.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 655, 50, 50);
    }
    else if ((P4F > 33.6) && (P4F < 33.7)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
    }
    else if ((P4F >= 33.7) && (P4F < 34.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
    }
    else if ((P4F >= 34.0) && (P4F < 34.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 435, 50, 50);
    }
    else if ((P4F > 34.1) && (P4F < 34.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 490, 50, 50);
    }
    else if ((P4F > 34.2) && (P4F < 34.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 545, 50, 50);
    }
    else if ((P4F > 34.3) && (P4F < 34.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 600, 50, 50);
    }
    else if ((P4F > 34.4) && (P4F < 34.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 655, 50, 50);
    }
    else if ((P4F > 34.5) && (P4F < 34.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
    }
    else if ((P4F > 34.6) && (P4F < 34.7)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
    }
    else if ((P4F >= 34.7) && (P4F < 35.0)) {
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
    }
    else if ((P4F >= 35.0) && (P4F < 35.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 435, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
    }
    else if ((P4F > 35.1) && (P4F < 35.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 490, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
    }
    else if ((P4F > 35.2) && (P4F < 35.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 545, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
    }
    else if ((P4F > 35.3) && (P4F < 35.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
    }
    else if ((P4F > 35.4) && (P4F < 35.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
    }
    else if ((P4F > 35.5) && (P4F < 35.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
    }
    else if ((P4F > 35.6) && (P4F < 36.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
    }
    else if ((P4F >= 36.0) && (P4F < 36.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 435, 50, 50);
    }
    else if ((P4F > 36.1) && (P4F < 36.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 490, 50, 50);
    }
    else if ((P4F > 36.2) && (P4F < 36.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 545, 50, 50);
    }
    else if ((P4F > 36.3) && (P4F < 36.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 600, 50, 50);
    }
    else if ((P4F > 36.4) && (P4F < 36.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 655, 50, 50);
    }
    else if ((P4F > 36.5) && (P4F < 36.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
    }
    else if ((P4F > 36.6) && (P4F < 37.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
    }
    else if ((P4F >= 37.0) && (P4F < 37.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 435, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
    }
    else if ((P4F > 37.1) && (P4F < 37.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 490, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
    }
    else if ((P4F > 37.2) && (P4F < 37.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 545, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
    }
    else if ((P4F > 37.3) && (P4F < 37.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
    }
    else if ((P4F > 37.4) && (P4F < 37.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
    }
    else if ((P4F > 37.5) && (P4F < 37.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
    }
    else if ((P4F > 37.6) && (P4F < 38.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
    }
    else if ((P4F >= 38.0) && (P4F < 38.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 435, 50, 50);
    }
    else if ((P4F > 38.1) && (P4F < 38.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 490, 50, 50);
    }
    else if ((P4F > 38.2) && (P4F < 38.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 545, 50, 50);
    }
    else if ((P4F > 38.3) && (P4F < 38.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 600, 50, 50);
    }
    else if ((P4F > 38.4) && (P4F < 38.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 655, 50, 50);
    }
    else if ((P4F > 38.5) && (P5F < 38.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
    }
    else if ((P4F > 38.6) && (P4F < 39.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
    }
    else if ((P4F > 38.6) && (P4F < 39.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    
    /////////////////////////////////////////////////////////////////////////////////////

    /////////////////////////////////////////////////////////////////////////////////
    
   ////////////////////////////////////////////////////////////////////////
    
   ////////////////////////////////////////////////////////////////////////// 
    
  //////////////////////////////////////////////////////////////////////////  
    
    ///////////////////////////////////////////////////////////////////////////////
    
                                   // PART IN QUESTION START.

    /////////////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////////
    
    ///////////////////////////////////////////////////////////////////
    
    ////////////////////////////////////////////////////////////////////
    
    ///////////////////////////////////////////////////////////////////////////
    
    /////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////////
    
    ///////////////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////////////////
    
    ////////////////////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////////////////
    
    /////////////////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////////////////////
    
    
    else if ((P4F > 39.0) && (P4F < 39.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 435, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
    }
    else if ((P4F > 39.1) && (P4F < 39.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 490, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
    }
    else if ((P4F > 39.2) && (P4F < 39.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 545, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
    }
    else if ((P4F > 39.3) && (P4F < 39.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
    }
    else if ((P4F > 39.4) && (P4F < 39.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
    }
    else if ((P4F > 39.5) && (P4F < 39.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
    }
    else if ((P5F > 39.6) && (P5F < 40.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
    }
    else if ((P4F >= 40.0) && (P4F < 40.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 435, 50, 50);
    }
    else if ((P4F > 40.1) && (P4F < 40.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 490, 50, 50);
    }
    else if ((P4F > 40.2) && (P4F < 40.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F > 40.3) && (P4F < 40.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 600, 50, 50);
    }
    else if ((P4F > 40.4) && (P4F < 40.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
    }
    else if ((P4F > 40.5) && (P4F < 40.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
    }
    else if ((P4F > 40.6) && (P4F < 41.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
    }
    else if ((P4F >= 41.0) && (P4F < 41.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 435, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
    }
    else if ((P4F > 41.1) && (P4F < 41.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 490, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
    }
    else if ((P4F > 41.2) && (P4F < 41.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 545, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
    }
    else if ((P4F > 41.3) && (P4F < 41.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
    }
    else if ((P4F > 41.4) && (P4F < 41.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
    }
    else if ((P4F > 41.5) && (P4F < 41.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
    }
    else if ((P4F > 41.6) && (P4F < 42.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
    }
    else if ((P4F >= 42.0) && (P4F < 42.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 435, 50, 50);
    }
    else if ((P4F > 42.1) && (P4F < 42.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 490, 50, 50);
    }
    else if ((P4F > 42.2) && (P4F < 42.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 545, 50, 50);
    }
    else if ((P4F > 42.3) && (P4F < 42.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 600, 50, 50);
    }
    else if ((P4F > 42.4) && (P4F < 42.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 655, 50, 50);
    }
    else if ((P4F > 42.5) && (P4F < 42.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
    }
    else if ((P4F > 42.6) && (P4F < 43.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
    }
    else if ((P4F >= 43.0) && (P4F < 43.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 435, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
    }
    else if ((P4F > 43.1) && (P4F < 43.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 490, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
    }
    else if ((P4F > 43.2) && (P4F < 43.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
    }
    else if ((P4F > 43.3) && (P4F < 43.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
    }
    else if ((P4F > 43.4) && (P4F < 43.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
    }
    else if ((P4F > 43.5) && (P4F < 43.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
    }
    else if ((P4F > 43.6) && (P4F < 44.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
    }
    else if ((P4F >= 44.0) && (P4F < 44.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 435, 50, 50);
    }
    else if ((P4F > 44.1) && (P4F < 44.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 490, 50, 50);
    }
    else if ((P4F > 44.2) && (P4F < 44.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F > 44.3) && (P4F < 44.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F > 44.4) && (P4F < 44.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F > 44.5) && (P4F < 44.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F > 44.6) && (P4F < 45.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F >= 45.0) && (P4F < 45.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 435, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F > 45.1) && (P4F < 45.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 490, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F > 45.2) && (P4F < 45.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 545, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F > 45.3) && (P4F < 45.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F > 45.4) && (P4F < 45.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F > 45.5) && (P4F < 45.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F > 45.6) && (P4F < 46.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
    }
    else if ((P4F >= 46.0) && (P4F < 46.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 435, 50, 50);
    }
    else if ((P4F > 46.1) && (P4F < 46.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 490, 50, 50);
    }
    else if ((P4F > 46.2) && (P4F < 46.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 545, 50, 50);
    }
    else if ((P4F > 46.3) && (P4F < 46.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 600, 50, 50);
    }
    else if ((P4F > 46.4) && (P4F < 46.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
    }
    else if ((P4F > 46.5) && (P4F < 46.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
    }
    else if ((P4F > 46.6) && (P4F < 47.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
    }
    else if ((P4F >= 47.0) && (P4F < 47.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 435, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
    }
    else if ((P4F > 47.1) && (P4F < 47.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 490, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
    }
    else if ((P4F > 47.2) && (P4F < 47.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 545, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
    }
    else if ((P4F > 47.3) && (P4F < 47.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 600, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
    }
    else if ((P4F > 47.4) && (P4F < 47.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
    }
    else if ((P4F > 47.5) && (P4F < 47.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
    }
    else if ((P4F > 47.6) && (P4F < 48.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
    }
    else if ((P4F >= 48.0) && (P4F < 48.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 435, 50, 50);
    }
    else if ((P4F > 48.1) && (P4F < 48.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 490, 50, 50);
    }
    else if ((P4F > 48.2) && (P4F < 48.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 545, 50, 50);
    }
    else if ((P4F > 48.3) && (P4F < 48.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 600, 50, 50);
    }
    else if ((P4F > 48.4) && (P4F < 48.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 600, 50, 50);
    }
    else if ((P4F > 48.5) && (P4F < 48.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 600, 50, 50);
    }
    else if ((P4F > 48.6) && (P4F < 49.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 600, 50, 50);
      fill(RedColor);
      ellipse(510, 435, 50, 50);
    }
    else if ((P4F >= 49.0) && (P4F < 49.1)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 600, 50, 50);
      fill(RedColor);
      ellipse(510, 490, 50, 50);
    }
    else if ((P4F > 49.1) && (P4F < 49.2)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 600, 50, 50);
      fill(RedColor);
      ellipse(510, 545, 50, 50);
    }
    else if ((P4F > 49.2) && (P4F < 49.3)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 600, 50, 50);
      fill(RedColor);
      ellipse(510, 435, 50, 50);
    }
    else if ((P4F > 49.3) && (P4F < 49.4)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 600, 50, 50);
      fill(RedColor);
      ellipse(510, 435, 50, 50);
    }
    else if ((P4F > 49.4) && (P4F < 49.5)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 600, 50, 50);
      fill(RedColor);
      ellipse(510, 435, 50, 50);
    }
    else if ((P4F > 49.5) && (P4F < 49.6)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 600, 50, 50);
      fill(RedColor);
      ellipse(510, 435, 50, 50);
    }
    else if ((P4F > 49.6) && (P4F < 50.0)) {         
      fill(255, 255, 255);                            
      textSize(14);                                   
      text("Page 4", 20, 20);                         
      text("Time", 20, 40);                           
      text(P4F, 58, 40);
      strokeWeight(0);
      noStroke();
      fill(246, 235, 15);
      rect(200, 400, 400, 350);
      fill(Background, Fade);
      for (int Y = 235; Y <= 565; Y = Y + 55) {
        if (Y <= 565) {
          ellipse(Y, 435, 50, 50);
          ellipse(Y, 490, 50, 50);
          ellipse(Y, 545, 50, 50);
          ellipse(Y, 600, 50, 50);
          ellipse(Y, 655, 50, 50);
          ellipse(Y, 710, 50, 50);
        }
      }
      fill(GBColor);
      ellipse(235, 710, 50, 50);
      ellipse(455, 655, 50, 50);
      ellipse(510, 655, 50, 50);
      ellipse(400, 710, 50, 50);
      ellipse(290, 710, 50, 50);
      ellipse(235, 600, 50, 50);
      ellipse(510, 600, 50, 50);
      ellipse(565, 655, 50, 50);
      fill(PBColor);
      ellipse(455, 710, 50, 50);
      ellipse(510, 710, 50, 50);
      ellipse(565, 710, 50, 50);
      ellipse(235, 655, 50, 50);
      ellipse(345, 710, 50, 50);
      ellipse(235, 545, 50, 50);
      ellipse(400, 655, 50, 50);
      ellipse(455, 600, 50, 50);
      fill(RedColor);
      ellipse(510, 435, 50, 50);
    }
    /////////////////////////////////////////////////////////////////////////////////////
    
    /////////////////////////////////////////////////////////////////////////////////////
    
    ///////////////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////////////////
    
    ////////////////////////////////////////////////////////////////////////////////
    
    ///////////////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////////
    
    /////////////////////////////////////////////////////////////////////////////////////////
    
                                    //PART IN QUESTION END
    
    //////////////////////////////////////////////////////////////////////////////////////
    
    ///////////////////////////////////////////////////////////////////////////////////////////
    
    ///////////////////////////////////////////////////////////////////////////////////////////
    
    ////////////////////////////////////////////////////////////////////////////////////
    
    /////////////////////////////////////////////////////////////////////////////////////////
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    ///////////////////////////////////////////////////////////////////////////////////////////////
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    ////////////////////////////////////////////////////////////////////////////////////
    
    else if (P4F >= 60.0) {
      RedPage = 10;
    }
  }
}





  void updateB(int x, int y) {
    switch (PurplePage) {
    case 1:
      background(11, 20, 42);
      smooth();
      RedX = 735;
      RedY = 735;
      RedSize = 116;
      BoxY = 67;
      GBoxY = 67;
      textSize(32);
      fill(255, 255, 255);
      noStroke();
      rect(800, 50, 390, 700);
      triangle(810, 750, 795, 755, 810, 735);
      fill(0, 0, 0);
      text("No Image", 920, 400);
      Fade = 255;
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);

      o8 += 1;                          //Things that need to increase over time Start
      x8 += 1;                          //Things that need to increase over time End

      if (o8 == 10) {                          //Time and Fading Variables Start
        P8F = P8F + 0.10;
        o8 = 0;
      }                                        //Time and Fading Variables End
      if (TC8 <= 8.0) {                          //Talking Animation Start
        switch(x8) {
        case 20:
          PButtonOuter = PBHighlight;
          break;
        case 50:
          PButtonOuter = color(68, 34, 103);
          break;
        case 55:
          PButtonOuter = PBHighlight;
          break;
        case 75:
          PButtonOuter = color(68, 34, 103);
          break;
        }                                          //Talking Animation End
      }

      if ((P8F >= 0.0) && (P8F < 7.7)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 2", 20, 20);
        text("Time", 20, 40);
        text(P8F, 58, 40);
        Fade = 255;
        strokeWeight(0);
        noStroke();
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 260);
        textSize(32);

        fill(PBTextColor, Fade);
        text("Purple Button", 120, 450);
        fill(GBTextColor, Fade);
        text("Green Button", 90, 500);
        text("Green Button", 240, 550);
        fill(RTextColor, Fade);
        text("Red Button", 90, 600);
        fill(TextColor, Fade);
        text("I am glad you picked me, I can safely say", 90, 400);
        text("am the best button here;", 340, 450);
        text("I,", 90, 450);
        text("is kind of full of himself ", 310, 500);
        text("although", 90, 550);
        text("is better than", 450, 550);
        text("just ignore him, click on me.", 270, 600);
      }
      else if ((P8F >= 7.7) && (P8F < 7.8)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 2", 20, 20);
        text("Time", 20, 40);
        text(P8F, 58, 40);
        noStroke();
        Fade = 200;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 260);
        textSize(32);

        fill(PBTextColor, Fade);
        text("Purple Button", 90, 450);
        fill(GBTextColor, Fade);
        text("Green Button", 90, 500);
        text("Green Button", 240, 550);
        fill(RTextColor, Fade);
        text("Red Button", 90, 600);
        fill(TextColor, Fade);
        text("I am glad you picked me, I can safely say", 90, 400);
        text("I am the best button here;", 310, 450);
        text("is kind of full of himself ", 310, 500);
        text("although", 90, 550);
        text("is better than", 450, 550);
        text("just ignore him, click on me.", 270, 600);
      } 
      else if ((P8F >= 7.8) && (P8F < 7.9)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 2", 20, 20);
        text("Time", 20, 40);
        text(P8F, 58, 40);
        noStroke();
        Fade = 150;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 260);
        textSize(32);

        fill(PBTextColor, Fade);
        text("Purple Button", 90, 450);
        fill(GBTextColor, Fade);
        text("Green Button", 90, 500);
        text("Green Button", 240, 550);
        fill(RTextColor, Fade);
        text("Red Button", 90, 600);
        fill(TextColor, Fade);
        text("I am glad you picked me, I can safely say", 90, 400);
        text("I am the best button here;", 310, 450);
        text("is kind of full of himself ", 310, 500);
        text("although", 90, 550);
        text("is better than", 450, 550);
        text("just ignore him, click on me.", 270, 600);
      } 
      else if ((P8F >= 7.9) && (P8F < 8.0)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 2", 20, 20);
        text("Time", 20, 40);
        text(P8F, 58, 40);
        noStroke();
        Fade = 100;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 260);
        textSize(32);

        fill(PBTextColor, Fade);
        text("Purple Button", 90, 450);
        fill(GBTextColor, Fade);
        text("Green Button", 90, 500);
        text("Green Button", 240, 550);
        fill(RTextColor, Fade);
        text("Red Button", 90, 600);
        fill(TextColor, Fade);
        text("I am glad you picked me, I can safely say", 90, 400);
        text("I am the best button here;", 310, 450);
        text("is kind of full of himself ", 310, 500);
        text("although", 90, 550);
        text("is better than", 450, 550);
        text("just ignore him, click on me.", 270, 600);
      } 
      else if ((P8F >= 8.0) && (P8F < 8.3)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 2", 20, 20);
        text("Time", 20, 40);
        text(P8F, 58, 40);
        noStroke();
        Fade = 0;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 260);
        textSize(32);

        fill(PBTextColor, Fade);
        text("Purple Button", 90, 450);
        fill(GBTextColor, Fade);
        text("Green Button", 90, 500);
        text("Green Button", 240, 550);
        fill(RTextColor, Fade);
        text("Red Button", 90, 600);
        fill(TextColor, Fade);
        text("I am glad you picked me, I can safely say", 90, 400);
        text("I am the best button here;", 310, 450);
        text("is kind of full of himself ", 310, 500);
        text("although", 90, 550);
        text("is better than", 450, 550);
        text("just ignore him, click on me.", 270, 600);
      }
      break;

    case 2:
      background(11, 20, 42);
      smooth();
      RedX = 735;
      RedY = 735;
      RedSize = 116;
      BoxY = 67;
      GBoxY = 67;

      o9 += 1;                          //Things that need to increase over time Start
      x9 += 1;                          //Things that need to increase over time End

      if (o9 == 10) {                          //Time and Fading Variables Start
        P9F = P9F + 0.10;
        o9 = 0;
      }   

      textSize(32);
      fill(255, 255, 255);
      noStroke();
      rect(800, 50, 390, 700);
      triangle(810, 750, 795, 755, 810, 735);
      fill(0, 0, 0);
      text("No Image", 920, 400);
      Fade = 255;
      fill(255, 255, 255);
      textSize(14);
      text("Page 3", 20, 20);
      text("Time", 20, 40);
      text(P9F, 58, 40);
      if (TC9 <= 15.0) {                          //Talking Animation Start
        switch(x8) {
        case 20:
          PButtonOuter = PBHighlight;
          break;
        case 50:
          PButtonOuter = color(68, 34, 103);
          break;
        case 55:
          PButtonOuter = PBHighlight;
          break;
        case 75:
          PButtonOuter = color(68, 34, 103);
          break;
        }                                          //Talking Animation End
      }

      if ((P9F >= 0.0) && (P9F < 7.7)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 3", 20, 20);
        text("Time", 20, 40);
        text(P9F, 58, 40);
        Fade = 255;
        strokeWeight(0);
        noStroke();
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 210);
        textSize(32);

        fill(TextColor, Fade);
        text("Wow, two clicks, you must really like me.", 90, 400);
        text("I don't blame you, I am pretty awesome,", 90, 450);
        text("keep clicking on me and you'll do", 140, 500);
        text("well on this test...", 290, 550);
      }
      else if ((P9F >= 7.7) && (P9F < 7.8)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 3", 20, 20);
        text("Time", 20, 40);
        text(P9F, 58, 40);
        noStroke();
        Fade = 200;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 210);
        textSize(32);

        fill(TextColor, Fade);
        text("Wow, two clicks, you must really like me.", 90, 400);
        text("I don't blame you, I am pretty awesome,", 90, 450);
        text("keep clicking on me and you'll do", 140, 500);
        text("well on this test...", 290, 550);
      } 
      else if ((P9F >= 7.8) && (P9F < 7.9)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 3", 20, 20);
        text("Time", 20, 40);
        text(P9F, 58, 40);
        noStroke();
        Fade = 150;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 210);
        textSize(32);

        fill(TextColor, Fade);
        text("Wow, two clicks, you must really like me.", 90, 400);
        text("I don't blame you, I am pretty awesome,", 90, 450);
        text("keep clicking on me and you'll do", 140, 500);
        text("well on this test...", 290, 550);
      } 
      else if ((P9F >= 7.9) && (P9F < 8.0)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 3", 20, 20);
        text("Time", 20, 40);
        text(P9F, 58, 40);
        noStroke();
        Fade = 100;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 210);
        textSize(32);

        fill(TextColor, Fade);
        text("Wow, two clicks, you must really like me.", 90, 400);
        text("I don't blame you, I am pretty awesome,", 90, 450);
        text("keep clicking on me and you'll do", 140, 500);
        text("well on this test...", 290, 550);
      } 
      else if ((P9F >= 8.0) && (P9F < 11.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 3", 20, 20);
        text("Time", 20, 40);
        text(P9F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 450, 60);
        textSize(32);

        fill(TextColor, Fade);
        text("Well, go on and click me...", 90, 400);
      }
      else if ((P9F >= 11.0) && (P9F < 15.7)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 3", 20, 20);
        text("Time", 20, 40);
        text(P9F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 450, 60);
        triangle(110, 360, 103, 460, 100, 460);
        rect(80, 430, 640, 180);
        textSize(32);

        fill(TextColor, Fade);
        text("Well, go on and click me...", 90, 400);
        text("Whats taking so long? Are you in shock", 100, 470);
        text("and awe that I would give you such a", 110, 510);
        text("prestigious honor? Well I am just", 140, 550);
        text("that gracious, be grateful.", 190, 590);
      }
      else if ((P9F >= 15.7) && (P9F < 15.8)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 3", 20, 20);
        text("Time", 20, 40);
        text(P9F, 58, 40);
        noStroke();
        Fade = 200;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 450, 60);
        triangle(110, 360, 103, 460, 100, 460);
        rect(80, 430, 640, 180);
        textSize(32);

        fill(TextColor, Fade);
        text("Well, go on and click me...", 90, 400);
        text("Whats taking so long? Are you in shock", 100, 470);
        text("and awe that I would give you such a", 110, 510);
        text("prestigious honor? Well I am just", 140, 550);
        text("that gracious, be grateful.", 190, 590);
      }
      else if ((P9F >= 15.8) && (P9F < 15.9)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 3", 20, 20);
        text("Time", 20, 40);
        text(P9F, 58, 40);
        noStroke();
        Fade = 150;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 450, 60);
        triangle(110, 360, 103, 460, 100, 460);
        rect(80, 430, 640, 180);
        textSize(32);

        fill(TextColor, Fade);
        text("Well, go on and click me...", 90, 400);
        text("Whats taking so long? Are you in shock", 100, 470);
        text("and awe that I would give you such a", 110, 510);
        text("prestigious honor? Well I am just", 140, 550);
        text("that gracious, be grateful.", 190, 590);
      }
      else if ((P9F >= 15.9) && (P9F < 16.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 3", 20, 20);
        text("Time", 20, 40);
        text(P9F, 58, 40);
        noStroke();
        Fade = 100;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 450, 60);
        triangle(110, 360, 103, 460, 100, 460);
        rect(80, 430, 640, 180);
        textSize(32);

        fill(TextColor, Fade);
        text("Well, go on and click me...", 90, 400);
        text("Whats taking so long? Are you in shock", 100, 470);
        text("and awe that I would give you such a", 110, 510);
        text("prestigious honor? Well I am just", 140, 550);
        text("that gracious, be grateful.", 190, 590);
      }
      else if ((P9F >= 16.0) && (P9F < 16.3)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 3", 20, 20);
        text("Time", 20, 40);
        text(P9F, 58, 40);
        noStroke();
        Fade = 0;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 450, 60);
        triangle(110, 360, 103, 460, 100, 460);
        rect(80, 430, 640, 180);
        textSize(32);

        fill(TextColor, Fade);
        text("Well, go on and click me...", 90, 400);
        text("Whats taking so long? Are you in shock", 100, 470);
        text("and awe that I would give you such a", 110, 510);
        text("prestigious honor? Well I am just", 140, 550);
        text("that gracious, be grateful.", 190, 590);
      }
      else if ((P9F >= 16.3) && (P9F < 19.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 3", 20, 20);
        text("Time", 20, 40);
        text(P9F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(610, 330, 603, 360, 600, 360);
        rect(120, 360, 620, 150);
        textSize(32);

        fill(TextColor, Fade);
        text("You should click on me, I can give you", 130, 400);
        text("a higher grade on this test than that", 140, 440);
        text("pathetic narcissist over there...", 170, 480);
      }
      else if ((P9F >= 19.0) && (P9F < 52.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 3", 20, 20);
        text("Time", 20, 40);
        text(P9F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(610, 330, 603, 360, 600, 360);
        rect(120, 360, 620, 150);
        triangle(110, 330, 103, 560, 100, 560);
        rect(80, 520, 640, 70);
        textSize(32);

        fill(TextColor, Fade);
        text("You should click on me, I can give you", 130, 400);
        text("a higher grade on this test than that", 140, 440);
        text("pathetic narcissist over there...", 170, 480);
        text("Pssh... your just jealous of my swag...", 90, 560);
      }
      break;

    case 3:
      background(11, 20, 42);
      smooth();
      RedX = 735;
      RedY = 735;
      RedSize = 116;
      BoxY = 67;
      GBoxY = 67;

      o10 += 1;                          //Things that need to increase over time Start
      x10 += 1;                          //Things that need to increase over time End

      if (o10 == 10) {                          //Time and Fading Variables Start
        P10F = P10F + 0.10;
        o10 = 0;
      }   

      textSize(32);
      fill(255, 255, 255);
      noStroke();
      rect(800, 50, 390, 700);
      triangle(810, 750, 795, 755, 810, 735);
      fill(0, 0, 0);
      text("No Image", 920, 400);
      Fade = 255;
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P10F, 58, 40);
      if (TC10 <= 8.0) {                          //Talking Animation Start
        switch(x10) {
        case 20:
          PButtonOuter = PBHighlight;
          break;
        case 50:
          PButtonOuter = color(68, 34, 103);
          break;
        case 55:
          PButtonOuter = PBHighlight;
          break;
        case 75:
          PButtonOuter = color(68, 34, 103);
          break;
        }                                          //Talking Animation End
      }

      if ((P10F >= 0.0) && (P10F < 6.7)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        Fade = 255;
        strokeWeight(0);
        noStroke();
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 170);
        textSize(32);

        fill(TextColor, Fade);
        text("See wasn't clicking on me another time", 90, 400);
        text("great? I thought it was, as fun as being", 90, 440);
        text("the center of attention is, it gets old", 100, 480);
        text("after a while...", 300, 520);
      }
      else if ((P10F >= 6.7) && (P10F < 6.8)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 200;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 170);
        textSize(32);

        fill(TextColor, Fade);
        text("See wasn't clicking on me another time", 90, 400);
        text("great? I thought it was, as fun as being", 90, 440);
        text("the center of attention is, it gets old", 100, 480);
        text("after a while...", 300, 520);
      } 
      else if ((P10F >= 6.8) && (P10F < 6.9)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 150;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 170);
        textSize(32);

        fill(TextColor, Fade);
        text("See wasn't clicking on me another time", 90, 400);
        text("great? I thought it was, as fun as being", 90, 440);
        text("the center of attention is, it gets old", 100, 480);
        text("after a while...", 300, 520);
      } 
      else if ((P10F >= 6.9) && (P10F < 7.0)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 100;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 170);
        textSize(32);

        fill(TextColor, Fade);
        text("See wasn't clicking on me another time", 90, 400);
        text("great? I thought it was, as fun as being", 90, 440);
        text("the center of attention is, it gets old", 100, 480);
        text("after a while...", 300, 520);
      } 
      else if ((P10F >= 7.0) && (P10F < 7.3)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 0;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 660, 170);
        textSize(32);

        fill(TextColor, Fade);
        text("See wasn't clicking on me another time", 90, 400);
        text("great? I thought it was, as fun as being", 90, 440);
        text("the center of attention is, it gets old", 100, 480);
        text("after a while...", 300, 520);
      }
      else if ((P10F >= 7.3) && (P10F < 9.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        textSize(32);

        fill(TextColor, Fade);
        text("I'm bored... Entertain me...", 90, 400);
      }
      else if ((P10F >= 9.0) && (P10F < 14.7)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(110, 360, 103, 460, 100, 460);
        rect(80, 440, 650, 120);
        textSize(32);

        fill(TextColor, Fade);
        text("I'm bored... Entertain me...", 90, 400);
        text("And I better be thoroughly entertained if", 90, 480);
        text("you want a good score on this IQ test...", 100, 520);
      }
      else if ((P10F >= 14.7) && (P10F < 14.8)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 200;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(110, 360, 103, 460, 100, 460);
        rect(80, 440, 650, 120);
        textSize(32);

        fill(TextColor, Fade);
        text("I'm bored... Entertain me...", 90, 400);
        text("And I better be thoroughly entertained if", 90, 480);
        text("you want a good score on this IQ test...", 100, 520);
      }
      else if ((P10F >= 14.8) && (P10F < 14.9)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 150;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(110, 360, 103, 460, 100, 460);
        rect(80, 440, 650, 120);
        textSize(32);

        fill(TextColor, Fade);
        text("I'm bored... Entertain me...", 90, 400);
        text("And I better be thoroughly entertained if", 90, 480);
        text("you want a good score on this IQ test...", 100, 520);
      }
      else if ((P10F >= 14.9) && (P10F < 15.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 100;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(110, 360, 103, 460, 100, 460);
        rect(80, 440, 650, 120);
        textSize(32);

        fill(TextColor, Fade);
        text("I'm bored... Entertain me...", 90, 400);
        text("And I better be thoroughly entertained if", 90, 480);
        text("you want a good score on this IQ test...", 100, 520);
      }
      else if ((P10F >= 15.0) && (P10F < 15.5)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 0;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(110, 360, 103, 460, 100, 460);
        rect(80, 440, 650, 120);
        textSize(32);

        fill(TextColor, Fade);
        text("I'm bored... Entertain me...", 90, 400);
        text("And I better be thoroughly entertained if", 90, 480);
        text("you want a good score on this IQ test...", 100, 520);
      }
      else if ((P10F >= 15.5) && (P10F < 17.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        textSize(32);

        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
      }
      else if ((P10F >= 17.0) && (P10F < 20.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 520, 70);
        textSize(32);

        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
        fill(TextColor, Fade);
        text("ya dance for us or we'll fail you", 130, 480);
      }
      else if ((P10F >= 20.0) && (P10F < 21.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 520, 70);
        triangle(110, 360, 103, 530, 100, 530);
        rect(80, 520, 120, 70);
        textSize(32);

        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
        text("ya dance for us or we'll fail you", 130, 480);
        text("Dance!", 90, 560);
      }
      else if ((P10F >= 21.0) && (P10F < 22.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 520, 70);
        triangle(110, 360, 103, 530, 100, 530);
        rect(80, 520, 120, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(210, 520, 120, 70);
        textSize(32);

        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
        text("ya dance for us or we'll fail you", 130, 480);
        text("Dance!", 90, 560);
        text("Dance!", 220, 560);
      }
      else if ((P10F >= 22.0) && (P10F < 23.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 520, 70);
        triangle(110, 360, 103, 530, 100, 530);
        rect(80, 520, 120, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(210, 520, 120, 70);
        triangle(110, 360, 103, 530, 100, 530);
        rect(80, 600, 120, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(210, 600, 120, 70);
        textSize(32);

        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
        text("ya dance for us or we'll fail you", 130, 480);
        text("Dance!", 90, 560);
        text("Dance!", 220, 560);
        text("Dance!", 90, 640);
        text("Dance!", 220, 640);
      }
      else if ((P10F >= 23.0) && (P10F < 24.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 520, 70);
        triangle(110, 360, 103, 530, 100, 530);
        rect(80, 520, 120, 70);
        rect(210, 520, 120, 70);
        rect(80, 600, 120, 70);
        rect(210, 600, 120, 70);
        rect(80, 680, 120, 70);
        rect(210, 680, 120, 70);
        textSize(32);

        image(Image4, 800, 50);
        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
        text("ya dance for us or we'll fail you", 130, 480);
        text("Dance!", 90, 560);
        text("Dance!", 220, 560);
        text("Dance!", 90, 640);
        text("Dance!", 220, 640);
        text("Dance!", 90, 720);
        text("Dance!", 220, 720);
      }
      else if ((P10F >= 24.0) && (P10F < 25.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 520, 70);
        triangle(110, 360, 103, 530, 100, 530);
        rect(80, 520, 120, 70);
        rect(210, 520, 120, 70);
        rect(80, 600, 120, 70);
        rect(210, 600, 120, 70);
        rect(80, 680, 120, 70);
        rect(210, 680, 120, 70);
        rect(340, 520, 120, 70);
        rect(340, 600, 120, 70);
        rect(340, 680, 120, 70);
        textSize(32);

        image(Image4, 800, 50);
        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
        text("ya dance for us or we'll fail you", 130, 480);
        text("Dance!", 90, 560);
        text("Dance!", 220, 560);
        text("Dance!", 90, 640);
        text("Dance!", 220, 640);
        text("Dance!", 90, 720);
        text("Dance!", 220, 720);
        text("Dance!", 350, 560);
        text("Dance!", 350, 640);
        text("Dance!", 350, 720);
      }
      else if ((P10F >= 25.0) && (P10F < 26.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 520, 70);
        triangle(110, 360, 103, 530, 100, 530);
        rect(80, 520, 120, 70);
        rect(210, 520, 120, 70);
        rect(80, 600, 120, 70);
        rect(210, 600, 120, 70);
        rect(80, 680, 120, 70);
        rect(210, 680, 120, 70);
        rect(340, 520, 120, 70);
        rect(340, 600, 120, 70);
        rect(340, 680, 120, 70);
        rect(470, 520, 120, 70);
        rect(470, 600, 120, 70);
        rect(470, 680, 120, 70);
        textSize(32);

        image(Image4, 800, 50);
        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
        text("ya dance for us or we'll fail you", 130, 480);
        text("Dance!", 90, 560);
        text("Dance!", 220, 560);
        text("Dance!", 90, 640);
        text("Dance!", 220, 640);
        text("Dance!", 90, 720);
        text("Dance!", 220, 720);
        text("Dance!", 350, 560);
        text("Dance!", 350, 640);
        text("Dance!", 350, 720);
        text("Dance!", 480, 560);
        text("Dance!", 480, 640);
        text("Dance!", 480, 720);
      }
      else if ((P10F >= 26.0) && (P10F < 27.7)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 520, 70);
        triangle(110, 360, 103, 530, 100, 530);
        rect(80, 520, 120, 70);
        rect(210, 520, 120, 70);
        rect(80, 600, 120, 70);
        rect(210, 600, 120, 70);
        rect(80, 680, 120, 70);
        rect(210, 680, 120, 70);
        rect(340, 520, 120, 70);
        rect(340, 600, 120, 70);
        rect(340, 680, 120, 70);
        rect(470, 520, 120, 70);
        rect(470, 600, 120, 70);
        rect(470, 680, 120, 70);
        rect(600, 520, 120, 70);
        rect(600, 600, 120, 70);
        textSize(32);

        image(Image4, 800, 50);
        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
        text("ya dance for us or we'll fail you", 130, 480);
        text("Dance!", 90, 560);
        text("Dance!", 220, 560);
        text("Dance!", 90, 640);
        text("Dance!", 220, 640);
        text("Dance!", 90, 720);
        text("Dance!", 220, 720);
        text("Dance!", 350, 560);
        text("Dance!", 350, 640);
        text("Dance!", 350, 720);
        text("Dance!", 480, 560);
        text("Dance!", 480, 640);
        text("Dance!", 480, 720);
        text("Dance!", 610, 560);
        text("Dance!", 610, 640);
      }
      else if ((P10F >= 27.7) && (P10F < 27.8)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 200;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 520, 70);
        triangle(110, 360, 103, 530, 100, 530);
        rect(80, 520, 120, 70);
        rect(210, 520, 120, 70);
        rect(80, 600, 120, 70);
        rect(210, 600, 120, 70);
        rect(80, 680, 120, 70);
        rect(210, 680, 120, 70);
        rect(340, 520, 120, 70);
        rect(340, 600, 120, 70);
        rect(340, 680, 120, 70);
        rect(470, 520, 120, 70);
        rect(470, 600, 120, 70);
        rect(470, 680, 120, 70);
        rect(600, 520, 120, 70);
        rect(600, 600, 120, 70);
        textSize(32);

        image(Image4, 800, 50);
        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
        text("ya dance for us or we'll fail you", 130, 480);
        text("Dance!", 90, 560);
        text("Dance!", 220, 560);
        text("Dance!", 90, 640);
        text("Dance!", 220, 640);
        text("Dance!", 90, 720);
        text("Dance!", 220, 720);
        text("Dance!", 350, 560);
        text("Dance!", 350, 640);
        text("Dance!", 350, 720);
        text("Dance!", 480, 560);
        text("Dance!", 480, 640);
        text("Dance!", 480, 720);
        text("Dance!", 610, 560);
        text("Dance!", 610, 640);
      }
      else if ((P10F >= 27.8) && (P10F < 27.9)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 150;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 520, 70);
        triangle(110, 360, 103, 530, 100, 530);
        rect(80, 520, 120, 70);
        rect(210, 520, 120, 70);
        rect(80, 600, 120, 70);
        rect(210, 600, 120, 70);
        rect(80, 680, 120, 70);
        rect(210, 680, 120, 70);
        rect(340, 520, 120, 70);
        rect(340, 600, 120, 70);
        rect(340, 680, 120, 70);
        rect(470, 520, 120, 70);
        rect(470, 600, 120, 70);
        rect(470, 680, 120, 70);
        rect(600, 520, 120, 70);
        rect(600, 600, 120, 70);
        textSize(32);

        image(Image4, 800, 50);
        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
        text("ya dance for us or we'll fail you", 130, 480);
        text("Dance!", 90, 560);
        text("Dance!", 220, 560);
        text("Dance!", 90, 640);
        text("Dance!", 220, 640);
        text("Dance!", 90, 720);
        text("Dance!", 220, 720);
        text("Dance!", 350, 560);
        text("Dance!", 350, 640);
        text("Dance!", 350, 720);
        text("Dance!", 480, 560);
        text("Dance!", 480, 640);
        text("Dance!", 480, 720);
        text("Dance!", 610, 560);
        text("Dance!", 610, 640);
      }
      else if ((P10F >= 27.9) && (P10F < 28.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 100;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 520, 70);
        triangle(110, 360, 103, 530, 100, 530);
        rect(80, 520, 120, 70);
        rect(210, 520, 120, 70);
        rect(80, 600, 120, 70);
        rect(210, 600, 120, 70);
        rect(80, 680, 120, 70);
        rect(210, 680, 120, 70);
        rect(340, 520, 120, 70);
        rect(340, 600, 120, 70);
        rect(340, 680, 120, 70);
        rect(470, 520, 120, 70);
        rect(470, 600, 120, 70);
        rect(470, 680, 120, 70);
        rect(600, 520, 120, 70);
        rect(600, 600, 120, 70);
        textSize(32);

        image(Image4, 800, 50);
        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
        text("ya dance for us or we'll fail you", 130, 480);
        text("Dance!", 90, 560);
        text("Dance!", 220, 560);
        text("Dance!", 90, 640);
        text("Dance!", 220, 640);
        text("Dance!", 90, 720);
        text("Dance!", 220, 720);
        text("Dance!", 350, 560);
        text("Dance!", 350, 640);
        text("Dance!", 350, 720);
        text("Dance!", 480, 560);
        text("Dance!", 480, 640);
        text("Dance!", 480, 720);
        text("Dance!", 610, 560);
        text("Dance!", 610, 640);
      }
      else if ((P10F >= 28.0) && (P10F < 28.3)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 0;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 520, 70);
        triangle(110, 360, 103, 530, 100, 530);
        rect(80, 520, 120, 70);
        rect(210, 520, 120, 70);
        rect(80, 600, 120, 70);
        rect(210, 600, 120, 70);
        rect(80, 680, 120, 70);
        rect(210, 680, 120, 70);
        rect(340, 520, 120, 70);
        rect(340, 600, 120, 70);
        rect(340, 680, 120, 70);
        rect(470, 520, 120, 70);
        rect(470, 600, 120, 70);
        rect(470, 680, 120, 70);
        rect(600, 520, 120, 70);
        rect(600, 600, 120, 70);
        textSize(32);

        image(Image4, 800, 50);
        fill(TextColor, Fade);
        text("Go on jester dance for us...", 90, 400);
        text("ya dance for us or we'll fail you", 130, 480);
        text("Dance!", 90, 560);
        text("Dance!", 220, 560);
        text("Dance!", 90, 640);
        text("Dance!", 220, 640);
        text("Dance!", 90, 720);
        text("Dance!", 220, 720);
        text("Dance!", 350, 560);
        text("Dance!", 350, 640);
        text("Dance!", 350, 720);
        text("Dance!", 480, 560);
        text("Dance!", 480, 640);
        text("Dance!", 480, 720);
        text("Dance!", 610, 560);
        text("Dance!", 610, 640);
      }
      else if ((P10F >= 28.3) && (P10F < 31.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        textSize(32);

        image(Image4, 800, 50);
        fill(TextColor, Fade);
        text("well that was disapointing...", 90, 400);
      }
      else if ((P10F >= 31.0) && (P10F < 33.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 500, 70);
        textSize(32);

        image(Image4, 800, 50);
        fill(TextColor, Fade);
        text("well that was disapointing...", 90, 400);
        text("I agree that was abysmal.", 120, 480);
      }
      else if ((P10F >= 33.0) && (P10F < 35.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 500, 70);
        triangle(110, 360, 103, 560, 100, 560);
        rect(80, 520, 520, 70);
        textSize(32);

        fill(RedColor, Fade);
        text("Red Button?", 400, 560);
        image(Image4, 800, 50);
        fill(TextColor, Fade);
        text("Well that was disapointing...", 90, 400);
        text("I agree that was abysmal.", 120, 480);
        text("What did you think", 90, 560);
      }
      else if ((P10F >= 35.0) && (P10F < 37.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 500, 70);
        triangle(110, 360, 103, 560, 100, 560);
        rect(80, 520, 520, 70);
        textSize(32);

        fill(RedColor, Fade);
        text("Red Button?", 400, 560);
        image(Image5, 800, 50);
        fill(TextColor, Fade);
        text("Well that was disapointing...", 90, 400);
        text("I agree that was abysmal.", 120, 480);
        text("What did you think", 90, 560);
      }
      else if ((P10F >= 37.0) && (P10F < 41.7)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 500, 70);
        triangle(110, 360, 103, 560, 100, 560);
        rect(80, 520, 520, 70);
        triangle(110, 560, 103, 660, 100, 660);
        rect(80, 600, 560, 70);
        textSize(32);

        fill(RedColor, Fade);
        text("Red Button?", 400, 560);
        image(Image5, 800, 50);
        fill(TextColor, Fade);
        text("Well that was disapointing...", 90, 400);
        text("I agree that was abysmal.", 120, 480);
        text("What did you think", 90, 560);
        text("Pssh, no one cares what you think.", 90, 640);
      }
      else if ((P10F >= 41.7) && (P10F < 41.8)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 200;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 500, 70);
        triangle(110, 360, 103, 560, 100, 560);
        rect(80, 520, 520, 70);
        triangle(110, 560, 103, 660, 100, 660);
        rect(80, 600, 560, 70);
        textSize(32);

        fill(RedColor, Fade);
        text("Red Button?", 400, 560);
        image(Image5, 800, 50);
        fill(TextColor, Fade);
        text("Well that was disapointing...", 90, 400);
        text("I agree that was abysmal.", 120, 480);
        text("What did you think", 90, 560);
        text("Pssh, no one cares what you think.", 90, 640);
      }
      else if ((P10F >= 41.8) && (P10F < 41.9)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 150;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 500, 70);
        triangle(110, 360, 103, 560, 100, 560);
        rect(80, 520, 520, 70);
        triangle(110, 560, 103, 660, 100, 660);
        rect(80, 600, 560, 70);
        textSize(32);

        fill(RedColor, Fade);
        text("Red Button?", 400, 560);
        image(Image5, 800, 50);
        fill(TextColor, Fade);
        text("Well that was disapointing...", 90, 400);
        text("I agree that was abysmal.", 120, 480);
        text("What did you think", 90, 560);
        text("Pssh, no one cares what you think.", 90, 640);
      }
      else if ((P10F >= 41.9) && (P10F < 42.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 100;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 500, 70);
        triangle(110, 360, 103, 560, 100, 560);
        rect(80, 520, 520, 70);
        triangle(110, 560, 103, 660, 100, 660);
        rect(80, 600, 560, 70);
        textSize(32);

        fill(RedColor, Fade);
        text("Red Button?", 400, 560);
        image(Image5, 800, 50);
        fill(TextColor, Fade);
        text("Well that was disapointing...", 90, 400);
        text("I agree that was abysmal.", 120, 480);
        text("What did you think", 90, 560);
        text("Pssh, no one cares what you think.", 90, 640);
      }
      else if ((P10F >= 42.0) && (P10F < 42.3)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 0;
        fill(White, Fade);
        triangle(110, 330, 103, 360, 100, 360);
        rect(80, 360, 500, 70);
        triangle(610, 330, 603, 460, 600, 460);
        rect(110, 440, 500, 70);
        triangle(110, 360, 103, 560, 100, 560);
        rect(80, 520, 520, 70);
        triangle(110, 560, 103, 660, 100, 660);
        rect(80, 600, 560, 70);
        textSize(32);

        fill(RedColor, Fade);
        text("Red Button?", 400, 560);
        image(Image5, 800, 50);
        fill(TextColor, Fade);
        text("Well that was disapointing...", 90, 400);
        text("I agree that was abysmal.", 120, 480);
        text("What did you think", 90, 560);
        text("Pssh, no one cares what you think.", 90, 640);
      }
      else if ((P10F >= 42.3) && (P10F < 45.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(610, 330, 603, 360, 600, 360);
        rect(110, 360, 640, 100);
        textSize(32);

        fill(GBTextColor, Fade);
        text("Green Button.", 510, 440);
        image(Image5, 800, 50);
        fill(TextColor, Fade);
        text("What did you think user? If you thought", 120, 400);
        text("it was good click on me,", 120, 440);
      }
      else if ((P10F >= 45.0) && (P10F < 48.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(610, 330, 603, 360, 600, 360);
        rect(110, 360, 640, 100);
        triangle(100, 330, 103, 560, 100, 560);
        rect(80, 470, 640, 100);
        textSize(32);

        fill(GBTextColor, Fade);
        text("Green Button.", 510, 440);
        image(Image5, 800, 50);
        fill(TextColor, Fade);
        text("What did you think user? If you thought", 120, 400);
        text("it was good click on me,", 120, 440);
        text("Hey, don't try and steal a click from", 120, 510);
        text("the user! Is the user even here?", 140, 550);
      }
      else if ((P10F >= 48.0) && (P10F < 52.0)) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 4", 20, 20);
        text("Time", 20, 40);
        text(P10F, 58, 40);
        noStroke();
        Fade = 255;
        fill(White, Fade);
        triangle(610, 330, 603, 360, 600, 360);
        rect(110, 360, 640, 100);
        triangle(100, 330, 103, 560, 100, 560);
        rect(80, 470, 640, 100);
        triangle(110, 560, 103, 600, 100, 600);
        rect(80, 580, 670, 70);
        textSize(32);

        fill(GBTextColor, Fade);
        text("Green Button.", 510, 440);
        image(Image5, 800, 50);
        fill(TextColor, Fade);
        text("What did you think user? If you thought", 120, 400);
        text("it was good click on me,", 120, 440);
        text("Hey, don't try and steal a click from", 120, 510);
        text("the user! Is the user even here?", 140, 550);
        text("Great they left, im restarting the IQ Test...", 90, 620);
      }
      else if (P10F >= 52.0) {
        PurplePage = 0;
        RedPage = 10;
      }
      break;
    case 4:
      background(11, 20, 42);
      smooth();
      RedX = 735;
      RedY = 735;
      RedSize = 116;
      BoxY = 67;
      GBoxY = 67;

      o11 += 1;                          //Things that need to increase over time Start
      x11 += 1;                          //Things that need to increase over time End

      if (o11 == 11) {                          //Time and Fading Variables Start
        P11F = P11F + 0.10;
        o11 = 0;
      } 

      textSize(32);
      fill(255, 255, 255);
      noStroke();
      rect(800, 50, 390, 700);
      triangle(810, 750, 795, 755, 810, 735);
      fill(0, 0, 0);
      text("No Image", 920, 400);
      Fade = 255;
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P11F, 58, 40);
      ellipse(100, 600, 10, 10);
      break;
    case 5:
      background(11, 20, 42);
      smooth();
      RedX = 735;
      RedY = 735;
      RedSize = 116;
      BoxY = 67;
      GBoxY = 67;

      o12 += 1;                          //Things that need to increase over time Start
      x12 += 1;                          //Things that need to increase over time End

      if (o12 == 12) {                          //Time and Fading Variables Start
        P12F = P12F + 0.10;
        o12 = 0;
      } 

      textSize(32);
      fill(255, 255, 255);
      noStroke();
      rect(800, 50, 390, 700);
      triangle(810, 750, 795, 755, 810, 735);
      fill(0, 0, 0);
      text("No Image", 920, 400);
      Fade = 255;
      fill(255, 255, 255);
      textSize(14);
      text("Page 6", 20, 20);
      text("Time", 20, 40);
      text(P12F, 58, 40);
      ellipse(100, 600, 10, 10);
      break;
    }
  }

  void updateC(int x, int y) {
    switch (GreenPage) {
    case 1:
      background(11, 20, 42);
      smooth();
      RedX = 735;
      RedY = 735;
      RedSize = 116;
      BoxY = 67;
      GBoxY = 67;
      textSize(32);
      fill(255, 255, 255);
      noStroke();
      rect(800, 50, 390, 700);
      triangle(810, 750, 795, 755, 810, 735);
      fill(0, 0, 0);
      text("No Image", 920, 400);
      Fade = 255;
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      rect(100, 600, 10, 10);

      o14 += 1;                          //Things that need to increase over time Start
      x14 += 1;                          //Things that need to increase over time End

      if (o14 == 10) {                          //Time and Fading Variables Start
        P14F = P14F + 0.10;
        o14 = 0;
      }                                        //Time and Fading Variables End

      RedX = 735;
      RedY = 735;
      BoxY = 67;
      GBoxY = 67;
      if (TC14 <= 15.0) {                          //Talking Animation Start
        switch(x14) {
        case 0:
          GButtonOuter = GBHighlight;
          break;
        case 5:
          GButtonOuter = color(25, 65, 30);
          break;
        case 15:
          GButtonOuter = GBHighlight;
          break;
        case 30:
          GButtonOuter = color(25, 65, 30);
          break;
        case 55:
          GButtonOuter = GBHighlight;
          break;
        case 80:
          GButtonOuter = color(25, 65, 30);
          break;
        }                                          //Talking Animation End
      }

      if ((P14F >= 0.0) && (P14F < 14.7)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 2", 20, 20);
        text("Time", 20, 40);
        text(P14F, 58, 40);
        Fade = 255;
        strokeWeight(0);
        noStroke();
        fill(White, Fade);
        triangle(610, 330, 603, 360, 600, 360);
        rect(80, 360, 660, 310);
        textSize(32);

        fill(PBTextColor, Fade);
        text("Purple Button", 305, 400);
        fill(GBTextColor, Fade);
        text("Green Button", 110, 500);
        fill(RTextColor, Fade);
        text("Red Button", 560, 400);
        fill(TextColor, Fade);
        text("Don't click on", 90, 400);
        text("or", 520, 400);
        text("I'm the only button you should click on.", 90, 450);
        text("I,", 90, 500);
        text("am awesome, those other", 320, 500);
        text("two are kind of lame, stick with me and I", 90, 550);
        text("can guarantee that you will get a high ", 100, 600);
        text("score on this IQ test.", 250, 650);
      }
      else if ((P14F > 14.7) && (P14F < 14.8)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 2", 20, 20);
        text("Time", 20, 40);
        text(P14F, 58, 40);
        noStroke();
        Fade = 200;
        strokeWeight(0);
        noStroke();
        fill(White, Fade);
        triangle(610, 330, 603, 360, 600, 360);
        rect(80, 360, 660, 310);
        textSize(32);

        fill(PBTextColor, Fade);
        text("Purple Button", 305, 400);
        fill(GBTextColor, Fade);
        text("Green Button", 110, 500);
        fill(RTextColor, Fade);
        text("Red Button", 560, 400);
        fill(TextColor, Fade);
        text("Don't click on", 90, 400);
        text("or", 520, 400);
        text("I'm the only button you should click on.", 90, 450);
        text("I,", 90, 500);
        text("am awesome, those other", 320, 500);
        text("two are kind of lame, stick with me and I", 90, 550);
        text("can guarantee that you will get a high ", 100, 600);
        text("score on this IQ test.", 250, 650);
      } 
      else if ((P14F > 14.8) && (P14F < 14.9)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 2", 20, 20);
        text("Time", 20, 40);
        text(P14F, 58, 40);
        noStroke();
        Fade = 150;
        strokeWeight(0);
        noStroke();
        fill(White, Fade);
        triangle(610, 330, 603, 360, 600, 360);
        rect(80, 360, 660, 310);
        textSize(32);

        fill(PBTextColor, Fade);
        text("Purple Button", 305, 400);
        fill(GBTextColor, Fade);
        text("Green Button", 110, 500);
        fill(RTextColor, Fade);
        text("Red Button", 560, 400);
        fill(TextColor, Fade);
        text("Don't click on", 90, 400);
        text("or", 520, 400);
        text("I'm the only button you should click on.", 90, 450);
        text("I,", 90, 500);
        text("am awesome, those other", 320, 500);
        text("two are kind of lame, stick with me and I", 90, 550);
        text("can guarantee that you will get a high ", 100, 600);
        text("score on this IQ test.", 250, 650);
      } 
      else if ((P14F > 14.9) && (P14F < 15.0)) {
        fill(255, 255, 255);
        textSize(14);
        text("Page 2", 20, 20);
        text("Time", 20, 40);
        text(P14F, 58, 40);
        noStroke();
        Fade = 100;
        strokeWeight(0);
        noStroke();
        fill(White, Fade);
        triangle(610, 330, 603, 360, 600, 360);
        rect(80, 360, 660, 310);
        textSize(32);

        fill(PBTextColor, Fade);
        text("Purple Button", 305, 400);
        fill(GBTextColor, Fade);
        text("Green Button", 110, 500);
        fill(RTextColor, Fade);
        text("Red Button", 560, 400);
        fill(TextColor, Fade);
        text("Don't click on", 90, 400);
        text("or", 520, 400);
        text("I'm the only button you should click on.", 90, 450);
        text("I,", 90, 500);
        text("am awesome, those other", 320, 500);
        text("two are kind of lame, stick with me and I", 90, 550);
        text("can guarantee that you will get a high ", 100, 600);
        text("score on this IQ test.", 250, 650);
      } 
      else if (P14F >= 15.0) {
        PBColor = color(75, 25, 80);
        PButtonOuter = color(68, 34, 103);
        fill(255, 255, 255);
        textSize(14);
        text("Page 2", 20, 20);
        text("Time", 20, 40);
        text(P14F, 58, 40);
        noStroke();
        Fade = 0;
        strokeWeight(0);
        noStroke();
        fill(White, Fade);
        triangle(610, 330, 603, 360, 600, 360);
        rect(80, 360, 660, 310);
        textSize(32);

        fill(PBTextColor, Fade);
        text("Purple Button", 305, 400);
        fill(GBTextColor, Fade);
        text("Green Button", 110, 500);
        fill(RTextColor, Fade);
        text("Red Button", 560, 400);
        fill(TextColor, Fade);
        text("Don't click on", 90, 400);
        text("or", 520, 400);
        text("I'm the only button you should click on.", 90, 450);
        text("I,", 90, 500);
        text("am awesome, those other", 320, 500);
        text("two are kind of lame, stick with me and I", 90, 550);
        text("can guarantee that you will get a high ", 100, 600);
        text("score on this IQ test.", 250, 650);
      }
      break;

    case 2:
      background(11, 20, 42);
      smooth();
      RedX = 735;
      RedY = 735;
      RedSize = 116;
      BoxY = 67;
      GBoxY = 67;

      o15 += 1;                          //Things that need to increase over time Start
      x15 += 1;                          //Things that need to increase over time End

      if (o15 == 10) {                          //Time and Fading Variables Start
        P15F = P15F + 0.10;
        o15 = 0;
      } 

      textSize(32);
      fill(255, 255, 255);
      noStroke();
      rect(800, 50, 390, 700);
      triangle(810, 750, 795, 755, 810, 735);
      fill(0, 0, 0);
      text("No Image", 920, 400);
      Fade = 255;
      fill(255, 255, 255);
      textSize(14);
      text("Page 2", 20, 20);
      text("Time", 20, 40);
      text(P15F, 58, 40);
      rect(100, 600, 10, 10);
      break;
    case 3:
      background(11, 20, 42);
      smooth();
      RedX = 735;
      RedY = 735;
      RedSize = 116;
      BoxY = 67;
      GBoxY = 67;

      o16 += 1;                          //Things that need to increase over time Start
      x16 += 1;                          //Things that need to increase over time End

      if (o16 == 10) {                          //Time and Fading Variables Start
        P16F = P16F + 0.10;
        o16 = 0;
      } 

      textSize(32);
      fill(255, 255, 255);
      noStroke();
      rect(800, 50, 390, 700);
      triangle(810, 750, 795, 755, 810, 735);
      fill(0, 0, 0);
      text("No Image", 920, 400);
      Fade = 255;
      fill(255, 255, 255);
      textSize(14);
      text("Page 3", 20, 20);
      text("Time", 20, 40);
      text(P16F, 58, 40);
      rect(100, 600, 10, 10);
      break;
    case 4:
      background(11, 20, 42);
      smooth();
      RedX = 735;
      RedY = 735;
      RedSize = 116;
      BoxY = 67;
      GBoxY = 67;

      o17 += 1;                          //Things that need to increase over time Start
      x10 += 1;                          //Things that need to increase over time End

      if (o17 == 10) {                          //Time and Fading Variables Start
        P17F = P17F + 0.10;
        o17 = 0;
      } 

      textSize(32);
      fill(255, 255, 255);
      noStroke();
      rect(800, 50, 390, 700);
      triangle(810, 750, 795, 755, 810, 735);
      fill(0, 0, 0);
      text("No Image", 920, 400);
      Fade = 255;
      fill(255, 255, 255);
      textSize(14);
      text("Page 4", 20, 20);
      text("Time", 20, 40);
      text(P17F, 58, 40);
      rect(100, 600, 10, 10);
      break;
    case 5:
      background(11, 20, 42);
      smooth();
      RedX = 735;
      RedY = 735;
      RedSize = 116;
      BoxY = 67;
      GBoxY = 67;

      o18 += 1;                          //Things that need to increase over time Start
      x18 += 1;                          //Things that need to increase over time End

      if (o18 == 10) {                          //Time and Fading Variables Start
        P18F = P18F + 0.10;
        o18 = 0;
      } 

      textSize(32);
      fill(255, 255, 255);
      noStroke();
      rect(800, 50, 390, 700);
      triangle(810, 750, 795, 755, 810, 735);
      fill(0, 0, 0);
      text("No Image", 920, 400);
      Fade = 255;
      fill(255, 255, 255);
      textSize(14);
      text("Page 5", 20, 20);
      text("Time", 20, 40);
      text(P18F, 58, 40);
      rect(100, 600, 10, 10);
      break;
    }
  }




  void mousePressed() {
    if (RedOver) {
      RedCounter++;
      RedPage = RedCounter;
      PurplePage = PurpleOff;
      GreenPage = GreenOff;
    }
    if (PurpleOver) {
      PurpleCounter++;
      PurplePage = PurpleCounter;
      RedPage = RedOff;
      GreenPage = GreenOff;
    }
    if (GreenOver) {
      GreenCounter++;
      GreenPage = GreenCounter;
      PurplePage = PurpleOff;
      RedPage = RedOff;
    }
  }

  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } 
    else {
      return false;
    }
  }

class P1 {

  P1() {
    
  }

  void display() {
    fill(255, 255, 255);
    noStroke();
    rect(800, 50, 390, 700);
    fill(0, 0, 0);
    text("No Image", 920, 400);
    fill(255, 255, 255);
    textSize(14);
    text("Page 1", 20, 20);
    text("Time", 20, 40);
    text("0", 58, 40);
    textSize(52);                              
    fill(211, 107, 39);
    text("Test you IQ", 250, 100);
    textSize(32);
    fill(255, 0, 0);
    text("Red Button", 320, 500);
    fill(255, 255, 255);
    text("Click", 230, 500);
    text("to Start", 500, 500);
  }
}



