
// Code from Visualizing Data, First Edition, Copyright 2008 Ben Fry.


import treemap.*;

Treemap map1, map2, map3, map4;
Table data;
String currName;
int rowCount;

void setup() {
  size(900, 900);

  smooth();
  strokeWeight(0.25f);
  PFont font = createFont("Serif", 13);
  textFont(font);

  // different choices for the layout method
  //MapLayout algorithm = new SliceLayout();
  //MapLayout algorithm = new StripTreemap();
  MapLayout algorithm = new PivotBySplitSize();
  //MapLayout algorithm = new SquarifiedLayout();

  // load table 1
  WordMap mapData = new WordMap();
  data = new Table("isyh_data_M spotting M.tsv");
  rowCount = data.getRowCount();
  for (int row = 0; row < rowCount; row++) {
    String word = data.getString(row,0);
    int count = data.getInt(row,1);
    for (int i = 0; i < count; i++) {
      mapData.addWord(word);
    }
  }
  mapData.finishAdd();
  map1 = new Treemap(mapData, 0, 0, width, height);
  
  // load table 2
  mapData = new WordMap();
  data = new Table("isyh_data_M spotting F.tsv");
  rowCount = data.getRowCount();
  for (int row = 0; row < rowCount; row++) {
    String word = data.getString(row,0);
    int count = data.getInt(row,1);
    for (int i = 0; i < count; i++) {
      mapData.addWord(word);
    }
  }
  mapData.finishAdd();
  map2 = new Treemap(mapData, 0, 0, width, height);
  
  // load table 3
  mapData = new WordMap();
  data = new Table("isyh_data_F spotting M.tsv");
  rowCount = data.getRowCount();
  for (int row = 0; row < rowCount; row++) {
    String word = data.getString(row,0);
    int count = data.getInt(row,1);
    for (int i = 0; i < count; i++) {
      mapData.addWord(word);
    }
  }
  mapData.finishAdd();
  map3 = new Treemap(mapData, 0, 0, width, height);
  
  // load table 4
  mapData = new WordMap();
  data = new Table("isyh_data_F spotting F.tsv");
  rowCount = data.getRowCount();
  for (int row = 0; row < rowCount; row++) {
    String word = data.getString(row,0);
    int count = data.getInt(row,1);
    for (int i = 0; i < count; i++) {
      mapData.addWord(word);
    }
  }
  mapData.finishAdd();
  map4 = new Treemap(mapData, 0, 0, width, height);
  


  background(255);
  map1.draw();
}


void draw() {
}


void keyPressed() {
  if (key == '1') {
    background(255);
    map1.draw();
  } else if (key == '2') {
    background(255);
    map2.draw();
  } else if (key == '3') {
    background(255);
    map3.draw();
  } else if (key == '4') {
    background(255);
    map4.draw();
  }
}

