

//determines whether the player has completed or failed/incompleted an arc
boolean allyDeucalion = false;
boolean allyTeille = false;
boolean allySironia = false;

int totalAllies = 0;

boolean completedDeucalion = false;
boolean completedSironia = false;
boolean completedTeille = false;

//tracks the panels which the player is on.
int panelTracker = 1;

//determines whether prev/next buttons will show up
boolean prevButton = false;
boolean nextButton = true;

//determines which of the arcs or sections the player is currently playing.
boolean playPrologue = true;
boolean playExposition = false;
boolean playIncident = false;
boolean playDeucalion = false;
boolean playTeille = false;
boolean playSironia = false;
boolean playFogelrith = false;
boolean selectStoryArc = false;

//decision making integers
int decAMouseX1;
int decAMouseX2;
int decAMouseY1;
int decAMouseY2;

int decBMouseX1;
int decBMouseX2;
int decBMouseY1;
int decBMouseY2;

//prologue decision booleans.
boolean stayWithStruggleFree;
boolean tellAboutNecklace;
boolean waitRunAway;
boolean takeStrangerHand;
boolean stayPut;

//exposition decision booleans
boolean protestOrPout;
boolean volunteerStayQuiet = true;
boolean helpVillagers;

//initiating incident decision booleans
boolean makeSceneAtParty;

//Deucalion decision booleans
boolean flowerGuy;
boolean brusqueAndRude;
boolean trenteAccepts;
boolean followBoy;
boolean stopTheft;
boolean redeemSelf;

//Teille decision booleans
boolean setUpCamp;
boolean killBoar;
boolean createDistraction;
boolean tameAnimal;
boolean tameAnimal2; //for the instance where you don't/can't volunteer Rolan
boolean volunteerRolan;

//Sironia decision booleans
boolean stayTheNight;
boolean fightCoyotes;
boolean investigateNoise;
boolean tellAboutSlaves;

//Fogelrith decision booleans
boolean attackDirectly;
boolean defendOlRaisin;
boolean olRaisinDies;

PImage fwdButton;
PImage bckButton;
PImage textBG;
PImage panelImage;

void setup(){
size(1000,700);
background(255,255,255);
fill(0,0,0);
frameRate(10);

fwdButton = loadImage("next.png");
bckButton = loadImage("prev.png");
textBG = loadImage("textbg.png");
panelImage = loadImage("Forest_colourize.png");
}


void draw(){
  background(255,255,255); 
  
  //loads the font used for the panels
  PFont GabriolaFont = loadFont("Gabriola-30.vlw");
  textFont(GabriolaFont);
  
  //sets up the background and the prev/next buttons
    image(panelImage, 0, 0);
    image(textBG, 0, 500);
    if (nextButton == true) {
      image(fwdButton, 880, 640);
    }
    if (prevButton == true) {
      image(bckButton, 10, 640);
    }
    
    
    //play the prologue
   if (playPrologue == true){ 
  prologueStory();
   }
   
   //play the exposition
   else if (playExposition == true) {
     expositionStory();
   }
   
   //play the initiating incident
   else if (playIncident == true) {
     incidentStory();
   }
   
   //play Deucalion
   else if (playDeucalion == true) {
     deucalionStory();
   }
   
   else if (playSironia == true) {
     sironiaStory();
   }
   
   else if (playTeille == true) {
     teilleStory();
   }
   
   else if (playFogelrith == true) {
     fogelrithStory();
   }
   
   else if (selectStoryArc == true) {
     arcSelection();
   }
}

void arcSelection() {
  playPrologue = false;
  playExposition = false;
  playIncident = false;
  playDeucalion = false;
  playTeille = false;
  playSironia = false;
  playFogelrith = false;
  prevButton = false;
  nextButton = false;
  if (completedDeucalion == false) {
    fill(255, 255, 255);
    rect(245, 510, 190, 40);
    fill(0,0,0);
    text("Ally with Deucalion", 250, 540);
    if ((mousePressed) && (mouseX > 245 && mouseX < 435) && (mouseY > 510 && mouseY < 550)) {
      panelTracker = 1;
      selectStoryArc = false;
      playDeucalion = true;
      nextButton = true;
    }
  }
  
  if (completedSironia == false) {
    fill(255, 255, 255);
    rect(545, 510, 170, 40);
    fill(0,0,0);
    text("Ally with Sironia", 550, 540);
    if ((mousePressed) && (mouseX > 545 && mouseX < 715) && (mouseY > 510 && mouseY < 550)) {
      panelTracker = 1;
      selectStoryArc = false;
      playSironia = true;
      nextButton = true;
    }
  }
  
  if (completedTeille == false) {
    fill(255, 255, 255);
    rect(245, 570, 145, 40);
    fill(0,0,0);
    text("Ally with Teille", 250, 600);
    if ((mousePressed) && (mouseX > 245 && mouseX < 435) && (mouseY > 570 && mouseY < 610)) {
      panelTracker = 1;
      selectStoryArc = false;
      playTeille = true;
      nextButton = true;
    }
  }
  
  fill(255, 255, 255);
  rect(545, 570, 165, 40);
  fill(0,0,0);
  text("Attack Fogelrith!", 550, 600);
  
  if ((mousePressed) && (mouseX > 545 && mouseX < 715) && (mouseY > 570 && mouseY < 610)) {
      panelTracker = 1;
      selectStoryArc = false;
      playFogelrith = true;
      nextButton = true;
    }
  
}
void prevNext() {
  //forward button
  if (mousePressed && (mouseX > 879 && mouseX < 991) && (mouseY > 639 && mouseY < 701)) {
    if (playPrologue == true) {
      panelTracker = panelTracker + 1;
      prevButton = true;
      //println(panelTracker);
    }
      else if ((playExposition == true) && (playPrologue == false)) {
        
      panelTracker = panelTracker + 1;
      prevButton = true;
      //println(panelTracker);
   
      if ((panelTracker == 23) && (volunteerStayQuiet == false)) {
        panelTracker = 29;
      }
    }
    
    else if ((playIncident == true) && (playExposition == false) && (playPrologue == false)) {
        if ((panelTracker == 6) && (volunteerStayQuiet == false)) {
          panelTracker = panelTracker + 2;
        }
        else {
      panelTracker = panelTracker + 1;
      prevButton = true;
      //println(panelTracker);
        }
    }
    
    else if ((playDeucalion == false) && (playIncident == false) && (playExposition == false) && (playPrologue == false) && (playFogelrith == false) && (playSironia == false) && (playTeille == true)) {
      panelTracker = panelTracker + 1;
      prevButton = true;
      //println(panelTracker);
    }
    
    else if ((playDeucalion == true) && (playIncident == false) && (playExposition == false) && (playPrologue == false) && (playFogelrith == false) && (playSironia == false) && (playTeille == false)) {
      panelTracker = panelTracker + 1;
      prevButton = true;
      //println(panelTracker);
    }
    
    else if ((playDeucalion == false) && (playIncident == false) && (playExposition == false) && (playPrologue == false) && (playFogelrith == false) && (playSironia == true) && (playTeille == false)) {
      panelTracker = panelTracker + 1;
      prevButton = true;
      //println(panelTracker);
    }
    
    else if ((playFogelrith == true) && (playIncident == false) && (playExposition == false) && (playPrologue == false) && (playDeucalion == false) && (playSironia == false) && (playTeille == false)) {
      if ((panelTracker == 16) && (totalAllies > 2)) {
        panelTracker = panelTracker + 2;
        prevButton = true;
        //println(panelTracker);
      }
      else {
      panelTracker = panelTracker + 1;
      prevButton = true;
      //println(panelTracker);
      }
    }
    
  }
  
  //prev button
  else if (mousePressed && (mouseX > 9 && mouseX < 121) && (mouseY > 639 && mouseY < 701)) {
    if (playPrologue == true) {
      nextButton = true;
      panelTracker = panelTracker - 1;
      //println(panelTracker);
    }
    
    else if ((playExposition == true)  && (playPrologue == false)) {
      nextButton = true;
      panelTracker = panelTracker - 1;
      //println(panelTracker);
    }
    
    else if ((playIncident == true) && (playExposition == false)  && (playPrologue == false)) {
      nextButton = true;
      panelTracker = panelTracker - 1;
      //println(panelTracker);
    }
    
    else if ((playDeucalion == true) && (playIncident == false) && (playExposition == false)  && (playPrologue == false)) {
      nextButton = true;
      panelTracker = panelTracker - 1;
      //println(panelTracker);
    }
    
    else if ((playSironia == true) && (playDeucalion == false) && (playIncident == false) && (playExposition == false)  && (playPrologue == false)) {
      nextButton = true;
      panelTracker = panelTracker - 1;
      //println(panelTracker);
    }
    
    else if ((playFogelrith == false) && (playIncident == false) && (playExposition == false) && (playPrologue == false) && (playDeucalion == false) && (playSironia == false) && (playTeille == true)) {
      panelTracker = panelTracker - 1;
      nextButton = true;
      //println(panelTracker);
    }
    
    else if ((playFogelrith == true) && (playIncident == false) && (playExposition == false) && (playPrologue == false) && (playDeucalion == false) && (playSironia == false) && (playTeille == false)) {
      panelTracker = panelTracker - 1;
      nextButton = true;
      //println(panelTracker);
    }
  }
}

