
PImage georgeL;
PImage georgeR;
PImage georgeLG;
PImage georgeRG;

//PImage mustardvist;

//int kitchenA = 20;

PImage georgePot;
PImage backgroundKitchen;
PImage backgroundKitchenUI;

//PFont carattere;

//cucina
int txtCurry;
int txtMustard;
int txtChili;
int txtPepper;
String txtCur = "curry powder";
String txtM = "mustard";
String txtC = "e.h.c.s.s.";
String txtP = "black pepper";

//end cucina

// START Chili
int xvisto=0;
int yvisto=0;
//int xmustardvisto = 0;
//int ymustardvisto = 0;

// chili END


// START Chili
PImage chili;
int xchili = 358;
int ychili = 80;
Boolean moveChili = false;
// chili END

// START Curry
PImage curry;
int xcurry = 255;
int ycurry =183;
Boolean movecurry = false;
// curry END

// START pepper
PImage pepper;
int xpepper = 565;
int ypepper = 53;
Boolean movepepper = false;
// pepper END

// START mustard
PImage mustard;
int xmustard = 307;
int ymustard = 113;
Boolean movemustard = false;
// mustard END

// START george
PImage george; // george
int xgeorge = 670;
float ygeorge = 215;
Boolean movegeorge = false;
// george END

color getColor = 0;
color getColor2 = 0;

void kitchen (){

  
  //println("xgeorge"+xgeorge);
  //println("ygeorge"+ygeorge);
  getColor2 = georgePot.get(mouseX+(670-xgeorge), mouseY-215+int(ygeorge));
  
  if(xgeorge > 800) {
    roomStep = 2;
    xgeorgeStairs = 50;
    ygeorgeStairs = 130;
  }
  
  getColor = backgroundKitchenUI.get(mouseX, mouseY);  
 
  image(backgroundKitchenUI, 0, 0);
  image(backgroundKitchen, 0, 0);
   
  //image(mustardvisto,0,0);
  image(visto,900,0);
      fill(0);
  textFont(carattere, 20);
  text(txtCur, 670, 50);
  text(txtM, 670, 80);
  text(txtC, 670, 110);
  text(txtP, 670, 140);
  
  // START george
  image(george, xgeorge-5, ygeorge);
  //image(georgePot, xgeorge, ygeorge);
    
  // go to the left
  if(keyPressed && (key == CODED)) { 
    if (keyCode == LEFT) {
      xgeorge=xgeorge-2;
      george = loadImage("georgeL.png");
    }
  // go to the right
    if (keyCode == RIGHT) {
      george = loadImage("georgeR.png");
      xgeorge=xgeorge+2;
    }
  }
    /*if(xgeorge == 668){
      xgeorge=670;
    }*/
    // START chili
  image(chili, xchili, ychili);
  if(getColor == -16777116){
    moveChili= true;
  }
  if(moveChili == true){
    xchili = mouseX-17;
    ychili = mouseY-30;
  }
  if(moveChili == true && getColor2 == -16711936){
    moveChili = false;
    xchili = - 100;
    ychili = - 100;
  } 
  if(xchili== -100 && ychili == -100){
    chili = loadImage("pallinobianco.png");
  }
    // END chili
    
    // START curry
  image(curry, xcurry, ycurry);
  if(getColor == -10223616){
    movecurry= true;
  }
  if(movecurry == true){
    xcurry = mouseX-17;
    ycurry = mouseY-30;
  }
  if(movecurry == true && getColor2 == -16711936){
    movecurry = false;
    xcurry = - 100;
    ycurry = - 100;
  }
  if(xcurry== -100 && ycurry == -100){
    curry = loadImage("pallinobianco.png");
  }
    // END curry
    
    // START pepper
  image(pepper, xpepper, ypepper);
  if(getColor == -10210766){
    movepepper= true;
  }
  if(movepepper == true){
    xpepper = mouseX-17;
    ypepper = mouseY-30;
  }
  if(movepepper == true && getColor2 == -16711936){
    movepepper = false;
    xpepper = - 100;
    ypepper = - 100;
  } 
  if(xpepper==-100 && ypepper == -100){
    pepper = loadImage("pallinobianco.png");
  } 
    // END pepper
   
    // START mustard
  image(mustard, xmustard, ymustard);
  if(getColor == -16751516){
    movemustard= true;
  }
  if(movemustard == true){
    xmustard = mouseX-17;
    ymustard = mouseY-30;
  }
  if(movemustard == true && getColor2 == -16711936){
    movemustard = false;
    xmustard = - 100;
    ymustard = - 100;
    

  } 
  if(xmustard== -100 && ymustard == -100){
    mustard = loadImage("pallinobianco.png");
  
  }
  if(xpepper== -100 && ypepper == -100){
   image (visto,-30,-10);
  }
   if(xcurry== -100 && ycurry == -100){
   image (visto,-30,20);
  }
   if(xmustard== -100 && ymustard == -100){
   image (visto,-30,50);
  }
   if(xchili== -100 && ychili == -100){
   image (visto,-30,80);
  }
    // END mustard
  
  if(mousePressed){
    // helps to get the color from the background
    //println(backgroundKitchenUI.get(mouseX, mouseY));
    println(getColor2);
    // hepls to get the actual mouseX & mouseY
    //println(mouseX + " " + mouseY);
  }
}


