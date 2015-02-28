
import java.util.ArrayList;

ArrayList<Double> Prices = new ArrayList<Double>();
PFont font;
PFont font2;
String[] Dates;
int index = 0;
int target = 0;
int smoothdelay = 0;
float rY = 0;
void setup() {
  size(800, 800, P3D);
  font = createFont("Arial", 36);
  font2 = createFont("Arial", 18);
  ArrayList<String> temp = new ArrayList<String>();
  String[] temp56 = loadStrings("naturalgasdata.txt");
  Dates = loadStrings("dates.txt");
  for (int i = 1; i < temp56.length;i++) {
    temp.add(temp56[i]);
  }
  for (int i = 0; i< temp.size();i++) {
    String temp2 = temp.get(i);
    Prices.add(new Double(Double.parseDouble(temp2)));
  }
}
void draw() {
  background(0);
  stroke(255, 255, 255, 255);
  for (int i = 0; i < Prices.size()-1; i++) {
    line((int)Math.round((i/(double)Prices.size()) * width), (int)700-Math.round(Prices.get(i)*30), (int)Math.round(((i+1)/(double)Prices.size()) * width), (int)700-Math.round(Prices.get(i+1)*30));
  }
  textFont(font);
  if (mousePressed && mouseY >= 740 && mouseY <= 760) {
    target = (int) ((mouseX/(double)width) * Prices.size());
    if (target > Prices.size()-1) {
      target = Prices.size()-1;
    } else if (target < 0){
      target = 0;
    }
     if (pmouseX != mouseX) {
      index = target;
    }
  }
  if (smoothdelay < 0) {
    if (index < target) {
      index++;
    } 
    else if (index > target) {
      index--;
    }
    if (index > Prices.size()-1) {
       index = Prices.size()-1;
    } else if (index< 0){
      index = 0;
    }
    smoothdelay = 1;
  } 
  else {
    smoothdelay--;
  }
  rectMode(CENTER);
  fill(Math.min(Math.round(Prices.get(index)*20), 255), 255-Math.min(Math.round(Prices.get(index)*20), 255), 0, 125);
  stroke(255, 255, 255, 125);
  //rect(300, 300, (int)Math.round(Prices.get(index))*10, (int)Math.round(Prices.get(index))*10);
  pushMatrix();
  translate(300, 300, -3500);
  rotateY(rY);
  rY += 0.01;
  sphere((int)Math.round(Prices.get(index)*100));
  popMatrix();
  fill(255, 255, 255, 255);
  text("United States Natural Gas Prices since 1981", 40, 35, 0);
  text("Date: " + Dates[index], 100, 100, 0);
  text("Price/MCF: $" + Prices.get(index), 100, 140, 0);
  text("Data From Data.gov", 470, 790, 0);
  textFont(font2);
  text("Scroll to view different months", 20, 730, 0);
  rect (400, 750, 800, 20);
  fill(255, 0, 0, 125);
  rect ((int)Math.round((target/(double)Prices.size()) * width), 750, 30, 22);
  fill(0, 0, 0, 255);
  rect ((int)Math.round((index/(double)Prices.size()) * width), 750, 30, 22);
}


