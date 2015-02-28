
/*****************************************************************************************************************************************
 Sentence to Curve Generator
 Xiaoyang Kao - 3D Art - October 14 2011
 Added screen rezize functionality on October 26 2011
 Enter any phrase or sentence and the program will convert and draw those into curves
 
 The program flow is like this: 
 Collect entered data -> parse ASCII string into integers and store in array -> draw random bezier curves from values in that array
 Each ASCII symbol (letters, periods, spaces, numbers.. etc) is paired with a decimal value that is determined with the int() function
 Try to enter more than ~20 characters for varied curves (internal limit of 100 to avoid overload)ers, 
 
 There is an inherent issue with the method of animating beziers: since the animation is a just bunch of little circles moving on the path, they will ocassionally split up as the speed increases
 This problem can be improved by changing variable ballSpeed, which controls how many ellipses are drawn (1/ballSpeed is the number of ellipses). This will slow the animation down, however.
 
 Future improvements:
 Animate more than one curve at the same time (requires many arrays which is too complicated at the moment)
 fix ball-separating issue
 reverse-fade when alpha is at max
 background
 change color, different shapes
 draw text of input along the bezier curves (atan2/bezierTangent)
 
 
 User-controllable variables:
 ballSpeed - speed of ball (indirectly controls density of ellipses)
 bezierCountMax - maximum number of beziers before sketch stops (preset at 30)
 The checkbox at the start screen lets you choose whether you want to display the bezier curve or not
 The second checkbox lets you select whether you want fading or not
 The slider lets you select how many curves to draw
 ****************************************************************************************************************************************/

color redColor = color(255, 0, 0);
color goldColor = color(255, 216, 0);
color greenColor = color(0, 143, 14);
color blueColor = color(79, 136, 255);
color purpleColor = color(178, 0, 255);
color yellowColor = color(255, 255, 0);
color limeColor = color(0, 255, 116);

color setColor;
String inputText = "enter text";
int clearText = 0;
int menu = 0;
int textLength = 0; // stores length of sentence
int ASCIIlistY = 50; // ASCII decimal list start column Y (adds in for loop)
int separationASCIIlist = 15; // ASCII decimal list separation (x axis, pixel)
int showBezier = 0; // display bezier; 0 is not show, 1 is show
int bezierWidth = 0; // width in pixels of bezier curve
int bezierCount = 1; // counts number of curves on screen
int bezierCountMax = 30; // maximum number of beziers
int sliderX = 1160; // x position of slider
int enableFade = 0; // enable fade; 0 is disable (default), 1 is enable
int ellipseNumberFixed = 0;
int ellipseNumber = 0;
int ellipseNumberMap = 0;
float x = 0.0;
float y = 0.0;
float steps = 1;
float t =0;
float ballSpeed = 0.005; // ball speed; 0.005 normal
float beginX = 900;
float beginY = 500;
float endY;
float endX;
float bezierRandomX;
float bezierRandomY;
float bezierRandomXtwo;
float bezierRandomYtwo;


char[] charArray = new char[100];
int[] intArray = new int[100];
color[] colorArray = new color[7];
int[] intArrayMappedX = new int[100];
int[] intArrayMappedY = new int[100];
PFont font;


void setup() {
  size(900, 500); // set screen size to fullscreen
  font = createFont("Sans Serif", 30);
  textFont(font, 40);
  textAlign(CENTER, CENTER);
  colorArray[0] = redColor; // assigns colors to color array
  colorArray[1]  = goldColor;
  colorArray[2]  = greenColor;
  colorArray[3]  = blueColor;
  colorArray[4]  = purpleColor;
  colorArray[5] = limeColor;
  colorArray[6] = yellowColor;
  smooth(); // antialias all shapes
}

void draw() {
  if (menu == 0) {
    background(0);
    textFont(font, 40);
    text(inputText, 0, 0, width, height);

    stroke(255);
    noFill();
    rect(900-30, 500-(500-10), 15, 15); // show bezier option square
    rect(900-30, 500-(500-92), 15, 15); // enable fade
    fill(255);
    textFont(font, 13);
    text("Show bezier path", 900-84, 500-(500-18));
    text("Number of curves:", 900-84, 500-(500-50));
    text("Enable fading", 900-75, 500-(500-100));
    text(bezierCountMax, 900-20, 500-(500-50));

    noStroke();
    fill(180);
    rect(900-120, 500-(500-65), 100, 10);
    fill(255);
    rect(sliderX, 500-(500-65), 10, 10);
    if (mousePressed == true && mouseX>900-180 && mouseX<900-10 && mouseY<500-(500-85) && mouseY>500-(500-55)) { // slider function
      sliderX=mouseX; // set x-value of slider to mouseX
      if (sliderX<900-120) {
        sliderX=900-120;
      } // these two if-statements set limits for the slider
      if (sliderX>900-30) {
        sliderX=900-30;
      }
    }
    bezierCountMax = int(map(sliderX, 900-120, 900-30, 10, 50)); // set maximum number of beziers to a value mapped from x-value of slider

    if (mousePressed == true && mouseX>900-30 && mouseX<900-15 && mouseY>500-(500-10) && mouseY<500-(500-25) && showBezier == 0) {
      showBezier = 1;
      delay(100); // time buffer
    } 
    else if (mousePressed == true && mouseX>900-30 && mouseX<900-15 && mouseY>500-(500-10) && mouseY<500-(500-25) && showBezier == 1) {
      showBezier = 0; 
      delay(100); // time buffer
    }
    if (showBezier == 1) {
      stroke(255);
      line(900-30, 500-(500-25), 900-15, 500-(500-10)); // checkmark for showBezier box
    }


    if (mousePressed == true && mouseX>900-30 && mouseX<900-15 && mouseY>500-(500-92) && mouseY<500-(500-107) && enableFade == 0) {
      enableFade = 1;
      delay(100); // time buffer
    }
    else if (mousePressed == true && mouseX>900-30 && mouseX<900-15 && mouseY>500-(500-92) && mouseY<500-(500-107) && enableFade == 1) {
      enableFade = 0; 
      delay(100); // time buffer
    }
    if (enableFade == 1) {
      stroke(255);
      line(900-30, 500-(500-107), 900-15, 500-(500-92)); // checkmark for enableFade box
    }
  } // menu 1

  if (menu!=0) { // loop after text is entered
    if (t<=1) { // loop this until t is less than one
      decodeSentence();
    } 
    if (t>1) { // if t is greater than 1 (bezier is drawn)
      generateBezier(); // regenerate bezier values
      t=0; // reset t
      bezierCount++; // increment bezierCount (number of beziers)
      if (bezierCount>bezierCountMax) { // if the number of beziers is greater than the max set by user
        save("curve.png");
        noLoop(); // stop program (loop)
      }
    }
  }
}