void nextArc() {
  if (mousePressed && (mouseX > 879 && mouseX < 991) && (mouseY > 639 && mouseY < 701)) {
    if (playPrologue == true) {
      playPrologue = false;
      playExposition = true;
      panelTracker = 1;
    }
    else if (playExposition == true) {
      playPrologue = false;
      playExposition = false;
      playIncident = true;
      panelTracker = 1;
    }
  }
  
  else if (mousePressed && (mouseX > 9 && mouseX < 121) && (mouseY > 639 && mouseY < 701)) {
    if (playPrologue == true) {
      nextButton = true;
      panelTracker = panelTracker - 1;
      //println(panelTracker);
    }
    
    else if (playExposition == true) {
      nextButton = true;
      panelTracker = panelTracker -1;
      //println(panelTracker);
    }
  }
}
void deucalionStory() {
  String[] deucalion1 = loadStrings ("deucalion.txt");
  

  if (panelTracker == 1) {
    text(deucalion1[0], 50, 540);
    text(deucalion1[1], 50, 570);
    text(deucalion1[2], 50, 600);
    prevNext();
  }
  
  else if (panelTracker == 2) {
    text(deucalion1[4], 50, 540);
    text(deucalion1[5], 50, 570);
    text(deucalion1[6], 50, 600);
    prevNext();
  }
  
  else if (panelTracker == 3) {
    text(deucalion1[8], 50, 540);
    text(deucalion1[9], 50, 570);
    text(deucalion1[10], 50, 600);
    text(deucalion1[11], 50, 630);
    prevNext();
  }
  
  else if (panelTracker == 4) {
    text(deucalion1[13], 50, 540);
    text(deucalion1[14], 50, 570);
    text(deucalion1[15], 50, 600);
    prevNext();
  }
  
  else if (panelTracker == 5) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 270, 40);
      
      //decision B
      rect(45, 595, 80, 40);
      
      fill(0,0,0);
    text(deucalion1[17], 50, 560);
    text(deucalion1[18], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingDeucalion();
    }
    
    else if ((panelTracker == 6) && (flowerGuy == false)) {
    text(deucalion1[99], 50, 540);
    text(deucalion1[100], 50, 570);
    text(deucalion1[101], 50, 600);
    text(deucalion1[102], 50, 630);
    prevNext();
    }
    
    else if ((panelTracker == 7) && (flowerGuy == false)) {
    text(deucalion1[104], 50, 540);
    text(deucalion1[105], 50, 570);
    prevNext();
    }
    
    else if ((panelTracker == 8) && (flowerGuy == false)) {
    text(deucalion1[107], 50, 540);
    text(deucalion1[108], 50, 570);
    prevNext();
    }
    
    else if ((panelTracker == 9) && (flowerGuy == false)) {
    text(deucalion1[110], 50, 540);
    text(deucalion1[111], 50, 570);
    prevNext();
    }
    
    else if ((panelTracker == 10) && (flowerGuy == false)) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 270, 40);
      
      //decision B
      rect(45, 595, 80, 40);
      
      fill(0,0,0);
    text(deucalion1[113], 50, 560);
    text(deucalion1[114], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingDeucalion();
    }
    
    else if ((panelTracker == 11) && (followBoy == true) && (flowerGuy == false)) {
    text(deucalion1[116], 50, 540);
    text(deucalion1[117], 50, 570);
    text(deucalion1[118], 50, 600);
    text(deucalion1[119], 50, 630);
    prevNext(); 
    }
    
    else if ((panelTracker == 12) && (followBoy == true) && (flowerGuy == false)) {
    text(deucalion1[121], 50, 540);
    text(deucalion1[122], 50, 570);
    text(deucalion1[123], 50, 600);
    text(deucalion1[124], 50, 630);
    prevNext(); 
    }
    
    else if ((panelTracker == 13) && (followBoy == true) && (flowerGuy == false)) {
    text(deucalion1[126], 50, 540);
    text(deucalion1[127], 50, 570);
    text(deucalion1[128], 50, 600);
    text(deucalion1[129], 50, 630);
    prevNext(); 
    }
    
    else if ((panelTracker == 14) && (followBoy == true) && (flowerGuy == false)) {
    text(deucalion1[131], 50, 540);
    text(deucalion1[132], 50, 570);
    text(deucalion1[133], 50, 600);
    text(deucalion1[134], 50, 630);
    prevNext(); 
    }
    
    else if ((panelTracker == 15) && (followBoy == true) && (flowerGuy == false)) {
    text(deucalion1[136], 50, 540);
    text(deucalion1[137], 50, 570);
    text(deucalion1[138], 50, 600);
    text(deucalion1[139], 50, 630);
    prevNext(); 
    }
    
    else if ((panelTracker == 16) && (followBoy == true) && (flowerGuy == false)) {
    text(deucalion1[141], 50, 540);
    text(deucalion1[142], 50, 570);
    text(deucalion1[143], 50, 600);
    text(deucalion1[144], 50, 630);
    prevNext(); 
    }
    
    else if ((panelTracker == 17) && (followBoy == true) && (flowerGuy == false)) {
    text(deucalion1[146], 50, 540);
    text(deucalion1[147], 50, 570);
    text(deucalion1[148], 50, 600);
    prevNext(); 
    }
    
    else if ((panelTracker == 18) && (followBoy == true) && (flowerGuy == false)) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 270, 40);
      
      //decision B
      rect(45, 595, 80, 40);
      
      fill(0,0,0);
    text(deucalion1[150], 50, 560);
    text(deucalion1[151], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingDeucalion();
    }
    
    else if ((panelTracker == 19) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false)) {
      text(deucalion1[171], 50, 540);
      text(deucalion1[172], 50, 570);
      text(deucalion1[173], 50, 600);
      text(deucalion1[174], 50, 630);
      prevNext();
    }
    
    else if ((panelTracker == 20) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false)) {
      text(deucalion1[176], 50, 540);
      text(deucalion1[177], 50, 570);
      text(deucalion1[178], 50, 600);
      text(deucalion1[179], 50, 630);
      prevNext();
    }
    
    else if ((panelTracker == 21) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false)) {
      text(deucalion1[181], 50, 540);
      text(deucalion1[182], 50, 570);
      prevNext();
    }
    
    else if ((panelTracker == 22) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false)) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 270, 40);
      
      //decision B
      rect(45, 595, 80, 40);
      
      fill(0,0,0);
    text(deucalion1[184], 50, 560);
    text(deucalion1[185], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingDeucalion();
    }
    
    else if ((panelTracker == 23) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == false)) {
      text(deucalion1[200], 50, 540);
      text(deucalion1[201], 50, 570);
      text(deucalion1[202], 50, 600);
      prevNext();
    }
    
    else if ((panelTracker == 24) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == false)) {
      text(deucalion1[204], 50, 540);
      text(deucalion1[205], 50, 570);
      text(deucalion1[206], 50, 600);
      text(deucalion1[207], 50, 630);
      prevNext();
    }
    
    else if ((panelTracker == 25) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == false)) {
      completedDeucalion = true;
      allyDeucalion = false;
      selectStoryArc = true;
      arcSelection();
    }
    
    else if ((panelTracker == 23) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == true)) {
      text(deucalion1[191], 50, 540);
      text(deucalion1[192], 50, 570);
      prevNext();
    }
    
    else if ((panelTracker == 24) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == true)) {
      text(deucalion1[194], 50, 540);
      text(deucalion1[195], 50, 570);
      prevNext();
    }
    
    else if ((panelTracker == 25) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == true)) {
      text(deucalion1[197], 50, 540);
      text(deucalion1[198], 50, 570);
      prevNext();
    }
    
    else if ((panelTracker == 26) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == true)) {
      prevButton = true;
        nextButton = false;
        fill(255, 255, 255);
      
        //decision A
        rect(45, 538, 500, 30);
        
        //decision B (normally not present)
        rect(45, 568, 850, 30);
      
        //decision C (normally B)
        rect(45, 598, 80, 30);
      
        fill(0,0,0);
      text(deucalion1[85], 50, 560);
      text(deucalion1[86], 50, 590);
      text(deucalion1[87], 50, 620);
    
      decAMouseX1 = 45;
      decAMouseX2 = 545;
      decAMouseY1 = 538;
      decAMouseY2 = 568;
    
    //actually decision C
      decBMouseX1 = 45;
      decBMouseX2 = 678;
      decBMouseY1 = 598;
      decBMouseY2 = 628;
    
      prevNext();
      decisionMakingDeucalion();
    }
    
    else if ((panelTracker == 27) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == true) && (trenteAccepts == false)) {
      text(deucalion1[89], 50, 540);
      text(deucalion1[90], 50, 570);
      text(deucalion1[91], 50, 600);
      text(deucalion1[92], 50, 630);
      prevNext();
    }
    
    else if ((panelTracker == 28) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == true) && (trenteAccepts == false)) {
      completedDeucalion = true;
      allyDeucalion = false;
      selectStoryArc = true;
      arcSelection();
    }
    
    else if ((panelTracker == 27) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == true) && (trenteAccepts == true)) {
      text(deucalion1[94], 50, 540);
      text(deucalion1[95], 50, 570);
      text(deucalion1[96], 50, 600);
      text(deucalion1[97], 50, 630);
      prevNext();
    }
    else if ((panelTracker == 28) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == true) && (trenteAccepts == true)) {
      completedDeucalion = true;
      allyDeucalion = true;
      selectStoryArc = true;
      totalAllies = totalAllies + 1;
      arcSelection();
    }
    
    else if ((panelTracker == 19) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true)) {
      text(deucalion1[153], 50, 540);
      text(deucalion1[154], 50, 570);
      text(deucalion1[155], 50, 600);
      text(deucalion1[156], 50, 630);
      prevNext();
    }
    
    else if ((panelTracker == 20) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true)) {
      text(deucalion1[158], 50, 540);
      text(deucalion1[159], 50, 570);
      text(deucalion1[160], 50, 600);
      prevNext();
    }
    
    else if ((panelTracker == 21) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true)) {
      text(deucalion1[162], 50, 540);
      text(deucalion1[163], 50, 570);
      prevNext();
    }
    
    else if ((panelTracker == 22) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true)) {
      text(deucalion1[165], 50, 540);
      text(deucalion1[166], 50, 570);
      prevNext();
    }
    
    else if ((panelTracker == 23) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true)) {
      text(deucalion1[168], 50, 540);
      text(deucalion1[169], 50, 570);
      prevNext();
    }
    
    else if ((panelTracker == 24) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true)) {
        prevButton = true;
        nextButton = false;
        fill(255, 255, 255);
      
        //decision A
        rect(45, 538, 500, 30);
        
        //decision B (normally not present)
        rect(45, 568, 850, 30);
      
        //decision C (normally B)
        rect(45, 598, 80, 30);
      
        fill(0,0,0);
      text(deucalion1[85], 50, 560);
      text(deucalion1[86], 50, 590);
      text(deucalion1[87], 50, 620);
    
      decAMouseX1 = 45;
      decAMouseX2 = 545;
      decAMouseY1 = 538;
      decAMouseY2 = 568;
    
    //actually decision C
      decBMouseX1 = 45;
      decBMouseX2 = 678;
      decBMouseY1 = 598;
      decBMouseY2 = 628;
    
      prevNext();
      decisionMakingDeucalion();
    }
    
    
    else if ((panelTracker == 25) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true) && (trenteAccepts == false)) {
      text(deucalion1[89], 50, 540);
      text(deucalion1[90], 50, 570);
      text(deucalion1[91], 50, 600);
      text(deucalion1[92], 50, 630);
      prevNext();
    }
    
    else if ((panelTracker == 25) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true) && (trenteAccepts == true)) {
      text(deucalion1[94], 50, 540);
      text(deucalion1[95], 50, 570);
      text(deucalion1[96], 50, 600);
      text(deucalion1[97], 50, 630);
      prevNext();
    }
    
    else if ((panelTracker == 26) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true) && (trenteAccepts == true)) {
      completedDeucalion = true;
      allyDeucalion = true;
      selectStoryArc = true;
      totalAllies = totalAllies + 1;
      arcSelection();
    }
    
    else if ((panelTracker == 26) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true) && (trenteAccepts == false)) {
      
      completedDeucalion = true;
      allyDeucalion = false;
      selectStoryArc = true;
      arcSelection();
    }
  
  else if ((panelTracker == 6) && (flowerGuy == true)) {
    text(deucalion1[20], 50, 540);
    text(deucalion1[21], 50, 570);
    text(deucalion1[22], 50, 600);
    text(deucalion1[23], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 7) && (flowerGuy == true)) {
    text(deucalion1[25], 50, 540);
    text(deucalion1[26], 50, 570);
    text(deucalion1[27], 50, 600);
    text(deucalion1[28], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 8) && (flowerGuy == true)) {
    text(deucalion1[30], 50, 540);
    text(deucalion1[31], 50, 570);
    text(deucalion1[32], 50, 600);
    text(deucalion1[33], 50, 630);
    prevNext(); 
  }
  
  else if ((panelTracker == 9) && (flowerGuy == true)) {
    text(deucalion1[35], 50, 540);
    text(deucalion1[36], 50, 570);
    text(deucalion1[37], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 10) && (flowerGuy == true)) {
    text(deucalion1[39], 50, 540);
    text(deucalion1[40], 50, 570);
    text(deucalion1[41], 50, 600);
    text(deucalion1[42], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 11) && (flowerGuy == true)) {
    text(deucalion1[44], 50, 540);
    prevNext();
  }
  
  else if ((panelTracker == 12) && (flowerGuy == true)) {
        prevButton = true;
        nextButton = false;
        fill(255, 255, 255);
      
        //decision A
        rect(45, 535, 270, 40);
      
        //decision B
        rect(45, 595, 80, 40);
      
        fill(0,0,0);
      text(deucalion1[46], 50, 560);
      text(deucalion1[47], 50, 620);
    
      decAMouseX1 = 45;
      decAMouseX2 = 295;
      decAMouseY1 = 535;
      decAMouseY2 = 575;
    
      decBMouseX1 = 45;
      decBMouseX2 = 295;
      decBMouseY1 = 595;
      decBMouseY2 = 635;
    
      prevNext();
      decisionMakingDeucalion();
    }
    
    else if ((panelTracker == 13) && (flowerGuy == true) && (brusqueAndRude == true)) {
      text(deucalion1[49], 50, 540);
      text(deucalion1[50], 50, 570);
      prevNext();
    }
    
    else if ((panelTracker == 14) && (flowerGuy == true) && (brusqueAndRude == true)) {
      text(deucalion1[52], 50, 540);
      text(deucalion1[53], 50, 570);
      text(deucalion1[54], 50, 600);
      prevNext();
    }
    
    else if ((panelTracker == 15) && (flowerGuy == true) && (brusqueAndRude == true)) {
      text(deucalion1[56], 50, 540);
      text(deucalion1[57], 50, 570);
      prevNext();
    }
    
    else if ((panelTracker == 16) && (flowerGuy == true) && (brusqueAndRude == true)) {
      completedDeucalion = true;
      allyDeucalion = false;
      selectStoryArc = true;
      arcSelection();
    }
    
    else if ((panelTracker == 13) && (flowerGuy == true) && (brusqueAndRude == false)) {
      text(deucalion1[59], 50, 540);
      text(deucalion1[60], 50, 570);
      text(deucalion1[61], 50, 600);
    prevNext();
    }
    
    else if ((panelTracker == 14) && (flowerGuy == true) && (brusqueAndRude == false)) {
      text(deucalion1[63], 50, 540);
      text(deucalion1[64], 50, 570);
      text(deucalion1[65], 50, 600);
      text(deucalion1[66], 50, 630);
      prevNext();
    }
    
    else if ((panelTracker == 15) && (flowerGuy == true) && (brusqueAndRude == false)) {
      text(deucalion1[68], 50, 540);
      text(deucalion1[69], 50, 570);
      text(deucalion1[70], 50, 600);
      prevNext();
    }
    
    else if ((panelTracker == 16) && (flowerGuy == true) && (brusqueAndRude == false)) {
      text(deucalion1[72], 50, 540);
      text(deucalion1[73], 50, 570);
      prevNext();
    }
    
    else if ((panelTracker == 16) && (flowerGuy == true) && (brusqueAndRude == false)) {
      text(deucalion1[75], 50, 540);
      text(deucalion1[76], 50, 570);
      text(deucalion1[77], 50, 600);
      text(deucalion1[78], 50, 630);
      prevNext();
    }
    
    else if ((panelTracker == 17) && (flowerGuy == true) && (brusqueAndRude == false)) {
      text(deucalion1[80], 50, 540);
      text(deucalion1[81], 50, 570);
      text(deucalion1[82], 50, 600);
      text(deucalion1[83], 50, 630);
      prevNext();
    }
    
    //the three way decision that will determine whether you pass/fail the arc based on what you have chosen so far for decisions.
    else if ((panelTracker == 18) && (flowerGuy == true) && (brusqueAndRude == false)) {
      prevButton = true;
        nextButton = false;
        fill(255, 255, 255);
      
        //decision A
        rect(45, 538, 500, 30);
        
        //decision B (normally not present)
        rect(45, 568, 850, 30);
      
        //decision C (normally B)
        rect(45, 598, 80, 30);
      
        fill(0,0,0);
      text(deucalion1[85], 50, 560);
      text(deucalion1[86], 50, 590);
      text(deucalion1[87], 50, 620);
    
      decAMouseX1 = 45;
      decAMouseX2 = 545;
      decAMouseY1 = 538;
      decAMouseY2 = 568;
    
    //actually decision C
      decBMouseX1 = 45;
      decBMouseX2 = 678;
      decBMouseY1 = 598;
      decBMouseY2 = 628;
    
      prevNext();
      decisionMakingDeucalion();
    }
    
    else if ((panelTracker == 19) && (flowerGuy == true) && (brusqueAndRude == false) && (trenteAccepts == false)) {
      text(deucalion1[89], 50, 540);
      text(deucalion1[90], 50, 570);
      text(deucalion1[91], 50, 600);
      text(deucalion1[92], 50, 630);
      prevNext();
    }
    
    else if ((panelTracker == 19) && (flowerGuy == true) && (brusqueAndRude == false) && (trenteAccepts == true)) {
      text(deucalion1[94], 50, 540);
      text(deucalion1[95], 50, 570);
      text(deucalion1[96], 50, 600);
      text(deucalion1[97], 50, 630);
      prevNext();
    }
    
    else if ((panelTracker == 20) && (flowerGuy == true) && (brusqueAndRude == false) && (trenteAccepts == true)) {
      completedDeucalion = true;
      allyDeucalion = true;
      selectStoryArc = true;
      totalAllies = totalAllies + 1;
      arcSelection();
    }
    
    else if ((panelTracker == 20) && (flowerGuy == true) && (brusqueAndRude == false) && (trenteAccepts == false)) {
      
      completedDeucalion = true;
      allyDeucalion = false;
      selectStoryArc = true;
      arcSelection();
    }

}
void decisionMakingDeucalion() {
  //decision A
  if (mousePressed && ((mouseX > decAMouseX1) && (mouseX < decAMouseX2)) && ((mouseY > decAMouseY1) && (mouseY < decAMouseY2))) {
    if (panelTracker == 5){
    flowerGuy = true;
    nextButton = true;
    panelTracker = panelTracker + 1;    
  }
  
  if ((panelTracker == 12) && (flowerGuy == true)){
    brusqueAndRude = true;
    nextButton = true;
    panelTracker = panelTracker + 1;    
  }
  
  //decision A in the threeway decision.
  if ((panelTracker == 18) && (flowerGuy == true) && (brusqueAndRude == false)){
    trenteAccepts = true;
    nextButton = true;
    panelTracker = panelTracker + 1;    
  }
  
  //also second instance of decision A in threeway.
  if ((panelTracker == 24) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true)){
    trenteAccepts = true;
    nextButton = true;
    panelTracker = panelTracker + 1;    
  }
  
  //third instance of decision A in threeway.
  if ((panelTracker == 26) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == true)){
    trenteAccepts = true;
    nextButton = true;
    panelTracker = panelTracker + 1;    
  }
  
  if ((panelTracker == 10) && (flowerGuy == false)) {
    panelTracker = 6;
    flowerGuy = true;
    nextButton = true;
  }
  
  if ((panelTracker == 18) && (followBoy == true) && (flowerGuy == false)) {
    stopTheft = true;
    panelTracker = panelTracker + 1;
    nextButton = true;
  }
  
  if ((panelTracker == 22) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false)) {
    redeemSelf = true;
    panelTracker = panelTracker + 1;
    nextButton = true;
  }
  prevButton = false;
 }
 
 //decision B
 else if (mousePressed && ((mouseX > decBMouseX1) && (mouseX < decBMouseX2)) && ((mouseY > decBMouseY1) && (mouseY < decBMouseY2))) {
   //decision B
   if (panelTracker == 5){
    flowerGuy = false;
    nextButton = true;
    panelTracker = panelTracker + 1;    
  }
  
  if ((panelTracker == 12) && (flowerGuy == true)){
    brusqueAndRude = false;
    nextButton = true;
    panelTracker = panelTracker + 1;    
  }
  
  //ACTUALLY Decision C for the three way decision.
  if ((panelTracker == 18) && (flowerGuy == true) && (brusqueAndRude == false)){
    trenteAccepts = false;
    nextButton = true;
    panelTracker = panelTracker + 1;    
  }
  
  //also actually decision C for the threeway.
  if ((panelTracker == 24) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true)){
    trenteAccepts = false;
    nextButton = true;
    panelTracker = panelTracker + 1;    
  }
  
  //third instance of Decision C.
  if ((panelTracker == 26) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == true)){
    trenteAccepts = false;
    nextButton = true;
    panelTracker = panelTracker + 1;    
  }
  
  if ((panelTracker == 10) && (flowerGuy == false)) {
    followBoy = true;
    panelTracker = panelTracker + 1;
    nextButton = true;
  }
  
  if ((panelTracker == 18) && (followBoy == true) && (flowerGuy == false)) {
    stopTheft = false;
    panelTracker = panelTracker + 1;
    nextButton = true;
  }
  
  if ((panelTracker == 22) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false)) {
    redeemSelf = false;
    panelTracker = panelTracker + 1;
    nextButton = true;
  }
  prevButton = false;
 }
 
 //SINGLE INSTANCE of Decision C, except this covers decision B.
 else if (mousePressed && ((mouseX > 45) && (mouseX < 895)) && ((mouseY > 568) && (mouseY < 598))) {

   if ((panelTracker == 18) && (flowerGuy == true) && (brusqueAndRude == false)) {
    trenteAccepts = false;
    nextButton = true;
    panelTracker = panelTracker + 1; 
   } 
    
    if ((panelTracker == 24) && (followBoy == true) && (flowerGuy == false) && (stopTheft == true)) {
    trenteAccepts = true;
    nextButton = true;
    panelTracker = panelTracker + 1;
  }
  
  if ((panelTracker == 26) && (followBoy == true) && (flowerGuy == false) && (stopTheft == false) && (redeemSelf == true)) {
    trenteAccepts = false;
    nextButton = true;
    panelTracker = panelTracker + 1;
  }
 }
}


