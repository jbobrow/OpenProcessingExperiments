
/* 
 Daniel C. Young
 Microsoft Twitter Viz
 12/15/2011
 
 INSTRUCTIONS
 Displays tweets of Microsoft related keywords every 1.5 seconds.
 Colors represent search term. Circle size represent length of tweet.
 Mouse over to view messages. Hit "r" to force update.
 */

import megamu.mesh.*;  // http://leebyron.com/else/mesh/

int total=100;
int counter=0;
int pMillis=0;
int thresh=1500;
int index=0;
int fHue = 30;
float xOff;
float yOff;
float [][] pos;

ArrayList particles;
ArrayList goodTweets;
Delaunay delaunay;
PFont sans, scala;
String curMsg = "";
String[] keywords = {"microsoft","office","windows","kinect","xbox"};
String trending;
String url;

void setup() {
  size(800, 600);
  smooth();
  colorMode(HSB, 100);
  frameRate(30);
  
  sans = loadFont("TheSans-48.vlw");
  scala = loadFont("ScalaSansCaps-48.vlw");
  goodTweets = new ArrayList();
  particles = new ArrayList();
}

void draw() {
  background(100);
  
  if (millis()-pMillis >= thresh) {
    // after displaying all good tweets, update keyword and colors
    if (counter >= goodTweets.size()) {
      updateTweets();
    }

    createParticle(counter);
    counter++;
    pMillis+=thresh;
  }

  drawParticles();
  
  // draw current message
  fill(10);
  textFont(sans, 16);
  textAlign(LEFT);
  text(curMsg, 40, height-80, width-80, 80);
  
  fill(fHue,80,80);
  textFont(scala, 13);
  textAlign(RIGHT);
  text("now trending – "+trending, width-40, 40);
}

void updateTweets(){
  fHue=(fHue+20)%100;  // update color
  
  // update search keyword
  index = index++ % keywords.length;
  trending = keywords[index++];
  url = "http://search.twitter.com/search.atom?q="+trending;

  getTweets(url);    // fetch new tweets
  resetParticles();  // randomize position
  counter=0;         // reset counter
}

// create new particle based on index position of goodTweets
void createParticle(int _i) {
  String msg = (String)goodTweets.get(_i);
  
  // randomize hue and saturation
  float tHue = random(fHue, fHue+10);
  color offFill = color(tHue, random(20, 100), random(15, 95));
  color onFill = color(tHue, 80, 90);
  particles.add(new Particle(msg, msg.length(), onFill, offFill));
}

void drawParticles(){
  for (int i=particles.size()-1;i>=0;i--) {
    Particle p = (Particle)particles.get(i);
    p.update();
    p.display();
    
    // remove dead particles
    if (p.life <= 0) {
      particles.remove(i);
    }
  }

  // get particle coordinates and create Delauney object
  pos = new float[particles.size()][2];
  for (int i=particles.size()-1;i>=0;i--) {
    Particle p = (Particle) particles.get(i);
    pos[i][0] = p.xCurr;
    pos[i][1] = p.yCurr;
  }
  delaunay = new Delaunay(pos);

  // get Delauney edges and draw lines
  float[][] edges = delaunay.getEdges();
  for (int i=0; i<edges.length; i++)
  {
    float startX = edges[i][0];
    float startY = edges[i][1];
    float endX = edges[i][2];
    float endY = edges[i][3];
    float trans = 255-dist(startX, startY, endX, endY)*4;
    float sw = 5/(dist(startX, startY, endX, endY)+1);
    strokeWeight(sw);
    stroke(0, trans);
    line(startX, startY, endX, endY);
  }
}

// populates goodTweets array list from query results
void getTweets(String _url) {
  goodTweets.clear();
  try {
    XMLElement xml = new XMLElement(this, _url);
    XMLElement[] tweets = xml.getChildren("entry/title");

    for (int i=0; i<tweets.length; i++) {
      String msg=tweets[i].getContent();

      // Don’t grab duplicates, retweets, and newline
      if (goodTweets.indexOf(msg)<0 && msg.indexOf("RT")<0 && msg.indexOf("\n")<0) {
        goodTweets.add(msg);
      }
    }
  } 
  catch(Exception e) {
    println(e);
  }
}

// mouse hover states
void mouseMoved() {
  for (int i=0;i<particles.size();i++) {
    Particle p=(Particle) particles.get(i);
    if (p.isWithin(mouseX, mouseY)){
      curMsg = p.tweet;
      p.on = true; 
    }else{
      p.on = false;
    }
  }
}

// force update
void keyPressed() {
  if (key =='r') {
    updateTweets();
  }
}

// randomize particle positions
void resetParticles() {
  for (int i=particles.size()-1;i>=0;i--) {
    Particle particle = (Particle) particles.get(i);
    particle.reset();
  }
}


