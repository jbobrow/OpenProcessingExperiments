
//Strings
String[][]pewData;//the whole .csv
String[] responses;//the cells I'm interested in

//Initialize quantities
int[] responseYes;//for respondents answering yes
int result;//to tally just the yeses 
int barSize;//intializing the sixe of the bar for later
int margeN;//both the space from the screen's edge and in between bars
int startX, startY;//set up the base for each bar
PFont title;//font of choice

//Set-up
void setup() {
  size(800, 600);//setting the screen size
  title=loadFont("AbadiMT-CondensedExtraBold.vlw");//loading in font file
  responses = loadStrings("barHeight.csv");//loading the .csv

  //Parsing the data
  String[] columnChecker=split(responses[1], ","); //just need to check one row
  int totalColumns=columnChecker.length;//the questions
  int totalRows=responses.length;//the responses
  responseYes=new int[totalColumns];//to count how many said yes for each ?
  pewData=new String[totalColumns][totalRows]; //reversing the col/row setup

  for (int row=1; row<totalRows; row++) {//starting from the first row on
    String[] temp = split(responses[row], ",");//split the data by commas
    for (int column=0; column<totalColumns; column++) {
      //starting from the first column on
      pewData[column][row]=temp[column];//focus on each ?/column
    }
  }

  //Calculating the totals
  for (int column=0; column<totalColumns; column++) {
    //starting from the first column on
    for (int row=1; row<totalRows; row++) {//starting from the first row on
      if (pewData[column][row].equals("yes")) {//if the response is yes
        responseYes[column]=responseYes[column]+1;//count it
      }
    }
  }
  for (int column=0; column<totalColumns; column++) {
    println(responseYes[column]);//to show number of yes responses per ?
  }
  barSize = width/11;//sets the bar size 
  margeN = 114;//space from the edges of the screen and in between bars 
  startX = width/35;//marking where the first bar starts in terms of x 
  startY = height-10;//marking where the first bar starts in terms of y 
  //And, DRAW!
}  
void draw() {
  background(64);//makes the background greyish
  noStroke();//evens out scale behind title
  textFont(title, 72);//font size
  textAlign(CENTER);//centers title
  text("HOW MOBILE R U?", width-400, height-525);//positions title at the top
  
  //List of functions
  increments();//sets the background scale
  clickVideo();//makes the first bar clickable to display more information
  clickSend();//makes the second bar clickable to display more information
  clickPost();//makes the third bar clickable to display more information
  clickBank();//makes the fourth bar clickable to display more information
  clickVideocall();//makes the fifth bar clickable to display more information
  clickCheckin();//makes the sixth bar clickable to display more information
  clickLocative();//makes the seventh bar clickable to display more information
  a ();//to draw the first bar
  b ();//to draw the second bar
  c ();//to draw the third bar
  d ();//to draw the fourth bar
  e ();//to draw the fifth bar
  f ();//to draw the sixth bar
  g ();//to draw the seventh bar
}
void increments() {
  for (int i = 10; i < 600; i = i+100) {
    line(0, i, 800, i);//split the screen to create a scale
    stroke(20);//make it contrast with the background
    strokeWeight(5);//and make it thick 
  }
}
void clickVideo() {
  if (mouseX>startX && mouseX<margeN-startX) {
    //if the mouse is between startX and the end of the bar
    if (mousePressed) {//and you click the mouse
      background(128);//the background gets brighter; erases scale
      textFont(title, 53);//a new, smaller title appears
      textAlign(CENTER);//that's centered
      text("WATCH A VIDEO", width-400, height-558);//gives ? info
      text("1170 OUT OF 1555 RESPONDENTS", width-400, height-505);//gives ? info
      text("75%", width-400, height-450);//and gives %
    }
  } 
}
void clickSend() {
  if (mouseX>margeN+startX && mouseX<margeN*2-startX) {
    //if the mouse is over the bar
    if (mousePressed) {//and you click the mouse
      background(128);//the background gets brighter; erases scale
      textFont(title, 53);//a new, smaller title appears
      textAlign(CENTER);//that's centered
      text("SEND A PHOTO OR VIDEO", width-400, height-558);//gives ? info
      text("666 OUT OF 1555 RESPONDENTS", width-400, height-505);//gives ? info
      text("43%", width-400, height-450);//and gives %
    }
  }
}
void clickPost() {
  if (mouseX>margeN*2+startX && mouseX<margeN*3-startX) {
    //if the mouse is over the bar
    if (mousePressed) {//and you click the mouse
      background(128);//the background gets brighter; erases scale
      textFont(title, 53);//a new, smaller title appears
      textAlign(CENTER);//that's centered
      text("POST A PHOTO OR VIDEO", width-400, height-558);//gives ? info
      text("1220 OUT OF 1555 RESPONDENTS", width-400, height-505);//gives ? info
      text("78%", width-400, height-450);//and gives %
    }
  }
}

