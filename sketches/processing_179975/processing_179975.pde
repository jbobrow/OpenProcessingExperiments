
/**
 *Design Brief generator
 *06/01/15
 adpated from Monster Name Generator by Jared Bauer
 http://www.openprocessing.org/sketch/4590
 */
 
String text = "";


void setup() {
  size(600, 300);
  smooth();
  background(0, 0, 0); //r, g, b
}

void draw() { 
  fill(#ff0000);
  rect(170, 220, 270, 30);
  fill(255);
  textSize(14);
  text( "click here for your design challenge", 180, 240);

  if (mousePressed ) {
    background(0, 0, 0);
    int r = 255; //int(random(0,255));
    int g = 255; //int(random(0,255));
    int b = 255; //int(random(0, 255));
    String printName =  makeName();

    fill(r, g, b);
    // textFont(fontA, 32);
    textSize(24);
    text( printName, width/2 - 100, height/2);
  }
  delay(100);
}

String makeName() {

  String title = "Brand: ";
  String brand = brand();
  String other = "Thing: ";
  String thing = thing();
  String objectName = title+brand+"\n"+other+thing;
  println(title);

  return objectName;
}

String brand() {

  String word = ""; 
  int ran = int(random(1, 9));

  if (ran == 1) {
    word = "Kinder ";
  } 
  if (ran == 2) {
    word = "Apple ";
  }
  if (ran == 3) {
    word= "Manfrotto ";
  }

  if (ran == 4) {
    word = "Lego ";
  }
  if (ran == 5) {
    word = "Evian ";
  }
  if (ran == 6) {
    word = "Heinz ";
  }
  if (ran == 7) {
    word = "Victorinox ";
  }
  if (ran == 8) {
    word = "Jaguar ";
  }
  if (ran == 9) {
    word = "Mini Cooper ";
  }


  println("title: " + word);
  return word;
}

String thing() {
  String word = "";
  int pre = int(random(1, 9));

  if (pre == 1) {
    word = "Lemon Squeezer";
  }

  if (pre == 2) {
    word = "Door Stop";
  }
  if (pre == 3) {
    word = "Nut Cracker";
  }

  if (pre == 4) {
    word = "Hand Sanitiser";
  }
  if (pre == 5) {
    word = "Tape Dispenser";
  }
  if (pre == 6) {
    word = "Candle Holder";
  }
  if (pre == 7) {
    word = "Cable Tidy";
  }
  if (pre == 8) {
    word = "Egg Cup";
  }
  if (pre == 9) {
    word = "Measuring Tool";
  }
  println("thing: " + word);

  return word;
}

