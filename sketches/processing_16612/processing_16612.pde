
boolean mouseReleased=false;
int card = 0;
PFont font;
PImage jackdaw1;
PImage peacock1;
PImage magpie1;
PImage happyend;
PImage badend;
PImage feather;
PImage birdheads;
PImage birdheads2;
PImage square;
PImage speech;
PImage flyaway;
PImage flyaway2;
PImage foolstrut;
PImage dead;
PImage goodstrut;
PImage seaside;
PImage crown;
PImage sunset;

void setup() {
  size(640, 480);
  smooth();
  font = loadFont("ChaparralPro-BoldIt-80.vlw");
  textFont(font);
  
  jackdaw1 = loadImage ("jackdaw1.png");
  peacock1 = loadImage ("peacock1.png");
  magpie1 = loadImage ("magpie1.png");
  happyend = loadImage ("happyend.png");
  badend = loadImage ("badend2.png");
  feather = loadImage ("feather.png");
  birdheads = loadImage ("birdheads.png");
    birdheads2 = loadImage ("birdheads2.png");
  square = loadImage ("square.png");
  speech = loadImage ("speech.png");
  flyaway= loadImage ("flyaway.png");
  foolstrut = loadImage ("foolstrut.png");
  dead = loadImage ("dead.png");
  goodstrut = loadImage ("goodstrut.png");
  flyaway2 = loadImage("flyaway2.png");
  seaside = loadImage ("seaside.png");
  crown = loadImage("crown.png");
  sunset = loadImage("SunsetOption.png");
}
void draw() {
  background(0);
  println(card);
  if (card == 0) {

    fill(255);
    image (feather, -25, 0);
    textFont(font, 60);
    text("Fowl Politics", 150, 250);
  
    //FLOCKING ALGORITHM ON TITLE PAGE

    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 75, 420);
      if (d < 450) {
        card = 1;
      }
    }
  }
  else if(card == 1) {

    background (134, 186, 210);
    textFont(font, 27);
     image(jackdaw1, 0, 0);
     image(square, 40, 155);
      image(square, 380, 155);
    fill(255);
    String s = "You are a jackdaw in the Land of the Birds. An announcement has been made that the birds will elect a new king. What do you do?";
    text(s, 30, 30, 575, 300);
    fill(0);
    textFont(font, 24);
    text("Who's running?", 60, 175);
    text("I'm running!", 400, 175);

    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 380, 155);
      if (d < 30) {
        card = 5;
      }
    }
    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 40, 155);
      if (d < 30) {
        card = 2;
      }
    }
    noFill();
  }
  else if(card == 2) {

    background (152, 159, 191);
    fill(255);
     image(peacock1, 0, 0);
      image(magpie1, 0, 0);
      image(square, 60, 330);
      image(square, 400, 330);
      image(square, 220, 380);
    textFont(font, 30);
    String s = "The peacock and the magpie are running.";
    text(s, 30, 30, 595, 200);
    textFont(font, 35);
    text("Who do you vote for?", 160, 90, 595, 250);
    textFont(font, 24);
    fill(0);
    text("The peacock", 80, 350);
    text("The magpie", 420, 350);
    text("I'm not voting.", 240, 400); 

    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 60, 330);
      if (d < 20) {
        card = 3;
      }
    }
    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 400, 330);
      if (d < 20) {
        card = 4;
      }
    }
    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 220, 380);
      if (d < 20) {
        card = 3;
      }
    }
  }
  else if(card == 3) {

    fill(255);
    background (131, 37, 1);
    image(badend, 0, 0);
    textFont(font, 65);
    text("The peacock won!", 50, 175, 600, 400);
    textFont(font, 24);
    String v = "After one day of the peacock's rule, the Land of the Birds was destroyed. Everyone is dead, including you!";
    text(v, 100, 350, 500, 450);

    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 400, 150);
      if (d < 350) {
        card = 0;
      }
    }
  }
  else if(card == 4) {

    fill(255);
    background(149, 194, 209);
    image(happyend, 0, 0);
    textFont(font, 65);
    String s = "The magpie won!";
    text(s, 60, 220, 575, 500);
    textFont(font, 24);
    fill(0);
    String v = "And by one vote! After a few years of the magpie's rule, the Land of the Birds was its most prosperous and beneficial as a living environment.";
    text(v, 25, 350, 585, 450);
    textFont(font, 40);
    text("Everyone is happy!", 155, 440, 575, 500);

    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 450, 300);
      if (d < 350) {
        card = 0;
      }
    }
  }

  else if(card == 5) {

    textFont(font, 50);
    image(birdheads, 0, 0);
    image(square, 10, 170);
      image(square, 280, 170);
    fill(255);
    String s = "Why are you running?";
    text(s, 65, 30, 575, 400);
    textFont(font, 24);
    text("I want the power and respect!", 30, 170, 235, 400);
    text("I want to mess with the system and beat them at their own game!", 300, 170, 340, 400);

    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 10, 170);
      if (d < 50) {
        card = 6;
      }
    }
    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 280, 170);
      if (d < 50) {
        card = 13;
      }
    }
  }
  else if(card == 6) {
    
    
    fill(255);
     background(149, 154, 209);
image(birdheads2, 0, 0);
image(square, 160, 180);
image(square, 30, 330);
    textFont(font, 40);
    String s = "How will you go about trying to win?";
    text(s, 50, 50, 570, 400);
    textFont(font, 24);
    text("I will be the best speaker they've heard!", 190, 180, 500, 400);
    text("I'm going to dress up as fancily as I can!", 60, 330, 400, 400);

    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 160, 180);
      if (d < 20) {
        card = 7;
      }
    }
    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 30, 330);
      if (d < 50) {
        card = 11;
      }
    }
    noFill();
  }
    
    
  else if(card == 7) {

    fill(255);
     background (131, 37, 1);
    image(speech, 0, 0);
    image (square, 220, 295);
    image (square, 220, 385);
    textFont(font, 24);
    String s = "You go in front of all the birds in the Land of Birds and give your speech. They don't like the way you use words, especially big ones. The crowds of birds start to attack you!";
    text(s, 150, 50, 390, 450);
    textFont(font, 40);
    text("Fly away!", 250, 285, 390, 300);
    String p = "Keep talking!";
    text(p, 250, 385, 540, 300);

    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 220, 295);
      if (d < 20) {
        card = 8;
      }
    }
    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 220, 385);
      if (d < 20) {
        card = 10;
      }
    }
    noFill();
  }
  else if(card == 8) {

    fill(255);
     background(149, 194, 209);
    image(flyaway, 0, 0);
    image (square, 320, 290);
    image(square, 320, 390);
    textFont(font, 38);
    String s = "You barely made it away! Where do you go now?";
    text(s, 50, 30, 550, 400);
    textFont(font, 30);
    String t = "Go back home.";
    text(t, 350, 287, 500, 400);
    String p = "Find a new home.";
    text(p, 350, 387, 500, 400);

    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 320, 290);
      if (d < 20) {
        card = 1;
      }
    }
    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 320, 390);
      if (d < 20) {
        card = 9;
      }
    }
  }
  else if(card == 9) {
       background(149, 194, 209);
image(seaside, 0, 0);
    fill(255);
    textFont(font, 35);
    String s = "You found a nice new home by the sea.";
     textFont(font, 25);
    text(s, 50, 50, 370, 400);
    text("Your home is far away from the destruction that kills all of the birds in the Land of the Birds (apparently the peacock was made king).", 50, 200, 270, 450);

    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 500, 50);
      if (d < 350) {
        card = 0;
      }
    }
  }
  else if(card == 10) {

    fill(255);
    image(dead, 0, 0);
    textFont(font, 24);
    String s = "They continued to attack you as you tried to keep talking until they killed you.";
    text(s, 50, 50, 570, 400);
    textFont(font, 50);
    text("You are dead!", 250, 180);

    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 250, 180);
      if (d < 350) {
        card = 0;
      }
    }
  }
  else if(card == 11) {

    fill(255);
    background (131, 37, 1);
    image (foolstrut, 0, 0);
    image (square, 30, 337);
    image (square, 30, 387);
    textFont(font, 20);
    String s = "You went in search of fancy feathers and found quite a few nice ones. However, when you go before the crowds of the Land of the Birds, many recognize their own feathers in your plumage. These birds start to attack you!";
    text(s, 40, 47, 270, 400);
    textFont(font, 25);
    text("Fly away!", 60, 340, 575, 450);
    textFont(font, 25);
    String p = "Still try to win!";
    text(p, 60, 390, 240, 450);

    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 30, 337);
      if (d < 20) {
        card = 8;
      }
    }
    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 30, 387);
      if (d < 20) {
        card = 12;
      }
    }
  }
  else if(card == 12) {
image(dead, 0, 0);
    fill(255);
    textFont(font, 24);
    String s = "They continued to attack you and rip out your feathers until they killed you.";
    text(s, 50, 50, 570, 400);
    textFont(font, 40);
    text("You are dead!", 250, 200);

    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 500, 30);
      if (d < 350) {
        card = 0;
      }
    }
  }
  else if(card == 13) {
    fill(255);
image(birdheads2, 0, 0);
image(square, 160, 180);
image(square, 30, 330);
    textFont(font, 40);
    String s = "How will you go about trying to win?";
    text(s, 50, 50, 570, 400);
    textFont(font, 24);
    text("I will use words - confuse them with speeches!", 200, 180, 500, 400);
    text("I'll dress up as extravagantly as I can - make them believe I am one of there own!", 70, 330, 400, 400);

    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 160, 180);
      if (d < 20) {
        card = 7;
      }
    }
    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 30, 330);
      if (d < 50) {
        card = 14;
      }
    }
    noFill();
  }
  else if(card == 14) {

    fill(255);
    image (goodstrut, 0, 0);
    image(square, 225, 360);
    image (square, 225, 310);
    textFont(font, 20);
    String s = "You found a bunch of great discarded feathers and added them to your plumage. You also studied the way the peacocks interacted with each other. When the day came, you confidently strutted yourself before the crowds of the Land of the Birds. They all gazed in awe of your beauty.";
    text(s, 50, 30, 570, 200);
    textFont(font, 37);
    String v = "YOU WON THE ELECTION!";
    text(v, 50, 170, 575, 250);
    textFont(font, 20);
    String p = "Take the power!";
    text(p, 250, 360, 570, 400);
    String z = "Tell them off and fly away!";
    text(z, 250, 310, 570, 400);

    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 225, 360);
      if (d < 20) {
        card = 15;
      }
    }
    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 225, 310);
      if (d < 20) {
        card = 18;
      }
    }
  }
  else if(card == 15) {
    fill(255);
image(crown, 0, 40);
    textFont(font, 40);
    String s = "You are now officially the king. What do you do with the power?";
    text(s, 50, 50, 570, 400);
    textFont(font, 24);
    text("Rule fairly.", 50, 420);
    text("Abuse it!", 500, 420);

    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 50, 420);
      if (d < 150) {
        card = 16;
      }
    }
    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 500, 420);
      if (d < 150) {
        card = 17;
      }
    }
    noFill();
  }
  else if(card == 16) {
    
        fill(255);
    background(149, 194, 209);
    image(happyend, 0, 0);
    textFont(font, 65);
    String s = "Well done!";
    text(s, 160, 220, 575, 500);
    textFont(font, 24);
    fill(0);
    String v = "After a few years of being king, the Land of the birds is its most prosperous and beneficial as a living environment!";
    text(v, 25, 350, 585, 450);
    textFont(font, 40);
    text("Everyone is happy!", 155, 440, 575, 500);

    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 450, 300);
      if (d < 350) {
        card = 0;
      }
    }
  }
    
  else if(card == 17) {
image(dead, 0, 0);
    fill(255);
    textFont(font, 20);
    String s = "After a few decades of being an immensely corrupt king, the masses finally turn against you, dethrown you, and kill you.";
    text(s, 50, 50, 570, 400);
    textFont(font, 40);
    text("You are dead!", 200, 150);
    // - and remembered as a horrible, horrible dictator

    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 500, 30);
      if (d < 350) {
        card = 0;
      }
    }
  }
  else if(card == 18) {
    fill(255);
 background(149, 194, 209);
 image(flyaway2, 0, 0);
 image (square, 20, 280);
 image (square, 20, 330);
 image (square, 20, 380);
    textFont(font, 30);
    String s = "You sure shocked and confused those birds, but now what do you do?";
    text(s, 50, 50, 570, 200);
    textFont(font, 24);
    text("Go back home.", 50, 300);
    text("Find a new home.", 50, 350);
   text("Fly epicly into the sun.", 50, 400);

    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 20, 280);
      if (d < 20) {
        card = 1;
      }
    }
    if (mouseReleased) {
      float d = dist(mouseX, mouseY, 20, 330);
      if (d < 20) {
        card = 9;
      }
    }
    if (mouseReleased) {
     float d = dist(mouseX, mouseY, 20, 380);
  if (d < 50) {
        card = 19;
  } 
    }
    }
  else if(card == 19) {

    background (167, 61, 3);
     image(sunset, 0, 0);

    if(mouseReleased) {
      float d = dist(mouseX, mouseY, 500, 30);
      if (d < 350) {
        card = 0;
      }
    }
  }
    

  mouseReleased = false;
}

void mouseReleased() {
mouseReleased = true;
}


