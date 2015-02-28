
int page = 1;

PFont font;

PImage page1;
PImage page2;
PImage page3;
PImage page4;
PImage page5;
PImage page6;
PImage page7;
PImage page8;
PImage page9;
PImage page10;
PImage page11;
PImage page12;
PImage page13;
PImage page14;
PImage page15;
PImage page16;

void setup() {
  size(640, 480); 
  smooth();
  
  font = loadFont("Baskerville-22.vlw");
  textFont(font);
  
  page1 = loadImage("card1.png");
  page2 = loadImage("card2.png");
  page3 = loadImage("card3.png");
  page4 = loadImage("card4.png");
  page5 = loadImage("card5.png");
  page6 = loadImage("card6.png");
  page7 = loadImage("card7.png");
  page8 = loadImage("card8.png");
  page9 = loadImage("card9.png");
  page10 = loadImage("card10.png");
  page11 = loadImage("card11.png");
  page12 = loadImage("card12.png");
  page13 = loadImage("card13.png");
  page14 = loadImage("card14.png");
  page15 = loadImage("card15.png");
  page16 = loadImage("card16.png");
}

void draw() {
  if (page == 1) 
  {
    pageOne();
  } 
  else if (page == 2) 
  {
    pageTwo(); 
  } 
  else if (page == 3) 
  {
    pageThree(); 
  } 
  else if (page == 4) 
  {
    pageFour(); 
  }
  else if (page == 5) 
  {
    pageFive(); 
  } 
  else if (page == 6) 
  {
    pageSix(); 
  } 
  else if (page == 7) 
  {
    pageSeven(); 
  } 
  else if (page == 8) 
  {
    pageEight();
  }
  else if (page == 9) 
  {
    pageNine(); 
  } 
  else if (page == 10) 
  {
    pageTen(); 
  } 
  else if (page == 11) 
  {
    pageEleven(); 
  } 
  else if (page == 12) 
  {
    pageTwelve(); 
  } 
  else if (page == 13) 
  {
    pageThirteen(); 
  } 
  else if (page == 14) 
  {
    pageFourteen(); 
  } 
  else if (page == 15) 
  {
    pageFifteen(); 
  } 
  else if (page == 16) 
  {
    pageSixteen(); 
  } 
}

void keyPressed() {
  if (page == 1)
  {
    if (key == 'y' || key == 'Y')
    {
      page = 9;
    }
    else if (key == 'n' || key == 'N')
    {
      page = 2;
    }      
  }
  else if (page == 2) 
  {
    if (key == 'y' || key == 'Y')
    {
      page = 3;
    }
    else if (key == 'n' || key == 'N')
    {
      page = 4;
    }      
  } 
  else if (page == 3)
  {
    if (key == 'y' || key == 'Y')
    {
      page = 5;
    }
    else if (key == 'n' || key == 'N')
    {
      page = 4;
    }       
  }
  else if (page == 4)
  {
    if (key == 'a' || key == 'A')
    {
      page = 1;
    }
  }
  else if (page == 5)
  {
    if (key == 'c' || key == 'C')
    {
      page = 6;
    }
  }
  else if (page == 6)
  {
    if (key == 'd' || key == 'D')
    {
      page = 4;
    }
    else if (key == 'r' || key == 'R')
    {
      page = 8;
    }
    else if (key == 's' || key == 'S')
    {
      page = 7;
    }
  }
  else if (page == 7)
  {
    if (key == 'c' || key == 'C')
    {
      page = 12;
    }
  }
  else if (page == 8)
  {
   if (key == 'a' || key == 'A')
   {
     page = 1;
   }
  }
  else if (page == 9)
  {
    if (key == 'y' || key == 'Y')
    {
       page = 11;
    }
    else if (key == 'n' || key == 'N')
    {
       page = 10;
    }       
  }
  else if (page == 10)
  {
      if (key == 'a' || key == 'A')
      {
        page = 1;
      }
  }
  else if (page == 11)
  {
    if (key == 'c' || key == 'C')
    {
      page = 12;
    }
  }
  else if (page == 12)
  {
    if (key == 'y' || key == 'Y')
    {
      page = 14;
    }
    else if (key == 'n' || key == 'N')
    {
      page = 13;
    }      
  }
  else if (page == 13)
  {
    if (key == 'a' || key == 'A')
    {
      page = 1;
    }
  }
  else if (page == 14)
  {
   if (key == 'y' || key == 'Y')
    {
      page = 13;
    }
    else if (key == 'n' || key == 'N')
    {
      page = 15;
    }       
  }
  else if (page == 15)
  {
    if (key == 'r' || key == 'R')
    {
       page = 1;
    }
    else if (key == 'h' || key == 'H')
    {
       page = 16;
    }
  }
  else if (page == 16)
  {
    if (key == 'a' || key == 'A')
    {
      page = 1;
    }
  }
}


void pageOne() {
    image(page1, 0, 0);
    fill(0);
    textLeading(20);
    text("After having just fallen down a very deep hole and wandering down a very long tunnel, you find a bottle labeled 'DRINK ME.' This seems the thing to do, but you remember your lessons.", 25, 100, 315, 220);
    text("Do you check for poison first?", 25, 310, 310, 40); 
    text("(Y/N)", 25, 350);
}

void pageTwo() {
    image(page2, 0, 0);
    fill(0);
    textLeading(20);
    text("You know better than to drink something without checking for poison first! As a result of disobeying your lessons and consuming the potion, you metamorphose into the White Rabbit.", 25, 100, 315, 220);
    text("Do you embrace your new form?", 25, 310, 310, 400); 
    text("(Y/N)", 25, 350);
}

