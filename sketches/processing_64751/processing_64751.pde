
// COLOR CLOCK with PROCESSING (practice)
// 
// refer < http://thecolourclock.co.uk/ > 
//   nice site, i like. 

PFont font;
int r, g, b;
boolean flag = false;

void setup() {
  size(800, 400);
  font = loadFont("Calibri-48.vlw");
  textFont(font, 48);
  colorMode(RGB, 255, 255, 255);
  r = 181;
  g = 250;
}

void draw(){
  int width2 = width / 2;
  int height2 = height / 2;
  
  String number[] = new String[] {
    "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
    "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
    "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
    "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
    "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",
    "51", "52", "53", "54", "55", "56", "57", "58", "59"};
    
  int h = hour();    // Values from 0 - 23
  int m = minute();  // Values from 0 - 59
  int s = second();  // Values from 0 - 59

  if( s == 0) {
      if( flag == false ) {
          flag = true;
          r = int( random(0, 255) );
          g = int( random(0, 255) );
      }
  }
  else {
      flag = false;
  }
  b = int((float(s) * 4.32));
  
  background(r, g, b);
  messageString();
  
  textSize(50);
  text(number[h] + ":", (width/2)-70, height/2);
  text(number[m] + ":", (width/2), height/2);
  text(number[s], (width/2)+70, height/2);

  text("#" + hex(r, 2) + hex(g, 2) + hex(b, 2), width2-70, height2+70);
}

void messageString() {
  textSize(18);
  text("refer < http://thecolourclock.co.uk/ > nice site. i like. ", 10, 20); 
}

void keyPressed() {
  try {
    saveFrame("screenshot.png");
  } 
  catch (Exception e) {
  }
}

