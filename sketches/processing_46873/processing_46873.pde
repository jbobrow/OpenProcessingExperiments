
PImage pulledImage;
String webpage = "";
String[] m1;
String url = "http://browse.deviantart.com/?order=5";
String [] webpageArray = loadStrings(url);
boolean done = false;

void setup()
{
  size(640,480);
  
  for(int i=0;i<webpageArray.length;i++){
    webpage += webpageArray[i];
  }
  
  webpage = webpage.replace("  "," "); // Cleans Script from unnecessary double spaces
  webpage = webpage.replace("	",""); // Cleans Script from unnecessary tabs
  
  m1 = match(webpage, "super_img=\"([^\"]*)\" super_w=");
  
  pulledImage = loadImage(m1[1]);
  
  println(m1[1]);  
  noLoop();
}

void draw()
{
  background(255);
  fill(0);
  image(pulledImage, 0, 0);
}

