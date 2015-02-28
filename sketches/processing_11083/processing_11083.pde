
// slideshow: display next sequenced photo in a folder
// author: Andy Modla

PImage img;

int number = 0;
int ndigits = 5;
int mask = 10000000;
int index;
int waitTime = 0;  // ms
String loadPath;
String url;
String FILE_PREFIX = "Remote";

void setup()
{
  loadPath = selectInput();
  // set screen dimensions for photo display
  //size (1366, 768);
  size (683, 384);
  background(0);
  if (loadPath == null)
  {
    println("Need a photo file to start off");
    exit();
  }
  else
  {
    index = loadPath.indexOf(FILE_PREFIX);
  
    String extract = loadPath.substring(index + FILE_PREFIX.length(), 
      index + FILE_PREFIX.length() + ndigits);
    //println("extract="+extract);
    try{
      number = Integer.parseInt(extract);
    }
    catch (NumberFormatException fne)
    {
      println("File name does not end with a number");
    }
    url = loadPath.substring(0, index+FILE_PREFIX.length()) +
      "xxxxx" + loadPath.substring(index + FILE_PREFIX.length() + ndigits);
    //println("url="+ url);
    number--;
  }
}

/**
 * Show next photo found in a folder using sequence number (example Remote00001.jpg)
 * I wrote this program to show the next photo added to a folder by DSLRemote 
 * (an iPhone, iTouch, iPad remote camera controller from OnOne Software). It assumes there is at least
 * one photo to start. As a new photo is added to the folder, it is displayed.
 */
void draw()
{
  String name = inc(number);
  String filename = url.replaceFirst("xxxxx", name);
  img = loadImage(filename);
  if (img != null && img.width>0 && img.height>0)
  {
    image(img, 0, 0, width, height);
    text(filename, 20, 20);
    number++;
  }
  else
  {
    delay(500);
  }
  delay(waitTime);
}

String inc (int n)
{
  n += mask + 1;
  String result = Integer.toString(n);
  String s = result.substring(result.length()-5);
  println(s);
  return s;
}
 


