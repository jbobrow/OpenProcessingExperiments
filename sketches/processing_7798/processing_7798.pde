
// Project 4 Template
// To understand this code, read Structure 3 (p. 181)
// The RollDice example shows the basic mechanics of 
// working with functions

int page = 1;   // Current page, this is the most important variable in the code
int bg1=179;
int bg2=191;
int bg3 = 232;

int brown1=76;
int brown2=64;
int brown3=23;

PFont font;
PImage button1;
PImage button2;
PImage page1;
PImage page4;
PImage page6;
PImage page7;
PImage page9;
PImage page10;
PImage page11;
PImage page16;
PImage page17;
PImage page20;
PImage page21;
PImage page25;
PImage page26;

int b1x = 20;   // Button 1 x-coordinate
int b1y = 370;  // Button 1 y-coordinate
int b1w = 200;  // Button 1 width
int b1h = 100;   // Button 1 height

int b2x = 420;  // Button 2
int b2y = 370;
int b2w = 200;
int b2h = 100;

// You can define more buttons here following the same pattern

void setup() {
  size(640, 480); 
  smooth();
  font = loadFont("Impact-32.vlw");
  textFont(font);
  page1 = loadImage("Griffin_Sleeping.gif");
  page4=loadImage("Queen_Yelling.gif");
  page6=loadImage("Alice_Creeping.gif");
  page7=loadImage("Griffin_Sitting.gif");
  page9=loadImage("Alice_Angry.gif");
  page10=loadImage("King_Conversing.gif");
  page11=loadImage("Griffin_Dancing.gif");
  button1=loadImage("Leaves1.gif");
  button2=loadImage("Leaves2.gif");
  page16=loadImage("Alice_Sitting.gif");
  page17=loadImage("Turtle_Talking.gif");
  page20=loadImage("Alice_Growing.gif");
  page21=loadImage("Alice_Drowning.gif");
  page25=loadImage("Guard.gif");
  page26=loadImage("King_Reading.gif");
}

void draw() {
  if (page == 1) {
    pageOne();
  } else if (page == 2) {
    pageTwo(); 
  } else if (page == 3) {
    pageThree(); 
  }
  else if(page == 4){
    pageFour();
  }
  else if (page == 5){
    pageFive();
  }
  else if (page == 6){
    pageSix();
  }
  else if (page == 7){
    pageSeven();
  }
  else if (page == 8){
    pageEight();
  }
  else if (page == 9){
    pageNine();
  }
  else if (page == 10){
    pageTen();
  }
  else if (page == 11){
    pageEleven();
  }
  else if (page == 12){
    pageTwelve();
  }
  else if (page ==13){
    pageThirteen();
  }
  else if (page==14){
    pageFourteen();
  }
  else if (page == 15){
    pageFifteen();
  }
  else if (page == 16){
    pageSixteen();
  }
  else if (page == 17){
    pageSeventeen();
  }
  else if (page == 18){
    pageEighteen();
  }
  else if (page == 19){
    pageNineteen();
  }
  else if (page == 20){
    pageTwenty();
  }
  else if (page == 21){
    pageTwentyone();
  }
  else if (page ==22){
    pageTwentytwo();
  }
  else if (page == 23){
    pageTwentythree();
  }
  else if (page == 24){
    pageTwentyfour();
  }
  else if(page == 25){
    pageTwentyfive();
  }
  else if(page == 26){
    pageTwentysix();
  }
}

void mousePressed() {
  if (page == 1) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 2; 
    } 
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 3;
    }
  } else if (page == 2) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 4; 
    } 
    else if (overButton(b2x, b2y, b2w, b2h) == true){
      page = 5;
    } 
   }
   else if (page == 3){
     if (overButton(b1x,b1y,b1w,b1h) == true){
       page = 1;
     }
   }
   else if (page == 4){
     if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 6;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 7;
     }
   }
   else if (page == 5){
     if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 6;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 7;
     }
   }
   else if (page == 6){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 8;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 9;
     }
   }
   else if (page == 7){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 10;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 11;
     }
   }
   else if (page == 8){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 9;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 12;
     }
   }
   else if (page == 9){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 12;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 13;
     }
   }
   else if (page == 10){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 14;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 15;
     }
   }
   else if (page == 11){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 1 ;
     }
   }
   else if (page == 12){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 16;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 17;
     }
   }
   else if (page == 13){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 18;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 19;
     }
   }
   else if (page == 14){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 22;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 23;
     }
   }
   else if (page == 15){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 24;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 25;
     }
   }
   else if (page == 16){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 19;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 17;
     }
   }
   else if (page == 17){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 1;
     }
   }
   else if (page == 18){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 17;
     }
   }
   else if (page == 19){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 18;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 20;
     }
   }
   else if (page == 20){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 21;
     }
   }
   else if (page == 21){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 1;
     }
   }
   else if (page == 22){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 1;
     }
   }
   else if (page == 23){
     if (overButton(b2x,b2y,b2w,b2h)==true){
       page = 1;
     }
   }
   else if (page == 24){
     if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 1;
     }
   }
  else if (page == 25){
     if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 26;
     }
   }
   else if (page == 26){
      if (overButton(b1x,b1y,b1w,b1h)==true){
       page = 22;
     }
     if(overButton(b2x,b2y,b2w,b2h)==true){
       page = 24;
     }
   }
   
   
}

