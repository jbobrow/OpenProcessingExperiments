
PImage alice1;
PImage alice2;
PImage alice3a;
PImage alice3b;
PImage alice4a;
PImage alice4b;
PImage alice4c;
PImage alice5a;
PImage alice5b;
PImage alice5c;
PImage alice5d;
PImage alice6a;
PImage alice6b;
PImage alice6c;
PImage alice6d;
PImage alice6e;
PImage potion1;
PImage potion2;
PImage mush1;
PImage mush2;
PImage arrow;
PImage alice3aAH;
PImage tall;

float x, y, r; 


int page = 1;   // Current page, this is the most important variable in the code

PFont font;



int b1x = 50;   // Button 1 x-coordinate
int b1y = 400;  // Button 1 y-coordinate
int b1w = 100;  // Button 1 width
int b1h = 50;   // Button 1 height

int b2x = 200;  // Button 2
int b2y = 400;
int b2w = 100;
int b2h = 50;

// You can define more buttons here following the same pattern

void setup() {
  size(640, 480); 
  smooth();
  loop();

  alice1 = loadImage("alice1.png");
  alice2 = loadImage("alice2.png");
  alice3a = loadImage("alice3a.png");
  alice3b = loadImage("alice3b.png");
  alice4a = loadImage("alice4a.png");
  alice4b = loadImage("alice4b.png");
  alice4c = loadImage("alice4c.png");
  alice5a = loadImage("alice5a.png");
  alice5b = loadImage("alice5b.png");
  alice5c = loadImage("alice5c.png");
  alice5d = loadImage("alice5d.png");
  alice6a = loadImage("alice6a.png");
  alice6b = loadImage("alice6b.png");
  alice6c = loadImage("alice6c.png");
  alice6d = loadImage("alice6d.png");
  alice6e = loadImage("alice6e.png");
  potion1 = loadImage("potion1.png");
  potion2 = loadImage("potion2.png");
  mush1 = loadImage("mush1.png");
  mush2 = loadImage("mush2.png");
  arrow = loadImage("arrow.png");
  alice3aAH = loadImage("alice3aAH.png");
  tall = loadImage("tall.png");


  font = loadFont("TektonPro-Bold-20.vlw");
  textFont(font);
}

void draw() {
  if (page == 1) {
    page1();
  } 
  else if (page == 2) {
    page2(); 
  } 
  else if (page == 3) {
    page3a(); 
  } 
  else if (page == 4) {
    page3b();
  } 
  else if (page == 5) {
    page4a();
  } 
  else if (page == 6) {
    page4b();
  } 
  else if (page == 7) {
    page4c();
  } 
  else if (page == 8) {
    page5a();
  } 
  else if (page == 9) {
    page5b();
  } 
  else if (page == 10) {
    page5c();
  } 
  else if (page == 11) {
    page5d();
  } 
  else if (page == 12) {
    page6a();
  } 
  else if (page == 13) {
    page6b();
  } 
  else if (page == 14) {
    page6c();
  } 
  else if (page == 15) {
    page6d();
  } 
  else if (page == 16) {
    page6e();
  }    
}

