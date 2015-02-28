

BufferedReader reader;
String line;
ArrayList postCodes;
PFont fontA;

void setup() {
  size(500, 760);
  // Open the file from the createWriter() example
  reader = createReader("uk-postcodes.csv");   
  try {
    line = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  postCodes = new ArrayList();

  background(50);
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

      String[] pieces = split(line, ',');


      int x = int(pieces[1]);
      x= (int)map(x, 22600, 653500, 0, width-100)+50;
      int y = int(pieces[2]);
      y= (int)map(y, 8200, 1160900, height-40, 0)+20;

      // point(x, y);
      postCodes.add(new pc(x, y, pieces[0]));
    }
  }

  fontA = loadFont("CourierNewPSMT-8.vlw");
  textFont(fontA, 8);

  frameRate(10);
}

int i=0;
int x=10;
int y=10;
boolean drawMap = false;

void mousePressed() {
  background(50);
  i=0;
  x=10;
  y=10;
  if (drawMap) {
    drawMap=false;
    frameRate(10);
  }
  else {
    drawMap=true;
    frameRate(1000);
  }
}

void draw() {



  if (i<postCodes.size()-2) {
    i++;
  } 
  else {
    i=0;
  }



  pc p = (pc) postCodes.get(i);

  if (drawMap) {
    point(p.getX(), p.getY());
  }
  else {
    text(p.getCode()+"\t["+p.getX()+"]\t ["+p.getY()+"]", x, y );
  }
  if (y<height) {
    y+=10;
  }
  else {
    y=10;
    x += 100;
  }
}

class pc {
  int x;
  int y;
  String code;

  public pc(int x, int y, String code) {
    this.x=x;
    this.y=y;
    this.code=code;
  }
  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public String getCode() {
    return code;
  }
}


