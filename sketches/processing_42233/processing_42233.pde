
PFont Garamond;
String txt1 = "“Prendi una stella cadente, con tatto";
String txt2 = "Alla mandragola dona un bambino.";
String txt3 = "Gli anni passati, che fine hanno fatto?";
String txt4 = "Chi taglia al Diavolo il piede caprino?";
String txt5 = "Delle sirene come odo il canto?";
String txt6 = "E dell’invidia com’evito il pianto?";
String txt7 = "Ancora, ancora:";
String txt8 = "qual è il mulinello";
String txt9 = "Che spinge l’onesto oltre ogni tranello?";
String txt10 = "Di cosa si tratti decidilo tu,";
String txt11 = "E aggiungi, a questa, una strofa in più.”";
int heightTxt = 300;
int widthTxt = 30;
float y = 300;

void setup() {
  size (400, 300);
  smooth();
  Garamond = loadFont("Garamond-48.vlw");
}

void draw() {
  background(255);
  textFont(Garamond, 19);
  noStroke();
  fill(0);
  text(txt1, 50, y, heightTxt, widthTxt);
  text(txt2, 50, y+30, heightTxt, widthTxt);
  text(txt3, 50, y+60, heightTxt, widthTxt);
  text(txt4, 50, y+90, heightTxt, widthTxt);
  text(txt5, 50, y+120, heightTxt, widthTxt);
  text(txt6, 50, y+150, heightTxt, widthTxt);
  text(txt7, 50, y+180, heightTxt, widthTxt);
  text(txt8, 50, y+210, heightTxt, widthTxt);
  text(txt9, 50, y+240, heightTxt, widthTxt);
  text(txt10, 50, y+300, heightTxt, widthTxt);
  text(txt11, 50, y+330, heightTxt, widthTxt);

  if (y < -360) {
    y = 300;
  }
  y = y - 0.3;
}


