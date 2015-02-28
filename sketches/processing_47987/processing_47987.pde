
//Text Adventure
//Sergi Calavia
int page = 1;  
import ddf.minim.*;  

Minim minim;  
AudioPlayer music; 


PFont font;  
PFont font2;  

void setup(){
size(800,700);
 minim = new Minim(this);  
  music = minim.loadFile("rainforestambience.wav", 1024);  
  music.loop();  

}

void draw(){


if (page == 1) {  
    pageOne();
 }else if (page == 0) {
     pageZero();
 }else if (page == 2) {  
    pageTwo();  
 }else if (page == 3) { 
    pageThree();  
 }else if (page == 4) {  
    pageFour();  
 }else if (page == 5) {  
    pageFive();  
 }else if (page == 6) {  
    pageSix();  
 }else if (page == 7) {  
    pageSeven();  
 }else if (page == 8) {  
    pageEight();  
 }else if (page == 9) {  
    pageNine();  
 }else if (page ==10) {
    pageTen();
 }else if (page ==11) {
    pageEleven();
 }else if (page ==12) {
    pageTwelve();
 }else if (page ==13) {
    pageThirteen();
 }else if (page ==14) {
    pageFourteen();
 }else if (page ==15) {
    pageFifteen();
 }else if (page ==16) {
    pageSixteen();
 }else if (page ==17) {
    pageSeventeen();
 }else if (page ==18) {
    pageEighteen();
 }else if (page ==19) {
    pageNineteen();
 }else if (page ==20) {
    pageTwenty();
 }else if (page ==21) {
    pageTwentyOne();
 
  background(0);
fill(255);  
  textAlign(CENTER);  
  text("The End", 320,25);

}

}

void mousePressed() {  
  if (page == 1) {  
    if (overButton(125, 410, 75, 35) == true) {  
      page = 2;}   
    else if (overButton(125, 410, 75, 35) == true) {  
      page = 3;}  
    else if (overButton(400,410,75,35) == true) {
      page = 0;}
  } else if (page == 2) {  
    if (overButton(125, 410, 75, 35) == true) {  
      page = 3;} 
    else if (overButton(400,410,75,35) == true) {  
      page = 4;}  
  } else if (page == 3) {  
    if (overButton(125, 410, 75, 35) == true) {  
      page = 4;}  
    else if (overButton(400,410,75,35) == true) {  
      page = 7;}  
  } else if (page == 9) {  
    if (overButton(265,410,75,35) == true) {  
      page = 8;} 
   } else if (page == 4) {  
    if (overButton(125,410,75,35) == true) {  
      page = 5;}  
    if (overButton(400,410,75,35) == true) {
       page = 8;}
   }else if (page == 7) {
     if (overButton(400,410,75,35) == true) {
      page = 6;}
     if (overButton(125,410,75,35) == true) {
      page = 9;}
   }else if (page ==8) {
     if (overButton(125,410,75,35) == true) {
     page = 11;}
   }else if (page ==6) {
     if (overButton(125,410,75,35) ==true) {
     page = 12;}
   }else if (page ==11) {
     if (overButton(125,410,75,35) == true) {
     page = 10;}
     if (overButton(400,410,75,35) == true) {
     page = 14;}
   }else if (page ==14) {
     if (overButton(125,410,75,35) == true) {
     page = 15;}
     if (overButton(400,410,75,35) == true) {
     page = 16;}
   }else if (page ==16) {
     if (overButton(125,410,75,35) == true) {
     page = 17;}
     if(overButton(400,410,75,35) == true) {
     page = 18;}
   }else if (page ==19) {
    if(overButton(125,410,75,35) == true) {
    page = 21;}
    if(overButton(400,410,75,35) == true) {
    
    }
   }
   }
boolean overButton(int x, int y, int w, int h) {  
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {  
    return true;   

  }   

  else {  
    return false;   

  }  

}  
   

void pageOne() {  
  background(0);  
  fill(255);  
  textAlign(CENTER);  

  text("You’re in a forest. You stand in a clearing, with a dense canopy of trees above",320,25);
  text("and to either side of you. The ground is damp and covered with ochre-tinted leaves.",320,40);  



  if (overButton(125, 410, 75, 35) == true) {  



  } 
  
  fill(0);    
  fill(255);  
  text("Go forward", 125 + 75/2, 410+20);  


  if (overButton(400,410,75,35) == true) {  
  }  

  
  fill(0);  
  rect(400,410,74,35);  
  fill(255);  
  text("Go backwards", 400 + 75/2, 410+20);  

  
}  
   
