

/* Drawing tool by Catalina Cortazar */

PFont miFont;

//PImage imgCuaderno; imagen cuaderno, no creo que la use
boolean NoDibuja = true;
boolean guilty = false;
boolean happy = false;
boolean tired = false;
int timer=0; // timer for the beginner of the text
int lastSavedTime;
int timeInterval;
float happyX;
float happyY;
float GuiltyX;
float GuiltyY;
float startX;
float startY;
float eraseX;
float eraseY;
float tiredX;
float tiredY;
float savepX;
float savepY;
float savesX;
float savesY;
float savetX;
float savetY;
float startaX;
float startaY;
PImage ImageSad;
PImage ImageTired;
PImage ImageGuilty;
int brushSize;
float savedrawingGX;
float savedrawingGY;
float savedrawingSX;
float savedrawingSY;
float savedrawingTX;
float savedrawingTY;
int opacity;

color colorTheySelected; 

String h ="Sad";       //from http://processing.org/reference/textWidth_.html
float hw; 

String g ="Romantic";
float gw;

String s ="Start Again";       //from http://processing.org/reference/textWidth_.html
float sw;

String e ="ERASE";
float er;

String t ="Tired";
float tr;

String p ="Save your palette";
float sp;

String u ="Save your palette";
float su;

String q ="Save your palette";
float st;

String c = "Save your drawing";
float cg;

String l = "Save your drawing";
float cs;

String m = "Save your drawing";
float ms;

void setup() {

  size(700, 500);
  background (255, 255, 255);
  smooth();
  miFont=loadFont("AGaramondPro-Regular-48.vlw");
  textFont(miFont, 24);

  //imgCuaderno = loadImage("GridLandscape.png");
  lastSavedTime = millis(); //because it takes a little to load
  timeInterval = 4000; //time to leave the text on the screen - preguna inicial
  happyX = 37;
  happyY = 95;
  GuiltyX = 37;
  GuiltyY = 295;
  startX = 10;
  startY = 275;
  eraseX = 50;
  eraseY = 35;
  tiredX = 37;
  tiredY = 195;
  savepX = 10;
  savepY = 250;
  savesX = 10;
  savesY = 250;
  savetX = 10;
  savetY = 250;
  startaX = 500;
  startaY = 430;
  brushSize = 10;
  savedrawingGX = 10;
  savedrawingGY = 225;
  savedrawingSX = 10;
  savedrawingSY = 225;
  savedrawingTX = 10;
  savedrawingTY = 225;
  opacity = 255;

  hw = textWidth(h);
  gw = textWidth(g);
  sw = textWidth(s);
  er = textWidth(e);
  tr = textWidth(t);
  sp = textWidth(p);
  su = textWidth(u);
  st = textWidth(q);
  cg = textWidth(c);
  cs = textWidth(l);
  ms = textWidth(m);

  colorTheySelected  = color(255, 255, 255, 255);

  ImageSad = loadImage("sad.jpg");
  ImageTired = loadImage("tired.jpg");
  ImageGuilty = loadImage("guilty.jpg");
}


