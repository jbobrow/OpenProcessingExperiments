
import simpleML.*;

HTMLRequest cnnSource;
HTMLRequest cnetSource;

String html_cnnSource = "";
String html_cnetSource = "";

boolean fetch = false;

int w = 700, h = 700;
int fps = 30;
PFont font;

float startTime = 0;
float now;
int interval = 10000;
int i = 0;

color bg = color(218, 228, 242);

int apple_cnnSource = 0, apple_cnetSource = 0,
  goog_cnnSource = 0, goog_cnetSource = 0,
  ms_cnnSource = 0, ms_cnetSource = 0;

// Multiplier
int m = 5;
  
/*int appleLine1 = 0, appleLine2 = 0,
  googLine1 = 0, googLine2 = 0,
  msLine1 = 0, msLine2 = 0;*/

void setup()
{
  size(700,700);
  background(bg);
  font = loadFont("Verdana-36.vlw");
  textFont(font, 36);
  noFill();
  ellipseMode(CENTER);
  frameRate(fps);

  cnnSource = new HTMLRequest(this,"http://www.cnn.com/TECH/");
  cnetSource = new HTMLRequest(this,"http://news.cnet.com/");
  cnnSource.makeRequest();
  cnetSource.makeRequest();
}

void draw()
{
  background(bg);
  if(startTime == 0)
  {
    textFont(font, 36);
    text("Tech Wars Trifecta", w/18, h/10);
  }

  // Timer
  now = millis();
  if(now > startTime + interval)
  {
    apple_cnnSource = 0;
    apple_cnetSource = 0;
    goog_cnnSource = 0;
    goog_cnetSource = 0;
    ms_cnnSource = 0;
    ms_cnetSource = 0;
    
    cnnSource.makeRequest();
    cnetSource.makeRequest();
    startTime = now;
  }
    
  if(fetch)
  {
    fetch = false;
    
    apple_cnnSource = getMatchCount("Apple", html_cnnSource) + getMatchCount("iPhone", html_cnnSource);
    apple_cnetSource = getMatchCount("Apple", html_cnetSource) + getMatchCount("iPhone", html_cnetSource);
   
    goog_cnnSource = getMatchCount("Google", html_cnnSource) + getMatchCount("Android", html_cnnSource);
    goog_cnetSource = getMatchCount("Google", html_cnetSource) + getMatchCount("Android", html_cnetSource);
    
    ms_cnnSource = getMatchCount("Microsoft", html_cnnSource) + getMatchCount("Windows", html_cnnSource);
    ms_cnetSource = getMatchCount("Microsoft", html_cnetSource) + getMatchCount("Windows", html_cnetSource);
    
    /*println("Apples on CNN: " + apple_cnnSource);
    println("Apples on CNet: " + apple_cnetSource);
    println("Googles on CNN: " + goog_cnnSource);
    println("Googles on CNet: " + goog_cnetSource);
    println("Microsofts on CNN: " + ms_cnnSource);
    println("Microsofts on CNet: " + ms_cnetSource);
    println("");*/
  }
  
  drawApple1();
  drawApple2();
  drawGoog1();
  drawGoog2();
  drawMS1();
  drawMS2();
  
  if(mousePressed && (mouseX > (w/4) && mouseX < ((3*w)/4) && mouseY > 0 && mouseY < (h/2)))
  {
    textFont(font, 36);
    text("Apple", (w/2)-55, (9*h)/10);
    textFont(font, 22);
    text("CNN and CNet Tech Sources", 190, h-30);
  }
  else if(mousePressed && (mouseX > 0 && mouseX < (w/2) && mouseY > (h/2) && mouseY < (h)))
  {
    textFont(font, 36);
    text("Google", (w/2)-60, (9*h)/10);
    textFont(font, 22);
    text("CNN and CNet Tech Sources", 190, h-30);
  }
  else if(mousePressed && (mouseX > (w/2) && mouseX < (w) && mouseY > (h/2) && mouseY < (h)))
  {
    textFont(font, 36);
    text("Microsoft", (w/2)-80, (9*h)/10);
    textFont(font, 22);
    text("CNN and CNet Tech Sources", 190, h-30);
  }

  // Ripples
  if(i < w)
    i+=2;
  else
    i = 0;
  
  strokeWeight(2);
  stroke(80, 45);
  ellipse(w/2, h/2, i, i);
  stroke(60, 30);
  strokeWeight(1);
  ellipse(w/2, h/2, i*.9-10,i*.9-10);
  stroke(50, 20);
  ellipse(w/2, h/2, i*.8-20,i*.8-20);
}

void drawApple1()
{
  if(apple_cnnSource > 0)
  {
    strokeWeight(3);
    stroke(255);
    line(w/2, h/2, (w/2)-10, ((h/2)-apple_cnnSource*m-1));
  }
}
void drawApple2()
{
  if(apple_cnetSource > 0)
  {
    strokeWeight(3);
    stroke(250);
    line(w/2, h/2, (w/2)+10, ((h/2)-apple_cnetSource*m-1));
  }
}

void drawGoog1()
{
  if(goog_cnnSource > 0)
  {
    strokeWeight(3);
    stroke(56, 135, 242);
    line(w/2, h/2, (w/2)-(sin(0.635398163)*(goog_cnnSource*m-1)), (h/2)+(cos(0.635398163)*(goog_cnnSource*m-1)));
  }
}
void drawGoog2()
{
  if(goog_cnetSource > 0)
  {
    strokeWeight(3);
    stroke(42, 104, 188);
    line(w/2, h/2, (w/2)-(sin(0.935398163)*(goog_cnetSource*m-1)), (h/2)+(cos(0.935398163)*(goog_cnetSource*m-1)));
  }
}

void drawMS1()
{
  if(ms_cnnSource > 0)
  {
    strokeWeight(3);
    stroke(178, 45, 31);
    line(w/2, h/2, (w/2)+(sin(2.20619449)*(ms_cnnSource*m-1)), (h/2)-(cos(2.20619449)*(ms_cnnSource*m-1)));
  }
}
void drawMS2()
{
  if(ms_cnetSource > 0)
  {
    strokeWeight(3);
    stroke(201, 82, 69);
    line(w/2, h/2, (w/2)+(sin(2.50619449)*(ms_cnetSource*m-1)), (h/2)-(cos(2.50619449)*(ms_cnetSource*m-1)));
  }
}

void netEvent(HTMLRequest r)
{
  html_cnnSource = cnnSource.readRawSource();
  html_cnetSource = cnetSource.readRawSource();
  fetch = true;
}

int getMatchCount(String finder, String s)
{
  int m = s.split(finder).length;
  return (m-1);
}

