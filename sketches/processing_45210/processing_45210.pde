


BufferedReader reader;
String line;
ArrayList gridAndMag;
PFont fontA;
PImage backgroundmap;


void setup() {
  fontA = loadFont("Arial-ItalicMT-12.vlw");
  backgroundmap = loadImage("mapbackOP.jpg");
  size (900, 450);

  // Open the file from the createWriter() example
  reader = createReader("earthquakes.csv");    
  try {
    line = reader.readLine();
  }
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  gridAndMag = new ArrayList();

  image(backgroundmap, 0, 0);
  stroke(255);
  boolean done=false;
  while (!done) {
    try {
      line = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty
      done=true;
    } 
    else {
      String[] pieces = split(line, ",");

      float x = float(pieces[1]);
      x= (float)map(x, -180, 180, 0, width);
      float y = float(pieces[0]);
      y= (float)map(y, 90, -90, 0, height);
      float m = float(pieces[2]);
      String loc = (pieces[5]);
      String date = (pieces[6]);
      gridAndMag.add(new eq(x, y, m, loc, date));
    }
  }
}

void draw() {
  background(backgroundmap);
  fill(255);
  text("Earthquakes from the last 7 days - Hover over a point to see details!",0,10);
  text("Magnitude is shown at pointer",0,22);
  text("Location is shown at bottom middle of screen",0,34);
  
  stroke(255);

  textFont(fontA, 12);
  int i =0;

  int x=10;
  int y=10;
  int a=0;




  for  (i=0;  i<gridAndMag.size(); i++) {




    eq p = (eq) gridAndMag.get(i);

    stroke(255);
    fill(p.getM()*70, p.getM()*40, 60);
    ellipse(p.getX(), p.getY(), ((p.getM())*2), ((p.getM())*2));

    p.hover();
  }
}


class eq {
  float x;
  float y;
  float m;
  String loc;
  String date;
  
  public eq(float x, float y, float m, String loc, String date) {
    this.x=x;
    this.y=y;
    this.m=m;
    this.loc=loc;
    this.date=date;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public float getM() {
    return m;
  }

  public String getLoc() {
    return loc;
  }
  
  public String getDate() {
    return date;
  }

  void hover() {
    float distance = dist(mouseX, mouseY, x, y); 
    if (distance < 2) {
      fill(255, 0, 0);
      text(m, mouseX, mouseY+30);
      fill(0);
      text("Magnitude: " + m, 10,450);
      text(loc, 200, 450);
      text(date, 400, 450);  
  }
  }
}


