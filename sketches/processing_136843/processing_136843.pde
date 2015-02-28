

/* @pjs font = "fancywords.ttf, caps.ttf"; */

int myState = 0 ;
PFont fancywords ;
PFont caps ;
PImage adventure ;
PImage path ;
PImage monty ;
PImage dragon ;
PImage goat ;
PImage dinodragon ;
PImage dance ;
PImage save ;
PImage percy ;
int x = -250;

void setup() {
  size(700, 500) ;
  fancywords = createFont("fancywords.ttf" , 128);
  caps = createFont("caps.TTF" , 36);
    adventure = loadImage("ChooseAdventure.png") ;
  path = loadImage("Whichpath.png") ;
  percy = loadImage("PercyandSteed.png") ;
  monty = loadImage("Monty.png") ;
  dragon = loadImage("FightTrogdor.png") ;
  goat = loadImage("gotgoat.png") ;
  dinodragon = loadImage("DinoDragon.png") ;
  dance = loadImage("Dance.png") ;
  save = loadImage("SavePauline.png") ;
}

void draw() {
  
  background(100) ;
  noStroke();
  
  switch(myState) {
    
    case 0:
    image(adventure, 0, 0, width, height);
    textFont(caps, 50);
    fill(255);
    text("Choose Your Adventure", 20, 50) ;
    textFont(fancywords, 20);
    fill(255);
    text("Pauline has been taken by a detranged", 250, 320) ;
    text("purple dragon in a top hat!", 250, 350) ;
    text("You have to save her!", 250, 400) ;
    text("Press {B} to begin!", 250, 450) ;
    break ;
    
    case 1:
    image(path, 0, 0, width, height);
    textFont(fancywords, 20);
    text("On your valiant journey you ", 10, 20) ;
    text("come across an ominous fork", 10, 40);
    text("in the road...", 10, 60);
    textFont(fancywords, 18);
    fill(0);
    text("Press {A} if you wish to journey", 370, 20);
    fill(0);
    text("through the Shadowy Forest...", 370, 40);
    fill(255);
    text("Choose (C) if you want to travel", 375, 385);
    text("trough the magical Lillipop and", 375, 405);
    text("Gumdrop Road.", 375, 425);
    image(percy, x, 0, width, height);
    x = x + 1 ;
    if(x > 130) {
      x = 130;
    }
    break ;
    
    case 2:
    image(dragon, 0, 0, width, height);
    textFont(fancywords, 18);
    text("You run into a most fearsome dragon whilst you ride the path with", 10, 20) ;
    text("your always faithful steed.", 10, 40);
    text("Press {Q} if you will fight the beast  head on!", 10, 60);
    text("Choose {Z} if you are going to grab", 10, 80);
    text("your steed to fight!", 10, 100);
    break ;
    
    case 3:
    image(monty, 0, 0, width, height);
    textFont(fancywords, 18);
    text("Oh no! You have come across the mighty", 10, 20) ;
    text("HippoHoboDogaCatapotamus", 10, 50);
    text("You must run and hope he doesn't find you!", 10, 80);
    text("Press {T}", 10, 110);
    break ;
    
    case 4:
    image(goat, 0, 0, width, height);
    textFont(fancywords, 18);
    text("Yikes! Now Trogd- I mean, the dragon", 10, 420) ;
    text("has your goat!", 10, 445) ;
    text("Now you both must run for it! Press {T}", 10, 470);
    break ;
    
    case 5:
    image(dinodragon, 0, 0, width, height);
    textFont(fancywords, 16);
    text("You have traveled far, valiant hero!", 10, 20) ;
    text("Now you have found the terrible purple dragon's lair!", 10, 40);
    text("You're so close to saving Pauline!", 10, 60);
    text("You just need to defeat the dragon!", 10, 80);
    text("Choose {D} if you wish to fight", 10, 100);
    text("with the power of dance!", 10, 120);
    text("Choose (F) if you wish to give the dragon your trusty red cape!", 10, 490);
    break ;
    
    case 6:
    image(dance, 0, 0, width, height);
    textFont(fancywords, 18);
    text("Well, the dragon loved your dance, but now he wants to keep", 10, 435) ;
    text("you both as prisoners forever...", 10, 460);
    text("You should probably press (T)              If you dare to try again...", 10, 485);
    break ;
    
    case 7:
    image(save, 0, 0, width, height);
    textFont(fancywords, 18);
    text("Hooray! By giving him your cape you", 10, 20) ;
    text("restored his faith in humanity!", 10, 45) ;
    text("Now all he wants to do is perform a one", 10, 70);
    text("man show of 'Man of La Mancha',", 10, 95);
    text("but with dragons!", 10, 115);
    text("You two are free to dance into the sunset,", 10, 230);
    text("well techinically nightset,", 10, 255);
    text("It took you forever to get here.", 10, 280);
    textFont(caps, 30);
    text("And they lived Happily Ever After", 10, 460);
    text("Probably", 440, 490); 
    break ;
    
  }
}
  
  void keyPressed() {
//    println(key) ;
    
    switch(key) {
      case 't':
      myState = 0 ;
      break ;
      
      case 'b':
      if (myState == 0)
      myState = 1 ;
      break ;
      
      case 'a':
      if (myState == 1)
      myState = 2 ;
      break ;
      
      case 'c':
      if (myState == 1)
      myState = 3 ;
      break ;
      
      case 'q':
      if (myState == 2)
      myState = 4 ;
      break ;
      
      case 'z':
      if (myState == 2)
      myState = 5 ;
      break ;
      
      case 'd':
      if (myState == 5)
      myState = 6 ;
      break ;
      
      case 'f':
      if (myState == 5)
      myState = 7 ;
      break ;
    
  }


  }