void pageZero() {  
  background(0);  
  fill(255);  
  textAlign(CENTER);  
  text("You inadvertently walk backwards into a pit covered", 320,25);
  text("with leaves and plummet into nothingness.", 320,40); 
   
  if (overButton(125, 410, 75, 35) == true) {  
  }
    
  fill(0);  
  rect(400,410,74,35);  
  fill(255);  
  text("Restart", 400 + 75/2, 410+20);  
  

}
  
void pageTwo() {  
  background(0);  
  fill(255);  
  textAlign(CENTER);  
  text("You part the bushes and arrive at another clearing", 320,25);
  text("There is a bearded gnome sitting cross-legged against an elm.", 320,40); 
  text("He doesn’t look like he wants to be bothered...",320,55);  


  if (overButton(125, 410, 75, 35) == true) {  



  }  

  
  fill(0);  
  rect(125, 410, 75, 35);  
  fill(255);  
  text("Wake him", 125 + 75/2, 410+30);    

  if (overButton(400,410,75,35) == true) {  

  }  

   

  fill(0);  

  rect(400,410,75,35);  

  fill(255);  

  text("Go forward", 400 + 75, 410+30);  

     

}  

  
void pageThree() {  
  background(0);  
  fill(255);  
  textAlign(CENTER);  
  text("The gnome is startled by your hand on his shoulder and",320,25);
  text("blinks up at you, silent and dumbdounded. He brings a finger to",320,45);
  text("his lips, admonishing you to stay silent. ",320,65);

    //go left
  if (overButton(125, 410, 75, 35) == true) {  
  } 

  fill(0);  
  rect(125, 410, 75, 35);  
  fill(255);  
  text("Go Left", 125 + 75/2, 410+40);  
  text("Go Right", 400 + 75/2, 410 + 40);  

     //go right
  if (overButton(400,410,75,35) == true) {  


  }  


}  

void pageFour() {  
  background(0);  
  fill(255);  
  textAlign(CENTER);  
  text("You encounter an oversized platypus trapped in a cast-iron cage.",320,25);  
  text("Outside the cage appears to be a pale-skinned elf, taunting the beast.",320,45);  
  text("The elf glances at you in acknowledgement, lowering his weapon.",320,65);
    
  if (overButton(125, 410, 75, 35) == true) {  

  }  
  fill(0);  
  
  fill(255);  
  text("Continue walking", 125 + 75/2, 410+40); 
  text("Approach the cage", 400 + 75/2, 410 + 40);

if (overButton(400,410,75,35) == true) {  
}  
}

void pageFive() {  
  background(0);  
  fill(255);  
  textAlign(CENTER);  
  text("You walk past the elf, ignoring his probing stare.",320,25);  
  text("A few paces later and you fall to your knees, an arrow",320,45);  
  text("protruding from your chest.",320,65);
    
  if (overButton(265,410,75,35) == true) {  

  }  

  fill(0);  
  rect(265,410,75,35);  
  fill(255);  
  text("Restart", 410 + 75/2, 410+30);  

     

}  


void pageSix() {  
  background(0);  
  fill(255);  
  textAlign(CENTER);  
  text("Your palms prickle upon meeting the damp soil. You wiggle into the small",320,25);  
  text("space with little difficulty. You begin to crawl, your shoulders dislodging",320,45);  
  text("some loose dirt as you make your way deeper. Ahead of you is obsolete darkness",320,65);
  if (overButton(400,410,75,35) == true) {  

  }  

  fill(0);  
  rect(125, 410, 75, 35);  
  fill(255);  
  text("Squeeze on your way out backwards", 125 + 75/2, 410+30);  

  if (overButton(125, 410, 75, 35) == true) {  

  }  

  fill(0);   

  fill(255);  

  text("Keep going", 400 + 75, 410+30);  

     

}  

   
   

void pageSeven() {  
  
  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("You part some more brush and arrive at a hill.",320,25);  
  text("There is an adobe windmill encircled by stones.",320,45);
  text("A wormhole is visible at its base.",320,65);  
  

  if (overButton(265,410,75,35) == true) {  

  }  

  fill(0);  

  rect(265,410,75,35);  

  fill(255);  

  text("Continue past the windmill", 125 + 75/2, 410+40);  
  text("Crawl in the wormhole", 400 + 75/2, 410 + 40); 
     

}  
   