void clickBank() {
  if (mouseX>margeN*3+startX && mouseX<margeN*4-startX) {
    //if the mouse is over the bar
    if (mousePressed) {//and you click the mouse
      background(128);//the background gets brighter; erases scale
      textFont(title, 53);//a new, smaller title appears
      textAlign(CENTER);//that's centered
      text("ONLINE BANKING", width-400, height-558);//gives ? info
      text("1261 OUT OF 1555 RESPONDENTS", width-400, height-505);//gives ? info
      text("81%", width-400, height-450);//and gives %
    }
  }
}
void clickVideocall() {
  if (mouseX>margeN*4+startX && mouseX<margeN*5-startX) {
    //if the mouse is over the bar
    if (mousePressed) {//and you click the mouse
      background(128);//the background gets brighter; erases scale
      textFont(title, 53);//a new, smaller title appears
      textAlign(CENTER);//that's centered
      text("VIDEO CALL OR VIDEO CHAT", width-400, height-558);//gives ? info
      text("1463 OUT OF 1555 RESPONDENTS", width-400, height-505);//gives ? info
      text("94%", width-400, height-450);//and gives %
    }
  }
}
void clickCheckin() {
  if (mouseX>margeN*5+startX && mouseX<margeN*6-startX) {
    //if the mouse is over the bar
    if (mousePressed) {//and you click the mouse
      background(128);//the background gets brighter; erases scale
      textFont(title, 53);//a new, smaller title appears
      textAlign(CENTER);//that's centered
      text("CHECK IN TO LOCATIONS", width-400, height-558);//gives ? info
      text("1478 OUT OF 1555 RESPONDENTS", width-400, height-505);//gives ? info
      text("95%", width-400, height-450);//and gives %
    }
  }
}
void clickLocative() {
  if (mouseX>margeN*6+startX && mouseX<margeN*7-startX) {
    //if the mouse is over the bar
    if (mousePressed) {//and you click the mouse
      background(128);//the background gets brighter; erases scale
      textFont(title, 53);//a new, smaller title appears
      textAlign(CENTER);//that's centered
      text("DIRECTIONS/LOCAL RECOMMENDATIONS", width-400, height-558);//gives ? info
      text("1106 OUT OF 1555 RESPONDENTS", width-400, height-505);//gives ? info
      text("71%", width-400, height-450);//and gives %
    }
  }
}
void a () {
  rect (startX, startY, barSize, -responseYes[0]*.33);//drawing the bar
  fill(#FFCC33);//setting the color
  stroke(20);//coloring the line
  strokeWeight(5);//make the lines thick
}

void b () {
  rect (startX+margeN, startY, barSize, -responseYes[1]*.33);//drawing the bar
  stroke(20);//coloring the line
  fill(#C67171);//setting the color
}

void c () {
  rect (startX+margeN*2, startY, barSize, -responseYes[2]*.33);//drawing the bar
  stroke(20);//coloring the line
  fill(#8B4513);//setting the color
}

void d () {
  rect (startX+margeN*3, startY, barSize, -responseYes[5]*.33);//drawing the bar
  stroke(20);//coloring the line
  fill(#1E90FF);//setting the color
  
}
void e () {
  rect (startX+margeN*4, startY, barSize, -responseYes[6]*.33);//drawing the bar
  stroke(20);//coloring the line
  fill(#191970);//setting the color
}
void f () {
  rect (startX+margeN*5, startY, barSize, -responseYes[7]*.33);//drawing the bar
  stroke(20);//coloring the line
  fill(#4B0082);//setting the color
}
void g () {
  rect (startX+margeN*6, startY, barSize, -responseYes[8]*.33);//drawing the bar
  stroke(20);//coloring the line
  fill(#B0171F);//setting the color
}


