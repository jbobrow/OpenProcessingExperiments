
//required variables


String[] page;
String[] strIntConf;
String[] strAge;
float[] floatIntConf;
int[] intAge;
//used to hold width of age bar width
float[] ageBarWidth;
//used to hold width of the internet conifdence bar width
float[] intConfBarWidth;
//used to hold the y values of the two bars
float[] ageBarY;
float[] intConfBarY;

//used to hold the colour values of each age bar
int[] cRed;
int[] cGreen;
int[] cBlue;

//stores font
PFont font;


void setup() {

  //loads each line of the .csv file into an element of the page array
  page = loadStrings("filtered.csv");



  //sets up all the other arrays to have the amount of 
  //elements specified by the length of the .csv file
  strIntConf = new String[page.length];
  strAge = new String[page.length];
  floatIntConf = new float[page.length];
  intAge = new int[page.length];
  ageBarWidth = new float[page.length];
  intConfBarWidth = new float[page.length];
  ageBarY = new float[page.length];
  intConfBarY = new float[page.length];
  cRed = new int[page.length];
  cGreen = new int[page.length];
  cBlue = new int[page.length];

  //sets size and background colour
  size(800, 700);
  background(0);
  //loads font
  font = loadFont("ArialMT-48.vlw");
  smooth();

  //splits up each line of the code at the comma to spearate the two data sets 
  for (int i=0; i<page.length;i++) {

    String[] bit = split(page[i], ",");
    strIntConf[i] = bit[0];
    strAge[i] = bit[1];
  }

  //converts the strings into floats and ints
  for (int i=0; i<page.length; i++) {
    floatIntConf[i] = Float.parseFloat(strIntConf[i]);
    intAge[i] = Integer.parseInt(strAge[i]);
  }

  //creates the bar down the middle separating the data sets and bar along the top
  fill(255);
  noStroke();
  rect((((width/2)-4)), 40, 8, (height-65));
  rect(50,40,700,8);
}


void draw() {
  //used to store the y values of each bar
  int y=80;
  int j=80;
  int yText = 50;



  //sets up text headings
  fill(255);
  textSize(25);
  text("Internet conifdence", 80, 25);
  text("Age", 580, 25);
  
  
// if the mouse is in the area of the bar the colour will change to red if not it will remain it's default colour
  for (int i=0; i<page.length;i++) {
    if (mouseX > ((width/2)+4) && mouseX < (((width/2)+4) + ageBarWidth[i]) && mouseY > ageBarY[i] && mouseY < (ageBarY[i] + 30)) {
      cRed[i]=255;
      cGreen[i]=0;
      cBlue[i]=0;
    }else{
      cRed[i]=0;
      cGreen[i]=0;
      cBlue[i]=255;     
    }
  }



 //Draws all the age bars on the screen
    for (int i=0; i<page.length; i++) {
      ageBarY[i] = y; //Stores the current y value in an array so they can be used later in a global variable
      ageBarWidth[i] = map(intAge[i], 0, 100, 0, (width/2)); //maps the age to a value between 0 to the width so i can be used as the width of the bar
      fill(cRed[i],cGreen[i],cBlue[i]);//fills based on if statement above
      rect((width/2)+4, y, ageBarWidth[i], 10);
      textSize(15);
      fill(255);
      text(intAge[i], (410+ageBarWidth[i]), (y+10)); // displays  the text relating to the bar
      y = y + 30;
    }


    for (int i=0; i<page.length;i++) {
      //I switched the "1,0.1875" part because it is minus, and if you switch it the other way around its not working. xD
      intConfBarY[i] = j; //stores current y value
      intConfBarWidth[i] = map(floatIntConf[i], 0, 1, 0, (-(width/2)+60));  //width is negative as the bar has to be drawn the opposite way
      j = j + 30;
    }



    for (int i=0; i<page.length;i++) {

      if (mousePressed == true) {
        //if the mouse presses one of the age bars it draws the corrosponding bar for internet confidence
        if (mouseX > ((width/2)+4) && mouseX < (((width/2)+4) + ageBarWidth[i]) && mouseY > ageBarY[i] && mouseY < (ageBarY[i] + 30)) {
          fill(0, 0, 255);
          rect((width/2)-4, intConfBarY[i], intConfBarWidth[i], 10);
          textSize(15);
          fill(255);
          //displays the text for the related bar
          text(floatIntConf[i], (340+intConfBarWidth[i]), (intConfBarY[i]+10));
        }
      }
    }
  }