// Check to see if the click happends over the button
boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true; 
  } 
  else {
    return false; 
  }
}


// PAGE ONE

void pageOne() {
  background(bg1,bg2,bg3);
  image(page1,240,70,page1.width/1.5, page1.height/1.5);
  fill(0);
  textSize(30);
  fill(brown1,brown2,brown3);
  text("The Adventures of the Griffin in Wonderland", 30, 50);
  
  textSize(20);
  String first = "The Griffin of Wonderland lay dormant in the imagination of Alice.  Between existence and oblivion he sat, curled silently in indescribable dreams; the dreams of an imaginary being.  Yet, suddenly the call of actuality came ringing in the Griffin’s ears.  A call worth answering?";
  textLeading(25);
  text(first, 30, 100, 300, 300);
  
  
  
  // Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(button1, 0,0); 
  } 
  else {
    fill(153); 
  }
  textAlign(CENTER);
  fill(76,64,23);
  text("Yes", b1x + b1w/2, b1y + 50);
  
  // Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(button2,0,0); 
  } 
  else {
    fill(153); 
  };
  fill(76,64,23);
  text("No", b2x + b2w/2, b2y + 50);
  textAlign(LEFT);
}


// PAGE TWO

void pageTwo() {
  background(bg1,bg2,bg3);
  image(page1, 100,-130,page1.width*1.5, page1.height*1.5);
  fill(brown1,brown2,brown3);
  String second = "The Griffin awakens.  He can hear the Queen of hearts off in the distance: “Off with their heads.”  Her words are getting louder as she approaches his resting form.  Should the Griffin pretend to sleep or be alert and ready for the arrival of the queen?";
  //textLeading(25);
  text(second, 10, 80,300,300);
  
  // Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(button1,0,0); 
  } 
  else {
    fill(153); 
  }
  fill(brown1,brown2,brown3);
  textAlign(CENTER);
  text("Wake Up", b1x + b1w/2, b1y + 50);
  textAlign(LEFT);
  
    // Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(button2,0,0); 
  } 
  else {
    fill(153); 
  }
  fill(brown1,brown2,brown3);
  textAlign(CENTER);
  text("Pretend to Sleep", b2x + b2w/2, b2y + 50);
  textAlign(LEFT);

}


// PAGE THREE

void pageThree() {
  background(bg1,bg2,bg3);
  image(page1, 100,-150,page1.width*1.5, page1.height*1.5);
  String third = "A brief moment of alertness fades into an eternity of misty dreams, and the Griffin lies dormant in the mind of Alice for the rest of her days.";
  fill(brown1,brown2,brown3);
  text(third, 15, 100,300,300);
    // Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(button1,0,0); 
  } 
  else {
    fill(153); 
  }
  fill(brown1,brown2,brown3);
  textAlign(CENTER);
  text("The End", b1x + b1w/2, b1y + 50);
  textAlign(LEFT);
}


//PAGE FOUR
void pageFour(){
  background(bg1,bg2,bg3);
  image(page4, 0, 20, page4.width*1.4, page4.height*1.4);
  String fourth = "She orders the Griffin in ways seemingly unfit for the majesty of the mythical creature: “You despicable creature, take this young lady to see the Mock Turtle, and to hear his history, or its off with your eagle head.  I must go back to see after some executions I have ordered.” Shall the Griffin rebel, or head the call of the commandeering member of the royal family?";
  textLeading(25);
  fill(brown1,brown2,brown3);
  text(fourth, 320, 50 ,300,300);

    // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Obey", b1x + b1w/2, b1y + 50);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Rebel", b2x + b2w/2, b2y + 50);
    textAlign(LEFT);
}

