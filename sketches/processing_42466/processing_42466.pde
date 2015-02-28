

PFont Impact;
String txt1 = "EPISODE IV:";
String txt2 = "A NEW HOPE";
String txt3 = "It is a period of civil war.";
String txt4 = "Rebel spaceships, striking";
String txt5 = "from a hidden base, have won";
String txt6 = "their first victory against";
String txt7 = "the evil Galactic Empire.";
String txt8 = "";
String txt9 = "During the battle, Rebel";
String txt10 = "spies managed to steal secret";
String txt11 = "ans to the Empire's";  
String txt12 = "ultimate weapon, the DEATH ";  
String txt13 = "STAR, an armored space";
String txt14 = "station with enough power to";
String txt15 = "destroy an entire planet.";





int heightTxt = 300;
int widthTxt = 30;
float y = 300;
 
void setup() {
  size (400, 300);
  smooth();
 
  Impact = loadFont("Impact-48.vlw");
}
 
void draw() {
  background(0);
  textFont(Impact, 20);
  noStroke();
   fill(255,255,0);
   textAlign(CENTER);
  text(txt1, 50, y, heightTxt, widthTxt);
  text(txt2, 50, y+30, heightTxt, widthTxt);
  text(txt3, 50, y+60, heightTxt, widthTxt);
  text(txt4, 50, y+90, heightTxt, widthTxt);
  text(txt5, 50, y+120, heightTxt, widthTxt);
  text(txt6, 50, y+150, heightTxt, widthTxt);
  text(txt7, 50, y+180, heightTxt, widthTxt);
  text(txt8, 50, y+210, heightTxt, widthTxt);
  text(txt9, 50, y+240, heightTxt, widthTxt);
  text(txt10, 50, y+270, heightTxt, widthTxt);
  text(txt11, 50, y+300, heightTxt, widthTxt);
  text(txt12, 50, y+330, heightTxt, widthTxt);
  text(txt13, 50, y+360, heightTxt, widthTxt);
  text(txt14, 50, y+390, heightTxt, widthTxt);
  text(txt15, 50, y+420, heightTxt, widthTxt);
  if (y < -360) {
    y = 300;
  }
  y = y - 0.3;
}


