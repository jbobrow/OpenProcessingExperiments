
int currentPage = 0; //Start Page
int skip = 0;
float r;
boolean clearbackground = true;
PImage StartPage; //Starting Page
PImage Rules; //Rules Button
PImage Credits; //Credits Button
PImage FanArt; //FanArt Button
PImage Level1; // Level 1
PImage Level2; //Level 2
PImage Start; //Start Button
PImage Button12; //Level 1 button 12
PImage Button31; //Level 1 button 31
PImage Button23; //Level 1 button 23
PImage Button29; //Level 1 button 29
PImage CrazySide; //Level 2 Crazy side
PImage GameOver; //Game over page
PImage TryAgain; //Try again button
PImage Skip; //Skip button
PImage RulesPa; //Rules Page
PImage StartButton; //StartButton For Rules Page
PImage CreditsPage; //Credits Page
PImage Back; //Back to start button
PImage FanArtPa; //Fan Art Page
PImage Smile; //Smile Image
PImage Donot; //Do not button
PImage GoAway; //Go away button
PImage NoChance; //No Chance button
PImage No; //No button
PImage Yes; //Yes button
PImage Donot1; // Do Not Button
PImage GoAway1; //Go Away button
PImage NoChance1; //No Chance button
PImage No1; //No button
PImage Yes1; //Yes button
PImage Skipbutton; //Skip button
PImage Level3; //Level 3
PImage Champ; //Winning Page
PImage Button27; //Number 27
PImage Button272; //Number 27
PImage Button273; //Number 27
PImage Button274; //Number 27
PImage Button275; //Number 27
PImage Button276; //Number 27
PImage Button277; //Number 27
PImage Button278; //Number 27
PImage Button279; //Number 27
PImage Button2710; //Number 27
PImage Button2711; //Number 27
PImage Button2712; //Number 27
PImage Button2713; //Number 27
PImage Button2714; //Number 27
PImage Button2715; //Number 27
PImage Button2716; //Number 27
PImage Button2717; //Number 27
PImage Button2718; //Number 27
PImage Button2719; //Number 27
PImage Button2720; //Number 27
PImage Button2721; //Number 27
PImage Button2722; //Number 27
PImage Button2723; //Number 27
PImage Button2724; //Number 27
PImage Button2725; //Number 27
PImage Button2726; //Number 27
PImage Button2727; //Number 27
PImage Button2728; //Number 27
PImage Button2729; //Number 27
PImage Button2730; //Number 27
PImage Button2731; //Number 27
PImage Button2732; //Number 27
PImage Button2733; //Number 27
PImage Button2734; //Number 27
PImage Button2735; //Number 27
PImage Button2736; //Number 27
PImage Button2737; //Number 27
PImage Button2738; //Number 27
PImage Button2739; //Number 27
PImage Button2740; //Number 27

