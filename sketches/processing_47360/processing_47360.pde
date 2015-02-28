
String key1 = "wind";
String tweet2;
//String url = "http://search.twitter.com/search.atom?q=wind&rpp=1";
PFont font;
PFont font2;
PImage bubble;
int[] i  = new int[21];
int a = 0;
float prevMillis;
float thresh = 2000;

//XMLElement tweet;

void setup()
{
  frameRate(1);
  size(800, 800);
  noStroke();
  smooth();
  font = loadFont("Sentinel.vlw");
  font2 = loadFont("Sentinel2.vlw");
  bubble = loadImage("bubble.png");
  textAlign(CENTER, CENTER);
  background(0);
  updateTweet2(key1);
}


void draw()
{
  println(millis()-prevMillis);
  if (millis() - prevMillis >= thresh) {
    //updateTweet2(key1);
    
    pushMatrix();
  translate(random(150, 350), random(100, 650));
//  fill(random(150, 230), random(150, 230), random(150, 230));
//  rect(-25, -25, 350, 150);
  tint(random(150, 230), random(150, 230), random(150, 230));
  image(bubble,-35,-25);
  fill(0);
  textFont(font, 18);
  text(tweet2, 0, 0, 300, 100);
  popMatrix(); 
  
    prevMillis = millis();
    
  }

  fill(255);
  textFont(font2,24);
  text("keyword - "+key1, 100, 700);

  

  //  println(Tweet2());
  i[a]++;

  if ( i[a] == 41)
  {
    i[a]=0;
    background(0);
    redraw();
  }
}

String getTweet(String _url)
{
  String tweet2;
  
  try {
    XMLElement tweet = new XMLElement(this, _url);
    tweet2 = tweet.getChild("entry/title").getContent();
  } 
  
  catch (Exception e) {
    tweet2 = "Re-searching....";
  }
  
  return tweet2;
}

void updateTweet2(String _key1) {
  String url = "http://search.twitter.com/search.atom?q="+_key1+"&rpp=1";
  tweet2 = getTweet(url);
}
void keyPressed()
{
  background(0);
  if ((key == BACKSPACE) &&(key1.length()>0))
  {
    key1 = key1.substring(0, key1.length()-1);
  }

  else if ((key == RETURN) || (key == ENTER))
  {
    updateTweet2(key1);
  }

  else
  {
    key1 = key1 +key;
  }
}


