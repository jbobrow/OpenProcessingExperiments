
//import processing.pdf.*;

int generations = 0; //define int called generations containing 0
String phrase = "F"; //define string called phrase 
float len = 100;
float angle = PI/5;
//float angleMult = 1.5;

void setup() {
  size(1000, 1000); 
  background(255);
  stroke(0);
  println("First phrase is:"+phrase); //print the line "First phrase is: A
  noStroke();
  smooth();
  // beginRecord(PDF, "l-sys_"+second()+"_"+minute()+"_"+hour()+"_"+day()+"_"+month()+"_"+year());
}

void draw() {
  makePhrase(phrase);
  pushMatrix();
  translate(width/2, height/2);
  drawPhrase(phrase);
  rotate(PI/4);
  drawPhrase(phrase);
  rotate(PI/4);
  drawPhrase(phrase);
  rotate(PI/4);
  drawPhrase(phrase);
  rotate(PI/4);
  drawPhrase(phrase);
  rotate(PI/4);
    drawPhrase(phrase);
  rotate(PI/4);
    drawPhrase(phrase);
  rotate(PI/4);
  drawPhrase(phrase);
  popMatrix();
}

void mousePressed() {
  phrase = makePhrase(phrase);
  // println (generations + ": " +phrase);
  fill(255, 90);
  rect(0, 0, width, height);
}

void drawPhrase (String input) {
  int stringLength = input.length();
  char c;
  for (int i=1; i<stringLength; i++) {
    c = input.charAt(i);
    switch(c) {
    case 'F':
      rect(0, 0, len, 0.25);
      fill(0);
      break;
    case 'X':
      translate(len, 0);
      break;
    case '[':
      pushMatrix();
      break;
    case ']':
      popMatrix();
      break;
    case '+':
      // for (int j=1; i<angleMult; i++){
      rotate(angle);
      break;
      //  }
    case '-':
      rotate(-angle);
      break;
    }
  }
}

String makePhrase(String input) { //Function called makePhrase defined as a string type
  String output = ""; //outputting a certain text/numerical phrase
  generations++;
  //println ("The input is this long: "+input.length());
  int stringLength = input.length();
  for (int i=0;i<stringLength;i++) { //output (above) will be a number that begins with 0, will only be printed when less tha the string length, adding 1 each time
    char c = input.charAt(i);
    switch(c) {
    case 'F':
      //println("This is F");
      output+="X[[+F]][[-F]]";
      break;
    case 'X':
      //println("This is X");
      output+="X";
      break;
    case '[':
      //println("This is [");
      output+=c;
      break;
    case ']':
      //println("This is ]");
      output+=c;
      break;
    case '+':
      //println("This is +");
      output+=c;
      break;
    case '-':
      //println("This is -");
      output+=c;
      break;
    default:
      //println("WTF is this");
      break;
    }
    //println(c); //print the above output (variable i)
  }
  //println(output);
  return output;
}

void keyPressed() {
  if (key == '1') {
    save("l-sys_"+second()+"_"+minute()+"_"+hour()+"_"+day()+"_"+month()+"_"+year()+"3.jpeg");
    //    endRecord();
  }
}


