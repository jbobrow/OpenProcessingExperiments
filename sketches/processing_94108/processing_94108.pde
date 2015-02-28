
Table inst;
int rowCount;
int tr=1;

void setup() {
 inst = new Table("uvuyear.csv");
 rowCount=inst.getRowCount();
 //println("rowCount = " + rowCount);
 size(1000,1000);
 colorMode(HSB);
}

void draw() {
  textAlign(CENTER);

 background(0);
stroke(255); 
strokeWeight(2);
textSize(24);
text("Relative number of Google searchs for UVU or UVSC by month",width/2+50,30);
textSize(16);
text("Use mouse to expand and blur to reveal general pattern",width/2+50,50);
//fill(25500,200,200,255);
//text("UVSC",100,450);
//text("UVU",862,450);
line(100,0,100,900);
line(100,900,1000,900);
noStroke();
textSize(12); 
tr=constrain(mouseX/10,2,100);
for (int i=1; i<rowCount; i++) { 
  fill(map(inst.getString(i,0),2003,2015,0,365),255,255,255/(tr/5));
  ellipse (map(inst.getString(i,1),0,365,100,1000),map(inst.getString(i,2),0,100,1000,100),tr,tr);
//  if (inst.getString(i,0)==inst.getString(i-1,0)) {
//  stoke(map(inst.getString(i,0),2003,2015,0,365),255,255,255/(tr/5));
//  line(map(inst.getString(i,1),0,365,100,1000),map(inst.getString(i,2),0,100,1000,100),map(inst.getString(i-1,1),0,365,100,1000),map(inst.getString(i-1,2),0,100,1000,100));
//  }
  
  if ((i==1) || (inst.getString(i,0)!=inst.getString(i-1,0))){
     fill(map(inst.getString(i,0),2003,2015,0,365),255,255,255/(tr/5));
     ellipse (50,(inst.getString(i,0)-2003)*75,tr,tr);
     fill(255);
     text (inst.getString(i,0),50, (inst.getString(i,0)-2003)*75+40);}
  
}
for (int i=0; i<12; i++) {
  stroke(255,50);
  line(100+i*900/12,0,100+i*900/12,905);
  fill(255);
  text(i+1,140+i*900/12,950);
  }
text("Legend",50,50);
text("Month",50,950);


}


class Table {
  int rowCount;
  String[][] data;
   
   
  Table(String filename) {
    String[] rows = loadStrings(filename);
    data = new String[rows.length][];
     
    for (int i = 0; i < rows.length; i++) {
      if (trim(rows[i]).length() == 0) {
        continue; // skip empty rows
      }
      if (rows[i].startsWith("#")) {
        continue;  // skip comment lines
      }
       
      // split the row on the tabs
      String[] pieces = split(rows[i], ",");
      // copy to the table array
      data[rowCount] = pieces;
      rowCount++;
       
      // this could be done in one fell swoop via:
      //data[rowCount++] = split(rows[i], "/t");
    }
    // resize the 'data' array as necessary
    data = (String[][]) subset(data, 0, rowCount);
  }
   
   
  int getRowCount() {
    return rowCount;
  }
   
   
  // find a row by its name, returns -1 if no row found
  int getRowIndex(String name) {
    for (int i = 0; i < rowCount; i++) {
      if (data[i][0].equals(name)) {
        return i;
      }
    }
    println("No row named '" + name + "' was found");
    return -1;
  }
   
   
  String getRowName(int row) {
    return getString(row, 0);
  }
 
 
  String getString(int rowIndex, int column) {
    return data[rowIndex][column];
  }
 
   
//  String getString(String rowName, int column) {
//    return getString(getRowIndex(rowName), column);
//  }
 
   
//  int getInt(String rowName, int column) {
//    return parseInt(getString(rowName, column));
 // }
 
   
  int getInt(int rowIndex, int column) {
    return parseInt(getString(rowIndex, column));
  }
 
   
//  float getFloat(String rowName, int column) {
//    return parseFloat(getString(rowName, column));
//  }
 
   
  float getFloat(int rowIndex, int column) {
//    line(random(1000),random(500),random(1000),random(500));
    return parseFloat(getString(rowIndex, column));
  }
   
   
  void setRowName(int row, String what) {
    data[row][0] = what;
  }
 
 
  void setString(int rowIndex, int column, String what) {
    data[rowIndex][column] = what;
  }
 
   
  void setString(String rowName, int column, String what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = what;
  }
 
   
  void setInt(int rowIndex, int column, int what) {
    data[rowIndex][column] = str(what);
  }
 
   
  void setInt(String rowName, int column, int what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = str(what);
  }
 
   
  void setFloat(int rowIndex, int column, float what) {
    data[rowIndex][column] = str(what);
  }
 
 
  void setFloat(String rowName, int column, float what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = str(what);
  } 
}