void draw() {

  drawTexto();
  //println(  colorTheySelected); para ver si funcionaba
  if (!NoDibuja) { 
    if (guilty == true) {

      drawPaletteGuilty();
    }

    if (happy == true) {
      drawPaletteHappy();
    }

    if (tired == true) {
      drawPaletteTired();
    }
  }
}
void drawTexto() {

  timer = millis() - lastSavedTime;

  if (NoDibuja) {

    fill(0, 0, 0, 3); // (R,G,B,opacity)
    text("how do you feel today?", width/3, height/2);

    if (timer >= timeInterval) { 

      background(255, 255, 255, 255);
      noStroke();

      //draw the sad entrance

        fill(171, 224, 248);
      rect(happyX - 5, happyY - 23, hw + 10, 30);
      fill(71, 105, 126);
      text(h, happyX, happyY);

      fill(71, 105, 126);
      rect(happyX + 5 + hw, happyY - 23, 10, 30);

      fill(195, 227, 203);
      rect(happyX + 15 + hw, happyY - 23, 10, 30);

      fill(142, 187, 160);
      rect(happyX + 25 + hw, happyY - 23, 10, 30);


      fill(232, 230, 183);
      rect(happyX + 35 + hw, happyY - 23, 10, 30);



      //draw the guilty entrance

      fill(252, 223, 236);
      rect(GuiltyX - 5, GuiltyY - 23, gw + 10, 30);
      fill(239, 68, 119);
      text(g, GuiltyX, GuiltyY);

      fill(239, 68, 119);
      rect(GuiltyX + 5 + gw, GuiltyY - 23, 10, 30);

      fill(243, 139, 172);
      rect(GuiltyX + 15 + gw, GuiltyY - 23, 10, 30);

      fill(7, 18, 55);
      rect(GuiltyX + 25 + gw, GuiltyY - 23, 10, 30);


      fill(0, 0, 0);
      rect(GuiltyX + 35 + gw, GuiltyY - 23, 10, 30);






      //draw the tired entrance


      fill(254, 225, 211);
      rect(tiredX - 5, tiredY - 23, gw + 10, 30);
      fill(107, 59, 26);
      text(t, tiredX, tiredY);

      fill(107, 59, 26);
      rect(tiredX + 5 + tr, tiredY - 23, 10, 30);

      fill(221, 174, 128);
      rect(tiredX + 15 + tr, tiredY - 23, 10, 30);

      fill(129, 117, 110);
      rect(tiredX + 25 + tr, tiredY - 23, 10, 30);

      fill(227, 157, 103);
      rect(tiredX + 35 + tr, tiredY - 23, 10, 30);





      //      fill(243, 20, 255, 255);  dibuja un rectangulo para lograr un area que hace click
      //      rect(happyX, happyY - 24, sw, 24);
    }
  }
}

