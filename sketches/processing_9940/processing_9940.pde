
int card = 0;
PFont font;
PImage SB;
PImage aa;
PImage bb;
PImage a; 
PImage b;
PImage c;
PImage d;
PImage e;
PImage ee;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;
PImage k;
PImage l;
PImage m;
PImage n;
PImage o;
PImage p;
PImage q;
PImage r;
PImage s;
PImage t;
PImage u;

void setup(){
  size(640, 480);
  smooth();
  font = loadFont("CoventryGardenNF-48.vlw");
  textFont(font);

  SB = loadImage("SB_FAINTS.png");
  aa = loadImage("bird.png");
  bb = loadImage("bird2.png");
  a = loadImage("1baby.png");
  b = loadImage("fairy.png");
  c = loadImage("EVIL.png");
  d = loadImage("WOMAN.png");
  e = loadImage("OLD_WOMAN.png");
  ee = loadImage("SBSTAND2.png");
  f = loadImage("garden.png");
  g = loadImage("fairysleep.png");
  h = loadImage("Prince_horse.png");
  i = loadImage("old-man.png");
  j = loadImage("FOREST_prince.png");
  k = loadImage("sleeping_knight.png");
  l = loadImage("find-SB.png");
  m = loadImage("DRUNK_end.png");
  n = loadImage("PRINCE_SBmarry.png");
  o = loadImage("OGRE.png");
  p = loadImage("DEAD-end.png");
  q = loadImage("servent.png");
  r = loadImage("OGRE2.png");
  s = loadImage("SB_standing.png");
  t = loadImage("happy-end.png");
  u = loadImage("Prince_horse2.png");

}
void draw() {
  println(card);
  if (card == 0) {

    image(SB, 0, 0);
    image(aa, 75, 220);
    fill(255);
    textFont(font, 60);
    text("Sleeping Beauty", 150, 100);

    if (mousePressed) {
      float d = dist(mouseX, mouseY, 75, 220);
      if (d < 150) {
        card = 1;
      }
    }
  }
  else if(card == 1) {
    image(a, 0, 0);
    image(aa, 100, 100);
    textFont(font, 30);
    fill(0);
    text("The King and Queen had a baby.", 30, 75);

    if (mousePressed) {
      float d = dist(mouseX, mouseY, 100, 100);
      if (d < 150) {
        card = 2;
      }
    }
  } 
  else if(card == 2) {
    image(b, 0, 0);
    image(bb, 440, 350);
    image(aa, 60, 360);
    fill(0);
    textFont(font, 30);
    String s = "The fairies came with presents for the newborn baby girl, but unfortunately, so did the evil fairy!";
    text(s, 30, 30, 275, 400);
    textFont(font, 24);
    text("Let Evil Fairy in.", 400, 350);
    text("Ignore her.", 60, 350);

    if (mousePressed) {
      float d = dist(mouseX, mouseY, 460, 350);
      if (d < 150) {
        card = 3;
      }
    }
    if(mousePressed) {
      float d = dist(mouseX, mouseY, 60, 350);
      if (d < 150) {
        card = 4;
      }
    }
  }
  else if(card == 3) {
    image(c, 0, 0);
    image(bb, 400,150);
    textFont(font, 45);
    String s = "The Evil Fairy gives the baby a curse!";
    text(s, 50, 75, 500, 400);

    if (mousePressed) {
      float d = dist(mouseX, mouseY, 400, 150);
      if (d < 150) {
        card = 5;
      }
    }
  }
  else if(card == 4) {
    image(c, 0, 0);
    image(bb, 450, 300);
    textFont(font, 50);
    String s = "The Evil Fairy killed everyone in the castle!";
    text(s, 100, 90, 500, 400);

    if(mousePressed) {
      float d = dist(mouseX, mouseY, 450, 300);
      if (d < 120) {
        card = 0;
      }
    }
  }else if(card == 5) {
    image(b, 0, 0);
    image(aa, 50, 10);
    textFont(font, 30);
    String s = "It is up to the Good Fairy to give a remedy...";
    text(s, 30, 300, 300, 400);

    if(mousePressed) {
      float d = dist(mouseX, mouseY, 50, 10);
      if (d < 120) {
        card = 6;
      }
    }
  }
  else if(card == 6) {
    fill(0);
    image(d, 0, 0);
    image(aa, 50 ,320);
    image(bb, 330, 200);
    textFont(font, 50);
    String s = "The Princess grew up!";
    text(s, 50, 75, 300, 400);
    textFont(font, 24);
    text("Explore castle", 50, 300);
    text("Wander in the garden", 230, 200); 

    if (mousePressed) {
      float d = dist(mouseX, mouseY, 50, 300);
      if (d < 150) {
        card = 7;
      }
    }
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 330, 200);
      if (d < 150) {
        card = 8;
      }
    }
    noFill();
  }
  else if(card == 7) {
    image(e, 0, 0);
    image(aa, 30, 100);
    image(bb, 170, 320);
    fill(255);
    textFont(font, 39);
    String s = "The Princess sees an old woman...";
    text(s, 40, 47, 500, 400);
    textFont(font, 24);
    text("Ask what she is doing.", 150, 185);
    String p = "Ignore her.";
    text(p, 60, 390, 140, 200);

    if (mousePressed) {
      float d = dist(mouseX, mouseY, 30, 100);
      if (d < 150) {
        card = 11;
      }
    }
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 220, 320);
      if (d < 100) {
        card = 6;
      }
    }
    noFill();
  }
  else if(card == 8) {
    image(f, 0, 0);
    image(aa, 50, 300);
    image(bb, 275, 100);
    textFont(font, 38);
    String s = "There are some pretty thorny flowers in the garden... ";
    text(s, 50, 30, 500, 400);
    textFont(font, 24);
    String t = "Touch the flowers. ";
    text(t, 90, 200, 500, 400);
    String p = "Go explore the castle. ";
    text(p, 180, 380, 200, 400);

    if (mousePressed) {
      float d = dist(mouseX, mouseY, 50, 300);
      if (d < 150) {
        card = 7;
      }
    } 
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 290, 120);
      if (d < 150) {
        card = 10;
      }
    }
  }
  else if(card == 10) {
    image(SB, 0, 0);
    image(bb, 500, 50);
    fill(255);
    textFont(font, 48);
    String s = "The Princess died from a thorn related injury!";
    text(s, 30, 30, 500, 400);

    if(mousePressed) {
      float d = dist(mouseX, mouseY, 500, 50);
      if (d < 120) {
        card = 0;
      }
    }
  }
  else if(card == 11) {
    image(ee, 0, 0);
    image(bb, 500, 30);
    image(aa, 155, 350);
    fill(255);
    textFont(font, 40);
    String s = "The old woman is spinning yarn.";
    text(s, 220, 220, 300, 400);
    textFont(font, 24);
    text("Try spinning yarn.", 350, 80);
    text("Go to the garden.", 250, 387);

    if(mousePressed) {
      float d = dist(mouseX, mouseY, 155, 350);
      if (d < 120) {
        card = 8;
      }
    }
    if(mousePressed) {
      float d = dist(mouseX, mouseY, 500, 30);
      if (d < 120) {
        card = 12;
      }
    }
  }
  else if(card == 12) {
    image(g, 0, 0);
    image(bb, 440, 200);
    image(aa, 65, 100);
    fill(0);
    textFont(font, 48);
    String s = "The Princess fainted!";
    text(s, 30, 30, 500, 400);
    textFont(font, 24);
    String p = "The good fairy ignores the issue.";
    text(p, 180, 180, 200, 200);
    String z = "The good fairy puts everyone in the castle to sleep.";
    text(z, 100, 280, 350, 200);

    if(mousePressed) {
      float d = dist(mouseX, mouseY, 440, 200);
      if (d < 120) {
        card = 13;
      }
    }
    if(mousePressed) {
      float d = dist(mouseX, mouseY, 65, 170);
      if (d < 120) {
        card = 14;
      }
    }
    noFill();
  }
  else if(card == 14) {
    image(SB, 0, 0);
    image(bb, 440, 150);
    fill(255);
    textFont(font, 48);
    String s = "The Princess never wakes up!";
    text(s, 30, 30, 500, 400);

    if(mousePressed) {
      float d = dist(mouseX, mouseY, 440, 150);
      if (d < 120) {
        card = 0;
      }
    }
  }
  else if(card == 13) {
    image(h, 0, 0);
    image(bb, 520, 240);
    image(aa, 300, 350);
    fill(0);
    textFont(font, 30);
    String s = "100 years later - A prince is hunting in the woods. He sees a castle in the distance and comes across an old man...";
    text(s, 310, 30, 270, 400);
    textFont(font, 24);
    String p = "Ask the old man about the castle.";
    text(p, 360, 315, 200, 200);
    String z = "Continue hunting.";
    text(z, 410, 410, 350, 200);

    if(mousePressed) {
      float d = dist(mouseX, mouseY,640, 290);
      if (d < 120) {
        card = 16;
      }
    }
    if(mousePressed) {
      float d = dist(mouseX, mouseY, 300, 350);
      if (d < 120) {
        card = 14;
      }
    }
    noFill();
  }
  else if(card == 16) {
    image(i, 0, 0);
    image(bb, 380, 340);
    image(aa, 60, 110);
    fill(0);
    textFont(font, 30);
    String s = "The old man tells the Prince the legend of Sleeping Beauty. The Prince is intrigued.";
    text(s, 30, 30, 500, 400);
    textFont(font, 24);
    String p = "Enter woods ";
    text(p, 270, 390, 200, 200);
    String z = "Continue hunting.";
    text(z, 160, 170, 350, 200);

    if(mousePressed) {
      float d = dist(mouseX, mouseY, 60, 110);
      if (d < 120) {
        card = 14;
      }
    }
    if(mousePressed) {
      float d = dist(mouseX, mouseY, 380, 340);
      if (d < 120) {
        card = 15;
      }
    }
  }
  else if(card == 15) {
    image(j, 0, 0);
    image(bb, 400, 70);
    fill(255);
    textFont(font, 30);
    String s = "The Prince manages to make his way though the forest of brambles...";
    text(s, 414, 300, 200, 500);

    if (mousePressed) {
      float d = dist(mouseX, mouseY, 400, 70);
      if (d < 150) {
        card = 17;
      }
    }
  }
  else if(card == 17) {
    image(k, 0, 0);
    image(aa, 150, 130);
    image(bb, 510,350);
    fill(255);
    textFont(font, 38);
    String s = "The Prince sees a knight sleeping with a bottle of wine...";
    text(s, 90, 45, 500, 500);
    textFont(font, 24);
    String w = "Drink the wine.";
    text(w, 250, 200, 500, 500);
    String z = "Explore the castle.";
    text(z, 350, 420, 500, 500);
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 250, 200);
      if (d < 150) {
        card = 19;
      }
    }
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 510, 350);
      if (d < 150) {
        card = 18;
      }
    }
  }
  else if(card == 18) {
    image(l, 0, 0);
    image(aa, 10, 10);
    image(bb, 520,10);
    fill(255);
    textFont(font, 35);
    String s = "The Prince wakes sleeping beauty with a kiss...";
    text(s, 410, 150, 240, 500);
    textFont(font, 24);
    String w = "Get married.";
    text(w, 425, 45, 250, 500);
    String z = "Leave her for the wine.";
    text(z, 110, 45, 500, 500);
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 10, 10);
      if (d < 150) {
        card = 19;
      }
    }
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 520, 10);
      if (d < 150) {
        card = 21;
      }
    }
  }
  else if(card == 19) {
    image(m, 0, 0);
    image(bb, 520,100);
    fill(0);
    textFont(font, 35);
    String s = "The Prince drank all the wine, left the castle drunk, and was eaten by wild boars!";
    text(s, 200, 350, 400, 500);

    if (mousePressed) {
      float d = dist(mouseX, mouseY, 520, 100);
      if (d < 150) {
        card = 0;
        noFill();
      }
    }
  }
  else if(card == 21) {
    image(n, 0, 0);
    image(bb, 520,350);
    fill(255);
    textFont(font, 30);
    String s = "The pair move to the Prince's castle and have two children. The Prince then goes off to war...";
    text(s, 360, 30, 250, 500);
    textFont(font, 24);
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 520, 350);
      if (d < 150) {
        card = 22;
      }
    }
  }
  else if(card == 22) {
    image(o, 0, 0);
    image(bb, 520,100);
    image(aa, 340, 280);
    fill(255);
    textFont(font, 33);
    String s = "Unbeknownst to the Princess, the Prince's mother is actually an OGRE!!! She orders her servant to cook the Princess' children for dinner...";    
    text(s, 70, 30, 500, 500);
    textFont(font, 24);
    String t = "Make the children into a stew!";    
    text(t, 450, 320, 150, 500);
    String y = "Kill the Ogre!";    
    text(y, 400, 170, 500, 500);
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 520, 100);
      if (d < 150) {
        card = 23;
      }
    }
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 340, 280);
      if (d < 150) {
        card = 24;
      }
    }
  }
  else if(card == 23) {
    image(t, 0, 0);
    image(aa, 40,340);
    fill(0);
    textFont(font, 35);
    String s = "The Ogre is dead and Everyone in the kingdom lives Happily Ever After!!";    
    text(s, 365, 30, 250, 500);
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 40, 340);
      if (d < 150) {
        card = 0;
      }
    }
    noFill();
  }
  else if(card == 24) {
    image(q, 0, 0);
    image(bb, 520,344);
    fill(0);
    textFont(font, 39);
    String s = "Instead of murdering the children, the servant prepares a stew with deer meat.";    
    text(s, 110, 30, 500, 500);
    textFont(font, 24);
    String t = "The Ogre is thrilled and orders the Princess to be cooked next!! The stressed servant immediately leaves to find more deer to prepare as a substitute.";    
    text(t, 280, 160, 300, 500);
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 520, 344);
      if (d < 100) {
        card = 25;
      }
    }
    noFill();
  }
  else if(card == 25) {
    image(r, 0, 0);
    image(aa, 40,320);
    image(bb, 265,120);
    fill(0);
    textFont(font, 43);
    String s = "The Ogre hears children laughing and realizes she has been had!!!";    
    text(s, 50, 30, 500, 500);
    textFont(font, 24);
    String t = "She forces the Princess, the two children and the servant into a large cooking pot filled with snakes and toads!!!";    
    text(t, 25, 170, 250, 500);
    String q = "Realizes the err of her ways and gives up the Ogre lifestyle!";    
    text(q, 150, 370, 250, 500);
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 40, 320);
      if (d < 150) {
        card = 26;
      }
    }
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 265, 120);
      if (d < 150) {
        card = 27;
      }
    }
  } 
  else if(card == 26) {
    image(s, 0, 0);
    image(bb, 500, 60);
    fill(0);
    textFont(font, 50);
    String s = "Everyone lives happily ever after!!!";    
    text(s, 240, 260, 400, 500);
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 500, 60);
      if (d < 150) {
        card = 0;
      }
    }
  } 
  else if(card == 27) {
    image(u, 0, 0);
    image(bb, 250, 360);
    image(aa, 20, 220);
    fill(0);
    textFont(font, 34);
    String s = "The Prince comes home early and sees his family in the pot...";    
    text(s, 30, 30, 400, 500);
    textFont(font, 24);
    String t = "Call the good fairy for backup!";    
    text(t, 60, 410, 200, 500);
    String y = "Run away in horror.";    
    text(y, 130, 300, 400, 500);
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 20, 220);
      if (d < 150) {
        card = 29;
      }
    }
    if (mousePressed) {
      float d = dist(mouseX, mouseY, 250, 360);
      if (d < 150) {
        card = 28;
      }
    }
  } 
  else if(card == 28) {
    image(b, 0, 0);
    image(bb, 500, 20);
    fill(0);
    textFont(font, 37);
    String s = "The Good Fairy killed the Ogre and the kingdom lives happily ever after!!!";    
    text(s, 80, 330, 450, 500);

    if (mousePressed) {
      float d = dist(mouseX, mouseY, 500, 20);
      if (d < 150) {
        card = 0;
      }
    }
  } 
  else if(card == 29) {
    image(o, 0, 0);
    image(bb, 500,230);
    fill(0);
    textFont(font, 40);
    String s = "The Ogre eats the Princess and the two children!";    
    text(s, 140, 70, 450, 500);

    if (mousePressed) {
      float d = dist(mouseX, mouseY, 500, 230);
      if (d < 150) {
        card = 0;
      }
    }
  }
}


