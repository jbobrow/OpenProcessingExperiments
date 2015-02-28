
dispData pythonDataDisplay;
dispData htmlDataDisplay;
dispData javaDataDisplay;

String java = "Java";
String python = "Python";
String html = "HTML";

int newCounter = 0;
int time = 0;

void setup()
{
  pythonDataDisplay = new dispData("data/python.txt", color(11, 116, 11));
  javaDataDisplay = new dispData("data/java.txt", color(252, 5, 5));
  htmlDataDisplay = new dispData("data/html.txt", color(19, 30, 137));

  PFont font;
  font = loadFont("CenturyGothic-Bold-10.vlw"); 
  textFont(font); 
  size (999, 600);
}

void draw()
{
PImage bg;

bg = loadImage("twitter_newbird_boxed_whiteonblue.png");

image(bg,0,0);
bg = loadImage("twitter_newbird_boxed_whiteonblue.png");

bg = loadImage("twitter_newbird_boxed_whiteonblue.png");

image(bg,300,0);
bg = loadImage("twitter_newbird_boxed_whiteonblue.png");

image(bg,600,0);
bg = loadImage("twitter_newbird_boxed_whiteonblue.png");

image(bg,900,0);
bg = loadImage("twitter_newbird_boxed_whiteonblue.png");

image(bg,0,300);
bg = loadImage("twitter_newbird_boxed_whiteonblue.png");

bg = loadImage("twitter_newbird_boxed_whiteonblue.png");

image(bg,300,300);
bg = loadImage("twitter_newbird_boxed_whiteonblue.png");

image(bg,600,300);
bg = loadImage("twitter_newbird_boxed_whiteonblue.png");

image(bg,900,300);
bg = loadImage("twitter_newbird_boxed_whiteonblue.png");

fill(255,220);
rect(0,0,1100,600);
  int k = 0;
  
  pythonDataDisplay.drawData();
  javaDataDisplay.drawData();
  htmlDataDisplay.drawData();

  // this draws the dots and numbers along the bottom
  for (float i = 0; i < 990; i += 41.25)
  {
    fill(0);
    strokeWeight(4);
    String number = "" + k;
    stroke(0,0,0);
    point(40+43.33 + i, 560);
    text(number, 87.25 + i, 555, 70, 70);
    k++;
  }
  
  // this displays the writing on the screen
  fill(0);
  text("Time of Tweet", 500, 590); 
  text("Number of Posts", 10, 40); 
  fill(252, 5, 5);
  text(java, 1000, 20, 70, 70);
  fill(11, 116, 11);
  text(python, 1000, 50, 70, 70);
  fill(19, 30, 137);
  text(html, 1000, 80, 70, 70);
  
  //this draws the graph lines
  stroke(0);
  strokeWeight(4);
  line(50, 550, 1060, 550);
  line(50, 50, 50, 550);
  
  //some small arrows to make mathmaticians happy
  line(1060, 550, 1055, 545);
  line(1060, 550, 1055, 555);
  line(50, 50, 45, 55);
  line(50, 50, 55, 55);
}