void expositionStory() {
  String[] exposition1 = loadStrings ("exposition.txt");
  
  //panel 1 of exposition
  if (panelTracker == 1) {
    text(exposition1[0], 50, 540);
    text(exposition1[1], 50, 570);
    text(exposition1[2], 50, 600);
    text(exposition1[3], 50, 630);
    prevNext();
  }
    else if (panelTracker == 2) {
    text(exposition1[5], 50, 540);
    text(exposition1[6], 50, 570);
    text(exposition1[7], 50, 600);
    text(exposition1[8], 50, 630);
    prevNext();
  }
    else if (panelTracker == 3) {
    text(exposition1[10], 50, 540);
    text(exposition1[11], 50, 570);
    text(exposition1[12], 50, 600);
    text(exposition1[13], 50, 630);
    prevNext();
  }
    else if (panelTracker == 4) {
    text(exposition1[15], 50, 540);
    prevNext();
  }
    else if (panelTracker == 5) {
    text(exposition1[17], 50, 540);
    text(exposition1[18], 50, 570);
    prevNext();
  }
    else if (panelTracker == 6) {
    text(exposition1[20], 50, 540);
    text(exposition1[21], 50, 570);
    prevNext();
  }
  // decision1 Protest or pout
       else if (panelTracker == 7) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 270, 40);
      
      //decision B
      rect(45, 595, 80, 40);
      
      fill(0,0,0);
    text(exposition1[23], 50, 560);
    text(exposition1[24], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingExposition();
    }
    
    //if decision a is picked by the player 
    else if ((panelTracker == 8) && (protestOrPout == true)) {
      text(exposition1[26], 50, 540);
      text(exposition1[27], 50, 570);
      text(exposition1[28], 50, 600);
      text(exposition1[29], 50, 630);
      prevNext();
  }
  
    else if ((panelTracker == 9) && (protestOrPout == true)) {
      text(exposition1[31], 50, 540);
      text(exposition1[32], 50, 570);
      text(exposition1[33], 50, 600);
      prevNext();
}    
    //if decision b is picked by the player
    else if ((panelTracker == 8) && (protestOrPout == false)) {
      text(exposition1[35], 50, 540);
      text(exposition1[36], 50, 570);
      text(exposition1[37], 50, 600);
      prevNext();
    }
    else if ((panelTracker == 9) && (protestOrPout == false)) {
      text(exposition1[39], 50, 540);
      text(exposition1[40], 50, 570);
      text(exposition1[41], 50, 600);
      prevNext();  
  }
    else if (panelTracker == 10) {
     text(exposition1[43], 50, 540);
     text(exposition1[44], 50, 570);
     text(exposition1[45], 50, 600); 
     prevNext();
    }
  else if (panelTracker == 11) {
     text(exposition1[47], 50, 540);
     text(exposition1[48], 50, 570);
     text(exposition1[49], 50, 600); 
    prevNext();
  }  
    else if (panelTracker == 12) {
     text(exposition1[51], 50, 540);
     text(exposition1[52], 50, 570); 
     prevNext();
    }
  else if (panelTracker == 13) {
     text(exposition1[54], 50, 540);
     text(exposition1[55], 50, 570);
     text(exposition1[56], 50, 600); 
     prevNext();
    }
  else if (panelTracker == 14) {
     text(exposition1[58], 50, 540);
     text(exposition1[59], 50, 570);
     text(exposition1[60], 50, 600); 
    prevNext();  
    }
    
    // decision2 volenteer or be quite
       else if (panelTracker == 15) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 500, 40);
      
      //decision B
      rect(45, 595, 160, 40);
      
      fill(0,0,0);
    text(exposition1[62], 50, 560);
    text(exposition1[63], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 545;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 205;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingExposition();
    }
    
    else if ((panelTracker == 16) && (volunteerStayQuiet == true)) {
     text(exposition1[65], 50, 540);
     text(exposition1[66], 50, 570);
    prevNext();
    }
    else if ((panelTracker == 17) && (volunteerStayQuiet == true)) {
     text(exposition1[68], 50, 540);
     text(exposition1[69], 50, 570);
     text(exposition1[70], 50, 600);
    prevNext();
    }
    else if ((panelTracker == 18) && (volunteerStayQuiet == true)) {
     text(exposition1[72], 50, 540);
     text(exposition1[73], 50, 570);
     text(exposition1[74], 50, 600);
    prevNext();
    }
    
        // decision helpVillagers
       else if ((panelTracker == 19) && (volunteerStayQuiet == true)) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 310, 40);
      
      //decision B
      rect(45, 595, 455, 40);
      
      fill(0,0,0);
    text(exposition1[76], 50, 560);
    text(exposition1[77], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 355;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 500;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingExposition();
    }
    
    else if ((panelTracker == 20) && (volunteerStayQuiet == true) && (helpVillagers == true)) {
     text(exposition1[79], 50, 540);
     text(exposition1[80], 50, 570);
     text(exposition1[81], 50, 600);
     text(exposition1[82], 50, 630);
    prevNext();
    }
    else if ((panelTracker == 21) && (volunteerStayQuiet == true) && (helpVillagers == true)) {
     text(exposition1[84], 50, 540);
     text(exposition1[85], 50, 570);
     text(exposition1[86], 50, 600);
    prevNext();
    }
    else if ((panelTracker == 22) && (volunteerStayQuiet == true) && (helpVillagers == true)) {
     text(exposition1[88], 50, 540);
     text(exposition1[89], 50, 570);
     text(exposition1[90], 50, 600);
    prevNext();
    }
    else if ((panelTracker == 23) && (volunteerStayQuiet == true) && (helpVillagers == true)) {
     text(exposition1[92], 50, 540);
     text(exposition1[93], 50, 570);
    prevNext();
    }
    else if ((panelTracker == 24) && (volunteerStayQuiet == true) && (helpVillagers == true)) {
     text(exposition1[95], 50, 540);
     text(exposition1[96], 50, 570);
     text(exposition1[97], 50, 600);
    nextArc();
    }
    else if ((panelTracker == 25) && (volunteerStayQuiet == true) && (helpVillagers == false)) {
     text(exposition1[99], 50, 540);
     text(exposition1[100], 50, 570);
     text(exposition1[101], 50, 600);
     text(exposition1[102], 50, 630);
    prevNext();
    }
    else if ((panelTracker == 26) && (volunteerStayQuiet == true) && (helpVillagers == false)) {
     text(exposition1[104], 50, 540);
     text(exposition1[105], 50, 570);
     text(exposition1[106], 50, 600);
     text(exposition1[107], 50, 630);
    prevNext();
    }
    else if ((panelTracker == 27) && (volunteerStayQuiet == true) && (helpVillagers == false)) {
     text(exposition1[109], 50, 540);
     text(exposition1[110], 50, 570);
     text(exposition1[111], 50, 600);
    prevNext();
    }
    else if ((panelTracker == 28) && (volunteerStayQuiet == true) && (helpVillagers == false)) {
     text(exposition1[113], 50, 540);
     text(exposition1[114], 50, 570);
    nextArc();
    }
    else if ((panelTracker == 16) && (volunteerStayQuiet == false)) {
     text(exposition1[116], 50, 540);
     text(exposition1[117], 50, 570);
     text(exposition1[118], 50, 600);
     text(exposition1[119], 50, 630);
     text(exposition1[120], 50, 660);
    prevNext();
    }
    else if ((panelTracker == 17) && (volunteerStayQuiet == false)) {
     text(exposition1[122], 50, 540);
     text(exposition1[123], 50, 570);
     text(exposition1[124], 50, 600);
     text(exposition1[125], 50, 630);
    prevNext();
    }
    else if ((panelTracker == 18) && (volunteerStayQuiet == false)) {
     text(exposition1[127], 50, 540);
     text(exposition1[128], 50, 570);
     text(exposition1[129], 50, 600);
     text(exposition1[130], 50, 630);
    nextArc();
    }
}
 void decisionMakingExposition() {
 //decision A
  if (mousePressed && ((mouseX > decAMouseX1) && (mouseX < decAMouseX2)) && ((mouseY > decAMouseY1) && (mouseY < decAMouseY2))) {
    if ((panelTracker == 7) && (playExposition == true)){
    protestOrPout = true;
    nextButton = true;
    panelTracker = panelTracker + 1;    
  }
  
  prevButton = false;
  
if ((panelTracker == 15) && (playExposition == true)){
    volunteerStayQuiet = true;
    nextButton = true;
    panelTracker = panelTracker + 1;  
    prevButton = false;  
  }
  
  if ((panelTracker == 19) && (playExposition == true)){
    helpVillagers = true;
    nextButton = true;
    panelTracker = panelTracker + 1;  
    prevButton = false;  
  }
 }
 
 //decision B
 else if (mousePressed && ((mouseX > decBMouseX1) && (mouseX < decBMouseX2)) && ((mouseY > decBMouseY1) && (mouseY < decBMouseY2))) {
   //decision 1b
  
  if ((panelTracker == 7) && (playExposition == true)){
  protestOrPout = false;
  nextButton= true; 
  panelTracker = panelTracker + 1;
  prevButton = false;
}
  if ((panelTracker == 15) && (playExposition == true)){
  volunteerStayQuiet = false;
  nextButton= true; 
  panelTracker = panelTracker + 1;
  prevButton = false;
 }
   if ((panelTracker == 19) && (playExposition == true)){
  helpVillagers = false;
  nextButton= true; 
  panelTracker = 25;
  prevButton = false;
 }
 }
 }
