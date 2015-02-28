
  //------audio players-----------
   import ddf.minim.*;
   import ddf.minim.signals.*;
   import ddf.minim.analysis.*;
   import ddf.minim.effects.*;
   Minim m;
   AudioPlayer p;
   //AudioPlayer a;
   AudioPlayer s;
  //------------------------------

  //---variables for if snapped-------
   int snap1 = 2;
   int snap2 = 2;
   int snap3 = 2;
   int snap4 = 2;
   int snap5 = 2;
   int snap6 = 2;
  //-----------------------------------
  
  //--------------------------------------------
  
  //---snap animation variables for lines 1 - 5-----------
   int[] line1 = {300, 200, 400, 200};
   int[] line2 = {350, 200, 350, 200};
   //int[] line3 = {?, ?, ?, ?};
   //int[] line4 = {?, ?, ?, ?};
   //int[] line5 = {?, ?, ?, ?};
  //------------------------------------------------------
  
  //----setup size and load sound files---------
   void setup(){
   size(700,400);
   m = new Minim(this);
   p = m.loadFile("snap_back.wav");
   s = m.loadFile("break.wav");
   //a = m.loadFile("zip.wav");
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
   if(snap1 == 2 && mousePressed == true 
   //--snapback turned off--//&& mouseY < 600 && mouseY > -200 && mouseX > -200 && mouseX < 900
   ){
   curve(mouseX, mouseY, -2, 200, 702, 200, mouseX, mouseY);
   }
  //----------------------------------------------
  
  //------flex for line 2------------------
   if(snap2 == 2 && mousePressed == true 
   //--snap back turned off--//&& mouseY < 600 && mouseY > -200 && mouseX > -200 && mouseX < 900
   ){
   curve(mouseX, mouseY, -2, 0, 702, 200, mouseX, mouseY);
   }
  //---------------------------------------
  
  //------flex for line 3------------------
   if(snap3 == 2 && mousePressed == true 
   //--snap back turned off--//&& mouseY < 600 && mouseY > -200 && mouseX > -200 && mouseX < 900
   ){
   curve(mouseX, mouseY, 0, 400, 700, 0, mouseX, mouseY);
   }
  //----------------------------------------
  
  //------flex for line 4------------------
   if(snap4 == 2 && mousePressed == true 
   //--snap back turned off--//&& mouseY < 600 && mouseY > -200 && mouseX > -200 && mouseX < 900
   ){
   curve(mouseX, mouseY, 0, 100, 700, 400, mouseX, mouseY);
   }
  //----------------------------------------
  
  //------flex for line 5------------------
   if(snap5 == 2 && mousePressed == true 
   //--snap back turned off--//&& mouseY < 600 && mouseY > -200 && mouseX > -200 && mouseX < 900
   ){
   curve(mouseX, mouseY, 0, 250, 700, 200, mouseX, mouseY);
   }
  //----------------------------------------
  
  //------flex for line 6------------------
   if(snap6 == 2 && mousePressed == true 
   //--snap back turned off--//&& mouseY < 600 && mouseY > -200 && mouseX > -200 && mouseX < 900
   ){
   curve(mouseX, mouseY, 300, 0, 100, 400, mouseX, mouseY);
   }
  //----------------------------------------
  
  //-------changes variable snap1 if mouse goes into snap zone---
   //------  1  -----
   if(mouseY > 500 && mousePressed == true){
   line(0, 200, line1[0], line1[1]);
   line(700, 200, line1[2], line1[3]);
   snap1 = 1;
   }
   //------  2  -----
   if(mouseY > 600 && mousePressed == true){
   line(0, 0, line2[0], line2[1]);
   line(700, 200, line2[2], line2[3]);
   snap2 = 1;
   }
  //--------------------------------------------------------------
  
  /*--turned off snap back for line 1----
  //---------snap back for when line does not snap-------
   if(snap1 == 2 && mouseY < -200 && mousePressed == true){line(0, 200, 700, 200);}
   if(snap1 == 2 && mouseX < -200 && mousePressed == true){line(0, 200, 700, 200);}
   if(snap1 == 2 && mouseX > 900 && mousePressed == true){line(0, 200, 700, 200);}
  //-----------------------------------------------------
  *///-------------------------------------
  
  //----------if snapped then play snapped annimation for line 1---------------
    if(snap1 == 1){
    line(0, 200, line1[0], line1[1]);
    line(700, 200, line1[2], line1[3]);
    line1[1] = line1[1] + 8;
    line1[0] = line1[0] - 3;
    line1[3] = line1[3] + 8;
    line1[2] = line1[2] + 3;
    }
   //---------------------------------------------------------------------------
  
   //----------same as above for line 2---------------
    if(snap2 == 1){
    line(0, 0, line2[0], line2[1]);
    line(700, 200, line2[2], line2[3]);
    line2[1] = line2[1] + 5;
    line2[0] = line2[0] - 7;
    line2[3] = line2[3] + 9;
    line2[2] = line2[2] + 5;
    }
   //--------------------------------------------------
  
   //-------line returns if mouse is released and line is not snapped-----
    if(mousePressed == false && snap1 == 2){
    line(0, 200, 700, 200);
    //a.loop(0);
    }
   //----------------------------------------------------------------------
  
   //--------same as above for line 2-------------------------
    if(mousePressed == false && snap2 == 2){
    line(0, 0, 700, 200);
    }
   //---------------------------------------------------------
   
   //--------same as above for line 3-------------------------
    if(mousePressed == false && snap3 == 2){
    line(0, 400, 700, 0);
    }
   //---------------------------------------------------------
   
   //--------same as above for line 4-------------------------
    if(mousePressed == false && snap4 == 2){
    line(0, 100, 700, 400);
    }
   //---------------------------------------------------------
   
   //--------same as above for line 5-------------------------
    if(mousePressed == false && snap5 == 2){
    line(0, 250, 700, 200);
    }
   //---------------------------------------------------------
   
   //--------same as above for line 6-------------------------
    if(mousePressed == false && snap6 == 2){
    line(300, 0, 100, 400);
    }
   //---------------------------------------------------------
   
   //--close draw-----
    }
   //-----------------
   
   //-----reset application-----------------
    void keyPressed(){
      //reset
    }
   //---------------------------------------

