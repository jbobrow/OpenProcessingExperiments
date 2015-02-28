
float[] data = new float[1173];
ArrayList dates = new ArrayList(1173);
float xPos = 0;
boolean held = false;
PImage dollar;
PImage gas;

void setup() {
  size(1173, 500);
  background(255);
  textAlign(CENTER, CENTER);
  BufferedReader reader = createReader("gasprices.txt");
  String str = "";
  for (int i = 0; i < 1173; i++) {
    try {
      str = reader.readLine();
    }
    catch(IOException ex) {
      System.out.println(ex.toString());
    }
    dates.add(str.substring(0, 12));
    data[i] = Float.parseFloat(str.substring(13));
  }
  dollar = loadImage("dollar.jpg");
  gas = loadImage("gas.png");
}

void draw() {
  background(0);
  rect(0, 0, 1173, 500);
  stroke(255);
  float xCoord1 = 0;
  float yCoord1 = 0;
  float xCoord2 = 1000/1172;
  float yCoord2 = 0;
  for(int i = 0; i < 1172; i++) {
    xCoord1 = xCoord1 + 1;
    xCoord2 = xCoord2 + 1;
    yCoord1 = data[i];
    yCoord2 = data[i+1];
    line(xCoord1, -50*yCoord1 + 250, xCoord2, -50*yCoord2 + 250);
  }
  stroke(255);
  fill(255);
  textSize(20);
  text("Gas Prices (week of " + dates.get(constrain((int) (xPos * 1172 / 1173), 0, 1172)) + ")", 500, 50);
  text("$" + data[constrain((int) (xPos * 1172 / 1173), 0, 1172)] + " / Gallon", 500, 100);
  image(dollar, 116, 300);
  fill(0);
  stroke(0);
  rectMode(CORNER);
  rect(116 + data[constrain((int) (xPos * 1172 / 1173), 0, 1172)]*180, 300, 800, 100);
  image(gas, 900, 200);
  stroke(255);
  fill(100,100,100);
  rect(0,480,width, 10);
  fill(0);
  rect(xPos - 10, 470, 25, 20);
  if(held){
    xPos = mouseX;
  }
}

void mouseReleased(){
  held = false;
}
void mouseDragged(){
  held = true;
}


