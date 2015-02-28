
XMLElement xml;

void setup() {
  size(800, 480);
  //xml = new XMLElement(this, "http://search.twitter.com/search.atom?q=hello");
  xml = new XMLElement(this, "http://search.twitter.com/search.atom?q=%E3%81%93%E3%82%93%E3%81%AB%E3%81%A1%E3%81%AF");
}
  
void draw() {
  XMLElement[] tweets = xml.getChildren("entry/title");
  for (int i = 0; i < tweets.length; i++) {
    fill(0);
    textSize(9);
    text(tweets[i].getContent(), 10, 20 + i*30);
    //println(tweets[i].getContent());
  }
  noLoop();
}

