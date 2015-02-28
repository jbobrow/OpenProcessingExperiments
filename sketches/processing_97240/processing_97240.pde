
int d;
float x;
float y;
color [] conf = {#005FFF, #FF7C00, #FAFF00, #0C02AA, #0C02AA, #005FFF, #0092FF, #005FFF, #FF004D, #FF4800, #FF0000, #7600FF, #00E8FF, #00FF4E, #7600FF, #00FFCA, #0C02AA, #FF4800, #00FFCA, #A900FF, #7600FF, #FF0000, #0C02AA, #FF007C, #00FF86, #A900FF, #7600FF, #005FFF, #FF0000, #CFFF00, #5000FF, #FAFF00, #005FFF, #FF0000, #FF4800, #00FF4E, #5000FF, #FF4800, #00FF86, #A900FF, #00FF12, #00FFCA, #E000FF, #E000FF, #E000FF, #FF004D, #FF7C00, #A5FF00, #00FF86, #FF004D, #FF004D, #7600FF, #005FFF, #FF4800, #005FFF, #FF00C4, #0092FF, #FF007C, #005FFF, #00FF86, #A900FF, #FF0000, #7600FF, #A900FF, #FF0000, #7600FF, #E000FF, #E000FF, #0092FF, #FF4800, #E000FF, #005FFF, #005FFF, #005FFF, #00FFCA, #FF4800, #E000FF, #FF4800, #00FF86, #FF00C4, #FF4800, #FFBC00, #FF4800, #FF0000, #FF0000, #69FF00, #FF4800, #E000FF, #00E8FF, #E000FF, #FF004D, #FF004D, #0C02AA, #0C02AA, #E000FF, #00FF4E, #FF007C, #FF7C00, #E000FF, #FF4800, #FF007C, #FAFF00, #5000FF, #FF00C4, #FF4800, #A900FF, #005FFF, #00FF12, #FF007C, #A5FF00, #FFBC00, #FF7C00, #A900FF, #A900FF, #00FFCA, #0C02AA, #FF4800, #FF007C, #FF4800, #FF007C, #005FFF, #A5FF00, #FAFF00, #A5FF00, #FF004D, #005FFF, #FF004D, #FF004D, #FAFF00, #FF4800, #7600FF, #0092FF, #A900FF, #A900FF, #0C02AA, #0C02AA, #0C02AA, #FF00C4, #A900FF, #005FFF, #00FF86, #FF0000, #FF0000, #FF4800, #FF4800, #0C02AA, #0C02AA, #FF4800, #FF004D, #0092FF, #E000FF, #5000FF, #69FF00};
String col;
color [] fbsc = {#E000FF, #005FFF, #FF0000, #0C02AA, #FF004D, #FF007C, #A900FF, #7600FF, #5000FF, #0092FF, #FF00C4, #00E8FF};
color [] fcsc = {#00FF86, #FAFF00, #00FFCA, #00FF12, #A5FF00, #FF7C00, #00FF4E, #69FF00, #FFBC00, #CFFF00};

Table NFL;
int rowCount;
int rowCount1;

void setup(){
  size(950, 375);
  smooth();
  NFL = new Table ("NFL.tsv");
  rowCount = NFL.getRowCount();
  println("rowCount = " + rowCount);
  noStroke();
  String fbsi [] = loadStrings("fbsi.tsv");
  String fcsi [] = loadStrings("fcsi.tsv");
  for (int s = 0; s < 12; s++){
    fill(255);
    text(fbsi[s], 20, 50+s*15);
    fill(fbsc[s]);
    rect(5, 40+s*15, 10, 10);
  }
  for (int s = 0; s < 10; s++){
    fill(255);
    text(fcsi[s], 155, 50+s*15);
    fill(fcsc[s]);
    rect(130, 40+s*15, 10, 10);
  }
  fill(255);
  text("Division II/III", 155, 50+10*15);
  fill(#FF4800);
  rect(130, 40+10*15, 10, 10);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("New Orleans Saints Feeder Colleges", width/2, 20);
}

void draw(){
    translate(1600, 550);
  for (int i = 0; i < rowCount; i++){
    col = NFL.getString(i, 0);
    fill(conf[i]);
    x = NFL.getFloat(i, 11);
    y = NFL.getFloat(i, 12);
    d = (NFL.getInt(i, 5))*6;
    ellipse(x, y, d, d);
    if(dist(x,y,mouseX, mouseY)< d){
      fill(255);
      text(col, mouseX, mouseY);
    }
  }
  noLoop();
}

