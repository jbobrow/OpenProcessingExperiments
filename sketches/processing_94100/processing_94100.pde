
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import processing.core.*;
BufferedReader reader;
String[] singleLineInput;
ArrayList data = new ArrayList<String>(100);
String line;
PShape usa;
PShape state;
int denLim;


public void setup() {
  size(950, 600);
  usa = loadShape("http://upload.wikimedia.org/wikipedia/commons/3/32/Blank_US_Map.svg");
  smooth();
  reader = createReader("data2.txt");
  for (int i = 0; i < 50; i++) {
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
      for (int j = 0; j < 2; j++) {
        data.add(singleLineInput[j]);
      }
    }
  }
}

public void draw() {
  background(255);
  shape(usa, 0, 0);
  colorStates();
  textSize(20);
  textAlign(CENTER);
  text("Population Density by State (Brighter Areas are Denser in Population)", 
  width / 2, 18);
  textSize(15);
  if (denLim <= 0) {
    text("Currently displaying states with all pop. densities", 
    width / 2 + 70, 38);
  } 
  else {
    text("Currently displaying states with pop. density >" + denLim
      + " people per square mile", width / 2 + 70, 38);
  }

  if (mousePressed) {
    if (denLim < 1200) {
      denLim += 5;
    } 
    else {
      denLim = -50;
    }
  }
}

void colorStates() {
  for (int i = 0; i < data.size(); i += 2) {
    PShape state = usa.getChild(data.get(i).toString());
    if ((int) Double.parseDouble(data.get(i + 1).toString()) > denLim) {
      state.disableStyle();
      fill((int) Double.parseDouble(data.get(i + 1).toString()) * 200 / 1200 + 50, 
      0, 0);
      noStroke();
      shape(state, 0, 0);
    }
  }
}