void keyPressed() { // called whenever a key is pressed
  if (keyCode == BACKSPACE && menu == 0) {
    if (inputText.length() > 0) {
      inputText = inputText.substring(0, inputText.length()-1); // removes last character
    }
  } 
  else if (clearText == 0  && menu == 0) {
    inputText = ""; // sets input to nothing
    inputText = inputText + key; // adds key pressed to inputText string
    clearText++; // text is only cleared once because clearText is not 0
  }
  else if (keyCode == DELETE  && menu == 0) { // delete to clear all text
    inputText = "";
  }
  else if (keyCode != ENTER  && menu == 0) { // if key pressed is not equal to enter (letter keys)
    inputText = inputText + key; // adds character to string
  }
  else if (key == ENTER  && menu == 0) {
    background(0); // clear background
    textSize(15);
    textAlign(LEFT, TOP); // display input text at top left
    text(inputText, 10, 10);  
    inputText = inputText.toLowerCase(); // converts all characters in string to lower case
    textLength = inputText.length(); // text length is the number of characters in stirng
    for (int x = 0; x<textLength; x++) { // generates character and integer array 
      charArray[x] = inputText.charAt(x); // writes individual characters into a char array
      intArray[x] = int(charArray[x]); // converts character array values into integers then writes into array
      if (intArray[x] == 32 || intArray[x] == 46 || intArray[x] == 65535) { // checks if any characters are non-letters (eg. shift, space, period)
        intArray[x] = int(random(97, 120)); // converts them into a random integer
      }
      intArrayMappedX[x] = int(map(intArray[x], 96, 123, 0, 900)); // map integer array into coordinate values that uses full canvas size
      intArrayMappedY[x] = int(map(intArray[x], 96, 123, 0, 500));
    }
    for (int x = 0; x<textLength; x++) { // lists all ASCII characters and decimals
      textSize(11);
      text(charArray[x], 8, ASCIIlistY); // prints character in array[x] in a column
      text(" = ", 16, ASCIIlistY);
      text(intArray[x], 28, ASCIIlistY);
      ASCIIlistY+=separationASCIIlist; // y-value for column is incremented
    }
    ellipseNumberFixed = int(1/ballSpeed); // set number of ellipses according to user set ball speed (used to get alpha values for fade)
    generateBezier();
    delay(100);
    menu = 1;
  }
}

void decodeSentence() {
  noStroke();
  steps++;
  if (steps<10000&&t<=1) {
    t+=ballSpeed; // t is incremented according to ball speed
    x = bezierPoint(beginX, bezierRandomX, bezierRandomXtwo, endX, t); // evaluates the bezier generated at point t
    y = bezierPoint(beginY, bezierRandomY, bezierRandomYtwo, endY, t);
  }
  if(enableFade == 1) {
    ellipseNumber = int(t/ballSpeed); // counts number of ellipses in the bezier being drawn
    ellipseNumberMap = int(map(ellipseNumber, 0, ellipseNumberFixed, 10, 100)); // maps number of ellipses into alpha value range (0-255)
    fill(setColor, ellipseNumberMap); 
  }
  ellipse(x, y, bezierWidth, bezierWidth); // draw circle at the x and y value
}

void generateBezier() {
  noFill();
  if (showBezier == 1) { // checks if user selected show-bezier box at start
    stroke(255);
  } 
  else {
    noStroke();
  }
  beginX = intArrayMappedX[int(random(textLength))]; // sets the begin and end coordinates to a random mapped value
  beginY = intArrayMappedY[int(random(textLength))]; 
  endX = intArrayMappedX[int(random(textLength))];
  endY = intArrayMappedY[int(random(textLength))];
  bezierRandomX = intArrayMappedX[int(random(textLength))]; // anchor points also determined by random mapped value
  bezierRandomY = intArrayMappedY[int(random(textLength))];
  bezierRandomXtwo = intArrayMappedX[int(random(textLength))];
  bezierRandomYtwo = intArrayMappedY[int(random(textLength))];
  bezier(beginX, beginY, bezierRandomX, bezierRandomY, bezierRandomXtwo, bezierRandomYtwo, endX, endY); // draw bezier (no stroke unless chosen)
  setColor = (colorArray[int(random(5))]); // choose fill color
  fill(setColor);
  bezierWidth = int(random(4, 15)); // random stroke width
}




