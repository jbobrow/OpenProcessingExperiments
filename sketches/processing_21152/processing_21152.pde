
import interfascia.*;

int ClearbuttonX = 30;
int ClearbuttonY = 400;
int SearchbuttonX = 75;
int SearchbuttonY = 400;
int buttonWidth = 40;
int buttonHeight = 17;


String title = "THE MEALMAKER";
String subhead = "MAKING MEALS / SAVING LEFTOVERS";
String CAT1 = "CUISINE";
String CAT2 = "MEAT";
String CAT3 = "VEGETABLES";
String CAT4 = "FRUIT";


PFont font;


GUIController c;
IFButton b1, b2;
IFCheckBox x1, x2, x3;

void setup() {
  size(900,450);
  background(250);




  c = new GUIController (this);

  b1 = new IFButton ("Clear", ClearbuttonX, ClearbuttonY, buttonWidth, buttonHeight);
  b2 = new IFButton ("Search", SearchbuttonX, SearchbuttonY, buttonWidth, buttonHeight);
  x1 = new IFCheckBox("American", 30, 175);
  x2 = new IFCheckBox("Chinese", 30, 225);
  x3 = new IFCheckBox("Italian", 30, 275);

  b1.addActionListener(this);
  b2.addActionListener(this);
  x1.addActionListener(this);
  x2.addActionListener(this);
  x3.addActionListener(this);

  c.add (b1);
  c.add (b2);
  c.add (x1);
  c.add (x2);
  c.add (x3);
  
}

void draw() {
  rectMode(CORNERS);
  rect(0,0,width,15);
  fill(0);
  smooth();
  
  font = loadFont("HelveticaNeue-Bold-48.vlw");
  smooth();
  textFont(font,36); //MEAL MAKER
  text(title,30,70);

  textFont(font,20); //SUBHEAD
  text(subhead,30,100);
  
  font = loadFont("HelveticaNeue-Medium-48.vlw");
  smooth();

  textFont(font,13); //CUISINE
  text(CAT1,30,150);

  textFont(font,13); //MEAT
  text(CAT2,180,150);
  
  textFont(font,13); //VEGETABLES
  text(CAT3, 320,150);
  
  textFont(font,13); //FRUIT
  text(CAT4,480,150);
}

void actionPerformed (GUIEvent e) {
  if (e.getSource() == b1) {
    println("Button one was clicked");
  } 
  else if (e.getSource() == b2) {
    println("Button two was clicked");
  }
  
  if (e.getSource() == x1) {
		if (x1.isSelected()) {
			println("Checked");
		} else {
			println("Unchecked");
}
}
}


