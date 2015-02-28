
String url = "http://search.twitter.com/search.atom?q=wind&rpp=1";
PFont font;
int[] i  = new int[21];
int a = 0;

XMLElement tweet;

//String letters="";

void setup()
{
  frameRate(1);
  size(800, 800);
  noStroke();
  smooth();
  font = loadFont("Sentinel.vlw");
  textFont(font, 18);
  textAlign(CENTER, CENTER);
  background(0);
}


void draw()
{

  //  fill(255);
  //  text(letters, 100, 700);

  pushMatrix();
  translate(random(150, 350), random(100, 650));
  fill(random(150, 230), random(150, 230), random(150, 230));
  rect(-25, -25, 350, 150);
  fill(0);
  text(getTweet(), 0, 0, 300, 100);
  popMatrix();

  println(getTweet());
  i[a]++;
  
  if ( i[a] == 21)
  {
    i[a]=0;
    background(0);
    redraw();
  }
}

String getTweet()
{
  XMLElement tweet = new XMLElement(this, url);
  XMLElement tmp = tweet.getChild("entry/title");

  String thisTweet = tmp.getContent();


  return thisTweet;
}
/*
void keyPressed()
 {
 background(0);
 if ((key == BACKSPACE) &&(letters.length()>0))
 {
 letters = letters.substring(0, letters.length()-1);
 }
 
 else if ((key == RETURN) || (key == ENTER))
 {
 letters="";
 background(0);
 }
 
 else
 {
 letters=letters+key;
 }
 }
 */

