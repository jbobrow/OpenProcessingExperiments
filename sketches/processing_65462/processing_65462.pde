
boolean mouseOver = false;

class Port {
  boolean dragging = false;
  boolean isOver = false;
  int code;
  float xPos, yPos, offsetX, offsetY;
  color fillColor, strokeColor;

  Port(int c, float x, float y, color f, color s) {
    code = c;
    xPos = x;
    yPos = y;
    offsetX = 0;
    offsetY = 0;
    fillColor = f;
    strokeColor = s;
  }

  void portDraw() {
    smooth();
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(3);
    ellipse(xPos, yPos, 20, 20);

    if (fillColor == color2) {
      fill(fillColor);
      textAlign(RIGHT, BOTTOM);
      textFont(font1a);
      text(waterwayNames[code], xPos, yPos - 10);
    } 
    else {
      fill(color3);
      pushMatrix();
      rotate(HALF_PI);
      textAlign(LEFT, CENTER);
      textFont(font1);
      text(waterwayNames[code], yPos + 15, -xPos - 5);
      popMatrix();
    }

//MOUSEOVER IMPORT/EXPORT DETAILS
    if (fillColor == color2 && isOver) {
      String importTextBox = "IMPORTS" + '\n';
      String exportTextBox = '\n' + "EXPORTS" + '\n';
      if (brightness(imp.textColor) == 255) {
        for (int i = 0; i < importList.length; i++) {
          String[] importListLine = split(importList[i], ',');
          String commN = "";
          for (int j = 0; j < commKey.length; j++) {
            String[] commKeyLine = split(commKey[j], '\t');
            if (int(importListLine[2]) == int(commKeyLine[0])) commN = commKeyLine[2];
          }
          if (int(importListLine[1]) - 1 == code) importTextBox = importTextBox + waterwayNames[int(importListLine[0]) - 1] + " : " + importListLine[3] + " tons of " + commN + '\n';
        }
      }
      if (brightness(ex.textColor) == 255) {
        for (int i = 0; i < exportList.length; i++) {
          String[] exportListLine = split(exportList[i], ',');
          String commN = "";
          for (int j = 0; j < commKey.length; j++) {
            String[] commKeyLine = split(commKey[j], '\t');
            if (int(exportListLine[2]) == int(commKeyLine[0])) commN = commKeyLine[2];
          }
          if (int(exportListLine[0]) - 1 == code) exportTextBox = exportTextBox + waterwayNames[int(exportListLine[1]) - 1] + " : " + exportListLine[3] + " tons of " + commN + '\n';
        }
      }

      fill(0, 100);
      noStroke();
      int boxHigh = matchAll(importTextBox + exportTextBox, "\n").length;
      rect(xPos + 10, yPos - boxHigh*12/2, 170, boxHigh*12);
      fill(255);
      textAlign(LEFT);
      textFont(font0);
      textLeading(12);
      text(importTextBox + exportTextBox, xPos + 15, yPos - boxHigh*12/2, 170, boxHigh*12);
    }
  }

  float[] ReturnPos() {
    float[] portPos = new float[2];
    portPos[0] = xPos;
    portPos[1] = yPos;
    return portPos;
  }

  void pressed(int mX, int mY) {
    if ((abs(xPos - mX) < 10) && (abs(yPos - mY) < 10)) {
      dragging = true;
      offsetX = xPos-mX;
      offsetY = yPos-mY;
    }
  }

  void released() {
    dragging = false;
  }

  void drag(int mX, int mY) {
    if (dragging) {
      xPos = mX + offsetX;
      yPos = mY + offsetY;
    }
  }

  void clicked() {
    if ((abs(xPos - mouseX) < 10) && (abs(yPos - mouseY) < 10)) {
      if (fillColor == color1) {
        fillColor = color2;
      }
      else {
        fillColor = color1;
      }
    }
  }

  boolean mouseOver() {
    if (abs(xPos - mouseX) < 10 && abs(yPos - mouseY) < 10) {
      isOver = true;
    }
    else {
      isOver = false;
    }
    return isOver;
  }

