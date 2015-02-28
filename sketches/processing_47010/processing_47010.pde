
/* 
 Daniel C. Young
 Twicker
 11/22/2011
 
 INSTRUCTIONS
 Displays tweets of keywords in real time, updated every 4 seconds.
 Type to specify search term. Use backspace to delete.
 */

String keyword = "occupy";
String msg;
PFont sentinel,scala;
float prevMillis;
float thresh = 4000;

void setup(){
  size(800,160);
  background(30);
  sentinel = loadFont("Sentinel-Italic-48.vlw");
  scala = loadFont("ScalaSansCaps-Bold-48.vlw");
  updateMsg(keyword);
}

void draw(){
  background(30);
  println(msg);
  
  if (millis()-prevMillis >= thresh) {
    updateMsg(keyword);
    fill(255);
    prevMillis = millis();
  }else{
    fill(255,map(millis()-prevMillis,0,thresh,300,5));
  }
  textAlign(LEFT,CENTER);
  textFont(sentinel, 19);
  text(msg, 20, height/2-50, 760, 80);
  
  fill(#FCCA21);
  textFont(scala, 13);
  textAlign(RIGHT);
  text("now trending – "+keyword, width-20, height-20);
}

String getTweet(String _url){
  String msg;
  try {
    XMLElement tweet = new XMLElement(this,_url);
    msg = tweet.getChild("entry/title").getContent();
  } catch(Exception e){
    msg = "Please enter a search keyword...";
  }
  return msg;
}

void updateMsg(String _keyword){
  String url = "http://search.twitter.com/search.atom?q="+_keyword+"&amp;rpp=1";
  msg = getTweet(url);
}

void keyPressed() {
  // checks that string is not empty
  if (key==BACKSPACE && (keyword.length()>0)) {
    // delete the last character
    keyword = keyword.substring(0, keyword.length()-1);
  } else if (key==RETURN || key==ENTER) {
    updateMsg(keyword);
  } else {
    keyword = keyword + key;
  }
}


