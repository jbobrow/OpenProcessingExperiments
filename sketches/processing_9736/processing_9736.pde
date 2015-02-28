
int card = 0;
PFont font;
PImage h;
PImage EatHerUp;
PImage Sleep;
PImage Next;
PImage NoHeIsFull;
PImage TalkToHer;
PImage YouAreMyHero;
PImage YesIDo;
PImage Yes;
PImage Damn;
PImage Option;
PImage Friend;
PImage No;
PImage Vegetarian;
PImage Carnivore;
PImage heart;


void setup() {
  size (640, 480);
  smooth ();
  font = loadFont ("C20.vlw");
  textFont(font);
    h = loadImage ("h.png");
    EatHerUp = loadImage ("EatHerUp.png");
    Sleep = loadImage ("Sleep.png");
    Next = loadImage ("Next.png");
    NoHeIsFull = loadImage ("NoHeIsFull.png");
    TalkToHer = loadImage ("TalkToHer.png");
    YouAreMyHero = loadImage ("YouAreMyHero.png");
    YesIDo = loadImage ("YesIDo.png");
    Yes = loadImage ("Yes.png");
    Damn = loadImage ("Damn.png");
    Option = loadImage ("Option.png");
    Friend = loadImage ("Friend.png");
    No = loadImage ("No.png");
    Vegetarian = loadImage ("Vegetarian.png");
    Carnivore = loadImage ("Carnivore.png");
    heart = loadImage("heart.png");
}

