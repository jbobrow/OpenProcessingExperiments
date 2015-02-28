
String st[];
ArrayList names;
ArrayList playcounts;
ArrayList listeners;


void setup() {
  size(1000, 800);
  //size(screen.width, screen.height);
  colorMode(HSB, 300);
  stroke(0, 0, 300, 30);
  smooth();
  noFill();
  background(0);
  println(minute() + " minutes " + second() + " seconds and " + millis() + " millis.");


  //st = loadStrings("http://ws.audioscrobbler.com/2.0/?method=chart.getTopArtists&limit=1000&api_key=98ccb6e436bc65d75230c786ff214fc2");
 // saveStrings("st.txt", st);
  st = loadStrings("st.txt");
  println(minute() + " minutes " + second() + " seconds and " + millis() + " millis.");
  names = new ArrayList();
  playcounts = new ArrayList();
  listeners = new ArrayList();

  parse();  

  //println(names);
  //println(playcounts);
  //println(st);
}

int count = 0;
int change = 1;

void draw() {

  fill(0, 0, 0, 50);
  rectMode(CORNER);
  rect(-10, -10, width+20, height+20);
  graphListeners(count);
  graphCounts(count);
  if (count>998) {
    change = -1;
  }
  if (count < 1) {
    change = 1;
  }
  delay(0);
  //delay(second() + hour());
  println(minute() + " minutes " + second() + " seconds and " + millis() + " millis.");
  count+=change;
}


void parse() {
  for (int i= 0; i<st.length; i++) {
    String temp = st[i];
    if (temp.contains("<name>")) {
      //      println(i);
      //      println(temp.length() + "is how long the line is");
      //      println(temp.indexOf("<name>") + " is the beginning");
      //      println(temp.indexOf("</name>") + " is the end");
      String name = temp.substring(temp.indexOf("<name>") + 6, temp.indexOf("</name>"));
      names.add(name);
    }
  }

  for (int i=0; i<st.length; i++) {
    String temp = st[i];
    if (temp.contains("<playcount>")) {
      String playcount = temp.substring(temp.indexOf("<playcount>") + 11, temp.indexOf("</playcount>"));
      playcounts.add(playcount);
    }
  }

  for (int i=0; i<st.length; i++) {
    String temp = st[i];
    if (temp.contains("<listeners>")) {
      String listenerCount = temp.substring(temp.indexOf("<listeners>") + 11, temp.indexOf("</listeners>"));
      listeners.add(listenerCount);
    }
  }
}

void graphCounts(int index) {



  float step = width/800;
  println(step + " step");
  float x = 0;
  float top = parseInt((String)playcounts.get(0));
  println(top+" Top");
  float ratio = height/top;
  println(ratio + "Ratio");

  float now = parseInt((String)playcounts.get(index));

  // println(now);
  float hi = now*ratio;
  // println(hi);
  //rect(index, height-hi, 1, height);
  strokeWeight(2);
  //stroke(second()*5, 220, 300, 50);
  stroke(0, 0, 300, 150);
  rectMode(CENTER);
  //rect(width/2, height/2, hi,hi);
  noFill();
  ellipse(width/2, height/2, hi,hi);
  x+=step;
}

void graphListeners(int index) {


  float step = width/1000;
  println(step + " step");
  float x = 0;
  float top = parseInt((String)listeners.get(0));
  println(top+" Top");
  float ratio = height/top;
  println(ratio + "Ratio");

  float now = parseInt((String)listeners.get(index));

  // println(now);
  float hi = now*ratio;
  // println(hi);
  //rect(index, height-hi, 1, height);
  fill(second()*5, 240, 299, 50);
  noStroke();
  ellipse(width/2, height/2, hi,hi);
  x+=step;
}



