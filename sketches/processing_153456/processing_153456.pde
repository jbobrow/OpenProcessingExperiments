
PFont font;
PImage img;

float xText1;
float xText2;
float xText3;

float xText1Cible;
float xText2Cible;
float xText3Cible;

float xPoem1;
float xPoem2;
float xPoem3;

float xPoem1Cible;
float xPoem2Cible;
float xPoem3Cible;

float y;
float vitesse = 0.1;

float alphaImage = 0;
float alphaPoem =0;

color selectedText1 = color(255, 0, 0);
color selectedText2 = color(255, 0, 0);
color selectedText3 = color(255, 0, 0);

String EXT = ".png";
String[] ancre1 = { 
  "Boat", "River", "Tangerine", "Marmalade skies", "The sky", "Parrot wing", "Plasticine porters", "Looking-glass ties", "Dream", "Trip", "Dying stars smiling", "Enlightened sky"
};
String[] ancre2 = {
  "Boat", "River", "Tangerine", "Marmalade skies", "The sky", "Parrot wing", "Plasticine porters", "Looking-glass ties", "Dream", "Trip", "Dying stars smiling", "Enlightened sky"
};
String[] ancre3 = {
  "Boat", "River", "Tangerine", "Marmalade skies", "The sky", "Parrot wing", "Plasticine porters", "Looking-glass ties", "Dream", "Trip", "Dying stars smiling", "Enlightened sky"
};


String poem1 = "";
String poem2 = "";
String poem3 = "";

String finalAncre1 = "Picture yourself on a ";
String finalAncre2 = "with ";
String finalAncre3 = "and ";

String startText = "Picture yourself...";

int randomText1, randomText2, randomText3; 

int textFontSize = 16;
int largeurRandom;
int largeurMarge;
int largeurText;
int largeurPoem;
int margeTexte = 20;

int selection1, selection2, selection3;
int turn = -1;

boolean isSelected1, isSelected2, isSelected3;
boolean isLocked1, isLocked2, isLocked3;
boolean isLoaded;
boolean isEllapsed;
boolean isVanished;
boolean isStarted;


PImage img1, img2, img3;

int startTime;
int duration = 5000;

void setup() {

  size(1366,768, OPENGL);
  noStroke();

  font = loadFont("hel.vlw");
  textFont(font, textFontSize);

  y = height/2;

  largeurRandom = round(width/2);
  largeurMarge = width-largeurRandom;
}

void draw() {

  positionerTexte();
  positionerFond();

  if (isStarted) { 

    if (isLoaded) {
      tint(255, alphaImage);
      if (!isEllapsed && alphaImage <= 255) alphaImage++;
      image(img1, largeurRandom, 0, width-largeurRandom, height);
      image(img2, largeurRandom, 0, width-largeurRandom, height);
      image(img3, largeurRandom, 0, width-largeurRandom, height);
      noTint();

      if (millis() - startTime > duration) {
        isEllapsed = true;
        isVanished = true;
        turn = -1;
        isLocked1 = false;
        isLocked2 = false;
        isLocked3 = false;
        isSelected1 = false;
        isSelected2 = false;
        isSelected3 = false;
        alphaImage--;
        if (alphaImage <= 0) {
          isLoaded = false;
          isEllapsed = false;
          poem1 = "";
          poem2 = "";
          poem3 = "";
          largeurPoem = 0;
        }
      }
    } else alphaImage = 0;


    if (!isVanished) {
      if (alphaPoem <= 255) alphaPoem++;
    } else {
      if (alphaPoem >= 0) alphaPoem--;
    }

    fill(255, alphaPoem);
    text(poem1, xPoem1, y) ; 
    text(poem2, xPoem2, y) ;
    text(poem3, xPoem3, y) ;

    fill(0);
    text(ancre1[randomText1], xText1, y);
    text(ancre2[randomText2], xText2, y);
    text(ancre3[randomText3], xText3, y);
  } else startScreen();
}


void startScreen() {

  fill(0);
  text(startText, width/4-textWidth(startText)/2, height/2);
}

void positionerFond() {

  fill(255);
  rect(0, 0, largeurRandom, height);

  fill(0);
  rect(largeurRandom, 0, largeurMarge, height);
}

