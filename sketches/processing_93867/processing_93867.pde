
Table inst;
int rowCount;

void setup() {
 inst = new Table("uvu-uvsc.csv");
 rowCount=inst.getRowCount();
// println("rowCount = " + rowCount);
 size(962,500);
}

void draw() {
  textAlign(CENTER);

 background(0); 
textSize(32);
//fill(25500,200,200,255);
text("UVSC",100,450);
text("UVU",862,450);
textSize(12); 
for (int i=0; i<rowCount; i++) { 
if (inst.getString(i,0).substring(0,4)!=inst.getString(i+1,0).substring(0,4)) {
 text(inst.getString(i,0).substring(0,4),i*2,20);
 stroke(200);
 line(i*2,30,i*2,height);}
 
 stroke(100,255,100,155);
 strokeWeight(1);
   line(i*2,height,i*2,map(inst.getFloat(i,1),100,0,0,height));
 stroke(250,255,100,155);
   line(i*2+1,height,i*2+1,map(inst.getFloat(i,2),100,0,0,height));

}

 noLoop();
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