//PAGE FIVE
void pageFive(){
  background(bg1,bg2,bg3);
  image(page4, 0, 20, page4.width*1.4, page4.height*1.4);
  fill(brown1,brown2,brown3);
  String fifth = "She orders the Griffin in ways seemingly unfit for the majesty of the mythical creature: “Up lazy thing! And take this young lady to see the Mock Turtle, and to hear his history.  I must go back to see after some executions I have ordered.” Shall he rebel, or head the call of the commandeering member of the royal family?";
  text(fifth, 320, 50, 300, 300);
  
    // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Obey", b1x + b1w/2, b1y + 50);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
     image(button2,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Rebel", b2x + b2w/2, b2y + 50);
    textAlign(LEFT);
}

//PAGE SIX
void pageSix(){
  background(bg1,bg2,bg3);
  image(page6,-15,0,page6.width/1.5,page6.height/1.5);
  String sixth = "Alice approaches the Griffin.  He is weary and rubs the sleep from his eyes.  As soon as the Queen is out of earshot the Griffin exclaims, “What fun!”                                    “What is the fun?” questions Alice.";
  fill(brown1,brown2,brown3);
  text(sixth, 300, 100, 300,300);

    // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
     image(button1,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("'The Queen of course'", b1x + b1w/2, b1y + 50);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("'The Mock Turtle of course. Come on!'", b2x, b2y+25, 200, 100);
    textAlign(LEFT);

  
}

//PAGE SEVEN
void pageSeven(){
  background(bg1,bg2,bg3);
  image(page7,0,-10,page7.width*1.2,page7.height*1.2);
  String seventh = "The Griffin explains to the Queen: “As you are merely a fat old card, and I a powerful mythical being, I must graciously refuse your offer.”  The Queen’s face boils over becoming as red as her heart.  “Well then it's off with your head like all the others,” and she proceeds to send her club-bearing guards after the Griffin.  What shall the Griffin do?";
  fill(brown1,brown2,brown3);
  text(seventh, 300,70, 300,300);
  
      // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Be taken into custody", b1x + b1w/2, b1y + 50);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Take to the air and flee", b2x + b2w/2, b2y + 50);
    textAlign(LEFT);
}

//PAGE EIGHT
void pageEight(){
  background(bg1,bg2,bg3);
  image(page7,30,-10,page7.width*1.2,page7.height*1.2);
  String eighth = "“It’s all her fancy, that: they never executes nobody, you know!”      Alice watched as the Queen moved out of sight, interested in her new found knowledge.";
  text(eighth, 300, 70, 300, 300);
  
      // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
     image(button1,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("'Come on Alice, we're going to the Mock Turtle.'", b1x, b1y+20, 200, 100);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("'Alice, shall we go visit the Mock Turtle now?'", b2x, b2y +25, 200,100);
    textAlign(LEFT);
}

//PAGE NINE
void pageNine(){
  background(bg1,bg2,bg3);
  image(page9,200,-60);
  String ninth = "“Everybody says ‘come on!’ here,” says Alice.  “I never was so ordered about in my life, never!” How shall the Griffin reply?";
  text(ninth, 15, 70, 300, 300);
  
        // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
     image(button1,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("'Apologies, for I thought you were eager to meet the Mock Turtle, shall we go visit him?'", b1x, b1y, 200, 100);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("'O stop the dribble-drabble.  You are a mere child and have no say in matters of such importance as a visit to the Mock Turtle.'", b2x, b2y , 200,100);
    textAlign(LEFT);
  
}
  
//PAGE TEN
void pageTen(){
  background(bg1,bg2,bg3);
  image(page10,350,-20,page10.width*1.3,page10.height*1.3);
  String tenth = "The royal gaurds close in around the Griffin, with their black clubs ready.  They shackle the beast, and drag him among the other prisoners the Queen has sentenced for execution.  The King of Hearts, spouce of the Queen, approached the sad group of outlaws.  Shall the Griffin treat the king with respect, or insult the man whose wife put him in chains?";
  text(tenth, 20,20, 300,300);
  
      // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Respect", b1x + b1w/2, b1y + 50);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
     image(button2,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Insult", b2x + b2w/2, b2y + 50);
    textAlign(LEFT);
}

//PAGE ELEVEN
void pageEleven(){
  background(bg1,bg2,bg3);
  image(page11,200,0, page11.width*2, page11.height*2);
  String eleventh = "The guards approach the Griffin tentatively.  His talons are beared and he thrashes his feathered head, planting his beak in the chest of one guard, and knocking another to the ground.   Finally, he spreads his majestic wings and takes to the sky.  Alice, the Queen, and the remaining guards watch in awe as the Griffin flies freely over the rocky shores of Wonderland.   ";
  text(eleventh,15,70,300,300);
  
      // Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(button1,0,0); 
  } 
  else {
    fill(153); 
  }
  fill(brown1,brown2,brown3);
  textAlign(CENTER);
  text("The End", b1x + b1w/2, b1y + 50);
  textAlign(LEFT);
}

//PAGE TWELVE
void pageTwelve(){
  background(bg1,bg2,bg3);
 image(page11, 300,-10);
 text("“Why yes a visit to the Mock Turtle sounds very interesting.  I’ve never heard of a Mock Turtle before.  A griffin is quite common,” she explains gesturing to the Griffin, “but a Mock Turtle, that’s enthralling.”", 10, 70,300,300);
 
       // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("'You should learn some respect child.'", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("'Well then let’s be on our way, Alice.'", b2x, b2y + 25, 200, 100);
    textAlign(LEFT);
}

//PAGE THIRTEEN
void pageThirteen(){
  background(bg1,bg2,bg3);
  image(page9, 200,-60);
  text("“I feel like sinking into the Earth,” says Alice, “for the animosity of all you creatures is really getting to me.  Never have I felt so hated before.”", 15,20,300,300);
  
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("'I should've held my tounge. I apologize.'", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("'You should be ashamed of yourself, Alice.'", b2x, b2y + 25, 200, 100);
    textAlign(LEFT);
}

//PAGE FOURTEEN
void pageFourteen(){
    background(bg1,bg2,bg3);
  image(page10,350,-20,page10.width*1.3,page10.height*1.3);
  text("“Why, excuse me good King,” says the Griffin. “You look quite flashing today.  Is that a new crown, for it looks purely majestic.” With that the king gave a smurk and turned to the guards.  “Let these prisoners go.  They are all pardoned.” Now that the Griffin has his freedom what should he do next?", 15,20,300,300);
  
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Go flying throughout Wonderland", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Go for a stroll in Wonderland", b2x, b2y + 25, 200, 100);
    textAlign(LEFT);
  
}

//PAGE FIFTEEN
void pageFifteen(){
    background(bg1,bg2,bg3);
    image(page10,350,-20,page10.width*1.3,page10.height*1.3);
  text("“You’re looking awfully plump today, your highness,” says the Griffin.  “Been stealing too many tarts from the kitchen have we?”  “Why you...I oughta shackle you up for the rest of your days,” the King exclaims.“Now why would you want to do that?” replies the Griffin. The king thought for a moment and then his face lit up with a stroke of genius. “For it is you who is the tart thief.”", 15,10,300,300);
  
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("‘Well then I except my fate’", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("‘They say a man is innocent until proven guilty, why not a griffin?’", b2x, b2y + 15, 200, 100);
    textAlign(LEFT);
  
}

//PAGE SIXTEEN
void pageSixteen(){
    background(bg1,bg2,bg3);
  image(page16, 300,0, page16.width/1.2, page16.height/1.2);
  text("“I’m sorry,” said Alice.  “I meant no offense.  It’s just that I’ve read of griffins in storybooks before, but never have I heard of a Mock Turtle.  That is all I meant.”", 10,50,300,300);
  
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("'You should still learn to hold your tounge.'", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("'Alright then, let’s be on our way.'", b2x, b2y + 25, 200, 100);
    textAlign(LEFT);
  
}

//PAGE SEVENTEEN
void pageSeventeen(){
    background(bg1,bg2,bg3);
  image(page17, 280,0,page17.width*1.7,page17.height*1.7);
  text("So Alice and the Griffin headed towards the majestic rocky shores of Wonderland, where they spoke with the Mock Turtle, who told them his interesting story.  Afterwards, Alice parted ways from the two creatures, and the Griffin felt a long nap coming on.", 10,70,300,300);
  
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("The End", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
  
  
}

//PAGE EIGHTEEN
void pageEighteen(){
    background(bg1,bg2,bg3);
  image(page6, -20,0, page6.width/1.5, page6.height/1.5);
  text("The Griffin wrapped one wing about Alice and explained, “I went too far.  It’s merely that I just woke up from my nap, and am slightly cranky.” “I understand,” said Alice.  “Shall we be off to see the Mock Turtle now?” ", 310,100,300,300);
  
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Continue", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
  
  
}

//PAGE NINETEEN
void pageNineteen(){
    background(bg1,bg2,bg3);
  image(page9, -180,0,page9.width*2,page9.height*2);
  text("“Never have I met a being so rude and self-centered,” elaborated the Griffin. With this statement, the Griffin could see tears welling up in Alice’s eyes.  Should he comfort the weaping child or continue his ranting?", 10,10,380,300);
  
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
     image(button1,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Comfort", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Rant", b2x, b2y + 25, 200, 100);
    textAlign(LEFT);
  
}

//PAGE TWENTY
void pageTwenty(){
    background(bg1,bg2,bg3);
  image(page20, 340,0);
  text("The Griffin began to speak, “I can’t believe, I, a creature of great power and myth must deal with such an inconsequential thing as a crying little girl.” With that the Griffin could see Alice, already balling, reach into her pocket and take a large bite from a mushroom.  She began to grow in a very disproportional manner, and the Griffin soon felt inconsequential himself standing beneath her feet.", 15,20,300,300);
  
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Continue", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
  
}


//PAGE TWENTY-ONE
void pageTwentyone(){
    background(bg1,bg2,bg3);
  image(page21, -10,60,page21.width/1.8,page21.height/1.8);
  text("Alice was still crying, but her tears had grown in size along with her.  The Griffin soon realized that the teardrops were flooding the ground around his feet, and they soon rized above Alice's shrinking form.  He took to the air, reaching for the sky.  But, alas, a large tear drop clipped his wing, sending the mythical creature plummeting to the river of tears below.  There he drowned in the tears of his creator.", 330,30,300,300);
  
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("The End", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
  
}

//PAGE TWENTY-TWO
void pageTwentytwo(){
      background(bg1,bg2,bg3);
  image(page11, 300,-15,page11.width*1.25,page11.height*1.25);
  text("And so with his new found freedom the Griffin took to the air.  He flew over all the beings of wonderland, their shrinking forms becoming inconsequential below.  The Griffin felt like he was the true king of Wonderland, for only he could watch the rest of the creatures from the heavens.", 15,90,300,300);
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("The End", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
}

//PAGE TWENTY-THREE
void pageTwentythree(){
        background(bg1,bg2,bg3);
  image(page7, -190,-220, page7.width*3, page7.height*3);
  text("And so with his new found freedom the Griffin decided to explore Wonderland on foot.  He met many new and interesting creatures on his adventure through Alice's imagination, from a hookah smoking caterpillar, to a psychedelic cat, and even a very mad hatter.", 300,90,300,300);
         // Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("The End", b2x, b2y + 25, 200, 100);
    textAlign(LEFT);
}

//PAGE TWENTY-FOUR
void pageTwentyfour(){
  background(bg1,bg2,bg3);
  image(page25, 320,0,page25.width*3,page25.height*3);
  text("And so the Griffin was shackled and chained and thrown into the dungeons of the Red Queen, never to roam free in Wonderland ever again.", 30,110,300,300);
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
     image(button1,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("The End", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
}


//PAGE TWENTY-FIVE
void pageTwentyfive(){
    background(bg1,bg2,bg3);
  image(page25, 320,0,page25.width*3,page25.height*3);
  text("''Then let us go to court and prove you guilt,'' said the King emphatically.  The guards then dragged the shackled beast away from his confines with the rest of the prisoners, and towards the courthouse of Wonderland.", 40,90,300,300);
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
     image(button1,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Continue", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
}
  
//PAGE TWENTY-SIX
void pageTwentysix(){
      background(bg1,bg2,bg3);
  image(page26, 350,-15, page26.width*1.4, page26.height*1.4);
  text("In court, a variety of witnesses are brought to the stand, every single one madder than the previous.  Their stories are convuluted and rarely relate to tarts.  At last, the sentence is handed down, and the Griffin is unanimously voted guilty.  Yet, suddenly an enormous Alice enters the courthouse ranting about the injustices of the king and queen.  The guards are distracted and the Griffin can see an opportunity to escape.  Should he take it?", 10,25,350,400);
  
         // Button
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      image(button1,0,0);
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("Yes", b1x, b1y + 25, 200, 100);
    textAlign(LEFT);
  
    // Right Button
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      image(button2,0,0); 
    } 
    else {
      fill(153); 
    }
    fill(brown1,brown2,brown3);
    textAlign(CENTER);
    text("No, he should remain for his punishment", b2x, b2y + 25, 200, 100);
    textAlign(LEFT);
  
}