void pageEight() {  

  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("You come closer, feeling the eyes of the elf on you.",320,25);  
  text("The creature in the cage appears frightened, backing",320,45);
  text("itself into a corner. It whimpers and shuffles awkwardly.",320,65); 

  if (overButton(125, 410, 75, 35) == true) {  

  }  

  fill(0);  
  rect(125, 410, 75, 35);  
  fill(255);  
  text("Accost the elf", 125 + 75/2, 410+20);  

  if (overButton(400,410,75,35) == true) {  



  }  

   

  fill(0);  

  rect(400,410,75,35);  

  fill(255);  

  text("Reach in and pet the platypus", 400 + 75/2, 410+30);  

     

}  

 

void pageNine() {  

  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("You continue past the windmill before sensing a shaft arc behind you.",320,25);  
  text("As you turn to examine, an arrow pierces your throat.",320,45);
  text("Your last frame of cognition is the elf from before, stooping",320,65);
  text("over you to retrieve his arrow.",320,85);
 
  if (overButton(400,410,75,35) == true) {  
  }  
  fill(0);  
  rect(125, 410, 75, 35);  
  fill(255);  
  text("Restart", 400 + 75, 410+30);  
  

  }  

 

void pageTen() {  

  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("With a wary conscience, you sidle through the bars of the cage.",320,25);  
  text("The Platypus is eyeing your corner curiously. The elf snaps his fingers and",320,45);
  text("the Platypus is upon you, ravaging you limb by limb.",320,65);

  
   

  fill(0);  
  
  fill(255);  
  text("Restart", 400 + 75/2, 410+30);  
 
  }



void pageEleven() {  

  background(0);  
  fill(255);  
  textAlign(CENTER);  

  text("The elf smirks, raising his drawn bow to your face, inches from your neck.",320,25);  
  text("He then cocks his head silently towards the cage,",320,45);
  text("motioning for you to climb in with the beast.",320,65);
 
 
  if (overButton(400,410,75,35) == true) {  
  
  }  
  
  fill(0);  
  rect(125, 410, 75, 35);  
  fill(255);  
  text("Climb in", 125 + 75/2, 410+20);  
 
  fill(0);  
    
  fill(255);  
  text("Run for it", 400 + 75/2, 410+30);  
  }
  
void pageTwelve() {  

  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("You back out carefully, peeking behind you as you",320,25);  
  text("crawl your way out in reverse. The moment you're out,",320,45);
  text("the elf intercepts your path, nocking an arrow and taking you out instantly.",320,65);
 
 
  if (overButton(125,410,75,35) == true) {  
  
  }  
  
  fill(0);  
  rect(125, 410, 75, 35);  
  fill(255);  
  text("Restart", 125 + 75/2, 410+20);  
 
}


void pageThirteen() {  

  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("You continue to crawl, a pungent, sewer-like stench flooding your nostrils.",320,25);  
  text("The air is dense and humid. It is a little brighter. You arrive at a cross-roads, ",320,45);
  text("the path forking in two before you.",320,65);
 
 
   if (overButton(125, 410, 75, 35) == true) {  


  }  

  
  fill(0);  
  rect(400,410,75,35);  
  fill(255);  
  text("Go Left", 125 + 75/2, 410+30); 
 
   
  fill(0);  
  rect(600,410,75,35);  
  fill(255);  
  text("Go Right", 400 + 75/2, 410+30);  
 

}  
void pageFourteen() {
  
  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("You spin on your heel, knocking aside the weapon. The elf darts to",320,25);
  text("retrieve it, and you head for the brush. He sends an arrow after you, burying itself",320,45); 
  text("on a trunk inches from your head. You sprint quickly, brushing aside everything in your path.",320,65);
  text("The hoarse whines of the platypus ring in the trunks around you. ",320,85);
 
 
   if (overButton(125, 410, 75, 35) == true) {  

  }  

  fill(0);  
  rect(400,410,75,35);  
  fill(255);  
  text("Go Left", 125 + 75/2, 410+30); 
 

  fill(0);  
   
  fill(255);  
  text("Go Right", 400 + 75/2, 410+30);  
 

}