void mouseReleased() {

  if (NoDibuja) {

    if (mouseX > happyX && mouseX < happyX + hw && mouseY > happyY - 24 && mouseY < happyY + 24) {
      println("you pressed happy"); 
      happy = true;
      tired = false;
      guilty=false;
      NoDibuja = false;
      fill(255, 255, 255, 255);
      rect(150, 0, 550, height);
    }


    if (mouseX > GuiltyX && mouseX < GuiltyX + gw && mouseY > GuiltyY - 24 && mouseY < GuiltyY + 24) {
      println("you pressed guilty");
      guilty=true;
      happy = false;
      tired = false;
      NoDibuja = false;
      fill(255, 255, 255, 255);
      rect(150, 0, 550, height);
    }



    if (mouseX > tiredX && mouseX <tiredX + tr && mouseY > tiredY - 24 && mouseY < tiredY + 24) {
      println("you pressed tired");
      guilty=false;
      happy = false;
      tired = true;
      NoDibuja = false;
      fill(255, 255, 255, 255);
      rect(150, 0, 550, height);
    }
  }
  else {

    if (mouseX >startX && mouseX < startX + sw && mouseY > startY - 18 && mouseY < startY + 18) {
      println("you pressed start");
      colorTheySelected  = color(255, 255, 255, 255);
      NoDibuja = true; 
      guilty=false;
      happy = false;
    }

    if (mouseX >startaX && mouseX < startaX + sw && mouseY > startaY - 18 && mouseY < startaY + 18) {
      println("you pressed start");
      colorTheySelected  = color(255, 255, 255, 255);
      NoDibuja = true; 
      guilty=false;
      happy = false;
    }

    if (mouseX > savepX && mouseX < savepX + sp && mouseY > savepY - 18 && mouseY < savepY + 18 && guilty == true) {
      println("you pressed saved");
      guilty=false;
      happy = false;
      tired = false;
      savepalleteGuilty();
    }

    if (mouseX > savesX && mouseX < savesX + su && mouseY > savesY - 18 && mouseY < savesY + 18  && happy == true) {
      println("you pressed saved");
      guilty=false;
      happy = false;
      tired = false;
      savepalleteSad();
    }

    if (mouseX > savetX && mouseX < savetX + st && mouseY > savetY - 18 && mouseY < savetY + 18  && tired == true) {
      println("you pressed saved");
      guilty=false;
      happy = false;
      tired = false;
      savepalleteTired();
    }

    //save your drawing guilty

    if (mouseX > savedrawingGX && mouseX < savedrawingGX + cg && mouseY > savedrawingGY - 18 && mouseY < savedrawingGY + 18 && guilty == true) {
      println("you pressed saved");
      guilty = true;
      happy = false;
      tired = false;
      saveFrame("drawings/GuiltyDrawing-####.jpg");
    }

    if (mouseX > savedrawingSX && mouseX < savedrawingSX + cs && mouseY > savedrawingSY - 18 && mouseY < savedrawingSY + 18 && happy == true) {
      println("you pressed saved");
      happy = true;
      guilty = false;
      tired = false;
      saveFrame("drawings/SadDrawing-####.jpg");
    }

    if (mouseX > savedrawingTX && mouseX < savedrawingTX + ms && mouseY > savedrawingTY - 18 && mouseY < savedrawingTY + 18 && tired == true) {
      println("you pressed saved");
      tired = true;
      guilty = false;
      happy = false;
      saveFrame("drawings/TiredDrawing-####.jpg");
    }



    if (guilty == true && happy == false && tired == false) {
      if (mouseX >10 && mouseX < 40 && mouseY > 20 && mouseY < 40) {
        colorTheySelected = color(239, 68, 119, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >10 && mouseX < 40 && mouseY > 50 && mouseY < 70) {
        colorTheySelected = color(243, 139, 172, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >10 && mouseX < 40 && mouseY > 80 && mouseY < 100) {
        colorTheySelected = color(252, 223, 236, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >10 && mouseX < 40 && mouseY > 110 && mouseY < 130) {
        colorTheySelected = color(7, 18, 55, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >10 && mouseX < 40 && mouseY > 140 && mouseY < 160) {
        colorTheySelected = color(0, 0, 0, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >eraseX && mouseX < eraseX +sw && mouseY > eraseY - 24 && mouseY < eraseY + 24) {

        colorTheySelected = color(255, 255, 255, 255);
      }
    }

    if (happy == true && guilty == false && tired == false) {
      if (mouseX >10 && mouseX < 40 && mouseY > 20 && mouseY < 40) {
        colorTheySelected = color(171, 224, 248, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >10 && mouseX < 40 && mouseY > 50 && mouseY < 70) {
        colorTheySelected = color(232, 230, 183, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >10 && mouseX < 40 && mouseY > 80 && mouseY < 100) {
        colorTheySelected = color(142, 187, 160, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >10 && mouseX < 40 && mouseY > 110 && mouseY < 130) {
        colorTheySelected = color(195, 227, 203, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >10 && mouseX < 40 && mouseY > 140 && mouseY < 160) {
        colorTheySelected = color(71, 105, 126, opacity);
        // println(colorTheySelected); para comprobar funciona
      }


      if (mouseX >eraseX && mouseX < eraseX +sw && mouseY > eraseY - 24 && mouseY < eraseY + 24) {

        colorTheySelected = color(255, 255, 255);
      }
    }




    if (tired == true && happy == false && guilty == false) {
      if (mouseX >10 && mouseX < 40 && mouseY > 20 && mouseY < 40) {
        colorTheySelected = color(107, 59, 26, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >10 && mouseX < 40 && mouseY > 50 && mouseY < 70) {
        colorTheySelected = color(221, 174, 128, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >10 && mouseX < 40 && mouseY > 80 && mouseY < 100) {
        colorTheySelected = color(254, 225, 211, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >10 && mouseX < 40 && mouseY > 110 && mouseY < 130) {
        colorTheySelected = color(129, 117, 110, opacity);
        // println(colorTheySelected); para comprobar funciona
      }

      if (mouseX >10 && mouseX < 40 && mouseY > 140 && mouseY < 160) {
        colorTheySelected = color(227, 157, 103, opacity);
        // println(colorTheySelected); para comprobar funciona
      }


      if (mouseX >eraseX && mouseX < eraseX + er && mouseY > eraseY - 24 && mouseY < eraseY + 24) {

        colorTheySelected = color(255, 255, 255);
      }
    }
  }
}




void drawPaletteGuilty() {

  image(ImageGuilty, 0, 0);
  //  fill(0, 0, 0);
  //  rect(0, 0, width/5, height);
  fill(239, 68, 119);
  text(g, 10, 200); //guilty



  //palette:
  stroke(255, 255, 255);
  strokeWeight(1);
  fill(239, 68, 119, opacity);
  rect(10, 20, 20, 20);

  fill(243, 139, 172, opacity);
  rect(10, 50, 20, 20);

  fill(252, 223, 236, opacity);
  rect(10, 80, 20, 20);

  fill(7, 18, 55, opacity);
  rect(10, 110, 20, 20);

  fill(0, 0, 0, opacity);
  rect(10, 140, 20, 20);

  noStroke();

  //buttons
  textFont(miFont, 16);
  fill(0, 0, 0);
  text(e, 50, 35);

  textFont(miFont, 18);
  text(s, startX, startY);
  text(p, savepX, savepY); 
  text(c, savedrawingGX, savedrawingGY);// lo tengo que declarar como el otro string
  textFont(miFont, 24);


  //brushes:
  if (mousePressed && mouseX > 150) {
    fill(colorTheySelected);
    ellipse(mouseX, mouseY, brushSize, brushSize);
    stroke(colorTheySelected);
    strokeWeight(brushSize);
    line(pmouseX, pmouseY, mouseX, mouseY);
    noStroke();
  }
}
//void mouseReleased() {
//
//}


void drawPaletteHappy() {

  image(ImageSad, 0, 0);

  //  fill(0, 0, 0);
  //  rect(0, 0, width/5, height);
  fill(71, 105, 126);
  text(h, 10, 200); //happy


  //palette:
  stroke(255, 255, 255);
  strokeWeight(1);
  fill(171, 224, 248, opacity);
  rect(10, 20, 20, 20);

  fill(232, 230, 183, opacity);
  rect(10, 50, 20, 20);

  fill(142, 187, 160, opacity);
  rect(10, 80, 20, 20);

  fill(195, 227, 203, opacity);
  rect(10, 110, 20, 20);

  fill(71, 105, 126, opacity);
  rect(10, 140, 20, 20);

  noStroke();

  //buttons
  textFont(miFont, 16);
  fill(71, 105, 126);
  text(e, 50, 35);
  // lo tengo que declarar como el otro string
  textFont(miFont, 18);
   fill(0, 0, 0);
  text(s, startX, startY);
  text(l, savedrawingSX, savedrawingSY);
  text(u, savesX, savesY); 

  textFont(miFont, 24);


  //brushes:
  if (mousePressed && mouseX > 150) {
    fill(colorTheySelected);
    ellipse(mouseX, mouseY, brushSize, brushSize);
    stroke(colorTheySelected);
    strokeWeight(brushSize);
    line(pmouseX, pmouseY, mouseX, mouseY);
    noStroke();
  }
}

void drawPaletteTired() {

  image(ImageTired, 0, 0);
  //  fill(0, 0, 0);
  //  rect(0, 0, width/5, height);
  fill(107, 59, 26);
  text(t, 10, 200); //tired


  //palette:
  stroke(255, 255, 255);
  strokeWeight(1);
  fill(107, 59, 26, opacity);
  rect(10, 20, 20, 20);

  fill(221, 174, 128, opacity);
  rect(10, 50, 20, 20);

  fill(254, 225, 211, opacity);
  rect(10, 80, 20, 20);

  fill(129, 117, 110, opacity);
  rect(10, 110, 20, 20);

  fill(227, 157, 103, opacity);
  rect(10, 140, 20, 20);

  noStroke();

  //buttons
  textFont(miFont, 16);
  fill(107, 59, 26);
  text(e, 50, 35);
  // lo tengo que declarar como el otro string
  fill(0, 0, 0);
  textFont(miFont, 18);
  text(s, startX, startY);
  text(m, savedrawingTX, savedrawingTY);
  text(p, savepX, savepY); 
  textFont(miFont, 24);


  //brushes:
  if (mousePressed && mouseX > 150) {
    fill(colorTheySelected);
    ellipse(mouseX, mouseY, brushSize, brushSize);
    stroke(colorTheySelected);
    strokeWeight(brushSize);
    line(pmouseX, pmouseY, mouseX, mouseY);
    noStroke();
  }
}


void savepalleteGuilty() {

  textFont(miFont, 16);
  fill(255, 255, 255, 255);
  rect(0, 0, width, height);
  stroke(255, 255, 255);
  strokeWeight(1);
  fill(239, 68, 119);
  rect(100, 150, 120, 30);
  text("R = 239, G = 68, B = 119", 270, 180);

  fill(243, 139, 172);
  rect(100, 200, 120, 30);
  text("R = 243, G = 139, B = 172", 270, 230);

  fill(252, 223, 236);
  rect(100, 250, 120, 30);
  text("R = 252, G = 223, B = 236", 270, 280);

  fill(7, 18, 55);
  rect(100, 300, 120, 30);
  text("R = 7, G = 18, B = 55", 270, 330);

  fill(0, 0, 0);
  rect(100, 350, 120, 30);
  text("R = 0, G = 0, B = 0", 270, 380);

  noStroke();
  textFont(miFont, 18);
  text(s, startaX, startaY);

  textFont(miFont, 24);

  saveFrame("palettes/GuiltyPalette-####.jpg");
}


void savepalleteSad() {

  textFont(miFont, 16);
  fill(255, 255, 255, 255);
  rect(0, 0, width, height);
  stroke(255, 255, 255);
  strokeWeight(1);
  fill(171, 224, 248);
  rect(100, 150, 120, 30);
  text("R = 171, G = 224, B = 248", 270, 180);

  fill(232, 230, 183);
  rect(100, 200, 120, 30);
  text("R = 232, G = 230, B = 183", 270, 230);

  fill(142, 187, 160);
  rect(100, 250, 120, 30);
  text("R = 142, G = 187, B = 160", 270, 280);

  fill(195, 227, 203);
  rect(100, 300, 120, 30);
  text("R = 195, G = 227, B = 203", 270, 330);

  fill(71, 105, 126);
  rect(100, 350, 120, 30);
  text("R = 71, G = 105, B = 126", 270, 380);

  noStroke();
  textFont(miFont, 18);
  text(s, startaX, startaY);

  textFont(miFont, 24);


  saveFrame("palettes/SadPalette-####.jpg");
}


void savepalleteTired() {

  textFont(miFont, 16);
  fill(255, 255, 255, 255);
  rect(0, 0, width, height);
  stroke(255, 255, 255);
  strokeWeight(1);
  fill(107, 59, 26);
  rect(100, 150, 120, 30);
  text("R = 107, G = 59, B = 26", 270, 180);

  fill(221, 174, 128);
  rect(100, 200, 120, 30);
  text("R = 221, G = 174, B = 128", 270, 230);

  fill(254, 225, 211);
  rect(100, 250, 120, 30);
  text("R = 254, G = 225, B = 211", 270, 280);

  fill(129, 117, 110);
  rect(100, 300, 120, 30);
  text("R = 129, G = 117, B = 110", 270, 330);

  fill(227, 157, 103);
  rect(100, 350, 120, 30);
  text("R = 227, G = 157, B = 103", 270, 380);

  noStroke();
  textFont(miFont, 18);
  text(s, startaX, startaY);

  textFont(miFont, 24);


  saveFrame("palettes/TiredPalette-####.jpg");
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      brushSize ++;
    } 
    else if (keyCode == DOWN) {

      if (  brushSize>0) {

        brushSize --;
      }
    }
    else if (keyCode == RIGHT) {
      opacity ++;
      println(opacity);
    } 
    else if (keyCode == LEFT) {

      if (  opacity > 0) {

        opacity --;
        println(opacity);
      }
    }
  }
}


