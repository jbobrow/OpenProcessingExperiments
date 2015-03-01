
PFont font;
String letters = "";
String q1 = "";
int red = 0;
int green = 0;
int blue = 0;




void setup() {
  size(500,500);
  background(red, green, blue);
  font = loadFont("Serif-48.vlw");
  textFont(font);
  textAlign(CENTER);
}

void draw() {
  background(red+50, green+50, blue+50);
text(letters, 50, 50);
String q1 = "Do you know the colors of Christmas?";
textSize(34);
text(q1, 10, 10, 500, 500);
}

void keyPressed() {
  if ((key == ENTER) || (key ==RETURN)) {
    letters = letters.toLowerCase();
    println(letters);
    if(letters.equals("green")) {
      green = 255;
      blue = 100;
      red = 0;
      String q1 = "You're so smar";
    } else if (letters.equals("red")) {
      red = 255;
      green = 20; 
      blue = 10; 
    }
    letters = "";
  } else if (( key > 31) && (key != CODED)) {
    letters = letters +key;
  }
}