void mousePressed() {
  if (page == 1) { 
    if (overButton(68, 145, 220, 50) == true) {
      page = 2;
    } 
  } 
  else if (page == 2) {
    if (overPotion2(550, 380, potion1.width, potion1.height) == true) {
      page = 4; 
    } 
    else if (overMush2(380, 380, potion1.width, potion1.height) == true) {
      page = 3;
    }
    else if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 1;
    }
  } 
  else if (page == 3) {
    if (overMush3(b1x, 200, potion1.width, potion1.height) == true) {
      page = 5;
    }
    else if (overPotion3(285, 200, potion1.width, potion1.height) == true) {
      page = 6;
      }
    else if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 2;
    }
  } 
  else if (page == 4) {
    if (overMush4(380, 380, potion1.width, potion1.height) == true) {
      page = 6;
    }
    else if (overPotion4(550, 380, potion1.width, potion1.height) == true) {
      page = 7;
      }
    else if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 2;
    }
  } 
  else if (page == 5) {
    if (overMush5(200, 400, potion1.width, potion1.height) == true) {
      page = 8;
    }
    else if (overPotion5(400, 400, potion1.width, potion1.height) == true) {
      page = 9;
      }
    else if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 3;
    }
  } 
  else if (page == 6) {
    if (overMush6(200, 410, potion1.width, potion1.height) == true) {
      page = 9;
    }
    else if (overPotion6(400, 410, potion1.width, potion1.height) == true) {
      page = 10;
      }
    else if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 4;
    }
  } 
  else if (page == 7) {
    if (overMush7(380, 380, potion1.width, potion1.height) == true) {
      page = 10;
    }
    else if (overPotion7(550, 380, potion1.width, potion1.height) == true) {
      page = 11;
      }
    else if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 4;
    }
  } 
  else if (page == 8) {
    if (overMush8(380, 380, potion1.width, potion1.height) == true) {
      page = 12;
    }
    else if (overPotion8(550, 380, potion1.width, potion1.height) == true) {
      page = 13;
      }
    else if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 5;
    }
  } 
  else if (page == 9) {
    if (overMush9(380, 380, potion1.width, potion1.height) == true) {
      page = 13;
    }
    else if (overPotion9(550, 380, potion1.width, potion1.height) == true) {
      page = 14;
      }
    else if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 5;
    }
  } 
  else if (page == 10) {
    if (overMush10(380, 380, potion1.width, potion1.height) == true) {
      page = 14;
    }
    else if (overPotion10(550, 380, potion1.width, potion1.height) == true) {
      page = 15;
      }
    else if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 6;
    }
  } 
  else if (page == 11) {
    if (overMush11(200, 410, potion1.width, potion1.height) == true) {
      page = 15;
    }
    else if (overPotion11(400, 410, potion1.width, potion1.height) == true) {
      page = 16;
      }
    else if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 7;
    }
  }
  else if (page == 12) {
    if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 8;
    }
  }
  else if (page == 13) {
    if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 8;
    }
  }
  else if (page == 14) {
    if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 9;
    }
  }
  else if (page == 15) {
    if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 10;
    }
  }
  else if (page == 16) {
    if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
      page = 11;
    }
  }
}

