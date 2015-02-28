
import java.io.BufferedReader;
import java.io.IOException;

import processing.core.*;

//Year	Electricity	Fuel Oil	Natural Gas	LPG/Propane	Coal	Purch. Steam	Other	Facility Subtotal

BufferedReader reader;
String line;
Float[][] data = new Float[9][33];
String[] singleLineInput;
float xPos = 0;

void setup() {
  size(1250, 550);
  smooth();
  // Open the file from the createWriter() example
  reader = createReader("data.txt");
  System.out.println(reader);
  for (int i = 0; i < 33; i++) {
    try {
      line = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty
      noLoop();
    } 
    else {
      singleLineInput = split(line, TAB);
      for (int j = 0; j < 9; j++) {
        data[j][i] = Float.parseFloat(singleLineInput[j]);
      }
    }
  }
}

void draw() {
  background(0);
  stroke(255);
  float c = 0;
  float x1 = 0;
  float y1 = 0;
  float x2 = 0;
  float y2 = 0;
  for (int i = 0; i < 9; i++) {
    stroke(200 - 2*c, 175 + c, 100 + 2*c);
    c += 8;
    for (int j = 1; j < 32; j++) {
      x1 = x2;
      x2 = x2 + 40;
      y1 = y2;
      y2 = data[i][j + 1]/70;
      line(x1, -1*y1 + 500, x2, -1*y2+ 500);
    }
    x1 = 0;
    x2 = 0;
  }
  if (mousePressed) {
    xPos = mouseX;
  }
  textSize(20);
  text("Federal Government Faculty Energy Costs by Type (in MILLIONS of Dollars) in the Year " + constrain((int) (xPos/40) + 1975, 1975, 2007), 500, 50);
  textSize(10);

  float sumCost = 0;
  //text("Spending in the year" + dates.get(constrain((int) (xPos * 1172 / 1173), 0, 1172)) + ")", 500, 50);
  rectMode(CORNER);
  textAlign(LEFT);
  fill(220);
  //rect(0,200, data[8][constrain((int) ((xPos/40)), 0, 32)]/10, 100);
  text("Total: $" + data[8][constrain((int) ((xPos/40)), 0, 32)], (int)(sumCost + data[8][constrain((int) ((xPos/40)), 0, 32)]/10) + 20, 250);

  textAlign(CENTER);
  rect(sumCost, 200, data[1][constrain((int) ((xPos/40)), 0, 32)]/10, 100);
  text("Electricity: $" + data[1][constrain((int) ((xPos/40)), 0, 32)], (int)(sumCost + 0.5*data[1][constrain((int) ((xPos/40)), 0, 32)]/10), 180);
  line((int)(sumCost + 0.5*data[1][constrain((int) ((xPos/40)), 0, 32)]/10), 180, (int)(sumCost + 0.5*data[1][constrain((int) ((xPos/40)), 0, 32)]/10), 200);

  sumCost += data[1][constrain((int) ((xPos/40)), 0, 32)]/10;
  fill(200);
  rect(sumCost, 200, data[2][constrain((int) ((xPos/40)), 0, 32)]/10, 100);
  text("Fuel Oil: $" + data[2][constrain((int) ((xPos/40)), 0, 32)], (int)(sumCost + 0.5*data[2][constrain((int) ((xPos/40)), 0, 32)]/10), 320);
  line((int)(sumCost + 0.5*data[2][constrain((int) ((xPos/40)), 0, 32)]/10), 320, (int)(sumCost + 0.5*data[2][constrain((int) ((xPos/40)), 0, 32)]/10), 300);

  sumCost += data[2][constrain((int) ((xPos/40)), 0, 32)]/10;
  fill(180);
  rect(sumCost, 200, data[3][constrain((int) ((xPos/40)), 0, 32)]/10, 100);
  text("Natural Gas: $" + data[3][constrain((int) ((xPos/40)), 0, 32)], (int)(sumCost + 0.5*data[3][constrain((int) ((xPos/40)), 0, 32)]/10), 160);
  line((int)(sumCost + 0.5*data[3][constrain((int) ((xPos/40)), 0, 32)]/10), 160, (int)(sumCost + 0.5*data[3][constrain((int) ((xPos/40)), 0, 32)]/10), 200);

  sumCost += data[3][constrain((int) ((xPos/40)), 0, 32)]/10;
  fill(160);
  rect(sumCost, 200, data[4][constrain((int) ((xPos/40)), 0, 32)]/10, 100);
  text("LPG/Propane: $" + data[4][constrain((int) ((xPos/40)), 0, 32)], (int)(sumCost + 0.5*data[4][constrain((int) ((xPos/40)), 0, 32)]/10), 340);
  line((int)(sumCost + 0.5*data[4][constrain((int) ((xPos/40)), 0, 32)]/10), 340, (int)(sumCost + 0.5*data[4][constrain((int) ((xPos/40)), 0, 32)]/10), 300);

  sumCost += data[4][constrain((int) ((xPos/40)), 0, 32)]/10;
  fill(140);
  rect(sumCost, 200, data[5][constrain((int) ((xPos/40)), 0, 32)]/10, 100);
  text("Coal: $" + data[5][constrain((int) ((xPos/40)), 0, 32)], (int)(sumCost + 0.5*data[5][constrain((int) ((xPos/40)), 0, 32)]/10), 140);
  line((int)(sumCost + 0.5*data[5][constrain((int) ((xPos/40)), 0, 32)]/10), 140, (int)(sumCost + 0.5*data[5][constrain((int) ((xPos/40)), 0, 32)]/10), 200);
  fill(120);

  sumCost += data[5][constrain((int) ((xPos/40)), 0, 32)]/10;
  rect(sumCost, 200, data[6][constrain((int) ((xPos/40)), 0, 32)]/10, 100);
  text("Purch. Steam: $" + data[6][constrain((int) ((xPos/40)), 0, 32)], (int)(sumCost + 0.5*data[6][constrain((int) ((xPos/40)), 0, 32)]/10), 360);
  line((int)(sumCost + 0.5*data[6][constrain((int) ((xPos/40)), 0, 32)]/10), 360, (int)(sumCost + 0.5*data[6][constrain((int) ((xPos/40)), 0, 32)]/10), 300);
  fill(100);

  sumCost += data[6][constrain((int) ((xPos/40)), 0, 32)]/10;
  rect(sumCost, 200, data[7][constrain((int) ((xPos/40)), 0, 32)]/10, 100);
  text("Other: $" + data[7][constrain((int) ((xPos/40)), 0, 32)], (int)(sumCost + 0.5*data[7][constrain((int) ((xPos/40)), 0, 32)]/10), 180);
  line((int)(sumCost + 0.5*data[7][constrain((int) ((xPos/40)), 0, 32)]/10), 180, (int)(sumCost + 0.5*data[7][constrain((int) ((xPos/40)), 0, 32)]/10), 200);
  rect(xPos, 500, 25, 20);
}


