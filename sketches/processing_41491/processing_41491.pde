
   //------audio players-----------
   import ddf.minim.*;
   import ddf.minim.signals.*;
   import ddf.minim.analysis.*;
   import ddf.minim.effects.*;
   Minim m;
   AudioPlayer p;
   AudioPlayer s;
   AudioPlayer s1;
   AudioPlayer s2;
   AudioPlayer s3;
   AudioPlayer s4;
   AudioPlayer s5;
   AudioPlayer s6;
   AudioPlayer s7;
   AudioPlayer s8;
  //------------------------------
  
  //--------Random Positions---------
  float La1 = random(150, 250);
  float La2 = random(150, 250);
  float Lb1 = random(0, 100);
  float Lb2 = random(100, 300);
  float Lc1 = random(300, 400);
  float Lc2 = random(0, 100);
  float Ld1 = random(0, 200);
  float Ld2 = random(350, 400);
  float Le1 = random(150, 350);
  float Le2 = random(150, 250);
  float Lf1 = random(250, 350);
  float Lf2 = random(50, 150);
  float Lg1 = random(300, 400);
  float Lg2 = random(250, 350);
  float Lh1 = random(400, 600);
  float Lh2 = random(250, 350);
  
  //---------------------------------
  
  //---variables for if snapped-------
   int snap1 = 2;
   int snap2 = 2;
   int snap3 = 2;
   int snap4 = 2;
   int snap5 = 2;
   int snap6 = 2;
   int snap7 = 2;
   int snap8 = 2;
  //-----------------------------------
  
  //--------------------------------------------
  
  //---snap animation variables for lines 1 - 6-----------
   int[] line1 = {400, 200, 400, 200};
   int[] line2 = {350, 100, 350, 100};
   int[] line3 = {400, 200, 400, 200};
   int[] line4 = {400, 250, 400, 250};
   int[] line5 = {400, 225, 400, 225};
   int[] line6 = {200, 200, 200, 200};
   int[] line7 = {525, 350, 525, 350};
   int[] line8 = {400, 200, 400, 200};
  //------------------------------------------------------
  
  //-----falling line variables---------------------------
   int n = 300;
   int l = 0;
   int y = 500;
   int u = 0;
   int o = 0;
   int i = 200;
   int e = 700;
   int r = 0;
   
   int f = 0;
   int g = 0;
  //-------------------------------------------------------
   
  //----setup size and load sound files---------
   void setup(){
   size(700,400);
   m = new Minim(this);
   p = m.loadFile("snap_back.wav");
   s = m.loadFile("break.wav");
   s1 = m.loadFile("snap_back_1.wav");
   s2 = m.loadFile("snap_back_2.wav");
   s3 = m.loadFile("snap_3.wav");
   s4 = m.loadFile("snap_4.wav");
   s5 = m.loadFile("snap_1.wav");
   s8 = m.loadFile("snap_new_2.wav");
   smooth();
   }
  //---------------------------------------------
  
  //-------colour and weight settings------
   void draw(){
   background(0);
   stroke(255, 100);
   strokeWeight(3);
   noFill();
  //---------------------------------------
 
  //------flex for line 1-------------------------
   if(snap1 == 2 && mousePressed == true){
   curve(mouseX, mouseY, 0, La1, 702, La2, mouseX, mouseY);
   }
  //----------------------------------------------
  
  //------flex for line 2------------------
   if(snap2 == 2 && mousePressed == true){
   curve(mouseX, mouseY, 0, Lb1, 700, Lb2, mouseX, mouseY);
   }
  //---------------------------------------
  
  //------flex for line 3------------------
   if(snap3 == 2 && mousePressed == true){
   curve(mouseX, mouseY, 0, Lc1, 700, Lc2, mouseX, mouseY);
   }
  //----------------------------------------
  
  //------flex for line 4------------------
   if(snap4 == 2 && mousePressed == true){
   curve(mouseX, mouseY, 0, Ld1, 700, Ld2, mouseX, mouseY);
   }
  //----------------------------------------
  
  //------flex for line 5------------------
   if(snap5 == 2 && mousePressed == true){
   curve(mouseX, mouseY, 0, Le1, 700, Le2, mouseX, mouseY);
   }
  //----------------------------------------
  
  //------flex for line 6------------------
   if(snap6 == 2 && mousePressed == true){
   curve(mouseX, mouseY, Lf1, 0, Lf2, 400, mouseX, mouseY);
   }
  //----------------------------------------
  
  //------flex for line 7------------------
   if(snap7 == 2 && mousePressed == true){
   curve(mouseX, mouseY, Lg1, 400, 700, Lg2, mouseX, mouseY);
   }
  //----------------------------------------
  
  //------flex for line 8------------------
   if(snap8 == 2 && mousePressed == true ){
   curve(mouseX, mouseY, Lh1, 0, Lh2, 400, mouseX, mouseY);
   }
  //----------------------------------------
  
  //-------changes variable snap1 if mouse goes into snap zone---
   //------  1  -----
   if(mouseY < -50 && mousePressed == true){
   line(o, i, line1[0], line1[1]);
   line(700, 200, line1[2], line1[3]);
   snap1 = 1;
   p.play();
   }
   //------  2  -----
   if(mouseY > 500 && mousePressed == true){
   line(f, g, line2[0], line2[1]);
   line(700, 200, line2[2], line2[3]);
   snap2 = 1;
   s.play();
   }
   //------  3  -----
   if(mouseX > 800 && mousePressed == true){
   line(0, 400, line3[0], line3[1]);
   line(e, r, line3[2], line3[3]);
   snap3 = 1;
   s1.play();
   }
     //------  4  -----
   if(mouseX < -100 && mousePressed == true){
   line(0, 100, line4[0], line4[1]);
   line(700, 400, line4[2], line4[3]);
   snap4 = 1;
   s2.play();
   }
    //------  5  -----
   if(mouseY < -100 && mousePressed == true){
   line(0, 250, line5[0], line5[1]);
   line(700, 200, line5[2], line5[3]);
   snap5 = 1;
   s3.play();
   }
    //------  6  -----
   if(mouseX < -100 && mousePressed == true){
   line(n, l, line6[0], line6[1]);
   line(100, 400, line6[2], line6[3]);
   snap6 = 1;
   s4.play();
   }
   
    if(mouseX > 800 && mousePressed == true){
   line(n, l, line6[0], line6[1]);
   line(100, 400, line6[2], line6[3]);
   snap6 = 1;
   s4.play();
   }
   
   //------  7  -----
   if(mouseY < 100 && mousePressed == true){
   line(350, 400, line7[0], line7[1]);
   line(700, 300, line7[2], line7[3]);
   snap7 = 1;
   s5.play();
   }
   //------  8  -----
   if(mouseX > 750 && mousePressed == true){
   line(y, u, line8[0], line8[1]);
   line(300, 400, line8[2], line8[3]);
   snap8 = 1;
   s8.play();
   }
  //--------------------------------------------------------------
  
  //----------if snapped then play snapped annimation for line 1---------------
    if(snap1 == 1){
    line(o, i, line1[0], line1[1]);
    line(700, 200, line1[2], line1[3]);
    line1[1] = line1[1] + 8;
    line1[0] = line1[0] - 5;
    line1[3] = line1[3] + 8;
    line1[2] = line1[2] + 3;
    o = o + 15;
    i = i + 10;
    }
   //---------------------------------------------------------------------------
  
   //----------same as above for line 2---------------
    if(snap2 == 1){
    line(f, g, line2[0], line2[1]);
    line(700, 200, line2[2], line2[3]);
    line2[1] = line2[1] + 10;
    line2[0] = line2[0] - 6;
    line2[3] = line2[3] + 9;
    line2[2] = line2[2] + 5;
    
    f = f + 6;
    g = g + 20;
    }
   //--------------------------------------------------
  
   //----------same as above for line 3---------------
    if(snap3 == 1){
    line(0, 400, line3[0], line3[1]);
    line(e, r, line3[2], line3[3]);
    line3[1] = line3[1] + 10;
    line3[0] = line3[0] - 4;
    line3[3] = line3[3] + 5;
    line3[2] = line3[2] + 5;
    e = e - 2;
    r = r + 12;
    }
   //--------------------------------------------------
  
   //----------same as above for line 4---------------
    if(snap4 == 1){
    line(0, 100, line4[0], line4[1]);
    line(700, 400, line4[2], line4[3]);
    line4[1] = line4[1] + 5;
    line4[0] = line4[0] - 7;
    line4[3] = line4[3] + 9;
    line4[2] = line4[2] + 5;
    }
    //----------same as above for line 5---------------
    if(snap5 == 1){
    line(0, 250, line5[0], line5[1]);
    line(700, 200, line5[2], line5[3]);
    line5[1] = line5[1] + 7;
    line5[0] = line5[0] - 7;
    line5[3] = line5[3] + 7;
    line5[2] = line5[2] + 7;
    }
   //--------------------------------------------------
  
   //----------same as above for line 6---------------
    if(snap6 == 1){
    line(n, l, line6[0], line6[1]);
    line(100, 400, line6[2], line6[3]);
    line6[1] = line6[1] + 4;
    line6[0] = line6[0] + 4;
    line6[3] = line6[3] + 6;
    line6[2] = line6[2] - 9;
    l = l + 10;
    }
   //--------------------------------------------------
   
   //----------same as above for line 7---------------
    if(snap7 == 1){
    line(350, 400, line7[0], line7[1]);
    line(700, 300, line7[2], line7[3]);
    line7[1] = line7[1] + 5;
    line7[0] = line7[0] - 5;
    line7[3] = line7[3] + 7;
    line7[2] = line7[2] + 5;
    }
   //-------------------------------------------------
   
    //----------same as above for line 8---------------
    if(snap8 == 1){
    line(y, u, line8[0], line8[1]);
    line(300, 400, line8[2], line8[3]);
    line8[1] = line8[1] + 4;
    line8[0] = line8[0] + 4;
    line8[3] = line8[3] + 9;
    line8[2] = line8[2] + 9;
    u = u + 9;
    y = y + 2;
    }
   //--------------------------------------------------
   
   //-------line returns if mouse is released and line is not snapped-----
    if(mousePressed == false && snap1 == 2){
    line(0, La1, 700, La2);
    }
   //----------------------------------------------------------------------
  
   //--------same as above for line 2-------------------------
    if(mousePressed == false && snap2 == 2){
    line(0, Lb1, 700, Lb2);
    }
   //---------------------------------------------------------
   
   //--------same as above for line 3-------------------------
    if(mousePressed == false && snap3 == 2){
    line(0, Lc1, 700, Lc2);
    }
   //---------------------------------------------------------
   
   //--------same as above for line 4-------------------------
    if(mousePressed == false && snap4 == 2){
    line(0, Ld1, 700, Ld2);
    }
   //---------------------------------------------------------
   
   //--------same as above for line 5-------------------------
    if(mousePressed == false && snap5 == 2){
    line(0, Le1, 700, Le2);
    }
   //---------------------------------------------------------
   
   //--------same as above for line 6-------------------------
    if(mousePressed == false && snap6 == 2){
    line(Lf1, 0, Lf2, 400);
    }
   //---------------------------------------------------------
   
   //--------same as above for line 7-------------------------
    if(mousePressed == false && snap7 == 2){
    line(Lg1, 400, 700, Lg2);
    }
   //---------------------------------------------------------
   
   //--------same as above for line 8-------------------------
    if(mousePressed == false && snap8 == 2){
    line(Lh1, 0, Lh2, 400);
    }
   //---------------------------------------------------------
   
   //--close draw-----
    }
   //-----------------
   
   //-----reset application-----------------
    void keyPressed(){
   
   snap1 = 2;
   snap2 = 2;
   snap3 = 2;
   snap4 = 2;
   snap5 = 2;
   snap6 = 2;
   snap7 = 2;
   snap8 = 2;
     
   line1[0] = 400; line1[1] = 200; line1[2] = 400; line1[3] = 200;
   line2[0] = 350; line2[1] = 100; line2[2] = 350; line2[3] = 100;
   line3[0] = 400; line3[1] = 200; line3[2] = 400; line3[3] = 200;
   line4[0] = 400; line4[1] = 250; line4[2] = 400; line4[3] = 250;
   line5[0] = 400; line5[1] = 225; line5[2] = 400; line5[3] = 225;
   line6[0] = 200; line6[1] = 200; line6[2] = 200; line6[3] = 200;
   line7[0] = 525; line7[1] = 350; line7[2] = 525; line7[3] = 350;
   line8[0] = 400; line8[1] = 200; line8[2] = 400; line8[3] = 200;
   
   n = 300;
   l = 0;
   y = 500;
   u = 0;
   o = 0;
   i = 200;
   e = 700;
   r = 0;
   f = 0;
   g = 0;
   
   m = new Minim(this);
   p = m.loadFile("snap_back.wav");
   s = m.loadFile("break.wav");
   s1 = m.loadFile("snap_back_1.wav");
   s2 = m.loadFile("snap_back_2.wav");
   s3 = m.loadFile("snap_3.wav");
   s4 = m.loadFile("snap_4.wav");
   s5 = m.loadFile("snap_1.wav");
   s8 = m.loadFile("snap_new_2.wav");
   
  La1 = random(150, 250);
  La2 = random(150, 250);
  Lb1 = random(0, 100);
  Lb2 = random(100, 300);
  Lc1 = random(300, 400);
  Lc2 = random(0, 100);
  Ld1 = random(0, 200);
  Ld2 = random(350, 400);
  Le1 = random(150, 350);
  Le2 = random(150, 250);
  Lf1 = random(250, 350);
  Lf2 = random(50, 150);
  Lg1 = random(300, 400);
  Lg2 = random(250, 350);
  Lh1 = random(400, 600);
  Lh2 = random(250, 350);
   
    }
   //---------------------------------------