  color onOff() {
    return fillColor;
  }
}


class ImportExport {
  float yPos;
  String label;
  color textColor;

  ImportExport(float y, String l, color tC) {
    yPos = y;
    label = l;
    textColor = tC;
  }

  void display() {
    textFont(font2);
    fill(textColor);
    pushMatrix();
    rotate(HALF_PI);
    textAlign(CENTER);
    text(label, yPos, -width + 50);
    popMatrix();
  }

  void clicked() {
    if (((mouseX > width - 55) && (mouseX < width - 25)) && ((mouseY > yPos - 50) && (mouseY < yPos + 50))) {
      if (brightness(textColor) == 128) {
        textColor = color(hue(textColor), saturation(textColor), 255);
      } 
      else {
        textColor = color(hue(textColor), saturation(textColor), 128);
      }
    }
  }

  boolean mouseOver() {
    return  ((mouseX > width - 55) && (mouseX < width - 25)) && ((mouseY > yPos - 50) && (mouseY < yPos + 50));
  }

  color onOff() {
    color onOff = textColor;
    return onOff;
  }
}


class Commodity {
  String commCode, commLongName, commName;
  float xPos;
  color fillColor, strokeColor, textColor;

  Commodity(String cC, String cLN, String cN, float x, color fC, color sC, color tC) {
    commCode = cC;
    commLongName = cLN;
    commName = cN;
    xPos = x;
    fillColor = fC;
    strokeColor = sC;
    textColor = tC;
  }

  void display() {
    rectMode(CORNER);
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(2);
    rect(xPos, height - 70, 70, 30);
    fill(textColor);
    textFont(font1);
    textAlign(CENTER);
    text(commName, xPos + 35, height - 50);
  }

  void clicked(int k) {
    if (((mouseX > xPos) && (mouseX < xPos + 70)) && ((mouseY > height - 70) && (mouseY < height - 40))) {
      if (fillColor == color1) {
        fillColor = color2;
        textColor = color1;
        commList[k][1] = 1;
      } 
      else {
        fillColor = color1;
        textColor = color3;
        commList[k][1] = -1;
      }

      if (int(commCode) == 0) {//IF 'ALL' BUTTON IS CLICKED
        for (int i = 0; i < commodities.size() - 1; i++) {
          Commodity commodity = (Commodity) commodities.get(i);
          commodity.turnOnAll(i);
        }
      }
    }
  }

  void turnOnAll(int m) {
    if (fillColor == color1) {
      fillColor = color2;
      textColor = color1;
      commList[m][1] = 1;
    } 
    else {
      fillColor = color1;
      textColor = color3;
      commList[m][1] = -1;
    }
  }

  boolean mouseOver() {
    return ((mouseX > xPos) && (mouseX < xPos + 70)) && ((mouseY > height - 70) && (mouseY < height - 40));
  }

  void tagFloat() {
    fill(100);
    textAlign(RIGHT, BOTTOM);
    text(commLongName, xPos + 25, height - 10);
    stroke(100);
    line(xPos + 70, height - 40, xPos + 25, height - 15);
    line(xPos + 25, height - 15, xPos - commLongName.length()*5.5, height - 15);
  }

  color onOff() {
    return fillColor;
  }
}

class Reset {
  float xPos, yPos;

  Reset(float x, float y) {
    xPos = x;
    yPos = y;
  }

  void display() {
    fill(0);
    stroke(255);
    rect(xPos, yPos, 100, 25);
    fill(255);
    textAlign(CENTER);
    textFont(font1);
    text("Reset Ports", xPos + 50, yPos + 18);
  }

  void clicked() {
    if (mouseX > xPos && mouseX < xPos + 100 && mouseY > yPos && mouseY < yPos + 25) {
      for (int i = 0; i < ports.size(); i++) {
        Port port = (Port) ports.get(i);
        port.xPos = xPort[i];
        port.yPos = yPort[i];
      }
    }
  }

  boolean mouseOver() {
    return mouseX > xPos && mouseX < xPos + 100 && mouseY > yPos && mouseY < yPos + 25;
  }
}