void setup (){
 size (760,505); //Size of screen 
 background(0); //Background color
 StartPage = loadImage("Start Page.png"); // Load Image Start Page
 Rules = loadImage("RulesButton.png"); //Load Image Rules Button
 Credits = loadImage("CreditsButton.png"); //Load Image Credits Button
 FanArt = loadImage("FanArtButton.png"); //Load Image Fan Art Button
 Level1 = loadImage("Level1.png"); //Load Image Level 1
 Level2 = loadImage("Screen2.png"); //Load Image Level 2 Screen
 Start = loadImage("Start.png"); //Load Image Start Button
 Button12 = loadImage("12Button.png"); //Load Image 12 Button Level 1
 Button31 = loadImage("31Button.png"); //Load Image 31 Button Level 1
 Button23 = loadImage("23Button.png"); //Load Iamge 23 Button Level 1
 Button29 = loadImage("29Button.png"); //Load Image 29 Button Level 1
 CrazySide = loadImage("Screen.png"); //Load Image Level 2 Crazy Side
 GameOver = loadImage("Game Over.png"); //Load Image Game Over Page
 TryAgain = loadImage("TryAgain.png"); //Load Image Try Again Button
 Skip = loadImage("Skipbutton.png"); //Load Image Skip Button
 RulesPa = loadImage("Rules Page.png"); //Load Image Rules Page
 StartButton =loadImage ("StartGame.png"); //Load Image Start Button
 CreditsPage =loadImage("CreditsPage.png"); //Load Image Credits Page
 Back =loadImage ("Back to start.png"); //Load Image Back to start
 FanArtPa=loadImage("Fan Art.png"); //Load Image Fan Art Page
 Smile =loadImage("Smile.png"); //Load Image Smile
 Donot = loadImage("Do not want.png"); //Load Image Donot
 GoAway = loadImage("Go Away.png"); //Load Image Go Away
 NoChance = loadImage("No Chance.png"); //Load Image No chance
 No = loadImage("No.png"); //Load Image No
 Yes = loadImage("Yes.png"); //Load Image Yes
 Donot1 =loadImage("Do not wamt.png"); //Load Image Do not want
 GoAway1 = loadImage("Go Away.png"); //Load Image Go Away
 NoChance1 = loadImage("No Chance.png"); //Load Image No Chance
 No1 = loadImage("No.png"); //Load Image No
 Yes1 = loadImage("Yes.png"); //Load Image Yes
 Skipbutton = loadImage("Skip Button 1.png"); //Load Image Skip button
 Level3 = loadImage("Level3.png"); //Load Image Level 3
 Champ = loadImage("Congratulations screen.png"); //Winning Page
 Button27 = loadImage("27.png"); //Load Image 27
 Button272 = loadImage("27.png"); //Load Image 27
 Button273 = loadImage("27.png"); //Load Image 27
 Button274 = loadImage("27.png"); //Load Image 27
 Button275 = loadImage("27.png"); //Load Image 27
 Button276 = loadImage("27.png"); //Load Image 27
 Button277 = loadImage("27.png"); //Load Image 27
 Button278 = loadImage("27.png"); //Load Image 27
 Button279 = loadImage("27.png"); //Load Image 27
 Button2710 = loadImage("27.png"); //Load Image 27
 Button2711 = loadImage("27.png"); //Load Image 27
 Button2712 = loadImage("27.png"); //Load Image 27
 Button2713 = loadImage("27.png"); //Load Image 27
 Button2714 = loadImage("27.png"); //Load Image 27
 Button2715 = loadImage("27.png"); //Load Image 27
 Button2716 = loadImage("27.png"); //Load Image 27
 Button2717 = loadImage("27.png"); //Load Image 27
 Button2718 = loadImage("27.png"); //Load Image 27
 Button2719 = loadImage("27.png"); //Load Image 27
 Button2720 = loadImage("27.png"); //Load Image 27
 Button2721 = loadImage("27.png"); //Load Image 27
 Button2722 = loadImage("27.png"); //Load Image 27
 Button2723 = loadImage("27.png"); //Load Image 27
 Button2724 = loadImage("27.png"); //Load Image 27
 Button2725 = loadImage("27.png"); //Load Image 27
 Button2726 = loadImage("27.png"); //Load Image 27
 Button2727 = loadImage("27.png"); //Load Image 27
 Button2728 = loadImage("27.png"); //Load Image 27
 Button2729 = loadImage("27.png"); //Load Image 27
 Button2730 = loadImage("27.png"); //Load Image 27
 Button2731 = loadImage("27.png"); //Load Image 27
 Button2732 = loadImage("27.png"); //Load Image 27
 Button2733 = loadImage("27.png"); //Load Image 27
 Button2734 = loadImage("27.png"); //Load Image 27
 Button2735 = loadImage("27.png"); //Load Image 27
 Button2736 = loadImage("27.png"); //Load Image 27
 Button2737 = loadImage("27.png"); //Load Image 27
 Button2738 = loadImage("27.png"); //Load Image 27
 Button2739 = loadImage("27.png"); //Load Image 27
 Button2740 = loadImage("27.png"); //Load Image 27
  
}
void draw (){
 if(currentPage ==0){ //Starting Page
  image(StartPage,0,0); //Location of Start Page
  image(Rules, 405,256); //Location of Rules Button
  image(Credits,97,382); //Loaction of Creidts Button
  image(FanArt,405,384); //Location of Fan Art Button
  image(Start,97,257); //Location of Start Button
}
 else if(currentPage ==1){ //Level 1
  image(Level1, 0,0); //Location of Level 1
  image(Button12,400,153); //Location of Button 12
  image(Button31,55, 155); //Location of Button 31
  image(Button23,52, 257); //Location of Button 23
  image(Button29, 398, 259); //Location of Button 29
  if(skip==0){
  image(Skip,711,461); //Location of Skip Button
   }
  }
   else if(currentPage==2){ //Level 2
    image(Level2,0,0); //Level 2 Page
    if(skip==0){
      image(Skipbutton,40,600); //Skip button
    }
   if(mouseX >290 && mouseX < 499 && mouseY > 370 && mouseY <424){
      image(GoAway,300,400); //Go Away button
   }
   else if(mouseX >200 && mouseX <419 && mouseY >200 && mouseY <270){
      image(NoChance,200,200); //No Chance button
   }
   else if (mouseX >0 && mouseX <186 && mouseY >0 && mouseY <150){
      image(Donot,0,0); //Do not want button 
   }
   else if(mouseX >500 && mouseX <565 && mouseY >95 && mouseY <146){
      image(Yes,500, 95); //Yes button
   }
   else if(mouseX >25 && mouseX <117 && mouseY >355 && mouseY <402){
      image(No,25,355); //No button
   }
   else if(mouseX >26 && mouseX <235 && mouseY >210 && mouseY <264){
      image(GoAway1,26,210); //Go Away Button
   }
   else if(mouseX >534 && mouseX <753 && mouseY >183 && mouseY <253){
       image(NoChance1,534,183); //No Chance button
   }
   else if(mouseX >356 && mouseX <448 && mouseY >45 && mouseY <92){
       image(No1,356,45); //No button 
   }
   else if(mouseX >275  && mouseX <340 && mouseY >285 && mouseY <336){
       image(Yes1,275,285); //Yes button
   }
  }
   else if(currentPage==4){ //Game Over
       image(GameOver,0,0); //Game Over Page
       image(TryAgain,200,400); //Try Again Button
   }
   else if(currentPage==5){//Rules Page
       image(RulesPa,0,0); //Rules Page
       image(StartButton, 240,330); //Start Button
   }
   else if(currentPage==6){
       image(CreditsPage,0,0); //Credits Page
       image(Back,218,378); //Back to start button
   }
   else if(currentPage==7){
     if (clearbackground == true){
       image(FanArtPa,0,0); //Fan Art Page
       image(Back, 0,0); //Back button
     }
   clearbackground = false;
    randomart(); //Random Art
 //69
 }
   else if(currentPage==8){
    image(Level3,0,0); //Level 3
    image(Button27,63,157); //Button number 27
    image(Button272,128,157); //Button number 27
    image(Button273,195,157); //Button number 27
    image(Button274,262,157); //Button number 27
    image(Button275,329,157); //Button number 27
    image(Button276,396,157); //Button number 27
    image(Button277,463,157); //Button number 27
    image(Button278,530,157); //Button number 27
    image(Button279,597,157); //Button number 27
    image(Button2710,664,157); //Button number 27
    image(Button2711,63,206); //Button number 27
    image(Button2712,128,206); //Button number 27
    image(Button2713,195,206); //Button number 27
    image(Button2714,262,206); //Button number 27
    image(Button2715,329,206); //Button number 27
    image(Button2716,396,206); //Button number 27
    image(Button2717,463,206); //Button number 27
    image(Button2718,530,206); //Button number 27
    image(Button2719,597,206); //Button number 27
    image(Button2720,664,206); //Button number 27
    image(Button2721,61,255); //Button number 27
    image(Button2722,126,255); //Button number 27
    image(Button2723,193,255); //Button number 27
    image(Button2724,259,255); //Button number 27
    image(Button2725,327,255); //Button number 27
    image(Button2726,394,255); //Button number 27
    image(Button2727,461,255); //Button number 27
    image(Button2728,528,255); //Button number 27
    image(Button2729,595,255); //Button number 27
    image(Button2730,662,255); //Button number 27
    image(Button2731,60,304); //Button number 27
    image(Button2732,125,304); //Button number 27
    image(Button2733,192,304); //Button number 27
    image(Button2734,259,304); //Button number 27
    image(Button2735,326,304); //Button number 27
    image(Button2736,393,304); //Button number 27
    image(Button2737,460,304); //Button number 27
    image(Button2738,527,304); //Button number 27
    image(Button2739,594,304); //Button number 27
    image(Button2740,661,304); //Button number 27
    
 }
 else if(currentPage==9){
    image(Champ,0,0); //Winning page
 }
}