void draw (){
  background(255);


  if (card == 0){
    background(0);

    fill(255);
    text("Welcome To The New Version of", 150,200);
    fill (255,0,0);


    int left = 200;  
    int right = 450;
    int top =220;
    int bottom =300;

    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
        card = 1;
      } else {
        fill(0,255,0);
      }
    }

    text("Little Red Riding-Hood", 200, 250);
  } // end card




  // start card 1 -------------------------------------------------
  else if (card == 1) {
    background(0);
    
image(h,0,0);

    fill(255,255,0);
    text("Beginning:", 235,25);
    /*
    fill (255,0,0);
    text("Eat her up",65,185);
    text ("No, he is full",380, 185);
    */
    
  
   int EHU_left = 65;
    int EHU_right = 150;
    int EHU_top = 170;
    int EHU_bottom =180;
    
   
        int nhif_left = 380;
        int nhif_right = 480;
        int nhif_top = 170;
        int nhif_bottom = 184;
        
         if (mouseX > EHU_left && mouseX < EHU_right && mouseY > EHU_top && mouseY < EHU_bottom) {
      if (mousePressed) {
        card = 2;
        } else{
        fill(0,255,0);
        }
    }
            text("Eat her up",65,185);
        
        fill(255,255,0);
            
        if (mouseX > nhif_left && mouseX < nhif_right && mouseY > nhif_top && mouseY < nhif_bottom) {
      if (mousePressed) {
        card = 5;
        } else{
        fill(0,255,0);       
     }
        }
        text("No, he is full",380, 185);   


      
  } // end card
    
  // start card 2 -------------------------------------------------
  else if (card == 2) {
    background(0);
    
image(EatHerUp,0,0);

   fill (255,255,0);
   text("Sleep",45,270);
    text("Talk to her", 180, 270);
    
   int S_left = 45;
    int S_right = 90;
    int S_top = 250;
    int S_bottom =270;
    
    if (mouseX > S_left && mouseX < S_right && mouseY > S_top && mouseY < S_bottom) {
      if (mousePressed) {
        card = 3;
        
      } else{
        fill(0,255,0);
        text("Sleep",45,270);
     }
    }

    fill (255,255,0);
    
    int T_left = 180;
    int T_right = 270;
    int T_top = 260;
    int T_bottom =270;
    
    if (mouseX > T_left && mouseX < T_right && mouseY > T_top && mouseY < T_bottom) {
      if (mousePressed) {
        card = 6;
        
      } else{
        fill(0,255,0);
        text("Talk to her",180,270);
     }
    }

      
  } // end card
  
  // start card 3 -------------------------------------------------
  else if (card == 3) {
    background(0);
    
image(Sleep,0,0);

   fill(255,255,0);
   text("Next",30,290);
   
    int N_left = 30;
    int N_right = 70;
    int N_top = 270;
    int N_bottom = 290;
    
    if (mouseX > N_left && mouseX < N_right && mouseY > N_top && mouseY < N_bottom) {
      if (mousePressed) {
        card = 4;
        
      }else{
        
        fill(0,255,0);
        text("Next",30,290);
     }
    }

      
  } // end card
  
   // start card 4 -------------------------------------------------
  else if (card == 4) {
    background(0);
    
image(Next,0,0);

   fill(255,255,0);
   text("End / Play Again?",10,450);
   
    int End_left = 10;
    int End_right = 150;
    int End_top = 430;
    int End_bottom = 450;
    
    if (mouseX > End_left && mouseX < End_right && mouseY > End_top && mouseY < End_bottom) {
      if (mousePressed) {
        card = 1;
        
      }else{
        
        fill(0,255,0);
        text("End / Play Again?",10,450);
     }
    }

      
  } // end card
  
  // start card 5 -------------------------------------------------
  else if (card == 5) {
    background(0);
    
image(NoHeIsFull,0,0);

   fill(255,255,0);
   text("Talk to her",460, 75);
   
    int End_left = 460;
    int End_right = 550;
    int End_top = 60;
    int End_bottom = 80;
    
    if (mouseX > End_left && mouseX < End_right && mouseY > End_top && mouseY < End_bottom) {
      if (mousePressed) {
        card = 6;
        
      }else{
        
        fill(0,255,0);
        text("Talk to her",460,75);
     }
    }

      
  } // end card
 
 // start card 6 -------------------------------------------------
  else if (card == 6) {
    background(0);
    
    
image(TalkToHer,0,0);

   fill(255,255,0);
   text("Oh! You are my hero.",35,300);
   text("Damn it! You ruined my plan!",35,330);
   
    int End_left = 40;
    int End_right = 210;
    int End_top = 280;
    int End_bottom = 300;
    
    if (mouseX > End_left && mouseX < End_right && mouseY > End_top && mouseY < End_bottom) {
      if (mousePressed) {
        card = 7;
        
      }else{
        
        fill(0,255,0);
        text("Oh! You are my hero.",35,300);
     }
    }
fill (255,255,0);
    
    int T_left = 30;
    int T_right = 280;
    int T_top = 320;
    int T_bottom =330;
    
    if (mouseX > T_left && mouseX < T_right && mouseY > T_top && mouseY < T_bottom) {
      if (mousePressed) {
        card = 10;
        
      } else{
        fill(0,255,0);
        text("Damn it! You ruined my plan!",35,330);
     }
    }


  } // end card
 
 // start card 7 -------------------------------------------------
  else if (card == 7) {
    background(0);
    
image(YouAreMyHero,0,0);

   fill(255,255,0);
   text("Yes, I do.",30,250);
   text("No, let us be friend.",30,280);
   
    int End_left = 30;
    int End_right = 100;
    int End_top = 235;
    int End_bottom = 250;
    
    if (mouseX > End_left && mouseX < End_right && mouseY > End_top && mouseY < End_bottom) {
      if (mousePressed) {
        card = 8;
        
      }else{
        
        fill(0,255,0);
        text("Yes, I do.",30,250);
     }
    }
fill (255,255,0);
    
    int T_left = 30;
    int T_right = 190;
    int T_top = 270;
    int T_bottom =280;
    
    if (mouseX > T_left && mouseX < T_right && mouseY > T_top && mouseY < T_bottom) {
      if (mousePressed) {
        card = 12;
        
      } else{
        fill(0,255,0);
        text("No, let us be friend.",30,280);
     }
    }


  } // end card
  
 // start card 8 -------------------------------------------------
  else if (card == 8) {
    background(0);
    
image(YesIDo,0,0);

   fill(255,255,0);
   text("Yes.",380,210);
   text("No.",550,210);
  
    int End_left = 380;
    int End_right = 410;
    int End_top = 200;
    int End_bottom = 210;
    
    if (mouseX > End_left && mouseX < End_right && mouseY > End_top && mouseY < End_bottom) {
      if (mousePressed) {
        card = 9;
        
      }else{
        
        fill(0,255,0);
        text("Yes.",380,210);
     }
    }
fill (255,255,0);
    
    int T_left = 550;
    int T_right = 570;
    int T_top = 195;
    int T_bottom =210;
    
    if (mouseX > T_left && mouseX < T_right && mouseY > T_top && mouseY < T_bottom) {
      if (mousePressed) {
        card = 14;
        
      } else{
        fill(0,255,0);
        text("No.",550,210);
     }
    }


  } // end card
  
  // start card 9 -------------------------------------------------
  else if (card == 9) {
    background(0);
    
image(Yes,0,0);

   fill(255,255,0);
   text("Back",390,400);
   
   
    int End_left = 390;
    int End_right = 430;
    int End_top = 380;
    int End_bottom = 400;
    
    if (mouseX > End_left && mouseX < End_right && mouseY > End_top && mouseY < End_bottom) {
      if (mousePressed) {
        card = 8;
        
      }else{
        
        fill(0,255,0);
        text("Back",390,400);
     }
    }



  } // end card
  
  
  // start card 10 -------------------------------------------------
  else if (card == 10) {
    background(0);
    
image(Damn,0,0);

   fill(255,255,0);
   text("Marry him",35,360);
   text("Another option",170,360);
  
    int End_left = 35;
    int End_right = 120;
    int End_top = 350;
    int End_bottom = 360;
    
    if (mouseX > End_left && mouseX < End_right && mouseY > End_top && mouseY < End_bottom) {
      if (mousePressed) {
        card = 8;
        
      }else{
        
        fill(0,255,0);
        text("Marry him",35,360);
     }
    }
fill (255,255,0);
    
    int T_left = 170;
    int T_right = 300;
    int T_top = 350;
    int T_bottom =360;
    
    if (mouseX > T_left && mouseX < T_right && mouseY > T_top && mouseY < T_bottom) {
      if (mousePressed) {
        card = 11;
        
      } else{
        fill(0,255,0);
        text("Another option",170,360);
     }
    }


  } // end card
  
  // start card 11 -------------------------------------------------
  else if (card == 11) {
    background(0);
    
image(Option,0,0);

   fill(255,255,0);
   text("End / Play Again?",10,450);
   
 int End_left = 10;
    int End_right = 150;
    int End_top = 430;
    int End_bottom = 450;
    
    if (mouseX > End_left && mouseX < End_right && mouseY > End_top && mouseY < End_bottom) {
      if (mousePressed) {
        card = 1;
        
      }else{
        
        fill(0,255,0);
        text("End / Play Again?",10,450);
     }
    }
    
    
  } // end card
  
  // start card 12 -------------------------------------------------
  else if (card == 12) {
    background(0);
    
image(Friend,0,0);

   fill(255,255,0);
   text("End / Play Again?",10,450);
   
 int End_left = 10;
    int End_right = 150;
    int End_top = 430;
    int End_bottom = 450;
    
    if (mouseX > End_left && mouseX < End_right && mouseY > End_top && mouseY < End_bottom) {
      if (mousePressed) {
        card = 1;
        
      }else{
        
        fill(0,255,0);
        text("End / Play Again?",10,450);
     }
    }
    
    
  } // end card
  
  // start card 14 -------------------------------------------------
  else if (card == 14) {
    background(0);
    
image(No,0,0);

   fill(255,255,0);
   text("Vegetarian",15,350);
   text("Carnivore",170,350);
    
    int End_left = 10;
    int End_right = 100;
    int End_top = 330;
    int End_bottom = 350;
    
    if (mouseX > End_left && mouseX < End_right && mouseY > End_top && mouseY < End_bottom) {
      if (mousePressed) {
        card = 15;
        
      }else{
        
        fill(0,255,0);
        text("Vegetarian",15,350);
     }
    }
fill (255,255,0);
    
    int T_left = 170;
    int T_right = 250;
    int T_top = 340;
    int T_bottom =350;
    
    if (mouseX > T_left && mouseX < T_right && mouseY > T_top && mouseY < T_bottom) {
      if (mousePressed) {
        card = 16;
        
      } else{
        fill(0,255,0);
        text("Carnivore",170,350);
     }
    }
 
  
  } //end card

// start card 15 -------------------------------------------------
  else if (card == 15) {
    background(0);
    
image(Vegetarian,0,0);

   fill(255,255,0);
   text("End / Play Again?",10,450);
   
 int End_left = 10;
    int End_right = 150;
    int End_top = 430;
    int End_bottom = 450;
    
    if (mouseX > End_left && mouseX < End_right && mouseY > End_top && mouseY < End_bottom) {
      if (mousePressed) {
        card = 1;
        
      }else{
        
        fill(0,255,0);
        text("End / Play Again?",10,450);
     }
    }
    
    
  } // end card

// start card 16 -------------------------------------------------
  else if (card == 16) {
    background(0);
    
image(Carnivore,0,0);

   fill(255,255,0);
   text("End / Play Again?",10,450);
   
 int End_left = 10;
    int End_right = 150;
    int End_top = 430;
    int End_bottom = 450;
    
    if (mouseX > End_left && mouseX < End_right && mouseY > End_top && mouseY < End_bottom) {
      if (mousePressed) {
        card = 1;
        
      }else{
        
        fill(0,255,0);
        text("End / Play Again?",10,450);
     }
    }
    
    
  } // end card

}


void mousePressed() {
  println(mouseX + ","+mouseY);
}