// Check to see if the click happens over the button
boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(potion1, b1x, b1y);
    return true; 
  } 
  else {
    image(potion2, b1x, b1y);
    return false; 
  }
}
boolean overPotion2(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(potion1, 550, 380);
    return true; 
  } 
  else {
    image(potion2, 550, 380);
    return false; 
  }
}
boolean overMush2(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(mush2, 380, 380);
    return true; 
  } 
  else {
    image(mush1, 380, 380);
    return false; 
  }
}
boolean overMush3(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(mush2, b1x, 200);
    return true; 
  } 
  else {
    image(mush1, b1x, 200);
    return false; 
  }
}
boolean overPotion3(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(potion1, 285, 200);
    return true; 
  } 
  else {
    image(potion2, 285, 200);
    return false; 
  }
}
boolean overMush4(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(mush2, 380, 380);
    return true; 
  } 
  else {
    image(mush1, 380, 380);
    return false; 
  }
}
boolean overPotion4(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(potion1, 550, 380);
    return true; 
  } 
  else {
    image(potion2, 550, 380);
    return false; 
  }
}
boolean overMush5(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(mush2, 200, 400);
    return true; 
  } 
  else {
    image(mush1, 200, 400);
    return false; 
  }
}
boolean overPotion5(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(potion1, 400, 400);
    return true; 
  } 
  else {
    image(potion2, 400, 400);
    return false; 
  }
}
boolean overMush6(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(mush2, 200, 410);
    return true; 
  } 
  else {
    image(mush1, 200, 410);
    return false; 
  }
}
boolean overPotion6(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(potion1, 400, 410);
    return true; 
  } 
  else {
    image(potion2, 400, 410);
    return false; 
  }
}
boolean overMush7(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(mush2, 380, 380);
    return true; 
  } 
  else {
    image(mush1, 380, 380);
    return false; 
  }
}
boolean overPotion7(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(potion1, 550, 380);
    return true; 
  } 
  else {
    image(potion2, 550, 380);
    return false; 
  }
}
boolean overMush8(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(mush2, 380, 380);
    return true; 
  } 
  else {
    image(mush1, 380, 380);
    return false; 
  }
}
boolean overPotion8(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(potion1, 550, 380);
    return true; 
  } 
  else {
    image(potion2, 550, 380);
    return false; 
  }
}
boolean overMush9(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(mush2, 380, 380);
    return true; 
  } 
  else {
    image(mush1, 380, 380);
    return false; 
  }
}
boolean overPotion9(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(potion1, 550, 380);
    return true; 
  } 
  else {
    image(potion2, 550, 380);
    return false;
  }
}
boolean overMush10(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(mush2, 380, 380);
    return true; 
  } 
  else {
    image(mush1, 380, 380);
    return false; 
  }
}
boolean overPotion10(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(potion1, 550, 380);
    return true; 
  } 
  else {
    image(potion2, 550, 380);
    return false; 
  }
}
boolean overMush11(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(mush2, 200, 410);
    return true; 
  } 
  else {
    image(mush1, 200, 410);
    return false; 
  }
}
boolean overPotion11(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(potion1, 400, 410);
    return true; 
  } 
  else {
    image(potion2, 400, 410);
    return false; 
  }
}
boolean backbutton2(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    image(arrow, 0, 450);
    return true; 
  } 
  else {
    image(arrow, 0, 450);
    return false; 
  }
}




// PAGE 1
void page1() {
  image(alice1, 0, 0);
  fill(225, 255, 255, 0);
  // Take a sip!
  if (overButton(68, 145, 220, 50) == true) {
    strokeWeight(4);
    stroke(0);
    fill(203, 72, 35, 100);
  } 
  else {
    fill(153, 0);
    stroke(0);
    strokeWeight(2);
    fill(0, 0);
  } 
  rect(68, 145, 220, 50);
  stroke(0, 0);
  strokeWeight(0);
  fill(255);
  rect(b1x, b1y, potion1.width, potion1.height);
}




// PAGE 2
void page2() {
  image(alice2, 0, 0);
  // Mushroom
  if (overMush2(380, 380, potion1.width, potion1.height) == true) {
    image(mush2, 380, 380);
  } 
  else {
    fill(153); 
  }
  // Potion
  if (overPotion2(550, 380, potion1.width, potion1.height) == true) {
    image(potion1, 550, 380);
    image(mush1, 380, 380);
  } 
  else {
    image(potion2, 550, 380);
  }
  
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}


// PAGE 3

void page3a() {
  loop();
  image(alice3a, 0, 0);
  image(alice3aAH, 0, 0);
  image(tall, 10, random(10, 180));
  // Potion
  if (overPotion3(285, 200, potion1.width, potion1.height) == true) {
    image(potion1, 285, 200);
    image(mush2, b1x, 200);
  } 
  else {
    image(potion2, 285, 200);
    fill(153); 
  }
  // Mushroom
  if (overMush3(b1x, 200, potion1.width, potion1.height) == true) {
    image(mush2, b1x, 200);
  } 
  else {
  }
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}

// PAGE 4
void page3b() {
  image(alice3b, 0, 0);
  // Mushroom
  if (overMush4(380, 380, potion1.width, potion1.height) == true) {
    image(mush2, 380, 380);
  } 
  else {
    fill(153); 
  }
  // Potion
  if (overPotion4(550, 380, potion1.width, potion1.height) == true) {
    image(potion1, 550, 380);
  } 
  else {
    image(potion2, 550, 380);
  }
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}