void mousePressed(){ //MousePressed
  if(currentPage ==0 && mouseX >97&&mouseX<341 && mouseY >257&& mouseY<351){ //Start Button Press
    currentPage=1; //Page the button will lead to
  }
  //else if(currentPage==0 && mouse
  else if(currentPage==1 && mouseX >711 && mouseX <756 && mouseY >461 && mouseY <501){ //Skip Button Press
   if( skip==0){
    currentPage=2; //Page the button will lead to
   }
     skip= skip+1;
  } 
  else if(currentPage==1 && mouseX >400 && mouseX<706 && mouseY >153 && mouseY <249){ //Button 12 Press
     currentPage=2; //Page the button will lead to
  }
  else if(currentPage==1 && mouseX >55 && mouseX <361 && mouseY >155 && mouseY<249){ //Button 31 Press
     currentPage=4; //Page the button will lead to
  }
  else if(currentPage==1 && mouseX >398 && mouseX <705 && mouseY >259 && mouseY<354){ //Button 29 Press
     currentPage=4; //Page the button will lead to
  }
  else if(currentPage==1 && mouseX >52 && mouseX <357 && mouseY >257 && mouseY <352){ //Button 23 Press
     currentPage=4; //Page the button will lead to
  }
  else if(currentPage==4 && mouseX >200 && mouseX <433 && mouseY >400 && mouseY <445){ //Try Again Button Press
     currentPage=0; //Page the button will lead to
  }
  else if(currentPage==0 && mouseX >405 && mouseX <647 && mouseY >256 && mouseY<353){
     currentPage=5; //Page the button will lead to
  }
  else if(currentPage==5 && mouseX >240 && mouseX <526 && mouseY >330 && mouseY<410){
     currentPage=1; //Page the button will lead to
  }
  else if(currentPage==0 && mouseX >97 && mouseX <339 && mouseY >382 && mouseY <478){
     currentPage=6; //Page the button will lead to 
  }
  else if(currentPage==6 && mouseX >218 && mouseX <502 && mouseY >378 && mouseY <453){
     currentPage=0; //Page the button will lead to
 }
 else if(currentPage==0 && mouseX >405 && mouseX <646 && mouseY >384 && mouseY <479){
     currentPage=7; //Page the button will lead to
 }
 else if(currentPage==7 && mouseX >0 && mouseX <284 && mouseY >0 && mouseY <75){
     currentPage=0; //Page the button will lead to
     clearbackground = true; //Clears the background once 
 }
 else if(currentPage==2 && mouseX >0 && mouseX < 186 && mouseY >0 && mouseY <150){
     currentPage=4; //Page the button will lead to 
 }
 else if(currentPage==2 && mouseX >300 && mouseX <509 && mouseY >400 && mouseY <454){
     currentPage=4;//Page the button will lead to
 }
 else if(currentPage==2 && mouseX >290 && mouseX < 499 && mouseY > 370 && mouseY <424){
     currentPage=4; //Page the button wi1l lead to
 }
 else if(currentPage==2 && mouseX >200 && mouseX <419 && mouseY >200 && mouseY <270){
     currentPage=4; //Page the button will lead to 
 }
 else if(currentPage==2 && mouseX >500 && mouseX <565 && mouseY >95 && mouseY <146){
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==2 && mouseX >25 && mouseX <117 && mouseY >355 && mouseY <402){
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==2 && mouseX >26 && mouseX <235 && mouseY >210 && mouseY <264){
     currentPage=4; //Page the button will lead to 
 }
 else if(currentPage==2 && mouseX >534 && mouseX <753 && mouseY >183 && mouseY <253){
     currentPage=4; //Page the button will lead to 
 }
 else if(currentPage==2 && mouseX >356 && mouseX <448 && mouseY >45 && mouseY <92){
     currentPage=4; //Page teh button will lead to041
 }
 else if(currentPage==2 && mouseX >275  && mouseX <340 && mouseY >285 && mouseY <336){
     currentPage=8; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >63 && mouseX <116 && mouseY >157 && mouseY <198){  //Number 27
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >128 && mouseX <181 && mouseY >157 && mouseY <198){ //Number 272
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >195 && mouseX <248 && mouseY >157 && mouseY <198){ //Number 273
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >262 && mouseX <315 && mouseY >157 && mouseY <198){ //Number 274
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >329 && mouseX <382 && mouseY >157 && mouseY <198){ //Number 275
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >396 && mouseX <449 && mouseY >157 && mouseY <198){ //Number 276
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >463 && mouseX <516 && mouseY >157 && mouseY <198){ //Number 277
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >530 && mouseX <583 && mouseY >157 && mouseY <198){ //Number 278
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >597 && mouseX <650 && mouseY >157 && mouseY <198){ //Number 279
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >664 && mouseX <717 && mouseY >157 && mouseY <198){ //Number 2710
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >63 && mouseX <116 && mouseY >206 && mouseY <247){  //Number 2711
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >128 && mouseX <181 && mouseY >206 && mouseY <247){ //Number 2712
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >195 && mouseX <248 && mouseY >206 && mouseY <247){ //Number 2713
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >262 && mouseX <315 && mouseY >206 && mouseY <247){ //Number 2714
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >329 && mouseX <382 && mouseY >206 && mouseY <247){ //Number 2715
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >396 && mouseX <449 && mouseY >206 && mouseY <247){ //Number 2716
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >463 && mouseX <516 && mouseY >206 && mouseY <247){ //Number 2717
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >530 && mouseX <583 && mouseY >206 && mouseY <247){ //Number 2718
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >597 && mouseX <650 && mouseY >206 && mouseY <247){ //Number 2719
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >664 && mouseX <717 && mouseY >206 && mouseY <247){ //Number 2720
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >61 && mouseX <114 && mouseY >255 && mouseY <296){  //Number 2721
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >126 && mouseX <179 && mouseY >255 && mouseY <296){ //Number 2722
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >193 && mouseX <246 && mouseY >255 && mouseY <296){ //Number 2723
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >259 && mouseX <313 && mouseY >255 && mouseY <296){ //Number 2724
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >327 && mouseX <380 && mouseY >255 && mouseY <296){ //Number 2725
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >394 && mouseX <447 && mouseY >255 && mouseY <296){ //Number 2726
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >461 && mouseX <514 && mouseY >255 && mouseY <296){ //Number 2727
     currentPage=9; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >528 && mouseX <581 && mouseY >255 && mouseY <296){ //Number 2728
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >595 && mouseX <648 && mouseY >255 && mouseY <296){ //Number 2729
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >662 && mouseX <715 && mouseY >255 && mouseY <296){ //Number 2730
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >60 && mouseX <113 && mouseY >304 && mouseY <345){  //Number 2731
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >125 && mouseX <178 && mouseY >304 && mouseY <345){ //Number 2732
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >192 && mouseX <245 && mouseY >304 && mouseY <345){ //Number 2733
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >259 && mouseX <312 && mouseY >304 && mouseY <345){ //Number 2734
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >326 && mouseX <379 && mouseY >304 && mouseY <345){ //Number 2735
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >393 && mouseX <446 && mouseY >304 && mouseY <345){ //Number 2736
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >460 && mouseX <513 && mouseY >304 && mouseY <345){ //Number 2737
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >527 && mouseX <580 && mouseY >304 && mouseY <345){ //Number 2738
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >594 && mouseX <647 && mouseY >304 && mouseY <345){ //Number 2739
     currentPage=4; //Page the button will lead to
 }
 else if(currentPage==8 && mouseX >661 && mouseX <714 && mouseY >304 && mouseY <345){ //Number 2740
     currentPage=4; //Page the button will lead to
 }
}



void randomart(){
  image(Smile,random(706),random(505));
}


