
import static javax.swing.JOptionPane.*;
void setup() {
  size(1366, 768);
  noSmooth();
  background(0);
  stroke(153);
  turnright();
  turnright();
  turnleft();
}

String incrementstr = showInputDialog(null, "Line increment (int between 1 and 50), lower number equals smaller line.", "Increment", QUESTION_MESSAGE);
int increment = Integer.parseInt(incrementstr);
String direction = "down";
int numl = 0;
int xold = 683;
int yold = 334;
int turn = 0;
String directionlr = "110";
String temp = "0";
String tempsubl = "df";
String tempsubr = "df";

void draw() {
  delay(300);

  int lang = directionlr.length();
  char cenchar = directionlr.charAt(lang/2);
  tempsubl = directionlr.substring(0, (lang/2));
  tempsubr = directionlr.substring(lang/2+1);
  temp = directionlr;

  if (cenchar == '1') {
    temp = tempsubl + "0" + tempsubr;
  } else if (cenchar == '0') {
    temp = tempsubl + "1" + tempsubr;
  }

  directionlr = directionlr + "1" + temp;
  int charnumb = lang; 
  while (charnumb <= directionlr.length ()-1) {
    if (directionlr.charAt(charnumb) == '1') {
      turnright();
      charnumb = charnumb+1;
    } else if (directionlr.charAt(charnumb) == '0') {
      turnleft();
      charnumb = charnumb+1;
    }
  }
}




void turnleft() {

  if (direction == "down") {
    line(xold, yold, xold+increment, yold);
    xold = xold+increment;
    direction = "right";
  } else if (direction == "right") {
    line(xold, yold, xold, yold-increment);
    yold = yold-increment;
    direction = "up";
  } else if (direction == "up") {
    line(xold, yold, xold-increment, yold);
    xold = xold-increment;
    direction = "left";
  } else if (direction == "left") {
    line(xold, yold, xold, yold+increment);
    yold = yold+increment;
    direction = "down";
  }
}

void turnright() {
  if (direction == "down") {
    line(xold, yold, xold-increment, yold);
    xold = xold-increment;
    direction = "left";
  } else if (direction == "right") {
    line(xold, yold, xold, yold+increment);
    yold = yold+increment;
    direction = "down";
  } else if (direction == "up") {
    line(xold, yold, xold+increment, yold);
    xold = xold+increment;
    direction = "right";
  } else if (direction == "left") {
    line(xold, yold, xold, yold-increment);
    yold = yold-increment;
    direction = "up";
  }
}



