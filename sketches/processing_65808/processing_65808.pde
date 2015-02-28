
//<!--Hello Processing -->
//<script src="jquery-1.6.4.min.js"></script>
//<script type="text/javascript" src="processing-1.3.6.js"></script>
//<script type="text/processing" data-processing-target="targetcanvas">
// COLOR CLOCK 
PFont font;
int r, g, b;
boolean flag = false;
int width2;
int height2;
int width4;
int height4;

void setup() {
//  size(screenWidth, screenHeight);  // Android
  size(400, 400);
  font = loadFont("Calibri-48.vlw");
  textFont(font, 48);
  colorMode(RGB, 255, 255, 255);
  r = 181;
  g = 250;
}

String number[] = new String[] {
    "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
    "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
    "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
    "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
    "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",
    "51", "52", "53", "54", "55", "56", "57", "58", "59"};
    
void draw(){
  width2 = width / 2;
  height2 = height / 2;
  width4 = width / 4;
  height4 = height / 4;
  
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
  
  background(255);
//  messageString();
  
  fill(r, g, b);
  rect(width4, height4, 2*width4, 2*height4);
  
  fill(255-r, 255-g, 255-b);
  textSize(50);
  text(number[h] + ":", width2, height2);
  text(number[m], width2+70, height2);

  text("#" + hex(r, 2) + hex(g, 2) + hex(b, 2), width2-70, height2+70);

  textSize(150);
  text(number[s], 10, height2);

}

void messageString() {
  textSize(18);
  fill(0);
  text("Color Clock ", width4, 4*height4); 
}

void keyPressed() {
  try {
    saveFrame("screenshot.png");
  } 
  catch (Exception e) {
  }
}
//</script>
//<!--ColorClock processing -->
//<canvas id="targetcanvas" style="border: 1px solid black;"></canvas>


