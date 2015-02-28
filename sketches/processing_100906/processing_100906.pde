
BufferedReader reader;
int currentYear = 2000;
ArrayList datapoints = new ArrayList();
boolean held = false;
int xPos = 10;
float xData;
float yData;
dataPoint temp;

void setup() {
  size(800,800);
  background(0);
  stroke(255);
  fill(255);
  textAlign(CENTER, CENTER);
  reader = createReader("data.txt");;
  String s = "";
  for(int i = 0; i < 342; i++) {
    try {
      s = reader.readLine();
    }
    catch(IOException ex) {
      System.out.println(ex.toString());
    }
    datapoints.add(new dataPoint(s));
  }
}

void draw() {
  background(0);
  currentYear = floor(2000 + constrain((int) (xPos * 9 / width), 0, 9));
  fill(255);
  textSize(24);
  text("GDP vs CO2 Emissions - " + currentYear, 400, 50);
  textSize(16);
  text("GDP per capita (US$)", 400, 750);
  pushMatrix();
  translate(25, 400);
  rotate(radians(270));
  text("CO2 Emissions (metric tons per capita)", 0, 0);
  popMatrix();
  textSize(12);
  text("0", 65, 700);
  text("1", 65, 670);
  text("2", 65, 640);
  text("3", 65, 610);
  text("4", 65, 580);
  text("5", 65, 550);
  text("6", 65, 520);
  text("7", 65, 490);
  text("8", 65, 460);
  text("9", 65, 430);
  text("10", 65, 400);
  text("11", 65, 370);
  text("12", 65, 340);
  text("13", 65, 310);
  text("14", 65, 280);
  text("15", 65, 250);
  text("16", 65, 220);
  text("17", 65, 190);
  text("18", 65, 160);
  text("19", 65, 130);
  text("20", 65, 100);
  text("21", 65, 70);
  text("22", 65, 40);
  
  text(0, 75,720);
  text(5000, 75+63,720);
  text(10000, 75+125,720);
  text(15000, 75+188,720);
  text(20000, 75+250,720);
  text(25000, 75+313,720);
  text(30000, 75+375,720);
  text(35000, 75+438,720);
  text(40000, 75+500,720);
  text(45000, 75+563,720);
  text(50000, 75+625,720);
  text(55000, 75+688,720);
  text(60000, 75+750,720);
  
  
  rectMode(CORNER);
  rect(0,780,width,10);
  fill(0);
  rect(xPos - 10, 770, 25, 20);
  fill(255);
  line(75,0,75,700);
  line(75,700,800,700);
  for(int i = 0; i < 171; i++) {
    temp = (dataPoint) datapoints.get(i);
    xData = 75 + Float.valueOf(temp.getData(currentYear-2000+2))/80;
    temp = (dataPoint) datapoints.get(i+171);
    yData = 700 - Float.valueOf(temp.getData(currentYear-2000+2))*30;
    ellipse(xData, yData, 8, 8);
    
    if(mouseX > xData-5 && mouseX < xData + 5 && mouseY > yData - 5 && mouseY < yData + 5) {
      text(temp.getData(0), xData, yData - 12);
    }
  }
  
  
  
  if(held){
    xPos = constrain((int)mouseX, 0, 800);
  }
}

class dataPoint {
  
  String[] info;
  
  String country = "";
  
  dataPoint(String s) {
    info = split(s,'\t');
  }
  
  String getData(int i) {
    return info[i];
  }
  
}

void mouseReleased(){
  held = false;
}

void mouseDragged(){
  held = true;
}

