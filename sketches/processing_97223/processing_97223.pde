
Table inst;
int rowCount;
int c;
int st=0;
int selector=1;
int highlight=0;
int ignore=0;
String s="";
void setup() {
 inst = new Table("instevolve.csv");
 rowCount=inst.getRowCount();
 //println("rowCount = " + rowCount);
 
 size(800,2000);
 }

void draw() {
  textAlign(LEFT);
  background(0);
  for (int r=1; r<4; r++) {
    stroke(206,214,180);
    noFill();
    ellipse (r*150,75,25,25);
    if (selector==r) {
      fill(191,75,49);
      ellipse (r*150,75,20,20);
    }
      fill(206,214,180);
    text ("Public", 180,80);
    text ("Not for profit", 330,80);
    text ("Private",480,80);
  }
  noFill();
  rect(587,63,25,25);
  text ("Ignore new institutions",630,80);
  if (ignore==1) {line(587,63,587+25,63+25); line(587+25,63,587,63+25);}
  
  textAlign(CENTER);
  textSize(20);
  text("Evolution of Degree-granting Institutions by Sector",width/2,25);
  st=0;
 noStroke();
   fill (75,57,41,150);
 rect (180,35,100,20);
  fill (191,75,49,150);
   rect (300,35,100,20);
  fill (252,194,64,150);
   rect (420,35,100,20);
  fill (77,139,77,150);
   rect (540,35,100,20);
  fill(206,214,180);
  textSize(12);
  text("Less than Bachelors",230,50);
  text("Bachelors",350,50);
  text("Masters",470,50);
  text("Doctorate",590,50);  
  
  textSize(20);
   if (selector==1) {s="Public";}
    if (selector==2) {s="Not for profit";}
      if (selector==3) {s="Private";}
  stroke(206,214,180);
  line(99,90,99,height-50);
  line(121+28*20,90,121+28*20,height-50);
  text("1980", 75,175);
  text("2011", 145+28*20,175);
  
  for (int i=0; i<rowCount;  i++) {
    if ((inst.getString(i,4)==s) && ((ignore==0) || (inst.getString(i,5)>0))) {
       for (int y=0; y<29; y++) {
         c=inst.getInt(i,y+5);
         if (c==0) {stroke(100*highlight,200*highlight);}
         if (c==1) {stroke(75,57,41,150+highlight*100);}
         if (c==2) {stroke(191,75,49,150+highlight*100);}
         if (c==3) {stroke(252,194,64,150+highlight*100);}
         if (c==4) {stroke(77,139,77,150+highlight*100);}      
         line(100+y*20,st+100,120+y*20,st+100);
       }  
     if (mouseY==st+100) {highlight=1; text(inst.getString(i,1),width/2,st+120);} else {highlight=0;}
     st++;
    }
  }    
}

void mousePressed() {
  if (dist(mouseX,mouseY,150,75)<25) {selector=1;}
  if (dist(mouseX,mouseY,300,75)<25) {selector=2;}
  if (dist(mouseX,mouseY,450,75)<25) {selector=3;}
  if (dist(mouseX,mouseY,600,75)<25) {ignore=1-ignore;}
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



