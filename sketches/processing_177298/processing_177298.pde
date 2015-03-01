
//my course experience
//final project of course Intro to the computational arts by Coursera and Stony Brook University
//The first part is basically a presentation.
//The final part interact with the mouse.
//Please move your mouse on the canvas when request.

import ddf.minim.*;                      //Audio library
Minim minim;
AudioPlayer ValtzerSound;                      //audio variables
AudioSample BellSound;
AudioPlayer XmasSound;

PImage GimpImage, AudacityImage;                  //images variables
PImage XmasPlant, XmasCandle;

PImage Total, Partial1, Partial2, Partial3, Partial4, Partial5, Partial6, Partial7, Partial8;    //mosaic images variables            
PImage Partial9, Partial10, Partial11, Partial12, Partial13, Partial14, Partial15, Partial16;

int DeltaPixel = 40, StoreMillis = 0, DeltaTime = 1000, TxtNum = 0, DrawStep = 1, StarCounter=0;                //global variables
boolean FlagTime = false, FlagEntry = false, FlagTextStar = true;
boolean FlagMosaic[]= new boolean[20];                                                                          //boolean array for mosaic images

color [] palette = {#1221A0,#E9F74D,#F79A4D,#C0F3F7,#FA2B54,#F5AA8D,#65FAB3,#F2ABDD,#FFF700,#CEFA8D,#FCEC8F};    //color palette for stars

void setup() {
  size(800,600);
  background (palette[0]);                              //canvas background (the sky) for stars
  GimpImage = loadImage ("images_gimp.png");            //open file images
  AudacityImage = loadImage ("images_audacity.png");
  XmasPlant = loadImage ("xmas_plant.png");
  XmasCandle = loadImage ("xmas_candle.png");
  
  Total = loadImage ("br1.png");                        //open file image for mosaic
  Partial1 = Total.get(0,0,200,150);                   //split image for mosaic
  Partial2 = Total.get(200,0,200,150);
  Partial3 = Total.get(400,0,200,150);
  Partial4 = Total.get(600,0,200,150);
  Partial5 = Total.get(0,150,200,150);
  Partial6 = Total.get(200,150,200,150);
  Partial7 = Total.get(400,150,200,150);
  Partial8 = Total.get(600,150,200,150);
  Partial9 = Total.get(0,300,200,150);
  Partial10 = Total.get(200,300,200,150);
  Partial11 = Total.get(400,300,200,150);
  Partial12 = Total.get(600,300,200,150);
  Partial13 = Total.get(0,450,200,150);
  Partial14 = Total.get(200,450,200,150);
  Partial15 = Total.get(400,450,200,150);
  Partial16 = Total.get(600,450,200,150);
  minim = new Minim (this);                            //minim instance
  ValtzerSound = minim.loadFile("valtzer_Strauss.mp3");      //load sounds
  BellSound = minim.loadSample("bell.mp3");
  XmasSound = minim.loadFile("PICMicro_sound.mp3");
  ValtzerSound.play();                                        //play ValtzerSound sound
  
}  
void draw() {
  
  switch (DrawStep) {                                  //switch into any step of presentation
    
    case 1:                                              //step 1 draw stars
    if (FlagTime==false) {                         //timing draw 
      StoreMillis = millis();
      FlagTime = true;
    }
    if (FlagTime && millis() > StoreMillis + 150) {
      int StarRadius =int(random(5,height/30));                         //data for star draw         
      int StarX =int(random(StarRadius, width - StarRadius));      
      int StarY =int(random(StarRadius, height - StarRadius - 100));     
      int StarColor=int(random(1,11));                   
      fill(palette[StarColor]);                          
      star(StarX,StarY,StarRadius);                   //call draw star procedure and pass data
      StarCounter++ ;                                  //increment StarCounter  
      if (FlagTextStar && StarCounter > 80) {        //step 1 text only one time
        fill(255);
        textSize (36);
        text("Do you remember where we started...",20,550);
        FlagTextStar = false;
      }
      FlagTime = false;
    }
    if (StarCounter > 210) {                            // number of star determines end of step 1                            
      DrawStep = 2;                                      //go to next step
    }    
    break;                                                //end step 1
    
    case 2:                                              //step 2 gimp image
    image(GimpImage,0,0);
    DrawStep = 3;                                      //go to next step
    break;                                              //end step 2
    
    case 3:                                              //step 3 gimp image text
    if (FlagTime==false) {                              //timing step
      StoreMillis = millis();
      fill(0);
      textSize (36);
      text("...next we are worked on images...",20,550);      //step 3 text
      FlagTime = true;
    }
    if (FlagTime && millis() > StoreMillis + 15000) {
      FlagTime = false;
      DrawStep = 4;                                    //go to next step
    }
    break;                                              //end step 3
    
    case 4:                                            //step 4 audacity image
    image(AudacityImage,0,0);
    DrawStep = 5;                                      //go to next step
    break;                                             //end step 4
    
    case 5:                                            //step 5 audacity image text
    if (FlagTime==false) {                            //timing step
      StoreMillis = millis();
      fill(0);
      textSize (36);                                    //step 5 text
      text("...finally",10,450);
      text("on sounds",10,500);
      FlagTime = true;
    }
    if (FlagTime && millis() > StoreMillis + 10000) {        //after wait time...
      FlagTime = false;
      textSize (24);
      text("(please move your mouse on canvas)", 10,570);  //introduction text of mosaic step 
      DrawStep = 6;                                        // go to next step
    }
    break;                                                  //end step 5
    
    case 6:                                                                              //step 6 mosaic with mouse
    if (mouseX>100-DeltaPixel && mouseX<100+DeltaPixel && mouseY>75-DeltaPixel && mouseY<75+DeltaPixel) {    //when the mouse passes over the center of the piece + or - DeltaPixel pixel... 
      image(Partial1,0,0);                                                              //...see the piece n.1 of the mosaic
      if (FlagMosaic[1] == false) {
        BellSound.trigger();                                                                  //BellSound sound only one time
        FlagMosaic[1] = true;                                                                  //store the number of the piece visualized
      }
    }
    if (mouseX>300-DeltaPixel && mouseX<300+DeltaPixel && mouseY>75-DeltaPixel && mouseY<75+DeltaPixel) {    //idem
      image(Partial2,200,0);                                                            //piece n.2
      if (FlagMosaic[2] == false) {
        BellSound.trigger();
        FlagMosaic[2] = true;
      }
    }
    if (mouseX>500-DeltaPixel && mouseX<500+DeltaPixel && mouseY>75-DeltaPixel && mouseY<75+DeltaPixel) {    //idem
      image(Partial3,400,0);                                                            //piece n.3
      if (FlagMosaic[3] == false) {
        BellSound.trigger();
        FlagMosaic[3] = true;
      }
    }
    if (mouseX>700-DeltaPixel && mouseX<700+DeltaPixel && mouseY>75-DeltaPixel && mouseY<75+DeltaPixel) {
      image(Partial4,600,0);                                                            //piece n.4
      if (FlagMosaic[4] == false) {
        BellSound.trigger();
        FlagMosaic[4] = true;
      }
    }
    if (mouseX>100-DeltaPixel && mouseX<100+DeltaPixel && mouseY>225-DeltaPixel && mouseY<225+DeltaPixel) {
      image(Partial5,0,150);                                                            //piece n.5
      if (FlagMosaic[5] == false) {
        BellSound.trigger();
        FlagMosaic[5] = true;
      }
    }
    if (mouseX>300-DeltaPixel && mouseX<300+DeltaPixel && mouseY>225-DeltaPixel && mouseY<225+DeltaPixel) {
      image(Partial6,200,150);                                                          //piece n.6
      if (FlagMosaic[6] == false) {
        BellSound.trigger();
        FlagMosaic[6] = true;
      }
    }
    if (mouseX>500-DeltaPixel && mouseX<500+DeltaPixel && mouseY>225-DeltaPixel && mouseY<225+DeltaPixel) {
      image(Partial7,400,150);                                                          //piece n.7
      if (FlagMosaic[7] == false) {
        BellSound.trigger();
        FlagMosaic[7] = true;
      }
    }
    if (mouseX>700-DeltaPixel && mouseX<700+DeltaPixel && mouseY>225-DeltaPixel && mouseY<225+DeltaPixel) {
      image(Partial8,600,150);                                                          //piece n.8
      if (FlagMosaic[8] == false) {
        BellSound.trigger();
        FlagMosaic[8] = true;
      }
    }
    if (mouseX>100-DeltaPixel && mouseX<100+DeltaPixel && mouseY>375-DeltaPixel && mouseY<375+DeltaPixel) {
      image(Partial9,0,300);                                                            //piece n.9
      if (FlagMosaic[9] == false) {
        BellSound.trigger();
        FlagMosaic[9] = true;
      }
    }
    if (mouseX>300-DeltaPixel && mouseX<300+DeltaPixel && mouseY>375-DeltaPixel && mouseY<375+DeltaPixel) {
      image(Partial10,200,300);                                                          //piece n.10
      if (FlagMosaic[10] == false) {
        BellSound.trigger();
        FlagMosaic[10] = true;
      }
    }
    if (mouseX>500-DeltaPixel && mouseX<500+DeltaPixel && mouseY>375-DeltaPixel && mouseY<375+DeltaPixel) {
      image(Partial11,400,300);                                                          //piece n.11
      if (FlagMosaic[11] == false) {
        BellSound.trigger();
        FlagMosaic[11] = true;
      }
    }
    if (mouseX>700-DeltaPixel && mouseX<700+DeltaPixel && mouseY>375-DeltaPixel && mouseY<375+DeltaPixel) {
      image(Partial12,600,300);                                                          //piece n.12
      if (FlagMosaic[12] == false) {
        BellSound.trigger();
        FlagMosaic[12] = true;
      }
    }
    if ((mouseX>100-DeltaPixel) && (mouseX<100+DeltaPixel) && (mouseY>525-DeltaPixel) && (mouseY<525+DeltaPixel)) {
      image(Partial13,0,450);                                                                    //piece n.13
      if (FlagMosaic[13] == false) {
        BellSound.trigger();
        FlagMosaic[13] = true;
      }
    }
    if ((mouseX>300-DeltaPixel) && (mouseX<300+DeltaPixel) && (mouseY>525-DeltaPixel) && (mouseY<525+DeltaPixel)) {
      image(Partial14,200,450);                                                                  //piece n.14
      if (FlagMosaic[14] == false) {
        BellSound.trigger();
        FlagMosaic[14] = true;
      }
    }
    if ((mouseX>500-DeltaPixel) && (mouseX<500+DeltaPixel) && (mouseY>525-DeltaPixel) && (mouseY<525+DeltaPixel)) {
      image(Partial15,400,450);                                                                  //piece n.15
      if (FlagMosaic[15] == false) {
        BellSound.trigger();
        FlagMosaic[15] = true;
      }
    }
    if ((mouseX>700-DeltaPixel) && (mouseX<700+DeltaPixel) && (mouseY>525-DeltaPixel) && (mouseY<525+DeltaPixel)) {
      image(Partial16,600,450);                                                                  //piece n.16
      if (FlagMosaic[16] == false) {
        BellSound.trigger();
        FlagMosaic[16] = true;
      }
    }
    if (FlagMosaic[1] && FlagMosaic[2] && FlagMosaic[3] && FlagMosaic[4] && FlagMosaic[5] && FlagMosaic[6] && FlagMosaic[7] && FlagMosaic[8] && FlagMosaic[9] && FlagMosaic[10] && FlagMosaic[11] && FlagMosaic[12] && FlagMosaic[13] && FlagMosaic[14] && FlagMosaic[15] && FlagMosaic[16]) {
      DrawStep = 7;                                                    //when the mosaic is complete go to next step
    }    
    break;                                                              //end step 6
    
    case 7:                                                    //step 7 final text
    if (FlagTime==false) {                                    //timing step
      StoreMillis = millis();
      FlagTime = true;
    }
    if (FlagEntry == true) {
      DeltaTime = 3000;
    }
    if (FlagTime && millis() > StoreMillis + DeltaTime) {
      TxtNum +=1;
      FlagTime = false;
      print_text(TxtNum);
    }
    if (TxtNum > 8) {                                        
      DrawStep = 8;                                          //end of text
    }
    break;                                                    //end step 7
    
    case 8:
    noLoop();
    break;   
  }
  
}

void print_text (int text_number) {                          //text print procedure

switch(text_number) {
  case 1: 
    fill(0);
    textSize (24);
    text("Hello, my name is Bruno",20,50);
    FlagEntry = true;
    break;
  case 2: 
    fill(0);
    textSize (24);
    text("Arrived at the end",20,90);
    break;
  case 3: 
    fill(0);
    textSize (24);
    text("of this challenging course,",20,130);
    break;
  case 4: 
    fill(0);
    textSize (24);
    text("I want say goodbye",20,170);
    break;
  case 5: 
    fill(0);
    textSize (24);
    text("to my classmates,",20,210);
    break;
  case 6: 
    fill(0);
    textSize (24);
    text("and all the tutors",20,250);
    break;
  case 7: 
    fill(0);
    textSize (24);
    text("of Stony Brook University.",20,290);
    break;
  case 8: 
    XmasSound.play();
    fill (255,0,0);
    textSize (40);
    text("Happy holidays to all.",20,470);
    image (XmasPlant,100,490);
    image (XmasCandle,270,300);
    break;      
}
}

void star(int x,int y,int r) {                    //star draw procedure
float proportion=0.5;                            //set inner radius half of the outer
int P1X = x;                                    //the tip up...
int P1Y = y-r;                                  //...in clockwise rotation...
int P2X = x+int(cos(0.3*PI)*r*proportion);      //...inner point...
int P2Y = y-int(sin(0.3*PI)*r*proportion);      
int P3X = x+int(cos(0.1*PI)*r);                 //...the tip at the top right...
int P3Y = y-int(sin(0.1*PI)*r);
int P4X = x+int(cos(0.1*PI)*r*proportion);      //...inner point...
int P4Y = y+int(sin(0.1*PI)*r*proportion);
int P5X = x+int(cos(0.3*PI)*r);                 //...the tip at the bottom right...
int P5Y = y+int(sin(0.3*PI)*r);
int P6X = x;                                    //...inner point...
int P6Y = y+int(r*proportion);
int P7X = x-int(cos(0.3*PI)*r);                 //...the tip at the bottom left...
int P7Y = y+int(sin(0.3*PI)*r);
int P8X = x-int(cos(0.1*PI)*r*proportion);      //...inner point...
int P8Y = y+int(sin(0.1*PI)*r*proportion);
int P9X = x-int(cos(0.1*PI)*r);                 //...the tip at the top left...
int P9Y = y-int(sin(0.1*PI)*r);
int P10X = x-int(cos(0.3*PI)*r*proportion);     //...the last inner point
int P10Y = y-int(sin(0.3*PI)*r*proportion);

beginShape();
vertex (P1X,P1Y);                              //uses the calculated points to draw the shape...
vertex (P2X,P2Y);
vertex (P3X,P3Y);
vertex (P4X,P4Y);
vertex (P5X,P5Y);
vertex (P6X,P6Y);
vertex (P7X,P7Y);
vertex (P8X,P8Y);
vertex (P9X,P9Y);
vertex (P10X,P10Y);
vertex (P1X,P1Y);                              //...closed
endShape();
}

 

