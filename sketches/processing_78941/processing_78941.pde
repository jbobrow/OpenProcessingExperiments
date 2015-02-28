
BufferedReader reader;
String dataLine;

void setup() {
  size(400, 720);
  background(255);
  smooth();
  reader = createReader("uk-postcodes.csv");
  noStroke();
  fill(random(255), random(255), random(255), 20);
}

void draw() {

  try {
    dataLine = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    dataLine = null;
  }

  if (dataLine == null) {
    background(255);
    reader = createReader("uk-postcodes.csv");
    fill(random(255), random(255), random(255), 20);
    delay(10000);
  } 
  else {
    String[] pieces = split(dataLine, ',');
    for (int i=0; i<pieces.length;i++) {
      println(pieces[i]);
    }
    println("--------");

    int x = int(pieces[1]);
    x= (int)map(x, 22600, 653500, 0, width-100)+50;
    int y = int(pieces[2]);
    y= (int)map(y, 8200, 1160900, height-100, 0)+50;
    ellipse(x, y, 12, 12);
  }
}