void pageFifteen() {
    background(0);  
  fill(255);  
  textAlign(CENTER); 
  
   text("You sprint for a while longer, evading trees and branches.",320,45); 
  text("You then encounter the gnome again, who is busily setting up for a tea party.",320,65);
  text("You stop to examine, and the elf catches up with you, killing you both.",320,85);
 
 
   if (overButton(125, 410, 75, 35) == true) {  

  }  

  fill(0);  
  rect(400,410,75,35);  
  fill(255);  
  text("Restart", 125 + 75/2, 410+30); 

} 

void pageSixteen() {
  
  background(0);  

  fill(255);  

  textAlign(CENTER);  
 
 text("You veer to the left, racing through the foliage before coming to a halt.",320,25);
  text("You reached the end of the woods, and find yourself at the edge of a sandstone precipice.",320,45); 
  text("The other edge is miles away, and you realize it is a canyon. The bottom, is enshrouded by mist and not visible.",320,65);
  text("You hear the roar of rapids miles below, as well as the crashing of branches as the elf is closing in not too far",320,85);
  text("behind you", 320,105);
 
   if (overButton(125, 410, 75, 35) == true) {  

  }  

  fill(0);  
  rect(400,410,75,35);  
  fill(255);  
  text("Jump", 125 + 75/2, 410+30); 
 

  fill(0);  
   
  fill(255);  
  text("Hide behind a tree", 400 + 75/2, 410+30);  
 

} 

void pageSeventeen() {
  
  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("You dive headfirst into the expanse of mist,",320,25);
  text("the intricacies of the stone being lost in a blur as it rushes past you.",320,45); 
  text("A wall of condensation overtakes you. You are momentarily blinded in free fall",320,65);
  text("before plunging into a body of water.",320,85);
 
 
   if (overButton(125, 410, 75, 35) == true) {  

  }  

  fill(0);  
  rect(400,410,75,35);  
  fill(255);  
  text("Jump", 125 + 75/2, 410+30); 
 

  fill(0);  
   
  fill(255);  
  text("Hide behind a tree", 400 + 75/2, 410+30);  
 

} 
void pageEighteen() {
  
  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("You reel back, throwing yourself up against a tall elm tree",320,25);
  text("You hear a series of branches being sliced through, followed by several seconds of silence.",320,45); 
  text("The silence continues tensely, and you sneak a peek around the trunk,",320,65);
  text("before an arrow meets you square in the head.",320,85);
 
 
   if (overButton(400, 410, 75, 35) == true) {  

  }  


  fill(0);  
   
  fill(255);  
  text("Restart", 400 + 75/2, 410+30);  
 

} 
void pageNineteen() {
  
  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("You submerge, feeling an immediate current tug precariously at your knees",320,25);
  text("You look around for something to grab onto. There is a root growing out of the side of the",320,45); 
  text("canyon, and a sizeable rock protruding nearby.",320,65);
 
 
   if (overButton(125, 410, 75, 35) == true) {  

  }  

  fill(0);  
  rect(400,410,75,35);  
  fill(255);  
  text("Latch onto the rock", 125 + 75/2, 410+30); 
 

  fill(0);  
   
  fill(255);  
  text("Go for the root", 400 + 75/2, 410+30);  
}
void pageTwenty() {
  
  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("Your hands clasp around the root, sturdier than meets the eye, and you heave your upper",320,25);
  text("body onto it, fighting the current by kicking. You take a moment to breathe, watching",320,45); 
  text("the tumultuous tributary wind its way down the canyon.",320,65);
 
 
   if (overButton(125, 410, 75, 35) == true) {  

  }  

  fill(0);  
  rect(400,410,75,35);  
  fill(255);  
  text("To be continued...", 125 + 75/2, 410+30); 
 

}
 
void pageTwentyOne() {
  
  background(0);  

  fill(255);  

  textAlign(CENTER);  

  text("You wrap your arms around the rock, anchoring yourself against the",320,25);
  text("forceful waves. The rock suddenly buckles under your weight,and you",320,45); 
  text("are dragged away by the current.",320,65);
 
 
   if (overButton(400, 410, 75, 35) == true) {  

  }  

  fill(0);  
   
  fill(255);  
  text("Restart", 400 + 75/2, 410+30);  
}
 

 