void mousePressed() {

  isStarted = true;

  if (mouseX >= xText1 && mouseX <= xText1+textWidth(ancre1[randomText1]) && mouseY <= y && mouseY >= y-textFontSize) { //textedroite1
    turn++;
    if (turn == 0) {
      isSelected1 = true;
      isVanished = false;
    } else if (turn == 1) {
      isSelected2 = true;
    } else {
      isSelected3 = true;
    }


    println(largeurPoem);

    if (isSelected1 && !isLocked1) { //if (boolean)
      poem1 = finalAncre1+ancre1[randomText1].toLowerCase();
      img1 = loadImage(ancre1[randomText1]+EXT);
      isLocked1 = true;
    }

    if (isSelected2 && !isLocked2) {
      poem2 = finalAncre2+ancre1[randomText1].toLowerCase();
      img2 = loadImage(ancre1[randomText1]+EXT);
      isLocked2 = true;
    }

    if (isSelected3 && !isLocked3) {
      poem3 = finalAncre3+ancre1[randomText1].toLowerCase();
      img3 = loadImage(ancre1[randomText1]+EXT);
      isLocked3 = true;
    }


    randomText1 = round(random(0, ancre1.length-1));
    randomText2 = round(random(0, ancre2.length-1)); 
    randomText3 = round(random(0, ancre3.length-1));
  } 

  if (mouseX >= xText2 && mouseX <= xText2+textWidth(ancre2[randomText2]) && mouseY <= y && mouseY >= y-textFontSize) { 

    turn++;

    if (turn == 0) {
      isSelected1 = true;
      isVanished = false;
    } else if (turn == 1) {
      isSelected2 = true;
    } else {
      isSelected3 = true;
    }

    if (isSelected1 && !isLocked1) {
      poem1 = finalAncre1+ancre2[randomText2].toLowerCase();
      img1 = loadImage(ancre2[randomText2]+EXT);
      isLocked1 = true;
    }

    if (isSelected2 && !isLocked2) {
      poem2 = finalAncre2+ancre2[randomText2].toLowerCase();
      img2 = loadImage(ancre2[randomText2]+EXT);
      isLocked2 = true;
    }

    if (isSelected3 && !isLocked3) {
      poem3 = finalAncre3+ancre2[randomText2].toLowerCase();
      img3 = loadImage(ancre2[randomText2]+EXT);
      isLocked3 = true;
    }

    randomText1 = round(random(0, ancre1.length-1));
    randomText2 = round(random(0, ancre2.length-1)); 
    randomText3 = round(random(0, ancre3.length-1));
  }

  if (mouseX >= xText3 && mouseX <= xText3+textWidth(ancre3[randomText3]) && mouseY <= y && mouseY >= y-textFontSize) { 

    turn++;

    if (turn == 0) {
      isSelected1 = true;
      isVanished = false;
    } else if (turn == 1) {
      isSelected2 = true;
    } else {
      isSelected3 = true;
    }

    if (isSelected1 && !isLocked1) {
      poem1 = finalAncre1+ancre3[randomText3].toLowerCase();
      img1 = loadImage(ancre3[randomText3]+EXT);
      isLocked1 = true;
    }

    if (isSelected2 && !isLocked2) {
      poem2 = finalAncre2+ancre3[randomText3].toLowerCase();
      img2 = loadImage(ancre3[randomText3]+EXT);
      isLocked2 = true;
    }

    if (isSelected3 && !isLocked3) {
      poem3 = finalAncre3+ancre3[randomText3].toLowerCase();
      img3 = loadImage(ancre3[randomText3]+EXT);
      isLocked3 = true;
    }

    randomText1 = round(random(0, ancre1.length-1));
    randomText2 = round(random(0, ancre2.length-1)); 
    randomText3 = round(random(0, ancre3.length-1));
  }

  if (turn == 2) {

    isLoaded = true;
    startTime = millis();
  }

}

void positionerTexte() {

  xText1 += (xText1Cible-xText1) * vitesse;
  xText2 += (xText2Cible-xText2) * vitesse;
  xText3 += (xText3Cible-xText3) * vitesse;

  xPoem1 += (xPoem1Cible-xPoem1) * vitesse;
  xPoem2 += (xPoem2Cible-xPoem2) * vitesse;
  xPoem3 += (xPoem3Cible-xPoem3) * vitesse;  

  largeurText = round(textWidth(ancre1[randomText1])+textWidth(ancre2[randomText2])+textWidth(ancre3[randomText3])+margeTexte*2); 

  xText1Cible = round((largeurRandom-largeurText)/2);
  xText2Cible = xText1 + textWidth(ancre1[randomText1]) + margeTexte ;
  xText3Cible = xText2 + textWidth(ancre2[randomText2]) + margeTexte ;

  if (textWidth(poem2) != 0) xPoem1Cible = xPoem2Cible - textWidth(poem1)- margeTexte/3;
  else xPoem1Cible = width*3/4 - textWidth(poem1)/2 ; 

  if (textWidth(poem3) != 0) xPoem2Cible = width*3/4 - textWidth(poem2)/2 ; 
  else {
    float largeur1et2 = textWidth(poem1)+textWidth(poem2)+margeTexte/3;
    xPoem1Cible = width*3/4 - largeur1et2/2 ; 
    xPoem2Cible = xPoem1Cible + textWidth(poem1) + margeTexte/3;
  }

  float largeur1et2et3 = textWidth(poem1)+textWidth(poem2)+textWidth(poem3)+(margeTexte*2)/3;
  xPoem1Cible = width*3/4 - largeur1et2et3/2 ; 
  xPoem2Cible = xPoem1Cible + textWidth(poem1) + margeTexte/3; 
  xPoem3Cible = xPoem2Cible + textWidth(poem2) + margeTexte/3;
}