// PAGE 5
void page4a() {
  image(alice4a, 0, 0);
  // Mushroom
  if (overMush5(200, 400, potion1.width, potion1.height) == true) {
    image(mush2, 200, 400);
  } 
  else {
    fill(153); 
  }
  // Potion
  if (overPotion5(400, 400, potion1.width, potion1.height) == true) {
    image(potion1, 400, 400);
    image(mush1, 200, 400);
  } 
  else {
    image(potion2, 400, 400);
  }
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}


// PAGE 6
void page4b() {
  image(alice4b, 0, 0);
  // Mushroom
  if (overMush6(200, 410, potion1.width, potion1.height) == true) {
    image(mush2, 200, 410);
  } 
  else {
    fill(153); 
  }
  // Potion
  if (overPotion6(400, 410, potion1.width, potion1.height) == true) {
    image(potion1, 400, 410);
    image(mush1, 200, 410);
  } 
  else {
    image(potion2, 400, 410);
  }
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}


// PAGE 7
void page4c() {
  image(alice4c, 0, 0);
  // Mushroom
  if (overMush7(380, 380, potion1.width, potion1.height) == true) {
    image(mush2, 380, 380);
  } 
  else {
    fill(153); 
  }
  // Potion
  if (overPotion7(550, 380, potion1.width, potion1.height) == true) {
    image(potion2, 550, 380);
    image(mush1, 380, 380);
  } 
  else {
    image(potion1, 550, 380);
  }
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}


// PAGE 8
void page5a() {
  image(alice5a, 0, 0);
  // Mushroom
  if (overMush8(380, 380, potion1.width, potion1.height) == true) {
    image(mush2, 380, 380);
  } 
  else {
    fill(153); 
  }
  // Potion
  if (overPotion8(550, 380, potion1.width, potion1.height) == true) {
    image(potion1, 550, 380);
    image(mush1, 380, 380);
  } 
  else {
    image(potion2, 550, 380);
  }
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}


// PAGE 9
void page5b() {
  image(alice5b, 0, 0);
  // Mushroom
  if (overMush9(380, 380, potion1.width, potion1.height) == true) {
    image(mush2, 380, 380);
  } 
  else {
    fill(153); 
  }
  // Potion
  if (overPotion9(550, 380, potion1.width, potion1.height) == true) {
    image(potion1, 550, 380);
    image(mush1, 380, 380);
  } 
  else {
    image(potion2, 550, 380);
  }
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}


// PAGE 10
void page5c() {
  image(alice5c, 0, 0);
  // Mushroom
  if (overMush10(380, 380, potion1.width, potion1.height) == true) {
    image(mush2, 380, 380);
  } 
  else {
    fill(153); 
  }
  // Potion
  if (overPotion10(550, 380, potion1.width, potion1.height) == true) {
    image(potion1, 550, 380);
    image(mush1, 380, 380);
  } 
  else {
    image(potion2, 550, 380);
  }
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}


// PAGE 11
void page5d() {
  image(alice5d, 0, 0);
  // Mushroom
  if (overMush11(200, 410, potion1.width, potion1.height) == true) {
    image(mush2, 200, 410);
  } 
  else {
    fill(153); 
  }
  // Potion
  if (overPotion11(400, 410, potion1.width, potion1.height) == true) {
    image(potion1, 400, 410);
    image(mush1, 200, 410);
  } 
  else {
    image(potion2, 400, 410);
  }
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}


// PAGE 6a
void page6a() {
  image(alice6a, 0, 0);
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}
// PAGE 6b
void page6b() {
  image(alice6b, 0, 0);
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}
// PAGE 6c
void page6c() {
  image(alice6c, 0, 0);
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}
// PAGE 6d
void page6d() {
  image(alice6d, 0, 0);
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}
// PAGE 6e
void page6e() {
  image(alice6e, 0, 0);
  // back
  if (backbutton2(0, 450, arrow.width, arrow.height) == true) {
    image(arrow, 0, 450);
  }
}