void pageThree() {
    image(page3, 0, 0);
    fill(0);
    textLeading(20);
    text("Embracing your newly fuzzy and elongated ears, you decide to check your pocket watch. Oh no! You're late, you're late, for a very important date!", 25, 100, 315, 220);
    text("Does you choose to attend?", 25, 310, 310, 40); 
    text("(Y/N)", 25, 350);
}

void pageFour() {
    image(page4, 0, 0);
    fill(0);
    textLeading(20);
    text("Lucky you!", 25, 100);
    fill(255);
    text("A giant hand drops down from the sky and ends your miserable life for you.", 25, 120, 315, 220);
    text("Play AGAIN?", 25, 310, 310, 40); 
    text("(A)", 25, 350);
}

void pageFive() {
    image(page5, 0, 0);
    fill(0);
    textLeading(20);
    text("Fancying to keep your date, you venture across a garden with many soldiers dressed as cards. They seem an odd bunch, painting all the white roses red.", 25, 100, 315, 220);
    text("You CONTINUE walking into the garden.", 25, 310, 310, 70); 
    text("(C)", 25, 370);
}

void pageSix() {
    image(page6, 0, 0);
    fill(0);
    textLeading(20);
    text("You see the Queen of Hearts screaming at a young girl, who seems fairly innocent. In fact, you have the odd feeling you see a bit of yourself in her. You think to DEFEND her, but the Queen also scares you into wanting to RUN. However, you also think it is time to START the croquet match.", 25, 100, 305, 220);
    text("What do you do?", 25, 310, 310, 40); 
    text("(D/R/S)", 25, 350);
}

void pageSeven() {
    image(page7, 0, 0);
    fill(0);
    textLeading(20);
    text("The Queen seems quite pacified at the suggestion of a game with the girl, Alice, and the Dutchess. With a quick glance at your pocket watch, you proclaim the game begun.", 25, 100, 315, 220);
    text("You CONTINUE to watch Alice's game, and feel almost as if you're seeing it through her eyes.", 25, 310, 310, 70); 
    text("(C)", 25, 390);
}

void pageEight() {
    image(page8, 0, 0);
    fill(0);
    textLeading(20);
    text("As you flee from the Queen's garden, you find yourself heading in the direction of the Mad Hatter, the March Hare, and the Dormouse. Believing the events of the day have left you quite batty anyhow, you decide to attend their tea party to relax.", 25, 100, 305, 220);
    text("Play AGAIN?", 25, 310, 310, 40); 
    text("(A)", 25, 350);
}

void pageNine() {
    image(page9, 0, 0);
    fill(0);
    textLeading(20);
    text("Good girl, remembering your lessons. Finding that it is poison, you do not drink it. You do, however, see a White Rabbit run past.", 25, 100, 305, 220);
    text("Do you follow it?", 25, 310, 310, 40); 
    text("(Y/N)", 25, 350);
}

void pageTen() {
    image(page10, 0, 0);
    fill(0);
    textLeading(20);
    text("You fool!", 25, 100);
    fill(255);
    text("You become so lost and confused that you begin to weep, ultimately drowning in a sea of your own miserable tears.", 25, 120, 315, 220);
    text("Play AGAIN?", 25, 310, 310, 40); 
    text("(A)", 25, 350);
}

void pageEleven() {
    image(page11, 0, 0);
    fill(0);
    textLeading(20);
    text("You encounter a great many Adventures in Wonderland while chasing the Rabbit, but you eventually lose not only him, but your way, too! Luckily, the Cheshire Cat points you towards the Queen's garden.", 25, 100, 315, 220);
    text("You CONTINUE onward.", 25, 310, 310, 70); 
    text("(C)", 25, 350);
}

void pageTwelve() {
    image(page12, 0, 0);
    fill(0);
    textLeading(20);
    text("For entering the garden and interrupting the execution of the Dutchess, the Queen of Hearts threatens 'OFF WITH YOUR HEAD!' if you do not humor her request to partake in a game of croquet.", 25, 100, 305, 220);
    text("Do you play?", 25, 310, 310, 40); 
    text("(Y/N)", 25, 350);
}

void pageThirteen() {
    image(page13, 0, 0);
    fill(0);
    textLeading(20);
    text("How delightful!", 25, 100);
    fill(255);
    text("For insulting their Queen, the card soldiers attack. You receive numerous nasty paper-cuts, and finally a gruesome paper-cut beheadding.", 25, 120, 315, 220);
    text("Play AGAIN?", 25, 310, 310, 40); 
    text("(A)", 25, 350);
}

void pageFourteen() {
    image(page14, 0, 0);
    fill(0);
    text("Having engaged in Wonderland croquet, you quickly discover that it is quite difficult and played with flamingoes and hedgehogs!", 25, 100, 295, 220);
    text("Are you any good at it?", 25, 310, 310, 40); 
    text("(Y/N)", 25, 350);
}

void pageFifteen() {
    image(page15, 0, 0);
    fill(0);
    textLeading(20);
    text("For loosing and having wasted the Queen's valuable time, she still wants you beheadded, but the Cheshire Cat appears long enough to cause a large commotion and you manage to escape the garden. But where did that rabbit go to?", 25, 100, 315, 220);
    text("Do you chase the RABBIT or return HOME?", 25, 310, 310, 70); 
    text("(R/H)", 25, 370);
}

void pageSixteen() {
    image(page16, 0, 0);
    fill(0);
    textLeading(20);
    text("You find your way home and depart from Wonderland. A strange place it was, indeed.", 25, 120, 315, 220);
    text("Play AGAIN?", 25, 310, 310, 40); 
    text("(A)", 25, 350);
}