void fogelrithStory() {
  String[] fogelrith1 = loadStrings ("fogelrith.txt");
  
  if (panelTracker == 1) {
    text(fogelrith1[0], 50, 540);
    text(fogelrith1[1], 50, 570);
    text(fogelrith1[2], 50, 600);
    text(fogelrith1[3], 50, 630);
    prevNext();
  }
  
  else if (panelTracker == 2) {
    text(fogelrith1[5], 50, 540);
    text(fogelrith1[6], 50, 570);
    text(fogelrith1[7], 50, 600);
    text(fogelrith1[8], 50, 630);
    prevNext();
  }
  
  else if (panelTracker == 3) {
    text(fogelrith1[10], 50, 540);
    text(fogelrith1[11], 50, 570);
    prevNext();
  }
  
  else if ((panelTracker == 4) && (allyTeille == true)) {
    text(fogelrith1[13], 50, 540);
    text(fogelrith1[14], 50, 570);
    text(fogelrith1[15], 50, 600);
    text(fogelrith1[16], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 5) && (allyTeille == true)) {
    text(fogelrith1[18], 50, 540);
    text(fogelrith1[19], 50, 570);
    text(fogelrith1[20], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 4) && (allyTeille == false)) {
    text(fogelrith1[22], 50, 540);
    text(fogelrith1[23], 50, 570);
    text(fogelrith1[24], 50, 600);
    text(fogelrith1[25], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 5) && (allyTeille == false)) {
    text(fogelrith1[27], 50, 540);
    prevNext();
  }
  
  else if ((panelTracker == 6) && (allyDeucalion == true)) {
    text(fogelrith1[29], 50, 540);
    text(fogelrith1[30], 50, 570);
    text(fogelrith1[31], 50, 600);
    text(fogelrith1[32], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker== 7) && (allyDeucalion == true)) {
    text(fogelrith1[34], 50, 540);
    text(fogelrith1[35], 50, 570);
    text(fogelrith1[36], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 6) && (allyDeucalion == false)) {
    text(fogelrith1[38], 50, 540);
    text(fogelrith1[39], 50, 570);
    text(fogelrith1[40], 50, 600);
    text(fogelrith1[41], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 7) && (allyDeucalion == false)) {
    text(fogelrith1[43], 50, 540);
    prevNext();
  }
  
  else if ((panelTracker == 8) && (allySironia == true)) {
    text(fogelrith1[45], 50, 540);
    text(fogelrith1[46], 50, 570);
    text(fogelrith1[47], 50, 600);
    text(fogelrith1[48], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 9) && (allySironia == true)) {
    text(fogelrith1[50], 50, 540);
    text(fogelrith1[51], 50, 570);
    prevNext();
  }
  
  else if ((panelTracker == 8) && (allySironia == false)) {
    text(fogelrith1[53], 50, 540);
    text(fogelrith1[54], 50, 570);
    text(fogelrith1[55], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 9) && (allySironia == false)) {
    text(fogelrith1[57], 50, 540);
    prevNext();
  }
  
  else if (panelTracker == 10) {
    text(fogelrith1[59], 50, 540);
    text(fogelrith1[60], 50, 570);
    text(fogelrith1[61], 50, 600);
    text(fogelrith1[62], 50, 630);
    prevNext();
  }
  
  else if (panelTracker == 11) {
    text(fogelrith1[64], 50, 540);
    text(fogelrith1[65], 50, 570);
    text(fogelrith1[66], 50, 600);
    text(fogelrith1[67], 50, 630);
    prevNext();
  }
  
  else if (panelTracker == 12) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 270, 40);
      
      //decision B
      rect(45, 595, 80, 40);
      
      fill(0,0,0);
    text(fogelrith1[69], 50, 560);
    text(fogelrith1[70], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingFogelrith();
  }
  
  else if ((panelTracker == 13) && (attackDirectly == true)) {
    text(fogelrith1[72], 50, 540);
    text(fogelrith1[73], 50, 570);
    text(fogelrith1[74], 50, 600);
    text(fogelrith1[75], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 14) && (attackDirectly == true)) {
    text(fogelrith1[77], 50, 540);
    text(fogelrith1[78], 50, 570);
    prevNext();
  }
  
  else if ((panelTracker == 15) && (attackDirectly == true)) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 270, 40);
      
      //decision B
      rect(45, 595, 80, 40);
      
      fill(0,0,0);
    text(fogelrith1[80], 50, 560);
    text(fogelrith1[81], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingFogelrith();
  }
  
  else if ((panelTracker == 16) && (attackDirectly == true) && (olRaisinDies == true)) {
    text(fogelrith1[83], 50, 540);
    text(fogelrith1[84], 50, 570);
    text(fogelrith1[85], 50, 600);
    text(fogelrith1[86], 50, 630);
    prevNext();
    }
    
    else if ((panelTracker == 17) && (attackDirectly == true) && (olRaisinDies == true)) {
    text(fogelrith1[88], 50, 540);
    text(fogelrith1[89], 50, 570);
    text(fogelrith1[90], 50, 600);
    text(fogelrith1[91], 50, 630);
    prevNext();
    }
    
    else if ((panelTracker == 18) && (attackDirectly == true) && (olRaisinDies == true)) {
    text(fogelrith1[93], 50, 540);
    text(fogelrith1[94], 50, 570);
    text(fogelrith1[95], 50, 600);
    text(fogelrith1[96], 50, 630);
    prevNext();
    }
    
  else if ((panelTracker == 16) && (attackDirectly == true) && (olRaisinDies == false)) {
    text(fogelrith1[98], 50, 540);
    text(fogelrith1[99], 50, 570);
    text(fogelrith1[100], 50, 600);
    prevNext();
    }
    
    else if ((panelTracker == 17) && (attackDirectly == true) && (olRaisinDies == false)) {
    text(fogelrith1[102], 50, 540);
    text(fogelrith1[103], 50, 570);
    text(fogelrith1[104], 50, 600);
    text(fogelrith1[105], 50, 630);
    prevNext();
    }
    
    else if ((panelTracker == 18) && (attackDirectly == true) && (olRaisinDies == false)) {
    text(fogelrith1[106], 50, 540);
    prevNext();
    }
    
    else if ((panelTracker == 17) && (attackDirectly == false)) {
    text(fogelrith1[109], 50, 540);
    text(fogelrith1[110], 50, 570);
    text(fogelrith1[111], 50, 600);
    text(fogelrith1[112], 50, 630);
    prevNext();
    }
    
    else if ((panelTracker == 18) && (attackDirectly == false)) {
    text(fogelrith1[114], 50, 540);
    text(fogelrith1[115], 50, 570);
    text(fogelrith1[116], 50, 600);
    text(fogelrith1[117], 50, 630);
    prevNext();
    }
    
    //AND SO HERE BEGINS THE DENOUMENT
    
    else if ((panelTracker == 19) && (totalAllies < 2)) {
    text(fogelrith1[119], 50, 540);
    text(fogelrith1[120], 50, 570);
    text(fogelrith1[121], 50, 600);
    text(fogelrith1[122], 50, 630);
    prevNext();
    }
    
    else if ((panelTracker == 20) && (totalAllies < 2)) {
    text(fogelrith1[124], 50, 540);
    text(fogelrith1[125], 50, 570);
    text(fogelrith1[126], 50, 600);
    text(fogelrith1[127], 50, 630);
    prevNext();
    }
    
    else if ((panelTracker == 21) && (totalAllies < 2)) {
    text(fogelrith1[124], 50, 540);
    text(fogelrith1[125], 50, 570);
    text(fogelrith1[126], 50, 600);
    text(fogelrith1[127], 50, 630);
    prevNext();
    }
    
    else if ((panelTracker == 20) && (totalAllies > 2)) {
    text(fogelrith1[129], 50, 540);
    text(fogelrith1[130], 50, 570);
    text(fogelrith1[131], 50, 600);
    prevNext();
    }
    
    else if ((panelTracker == 21) && (totalAllies > 2)) {
    text(fogelrith1[133], 50, 540);
    text(fogelrith1[134], 50, 570);
    prevNext();
    }
    
    else if ((panelTracker == 22) && (olRaisinDies == true)) {
    text(fogelrith1[140], 50, 540);
    text(fogelrith1[141], 50, 570);
    text(fogelrith1[142], 50, 600);
    text(fogelrith1[143], 50, 630);
    prevNext();
    }
    
    else if ((panelTracker == 22) && (olRaisinDies == false)) {
    text(fogelrith1[145], 50, 540);
    text(fogelrith1[146], 50, 570);
    text(fogelrith1[147], 50, 600);
    prevNext();
    }
    
    
}
void decisionMakingFogelrith() {
  //decision A
  if (mousePressed && ((mouseX > decAMouseX1) && (mouseX < decAMouseX2)) && ((mouseY > decAMouseY1) && (mouseY < decAMouseY2))) {
    if (panelTracker == 12) {
      attackDirectly = true;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if ((panelTracker == 15) && (attackDirectly == true)) {
      olRaisinDies = true;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    prevButton = false;
  }
  
  //decision B
 else if (mousePressed && ((mouseX > decBMouseX1) && (mouseX < decBMouseX2)) && ((mouseY > decBMouseY1) && (mouseY < decBMouseY2))) {
   if (panelTracker == 12) {
      attackDirectly = false;
      panelTracker = 17;
      nextButton = true;
   }
   
   if ((panelTracker == 13) && (attackDirectly == true)) {
      olRaisinDies = false;
      //panelTracker = panelTracker + 1;
      nextButton = true;
    }
   prevButton = false;
 }
}
void decisionMakingIncident() {
    //decision A
  if (mousePressed && ((mouseX > decAMouseX1) && (mouseX < decAMouseX2)) && ((mouseY > decAMouseY1) && (mouseY < decAMouseY2))) {
    if ((panelTracker == 3) && (playIncident == true) && (volunteerStayQuiet == true)) {
      makeSceneAtParty = true;
      nextButton = true;
      panelTracker = 5;
    }
  
  prevButton = false;
  }
  
  //decision B
  else if (mousePressed && ((mouseX > decBMouseX1) && (mouseX < decBMouseX2)) && ((mouseY > decBMouseY1) && (mouseY < decBMouseY2))) {
    if ((panelTracker == 3) && (playIncident == true) && (volunteerStayQuiet == true)) {
      makeSceneAtParty = false;
      panelTracker = 9;
      
    }
  prevButton = false;
}
}
void incidentStory() {
  String[] incident1 = loadStrings ("InitiatingIncident.txt");
  if ((panelTracker == 1) && (volunteerStayQuiet == true)) {
    text(incident1[34], 50, 540);
    text(incident1[35], 50, 570);
    text(incident1[36], 50, 600);
    text(incident1[37], 50, 630);
    prevNext();
  }
  
    else if ((panelTracker == 2) && (volunteerStayQuiet == true)) {
    text(incident1[39], 50, 540);
    prevNext();
  }
  
  else if ((panelTracker == 3) && (volunteerStayQuiet == true)) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 270, 40);
      
      //decision B
      rect(45, 595, 80, 40);
      
      fill(0,0,0);
    text(incident1[41], 50, 560);
    text(incident1[42], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingIncident();
    }
    
    else if ((panelTracker == 9) && (makeSceneAtParty == false) && (volunteerStayQuiet == true)) {
    text(incident1[34], 50, 540);
    text(incident1[35], 50, 570);
    text(incident1[36], 50, 600);
    text(incident1[37], 50, 630);
    
      prevNext();
    }
    
    else if ((panelTracker == 10) && (makeSceneAtParty == false) && (volunteerStayQuiet == true)) {
    text(incident1[55], 50, 540);
    text(incident1[56], 50, 570);
    text(incident1[57], 50, 600);
    text(incident1[58], 50, 630);
    
      prevNext();
    }
    
    else if ((panelTracker == 11) && (makeSceneAtParty == false) && (volunteerStayQuiet == true)) {
    text(incident1[60], 50, 540);
    text(incident1[61], 50, 570);
    text(incident1[62], 50, 600);
    text(incident1[63], 50, 630);
    
      prevNext();
    }
    
    else if ((panelTracker == 12) && (makeSceneAtParty == false) && (volunteerStayQuiet == true)) {
    text(incident1[65], 50, 540);
    
      prevNext();
    }
    
    else if ((panelTracker == 5) && (makeSceneAtParty == true)) {
    text(incident1[44], 50, 540);
    text(incident1[45], 50, 570);
      
      prevNext();
    }
    
    else if ((panelTracker == 6) && (makeSceneAtParty == true)) {
    text(incident1[47], 50, 540);
    text(incident1[48], 50, 570);
    text(incident1[49], 50, 600);
    text(incident1[50], 50, 630);
    
    prevNext();
    }
    
    else if ((panelTracker == 7) && (makeSceneAtParty == true)) {
    text(incident1[52], 50, 540);
    text(incident1[53], 50, 570);
    
    prevNext();
    }
  
  else if ((panelTracker == 1) && (volunteerStayQuiet == false)) {
    text(incident1[0], 50, 540);
    text(incident1[1], 50, 570);
    text(incident1[2], 50, 600);
    text(incident1[3], 50, 630);
    
    prevNext();
  }
  
  else if ((panelTracker == 2) && (volunteerStayQuiet == false)) {
    text(incident1[5], 50, 540);
    text(incident1[6], 50, 570);
    text(incident1[7], 50, 600);
    
    prevNext();
  }
  
  else if ((panelTracker == 3) && (volunteerStayQuiet == false)) {
    text(incident1[9], 50, 540);
    text(incident1[10], 50, 570);
    
    prevNext();
  }
  
  else if ((panelTracker == 4) && (volunteerStayQuiet == false)) {
    text(incident1[12], 50, 540);
    
    prevNext();
  }
  
  else if ((panelTracker == 5) && (volunteerStayQuiet == false)) {
    text(incident1[14], 50, 540);
    text(incident1[15], 50, 570);
    text(incident1[16], 50, 600);
    
    prevNext();
  }
  
  else if ((panelTracker == 6) && (volunteerStayQuiet == false)) {
    text(incident1[18], 50, 540);
    text(incident1[19], 50, 570);
    text(incident1[20], 50, 600);
    
    prevNext();
  }
  
  else if ((panelTracker == 8) && ((volunteerStayQuiet == false) || (makeSceneAtParty == true))) {
    text(incident1[22], 50, 540);
    text(incident1[23], 50, 570);
    text(incident1[24], 50, 600);
    text(incident1[25], 50, 630);
    
    prevNext();
  }
    
    else if ((panelTracker == 9) && ((volunteerStayQuiet == false) || (makeSceneAtParty == true))) {
    text(incident1[27], 50, 540);
    
    prevNext();
    }
    
    else if ((panelTracker == 10) && ((volunteerStayQuiet == false) || (makeSceneAtParty == true))) {
    text(incident1[29], 50, 540);
    text(incident1[30], 50, 570);
    text(incident1[31], 50, 600);
    text(incident1[32], 50, 630);
    
    prevNext();
    }
  
  else if (panelTracker == 11) {
    text(incident1[72], 50, 540);
    text(incident1[73], 50, 570);
    text(incident1[74], 50, 600);
    text(incident1[75], 50, 630);
    
    prevNext();
  }
  
    else if (panelTracker == 12) {
    text(incident1[77], 50, 540);
    text(incident1[78], 50, 570);
    text(incident1[79], 50, 600);
    
    prevNext();
  }
  
    else if (panelTracker == 13) {
    text(incident1[81], 50, 540);
    text(incident1[82], 50, 570);
    
    prevNext();
  }
  
    else if (panelTracker == 14) {
    text(incident1[84], 50, 540);
    
    prevNext();
  }
  
    else if (panelTracker == 15) {
    text(incident1[86], 50, 540);
    text(incident1[87], 50, 570);
    
    prevNext();
  }
  
    else if (panelTracker == 16) {
    text(incident1[89], 50, 540);
    text(incident1[90], 50, 570);
    
    prevNext();
  }
  
    else if (panelTracker == 17) {
    text(incident1[92], 50, 540);
    text(incident1[93], 50, 570);
    
    prevNext();
  }
  
    else if (panelTracker == 18) {
    text(incident1[95], 50, 540);
    text(incident1[96], 50, 570);
    text(incident1[97], 50, 600);
    text(incident1[98], 50, 630);
    
    prevNext();
  }
  
    else if (panelTracker == 19) {
    text(incident1[100], 50, 540);
    text(incident1[101], 50, 570);
    text(incident1[102], 50, 600);
    text(incident1[103], 50, 630);
    
    prevNext();
  }
  
    else if (panelTracker == 20) {
    text(incident1[105], 50, 540);
    text(incident1[106], 50, 570);
    text(incident1[107], 50, 600);
    
    prevNext();
  }
  
  else if (panelTracker == 21) {
    text(incident1[109], 50, 540);
    
    prevNext();
  }
  
  else if (panelTracker == 22) {
    text(incident1[111], 50, 540);
    text(incident1[112], 50, 570);
    text(incident1[113], 50, 600);
    
    prevNext();
  }
  
  else if (panelTracker == 23) {
    text(incident1[115], 50, 540);
    text(incident1[116], 50, 570);
    text(incident1[117], 50, 600);
    text(incident1[118], 50, 630);
    
    prevNext();
  }
  
  else if (panelTracker == 24) {
    text(incident1[120], 50, 540);
    text(incident1[121], 50, 570);
    
    prevNext();
  }
  
  else if (panelTracker == 25) {
    prevButton = false;
    playIncident = false;
    selectStoryArc = true;
    arcSelection();
  }
  
  
}
void prologueStory() {
    String[] prologue1 = loadStrings ("prologue-0-1.txt");
  //panel 1 of prologue 0.1
  if (panelTracker == 1) {
    //panelImage = loadImage("Forest_colourize.png");
    text(prologue1[0], 50, 540);
    text(prologue1[1], 50, 570);
    text(prologue1[2], 50, 600);
    text(prologue1[3], 50, 630);
    prevNext();
  }
  
  //panel 2 of prologue 0.1
  
  else if (panelTracker == 2) {
    //panelImage = loadImage("forest-setting.png");
    text(prologue1[5], 50, 540);
    text(prologue1[6], 50, 570);
    text(prologue1[7], 50, 600);
    prevNext();
  }
  
  //panel 3 of prologue 0.1
  else if (panelTracker == 3) {
    text(prologue1[9], 50, 540);
    text(prologue1[10], 50, 570);
    text(prologue1[11], 50, 600);
    prevNext();
  }
  
  //panel 1 of prologue 0.2
    else if (panelTracker == 4) {
    text(prologue1[13], 50, 540);
    text(prologue1[14], 50, 570);
    text(prologue1[15], 50, 600);
    text(prologue1[16], 50, 630);
    prevNext();
  }
  
    //panel 2 of prologue 0.2
    else if (panelTracker == 5) {
    text(prologue1[18], 50, 540);
    text(prologue1[19], 50, 570);
    text(prologue1[20], 50, 600);
    text(prologue1[21], 50, 630);
    prevNext();
  }
  
  else if (panelTracker == 6) {
    text(prologue1[23], 50, 540);
    text(prologue1[24], 50, 570);
    text(prologue1[25], 50, 600);
    prevNext();
  }
  
  else if (panelTracker == 7) {
    text(prologue1[27], 50, 540);
    text(prologue1[28], 50, 570);
    text(prologue1[29], 50, 600);
    prevNext();
  }
  
    else if (panelTracker == 8) {
    text(prologue1[31], 50, 540);
    text(prologue1[32], 50, 570);
    text(prologue1[33], 50, 600);
    prevNext();
  }
  
    else if (panelTracker == 9) {
    text(prologue1[35], 50, 540);
    text(prologue1[36], 50, 570);
    text(prologue1[37], 50, 600);
    prevNext();
  }
  
    else if (panelTracker == 10) {
    text(prologue1[39], 50, 540);
    text(prologue1[40], 50, 570);
    text(prologue1[41], 50, 600);
    text(prologue1[42], 50, 630);
    prevNext();
  }
  
    else if (panelTracker == 11) {
    text(prologue1[44], 50, 540);
    text(prologue1[45], 50, 570);
    text(prologue1[46], 50, 600);

    prevNext();
  }
  
    else if (panelTracker == 12) {
    text(prologue1[48], 50, 540);
    text(prologue1[49], 50, 570);
    text(prologue1[50], 50, 600);

    prevNext();
  }
  
    else if (panelTracker == 13) {
    text(prologue1[52], 50, 540);
    text(prologue1[53], 50, 570);
    text(prologue1[54], 50, 600);

    prevNext();
    }
  
  //0.5 Decision. Either stay with stranger, or struggle free.
  
    else if (panelTracker == 14) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 250, 40);
      
      //decision B
      rect(45, 595, 250, 40);
      
      fill(0,0,0);
    text(prologue1[56], 50, 560);
    text(prologue1[57], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingPrologue();
    }
    
    //If decision A is picked by the player in 0.5
    else if ((panelTracker == 15) && (stayWithStruggleFree == true)) {
    text(prologue1[59], 50, 540);
    text(prologue1[60], 50, 570);
    text(prologue1[61], 50, 600);
    text(prologue1[62], 50, 630);
    
    prevNext();
    }
    
    else if (panelTracker == 16 && (stayWithStruggleFree == true)) {
    text(prologue1[64], 50, 540);
    text(prologue1[65], 50, 570);
    text(prologue1[66], 50, 600);
    text(prologue1[67], 50, 630);
    
    prevNext();
    }
    
    else if (panelTracker == 17 && (stayWithStruggleFree == true)) {
    text(prologue1[69], 50, 540);
    text(prologue1[70], 50, 570);
    text(prologue1[71], 50, 600);
    text(prologue1[72], 50, 630);
    
    prevNext();
    }
    
    //decision for 0.5A
    else if ((panelTracker == 18) && (stayWithStruggleFree == true)) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      rect(45, 535, 300, 40);
      rect(45, 595, 300, 40);
      fill(0,0,0);
    text(prologue1[74], 50, 560);
    text(prologue1[75], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 345;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 345;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingPrologue();

    }
    
    //beginning of 0.5A-A
    else if (panelTracker == 19 && (tellAboutNecklace == true) && (stayWithStruggleFree == true)) {
    text(prologue1[77], 50, 540);
    text(prologue1[78], 50, 570);
    text(prologue1[79], 50, 600);
    
    prevNext();
    
}

  else if (panelTracker == 20 && (tellAboutNecklace == true) && (stayWithStruggleFree == true)) {
    text(prologue1[81], 50, 540);
    text(prologue1[82], 50, 570);
    text(prologue1[83], 50, 600);
    
    prevNext();
    
}

  else if (panelTracker == 21 && (tellAboutNecklace == true) && (stayWithStruggleFree == true)) {
    text(prologue1[85], 50, 540);
    text(prologue1[86], 50, 570);
    text(prologue1[87], 50, 600);
    
    prevNext();
    
  }

//beginning of 0.5A-B
  else if (panelTracker == 19 && (tellAboutNecklace == false) && (stayWithStruggleFree == true)) {
    text(prologue1[89], 50, 540);
    text(prologue1[90], 50, 570);
    text(prologue1[91], 50, 600);
    
    prevNext();
    
  }
  
  else if (panelTracker == 20 && (tellAboutNecklace == false) && (stayWithStruggleFree == true)) {
    text(prologue1[93], 50, 540);
    text(prologue1[94], 50, 570);
    
    prevNext();
    
  }
  
    else if (panelTracker == 21 && (tellAboutNecklace == false) && (stayWithStruggleFree == true)) {
    text(prologue1[96], 50, 540);
    text(prologue1[97], 50, 570);
    text(prologue1[98], 50, 600);
    
    prevNext();
    
  }
  
  //decision 0.5B
  else if (panelTracker == 18 && (stayWithStruggleFree == false)) {
    text(prologue1[100], 50, 540);
    text(prologue1[101], 50, 570);
    text(prologue1[102], 50, 600);
    text(prologue1[103], 50, 630);
    
    prevNext();
    }
    
    //decision for 0.5B
    else if ((panelTracker == 19) && (stayWithStruggleFree == false)) {
      prevButton = true;
      nextButton = false;
      prevNext();
      fill(255, 255, 255);
      rect(45, 535, 450, 40);
      rect(45, 595, 300, 40);
      fill(0,0,0);
    text(prologue1[105], 50, 560);
    text(prologue1[106], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 495;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 345;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    decisionMakingPrologue();

    }
    
    //0.5B-A text
    else if (panelTracker == 20 && (stayWithStruggleFree == false)) {
    text(prologue1[108], 50, 540);
    text(prologue1[109], 50, 570);
    
    prevNext();
    }
    
    //decision for 0.5B-B
    else if ((panelTracker == 21) && (stayWithStruggleFree == false)) {
      prevButton = true;
      nextButton = false;
      prevNext();
      fill(255, 255, 255);
      rect(45, 535, 175, 40);
      rect(45, 595, 220, 40);
      fill(0,0,0);
    text(prologue1[111], 50, 560);
    text(prologue1[112], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 220;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 265;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    decisionMakingPrologue();

    }
    
    else if (panelTracker == 22) {
    text(prologue1[114], 50, 540);
    text(prologue1[115], 50, 570);
    text(prologue1[116], 50, 600);
    
    prevNext();
    }
    
    else if (panelTracker == 23) {
    text(prologue1[118], 50, 540);
    text(prologue1[119], 50, 570);
    text(prologue1[120], 50, 600);
    text(prologue1[121], 50, 630);
    
    prevNext();
    }
    
    else if (panelTracker == 24) {
    text(prologue1[123], 50, 540);
    text(prologue1[124], 50, 570);
    text(prologue1[125], 50, 600);
    
    prevNext();
    }
    
    else if (panelTracker == 25) {
    text(prologue1[127], 50, 540);
    text(prologue1[128], 50, 570);
    text(prologue1[129], 50, 600);
    
    prevNext();
    }
    
    else if (panelTracker == 26) {
      prevButton = true;
      nextButton = false;
      prevNext();
      fill(255, 255, 255);
      rect(45, 535, 125, 40);
      rect(45, 595, 220, 40);
      fill(0,0,0);
    text(prologue1[131], 50, 560);
    text(prologue1[132], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 170;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 265;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    decisionMakingPrologue();

    }
    
    else if ((panelTracker == 28) && (stayPut == true)) {
    text(prologue1[134], 50, 540);
    text(prologue1[135], 50, 570);
    text(prologue1[136], 50, 600);
    text(prologue1[137], 50, 630);
    
    prevNext();
    }
    
    else if ((panelTracker == 29) && (stayPut == true)) {
    text(prologue1[139], 50, 540);
    text(prologue1[140], 50, 570);
    text(prologue1[141], 50, 600);
    text(prologue1[142], 50, 630);
    
    prevNext();
    }
    
    else if ((panelTracker == 27) && (stayPut == false)) {
    text(prologue1[144], 50, 540);
    text(prologue1[145], 50, 570);
    text(prologue1[146], 50, 600);
    text(prologue1[147], 50, 630);
    
    prevNext();
    }
    
    else if ((panelTracker == 28) && (stayPut == false)) {
    text(prologue1[149], 50, 540);
    text(prologue1[150], 50, 570);
    text(prologue1[151], 50, 600);
    text(prologue1[152], 50, 630);
    
    prevNext();
    }
    
    else if ((panelTracker == 29) && (stayPut == false)) {
    text(prologue1[154], 50, 540);
    text(prologue1[155], 50, 570);
    text(prologue1[156], 50, 600);
    text(prologue1[157], 50, 630);
    
    prevNext();
    }
    
    else if (panelTracker == 30) {
    text(prologue1[159], 50, 540);
    text(prologue1[160], 50, 570);
    text(prologue1[161], 50, 600);
    
    prevNext();
    }
    
    else if (panelTracker == 31) {
    text(prologue1[163], 50, 540);
    text(prologue1[164], 50, 570);
    text(prologue1[165], 50, 600);
    text(prologue1[166], 50, 630);
    
    prevNext();
    }
    
    else if (panelTracker == 32) {
    text(prologue1[168], 50, 540);
    text(prologue1[169], 50, 570);
    
    prevNext();
    }
    
    else if (panelTracker == 33) {
    text(prologue1[171], 50, 540);
    
    nextArc();
    }
}
void decisionMakingPrologue() {
    //decision A
  if (mousePressed && ((mouseX > decAMouseX1) && (mouseX < decAMouseX2)) && ((mouseY > decAMouseY1) && (mouseY < decAMouseY2))) {
     //decision in prologue 0.5
    if ((panelTracker == 14) && (playPrologue == true)){
    stayWithStruggleFree = true;
    nextButton = true;
    panelTracker = panelTracker + 1;    
  }
  //decision in prologue 0.5A
  if ((panelTracker == 18) && (playPrologue == true) && (stayWithStruggleFree == true)){
    tellAboutNecklace = true;
    nextButton = true;
    panelTracker = panelTracker + 1;
  }
  
  //decision in prologue 0.5B
  if ((panelTracker == 18) && (playPrologue == true) && (stayWithStruggleFree == false)){
    waitRunAway = true;
    nextButton = true;
    panelTracker = panelTracker + 1;
  }
  
  //decision in prologue 0.5B-A. waiting for stranger to make the next move
  if ((panelTracker == 19) && (playPrologue == true) && (stayWithStruggleFree == false)) {
    takeStrangerHand = true;
    nextButton = true;
    panelTracker = panelTracker + 1;
  }
  
  //decide whether to take the stranger's hand or not
    if ((panelTracker == 21) && (playPrologue == true) && (stayWithStruggleFree == false)) {
    takeStrangerHand = false;
    nextButton = true;
    panelTracker = 22;
  }
  
  //decision whether to stay put or go to your father
    if ((panelTracker == 26) && (playPrologue == true)) {
    stayPut = true;
    nextButton = true;
    panelTracker = panelTracker + 2;
  }
  
  prevButton = false;
  }
  
  //decision B
  else if (mousePressed && ((mouseX > decBMouseX1) && (mouseX < decBMouseX2)) && ((mouseY > decBMouseY1) && (mouseY < decBMouseY2))) {
    if ((panelTracker == 14) && (playPrologue == true)){
    stayWithStruggleFree = false;
    nextButton = true;
    panelTracker = 18; //this is set because we have to jump panels in order to converge back.
    }
    
    if ((panelTracker == 18) && (playPrologue == true) && (stayWithStruggleFree == true)){
      tellAboutNecklace = false;
      nextButton = true;
      panelTracker = panelTracker + 1;
  }
  
  if ((panelTracker == 18) && (playPrologue == true) && (stayWithStruggleFree == false)){
    waitRunAway = false;
    nextButton = true;
    panelTracker = 22;
  }
  
  if ((panelTracker == 19) && (playPrologue == true) && (stayWithStruggleFree == false)) {
    takeStrangerHand = false;
    nextButton = true;
    panelTracker = 22;
  }
  
  //decision whether to stay put or go to your father
    if ((panelTracker == 26) && (playPrologue == true)) {
    stayPut = false;
    nextButton = true;
    panelTracker = panelTracker + 1;
  }
  
  prevButton = false;
}
}
void sironiaStory() {
  String[] sironia1 = loadStrings ("sironia.txt");
  
  if (panelTracker == 1) {
    text(sironia1[0], 50, 540);
    text(sironia1[1], 50, 570);
    text(sironia1[2], 50, 600);
    text(sironia1[3], 50, 630); 
    prevNext();
  }
  
  else if (panelTracker == 2) {
    text(sironia1[5], 50, 540);
    text(sironia1[6], 50, 570);
    text(sironia1[7], 50, 600);
    text(sironia1[8], 50, 630); 
    prevNext();
  }
  
  else if (panelTracker == 3) {
    text(sironia1[10], 50, 540);
    text(sironia1[11], 50, 570);
    text(sironia1[12], 50, 600);
    text(sironia1[13], 50, 630); 
    prevNext();
  }
  
  else if (panelTracker == 4) {
    text(sironia1[15], 50, 540);
    text(sironia1[16], 50, 570);
    prevNext();
  }
  
  else if (panelTracker == 5) {
    text(sironia1[18], 50, 540);
    prevNext();
  }
  
  else if (panelTracker == 6) {
    text(sironia1[20], 50, 540);
    text(sironia1[21], 50, 570);
    text(sironia1[22], 50, 600);
    text(sironia1[23], 50, 630); 
    prevNext();
  }
  
  else if (panelTracker == 7) {
    text(sironia1[25], 50, 540);
    text(sironia1[26], 50, 570);
    text(sironia1[27], 50, 600);
    prevNext();
  }
  
  else if (panelTracker == 8) {
    text(sironia1[29], 50, 540);
    text(sironia1[30], 50, 570);
    text(sironia1[31], 50, 600);
    text(sironia1[32], 50, 630); 
    prevNext();
  }
  
  else if (panelTracker == 9) {
    text(sironia1[34], 50, 540);
    prevNext();
  }
  
  else if (panelTracker == 10) {
    text(sironia1[36], 50, 540);
    text(sironia1[37], 50, 570);
    text(sironia1[38], 50, 600);
    prevNext();
  }
  
  else if (panelTracker == 11) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 250, 40);
      
      //decision B
      rect(45, 595, 250, 40);
      
      fill(0,0,0);
    text(sironia1[40], 50, 560);
    text(sironia1[41], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingSironia();
  }
  
  //if you accept David's offer
  
  else if ((panelTracker == 12) && (stayTheNight == true)) {
    text(sironia1[88], 50, 540);
    text(sironia1[89], 50, 570);
    text(sironia1[90], 50, 600);
    text(sironia1[91], 50, 630); 
    prevNext();
  }
  
  else if ((panelTracker == 13) && (stayTheNight == true)) {
    text(sironia1[93], 50, 540);
    text(sironia1[94], 50, 570);
    text(sironia1[95], 50, 600);
    text(sironia1[96], 50, 630); 
    prevNext();
  }
  
  else if ((panelTracker == 14) && (stayTheNight == true)) {
    text(sironia1[98], 50, 540);
    text(sironia1[99], 50, 570);
    text(sironia1[100], 50, 600);
    prevNext();
  }
  
  //decide to investigate the noise or ask David in the morning.
  else if ((panelTracker == 15) && (stayTheNight == true)) {
    prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 250, 40);
      
      //decision B
      rect(45, 595, 250, 40);
      
      fill(0,0,0);
    text(sironia1[102], 50, 560);
    text(sironia1[103], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingSironia();
  }
  
  //if you investigate the noise
  
  else if ((panelTracker == 16) && (stayTheNight == true) && (investigateNoise == true)) {
    text(sironia1[105], 50, 540);
    text(sironia1[106], 50, 570);
    text(sironia1[107], 50, 600);
    text(sironia1[108], 50, 630); 
    prevNext();
  }
  
  else if ((panelTracker == 17) && (stayTheNight == true) && (investigateNoise == true)) {
    text(sironia1[110], 50, 540);
    prevNext();
  }
  
  else if ((panelTracker == 18) && (stayTheNight == true) && (investigateNoise == true)) {
    text(sironia1[112], 50, 540);
    text(sironia1[113], 50, 570);
    text(sironia1[114], 50, 600);
    text(sironia1[115], 50, 630); 
    prevNext();
  }
  
  else if ((panelTracker == 19) && (stayTheNight == true) && (investigateNoise == true)) {
    text(sironia1[117], 50, 540);
    text(sironia1[118], 50, 570);
    text(sironia1[119], 50, 600);
    prevNext();
  }
  
  //if you ask David about it in the morning
  else if ((panelTracker == 16) && (stayTheNight == true) && (investigateNoise == false)) {
    text(sironia1[121], 50, 540);
    text(sironia1[122], 50, 570);
    text(sironia1[123], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 17) && (stayTheNight == true) && (investigateNoise == false)) {
    text(sironia1[125], 50, 540);
    prevNext();
  }
  
  else if ((panelTracker == 18) && (stayTheNight == true) && (investigateNoise == false)) {
    text(sironia1[127], 50, 540);
    text(sironia1[128], 50, 570);
    text(sironia1[129], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 19) && (stayTheNight == true) && (investigateNoise == false)) {
    text(sironia1[131], 50, 540);
    text(sironia1[132], 50, 570);
    prevNext();
  }
  
  //if you don't accept his offer
  
  else if ((panelTracker == 12) && (stayTheNight == false)) {
    text(sironia1[43], 50, 540);
    text(sironia1[44], 50, 570);
    text(sironia1[45], 50, 600);
    text(sironia1[46], 50, 630); 
    prevNext();
  }
  
  else if ((panelTracker == 13) && (stayTheNight == false)) {
    text(sironia1[48], 50, 540);
    text(sironia1[49], 50, 570);
    text(sironia1[50], 50, 600);
    text(sironia1[51], 50, 630); 
    prevNext();
  }
  
  //fight the coyotes or run to the barn
  else if ((panelTracker == 14) && (stayTheNight == false)) {
    prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 250, 40);
      
      //decision B
      rect(45, 595, 250, 40);
      
      fill(0,0,0);
    text(sironia1[53], 50, 560);
    text(sironia1[54], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingSironia();
  }
  
  //if you fight the coyotes
  
  else if ((panelTracker == 16) && (stayTheNight == false) && (fightCoyotes = true)) {
    text(sironia1[71], 50, 540);
    text(sironia1[72], 50, 570);
    text(sironia1[73], 50, 600);
    text(sironia1[74], 50, 630); 
    prevNext();
  }
  
  else if ((panelTracker == 17) && (stayTheNight == false) && (fightCoyotes = true)) {
    text(sironia1[76], 50, 540);
    text(sironia1[77], 50, 570);
    text(sironia1[78], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 18) && (stayTheNight == false) && (fightCoyotes = true)) {
    text(sironia1[80], 50, 540);
    text(sironia1[81], 50, 570); 
    prevNext();
  }
  
  else if ((panelTracker == 19) && (stayTheNight == false) && (fightCoyotes = true)) {
    text(sironia1[83], 50, 540);
    text(sironia1[84], 50, 570);
    text(sironia1[85], 50, 600);
    text(sironia1[86], 50, 630); 
    prevNext();
  }
  
  //if you run to the barn
  
  else if ((panelTracker == 16) && (stayTheNight == false) && (fightCoyotes = false)) {
    text(sironia1[56], 50, 540);
    text(sironia1[57], 50, 570);
    text(sironia1[58], 50, 600);
    text(sironia1[59], 50, 630); 
    prevNext();
  }
  
  else if ((panelTracker == 17) && (stayTheNight == false) && (fightCoyotes = false)) {
    text(sironia1[61], 50, 540);
    text(sironia1[62], 50, 570);
    text(sironia1[63], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 18) && (stayTheNight == false) && (fightCoyotes = false)) {
    text(sironia1[65], 50, 540);
    text(sironia1[66], 50, 570); 
    prevNext();
  }
  
  else if ((panelTracker == 19) && (stayTheNight == false) && (fightCoyotes = false)) {
    text(sironia1[68], 50, 540);
    text(sironia1[69], 50, 570);
    text(sironia1[70], 50, 600);
    text(sironia1[71], 50, 630); 
    prevNext();
  }
  
  // start here with reaching the city
  
  else if (panelTracker == 20) {
    text(sironia1[134], 50, 540);
    text(sironia1[135], 50, 570);
    text(sironia1[136], 50, 600);
    text(sironia1[137], 50, 630); 
    prevNext();
  }
  
  else if (panelTracker == 21) {
    text(sironia1[139], 50, 540);
    text(sironia1[140], 50, 570);
    prevNext();
  }
  
  //decide to speak about the slaves
  
  else if (panelTracker == 22) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 250, 40);
      
      //decision B
      rect(45, 595, 250, 40);
      
      fill(0,0,0);
    text(sironia1[142], 50, 560);
    text(sironia1[143], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingSironia(); 
  }
  
  //tell the mayor about the slaves
  
  else if ((panelTracker == 23) && (tellAboutSlaves == true)) {
    text(sironia1[145], 50, 540);
    text(sironia1[146], 50, 570);
    text(sironia1[147], 50, 600);
    text(sironia1[148], 50, 630); 
    prevNext();
  }
  
  else if ((panelTracker == 24) && (tellAboutSlaves == true)) {
    text(sironia1[150], 50, 540);
    text(sironia1[151], 50, 570); 
    prevNext();
  }
  
  else if ((panelTracker == 25) && (tellAboutSlaves == true)) {
      completedSironia = true;
      allySironia = false;
      selectStoryArc = true;
      arcSelection();
  }
  
  //avoid insulting the culture
  
  else if ((panelTracker == 23) && (tellAboutSlaves == false)) {
    text(sironia1[153], 50, 540);
    prevNext();
  }
  
  else if ((panelTracker == 24) && (tellAboutSlaves == false)) {
    text(sironia1[155], 50, 540);
    text(sironia1[156], 50, 570);
    prevNext();
  }
  
  else if ((panelTracker == 25) && (tellAboutSlaves == false)) {
    completedSironia = true;
      allySironia = true;
      totalAllies = totalAllies + 1;
      selectStoryArc = true;
      arcSelection();
  }
  
}
void decisionMakingSironia() {
  //decision A
  if (mousePressed && ((mouseX > decAMouseX1) && (mouseX < decAMouseX2)) && ((mouseY > decAMouseY1) && (mouseY < decAMouseY2))) {
    if (panelTracker == 11) {
      stayTheNight = true;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if ((panelTracker == 14) && (stayTheNight == false)) {
      fightCoyotes = false;
      panelTracker = panelTracker + 2;
      nextButton = true;
    }
    
    if ((panelTracker == 15) && (stayTheNight == true)) {
      investigateNoise = true;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if (panelTracker == 22) {
      tellAboutSlaves = true;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    prevButton = false;
  }
  
  //decision B
  else if (mousePressed && ((mouseX > decBMouseX1) && (mouseX < decBMouseX2)) && ((mouseY > decBMouseY1) && (mouseY < decBMouseY2))) {
    if (panelTracker == 11) {
      stayTheNight = false;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if ((panelTracker == 14) && (stayTheNight == false)) {
      fightCoyotes = true;
      panelTracker = panelTracker + 2;
      nextButton = true;
    }
    
    if ((panelTracker == 15) && (stayTheNight == true)) {
      investigateNoise = false;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if (panelTracker == 22) {
      tellAboutSlaves = false;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    prevButton = false;
  }
  
}
void teilleStory() {
  String[] teille1 = loadStrings ("teille.txt");
  
  if (panelTracker == 1) {
    text(teille1[0], 50, 540);
    text(teille1[1], 50, 570);
    text(teille1[2], 50, 600);
    prevNext();
  }
  
  else if (panelTracker == 2) {
    text(teille1[4], 50, 540);
    text(teille1[5], 50, 570);
    text(teille1[6], 50, 600);
    text(teille1[7], 50, 630);
    prevNext();
  }
  
  else if (panelTracker == 3) {
    text(teille1[9], 50, 540);
    text(teille1[10], 50, 570);
    text(teille1[11], 50, 600);
    prevNext();
  }
  
  else if (panelTracker == 4) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 250, 40);
      
      //decision B
      rect(45, 595, 250, 40);
      
      fill(0,0,0);
    text(teille1[13], 50, 560);
    text(teille1[14], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingTeille();
  }
  
  else if ((panelTracker == 5) && (setUpCamp == true)) {
    text(teille1[90], 50, 540);
    text(teille1[91], 50, 570);
    text(teille1[92], 50, 600);
    text(teille1[93], 50, 630);
    prevNext();
  }
  
  //whether you choose to let Rolan create a distraction or explain why you are there.
  
  else if ((panelTracker == 6) && (setUpCamp == true)) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 250, 40);
      
      //decision B
      rect(45, 595, 250, 40);
      
      fill(0,0,0);
    text(teille1[95], 50, 560);
    text(teille1[96], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingTeille();
  }
  
  //explain why you are there.
  
  else if ((panelTracker == 7) && (setUpCamp == true) && (createDistraction == false)) {
    text(teille1[153], 50, 540);
    text(teille1[154], 50, 570);
    text(teille1[155], 50, 600);
    text(teille1[156], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 8) && (setUpCamp == true) && (createDistraction == false)) {
    text(teille1[158], 50, 540);
    prevNext();
  }
  
  else if ((panelTracker == 9) && (setUpCamp == true) && (createDistraction == false)) {
    text(teille1[160], 50, 540);
    text(teille1[161], 50, 570);
    text(teille1[162], 50, 600);
    text(teille1[163], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 10) && (setUpCamp == true) && (createDistraction == false)) {
    text(teille1[165], 50, 540);
    text(teille1[166], 50, 570);
    text(teille1[167], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 11) && (setUpCamp == true) && (createDistraction == false)) {
    text(teille1[169], 50, 540);
    text(teille1[170], 50, 570);
    text(teille1[171], 50, 600);
    text(teille1[172], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 12) && (setUpCamp == true) && (createDistraction == false)) {
    text(teille1[174], 50, 540);
    text(teille1[175], 50, 570);
    text(teille1[176], 50, 600);
    text(teille1[177], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 13) && (setUpCamp == true) && (createDistraction == false)) {
    text(teille1[179], 50, 540);
    text(teille1[180], 50, 570);
    prevNext();
  }
  
  else if ((panelTracker == 14) && (setUpCamp == true) && (createDistraction == false)) {
    text(teille1[182], 50, 540);
    text(teille1[183], 50, 570);
    text(teille1[184], 50, 600);
    prevNext();
  }
  
  //accept or refuse the test, both positive consequences
  
  else if ((panelTracker == 15) && (setUpCamp == true) && (createDistraction == false)) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 250, 40);
      
      //decision B
      rect(45, 595, 250, 40);
      
      fill(0,0,0);
    text(teille1[186], 50, 560);
    text(teille1[187], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingTeille();
  }
  
  //if you accept the request
  
  else if ((panelTracker == 16) && (setUpCamp == true) && (createDistraction == false) && (tameAnimal2 == true)) {
    text(teille1[189], 50, 540);
    text(teille1[190], 50, 570);
    text(teille1[191], 50, 600);
    text(teille1[192], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 17) && (setUpCamp == true) && (createDistraction == false) && (tameAnimal2 == true)) {
    text(teille1[194], 50, 540);
    text(teille1[195], 50, 570);
    text(teille1[196], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 18) && (setUpCamp == true) && (createDistraction == false) && (tameAnimal2 == true)) {
    text(teille1[198], 50, 540);
    text(teille1[199], 50, 570);
    text(teille1[200], 50, 600);
    text(teille1[201], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 19) && (setUpCamp == true) && (createDistraction == false) && (tameAnimal2 == true)) {
      completedTeille = true;
      allyTeille = true;
      totalAllies = totalAllies + 1;
      selectStoryArc = true;
      arcSelection();
  }
  
  //if you decline the request
  
  else if ((panelTracker == 16) && (setUpCamp == true) && (createDistraction == false) && (tameAnimal2 == false)) {
    text(teille1[203], 50, 540);
    prevNext();
  }
  
  else if ((panelTracker == 17) && (setUpCamp == true) && (createDistraction == false) && (tameAnimal2 == false)) {
    text(teille1[205], 50, 540);
    text(teille1[206], 50, 570);
    prevNext();
  }
  
  else if ((panelTracker == 18) && (setUpCamp == true) && (createDistraction == false) && (tameAnimal2 == false)) {
      completedTeille = true;
      allyTeille = true;
      totalAllies = totalAllies + 1;
      selectStoryArc = true;
      arcSelection();
  }
  
  
  //let Rolan make a distraction (haha derp)
  else if ((panelTracker == 12) && (setUpCamp == true) && (createDistraction == true)) {
    text(teille1[98], 50, 540);
    text(teille1[99], 50, 570);
    text(teille1[100], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 5) && (setUpCamp == false)) {
    text(teille1[16], 50, 540);
    text(teille1[17], 50, 570);
    text(teille1[18], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 6) && (setUpCamp == false)) {
    text(teille1[20], 50, 540);
    text(teille1[21], 50, 570);
    text(teille1[22], 50, 600);
    text(teille1[23], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 7) && (setUpCamp == false)) {
    prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 250, 40);
      
      //decision B
      rect(45, 595, 250, 40);
      
      fill(0,0,0);
    text(teille1[25], 50, 560);
    text(teille1[26], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingTeille();
  }
  
  else if ((panelTracker == 8) && (setUpCamp == false) && (killBoar == true)) {
    text(teille1[45], 50, 540);
    text(teille1[46], 50, 570);
    text(teille1[47], 50, 600);
    text(teille1[48], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 9) && (setUpCamp == false) && (killBoar == true)) {
    text(teille1[50], 50, 540);
    text(teille1[51], 50, 570);
    text(teille1[52], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 10) && (setUpCamp == false) && (killBoar == true)) {
    text(teille1[54], 50, 540);
    text(teille1[55], 50, 570);
    prevNext();
  }
  
  else if ((panelTracker == 11) && (setUpCamp == false) && (killBoar == true)) {
    text(teille1[57], 50, 540);
    text(teille1[58], 50, 570);
    text(teille1[59], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 12) && (setUpCamp == false) && (killBoar == true)) {
    text(teille1[61], 50, 540);
    text(teille1[62], 50, 570);
    prevNext();
  }
  
  else if ((panelTracker == 8) && (setUpCamp == false) && (killBoar == false)) {
    text(teille1[28], 50, 540);
    text(teille1[29], 50, 570);
    text(teille1[30], 50, 600);
    text(teille1[31], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 9) && (setUpCamp == false) && (killBoar == false)) {
    text(teille1[33], 50, 540);
    prevNext();
  }
  
  else if ((panelTracker == 10) && (setUpCamp == false) && (killBoar == false)) {
    text(teille1[35], 50, 540);
    text(teille1[36], 50, 570);
    prevNext();
  }
  
  else if ((panelTracker == 11) && (setUpCamp == false) && (killBoar == false)) {
    text(teille1[38], 50, 540);
    text(teille1[39], 50, 570);
    text(teille1[40], 50, 600);
    text(teille1[41], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 12) && (setUpCamp == false) && (killBoar == false)) {
    text(teille1[43], 50, 540);
    prevNext();
  }
  
  //HERE BEGINS 1.1 WHERE THEY ARE ARRESTED
  
  else if ((panelTracker == 13) && ((setUpCamp == false) || (createDistraction == true))) {
    text(teille1[64], 50, 540);
    text(teille1[65], 50, 570);
    text(teille1[66], 50, 600);
    text(teille1[67], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 14) && ((setUpCamp == false) || (createDistraction == true))) {
    text(teille1[69], 50, 540);
    text(teille1[70], 50, 570);
    text(teille1[71], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 15) && ((setUpCamp == false) || (createDistraction == true))) {
    text(teille1[73], 50, 540);
    text(teille1[74], 50, 570);
    text(teille1[75], 50, 600);
    text(teille1[76], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 16) && ((setUpCamp == false) || (createDistraction == true))) {
    text(teille1[78], 50, 540);
    text(teille1[79], 50, 570);
    text(teille1[80], 50, 600);
    text(teille1[81], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 17) && ((setUpCamp == false) || (createDistraction == true))) {
    text(teille1[83], 50, 540);
    text(teille1[84], 50, 570);
    text(teille1[85], 50, 600);
    prevNext();
  }
  
  //ACCEPT OR REFUSE TO TAME THE ANIMAL
  
  else if ((panelTracker == 18) && ((setUpCamp == false) || (createDistraction == true))) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 250, 40);
      
      //decision B
      rect(45, 595, 250, 40);
      
      fill(0,0,0);
    text(teille1[87], 50, 560);
    text(teille1[88], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingTeille();
  }
  
  //if you tame the beast
  
  else if ((panelTracker == 19) && ((setUpCamp == false) || (createDistraction == true)) && (tameAnimal == true) && (killBoar == false)) {
    text(teille1[189], 50, 540);
    text(teille1[190], 50, 570);
    text(teille1[191], 50, 600);
    text(teille1[192], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 20) && ((setUpCamp == false) || (createDistraction == true)) && (tameAnimal == true) && (killBoar == false)) {
    text(teille1[194], 50, 540);
    text(teille1[195], 50, 570);
    text(teille1[196], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 21) && ((setUpCamp == false) || (createDistraction == true)) && (tameAnimal == true) && (killBoar == false)) {
    text(teille1[198], 50, 540);
    text(teille1[199], 50, 570);
    text(teille1[200], 50, 600);
    text(teille1[201], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 22) && ((setUpCamp == false) || (createDistraction == true)) && (tameAnimal == true) && (killBoar == false)) {
      completedTeille = true;
      allyTeille = true;
      totalAllies = totalAllies + 1;
      selectStoryArc = true;
      arcSelection();
  }
  
  //if you refuse taming the beast and can volunteer Rolan
  
  else if ((panelTracker == 19) && ((setUpCamp == false) || (createDistraction == true)) && (tameAnimal == false) && (killBoar == false)) {
    text(teille1[113], 50, 540);
    text(teille1[114], 50, 570);
    prevNext();
  }
  
  else if ((panelTracker == 20) && (tameAnimal == false) && ((setUpCamp == false) || (createDistraction == true))) {
    text(teille1[116], 50, 540);
    prevNext();
  }
  
  //volunteer Rolan to do it
  else if ((panelTracker == 21) && (tameAnimal == false) && ((setUpCamp == false) || (createDistraction == true)) && (killBoar == false)) {
      prevButton = true;
      nextButton = false;
      fill(255, 255, 255);
      
      //decision A
      rect(45, 535, 250, 40);
      
      //decision B
      rect(45, 595, 250, 40);
      
      fill(0,0,0);
    text(teille1[118], 50, 560);
    text(teille1[119], 50, 620);
    
    decAMouseX1 = 45;
    decAMouseX2 = 295;
    decAMouseY1 = 535;
    decAMouseY2 = 575;
    
    decBMouseX1 = 45;
    decBMouseX2 = 295;
    decBMouseY1 = 595;
    decBMouseY2 = 635;
    
    prevNext();
    decisionMakingTeille();
  }
  
  //if you volunteer Rolan
  
  else if ((panelTracker == 22) && (tameAnimal == false) && (killBoar == false) && (volunteerRolan == true)) {
    text(teille1[121], 50, 540);
    text(teille1[122], 50, 570);
    text(teille1[123], 50, 600);
    text(teille1[124], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 23) && (tameAnimal == false) && (killBoar == false) && (volunteerRolan == true)) {
    text(teille1[126], 50, 540);
    text(teille1[127], 50, 570);
    text(teille1[128], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 24) && (tameAnimal == false) && (killBoar == false) && (volunteerRolan == true)) {
    text(teille1[130], 50, 540);
    text(teille1[131], 50, 570);
    text(teille1[132], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 25) && (tameAnimal == false) && (killBoar == false) && (volunteerRolan == true)) {
    text(teille1[134], 50, 540);
    text(teille1[135], 50, 570);
    text(teille1[136], 50, 600);
    text(teille1[137], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 26) && (tameAnimal == false) && (killBoar == false) && (volunteerRolan == true)) {
    text(teille1[139], 50, 540);
    prevNext();
  }
  
  else if ((panelTracker == 27) && (tameAnimal == false) && (killBoar == false) && (volunteerRolan == true)) {
      completedTeille = true;
      allyTeille = true;
      totalAllies = totalAllies + 1;
      selectStoryArc = true;
      arcSelection();
  }
  
  //if you let Rolan decide
  
  else if ((panelTracker == 22) && (tameAnimal == false) && (killBoar == false) && (volunteerRolan == false)) {
    text(teille1[141], 50, 540);
    text(teille1[142], 50, 570);
    text(teille1[143], 50, 600);
    text(teille1[144], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 23) && (tameAnimal == false) && (killBoar == false) && (volunteerRolan == false)) {
    text(teille1[146], 50, 540);
    text(teille1[147], 50, 570);
    prevNext();
  }
  
  else if ((panelTracker == 24) && (tameAnimal == false) && (killBoar == false) && (volunteerRolan == false)) {
    text(teille1[149], 50, 540);
    text(teille1[150], 50, 570);
    text(teille1[151], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 25) && (tameAnimal == false) && (killBoar == false) && (volunteerRolan == false)) {
      completedTeille = true;
      allyTeille = false;
      selectStoryArc = true;
      arcSelection();
  }
  
  //whoops you derped and killed the boar
  
  else if ((panelTracker == 19) && (tameAnimal == false) && (killBoar == true)) {
    text(teille1[102], 50, 540);
    text(teille1[103], 50, 570);
    text(teille1[104], 50, 600);
    text(teille1[105], 50, 630);
    prevNext();
  }
  
  else if ((panelTracker == 20) && (tameAnimal == false) && (killBoar == true)) {
    text(teille1[107], 50, 540);
    prevNext();
  }
  
  else if ((panelTracker == 21) && (tameAnimal == false) && (killBoar == true)) {
    text(teille1[109], 50, 540);
    text(teille1[110], 50, 570);
    text(teille1[111], 50, 600);
    prevNext();
  }
  
  else if ((panelTracker == 22) && (tameAnimal == false) && (killBoar == true)) {
      completedTeille = true;
      allyTeille = false;
      selectStoryArc = true;
      arcSelection();
  }
}
void decisionMakingTeille() {
  if (mousePressed && ((mouseX > decAMouseX1) && (mouseX < decAMouseX2)) && ((mouseY > decAMouseY1) && (mouseY < decAMouseY2))) {
    if (panelTracker == 4) {
      setUpCamp = true;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if ((panelTracker == 7) && (setUpCamp == false)) {
      killBoar = false;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if ((panelTracker == 6) && (setUpCamp == true)) {
      createDistraction = false;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if ((panelTracker == 15) && (setUpCamp == true) && (createDistraction == false)) {
      tameAnimal2 = true;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if ((panelTracker == 18) && ((setUpCamp == false) || (createDistraction == true))) {
      tameAnimal = true;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if ((panelTracker == 21) && (tameAnimal == false) && ((setUpCamp == false) || (createDistraction == true)) && (killBoar == false)) {
      volunteerRolan = true;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    
    prevButton = false;
  }
  
  else if (mousePressed && ((mouseX > decBMouseX1) && (mouseX < decBMouseX2)) && ((mouseY > decBMouseY1) && (mouseY < decBMouseY2))) {
    if (panelTracker == 4) {
      setUpCamp = false;
      panelTracker = panelTracker +1;
      nextButton = true;
    }
    
    if ((panelTracker == 6) && (setUpCamp == true)) {
      createDistraction = true;
      panelTracker = 12;
      nextButton = true;
    }
    
    if ((panelTracker == 7) && (setUpCamp == false)) {
      killBoar = true;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if ((panelTracker == 15) && (setUpCamp == true) && (createDistraction == false)) {
      tameAnimal2 = false;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if ((panelTracker == 18) && ((setUpCamp == false) || (createDistraction == true))) {
      tameAnimal = false;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    
    if ((panelTracker == 21) && (tameAnimal == false) && ((setUpCamp == false) || (createDistraction == true)) && (killBoar == false)) {
      volunteerRolan = false;
      panelTracker = panelTracker + 1;
      nextButton = true;
    }
    prevButton = false;
  }
}


