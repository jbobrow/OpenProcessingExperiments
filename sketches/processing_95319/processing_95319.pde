
Table inst;
int rowCount;
int limit=0;
float lngmin=-135;
float lngmax=-60;
float latmin=23;
float latmax=50;
float lngmint=-135;
float lngmaxt=-60;
float latmint=23;
float latmaxt=50;
int sizer=0;
float x=0;
float y=0;
float easing=.00005;
int disp=0;
  colorMode(HSB);




void setup() {
 inst = new Table("enrlonglat.csv");
 rowCount=inst.getRowCount();
 //println("rowCount = " + rowCount);
 size(600,300);
}

void draw() {
  cursor(CROSS);
  textAlign(CENTER);
 background(0); 
 textSize(12);
 text(disp+" colleges with enrollment greater than "+limit, 140,height-75);
 disp=0;
 text("Reset zoom",450,height-75);
   textSize(9);
 stroke(155,0,255,255);
 strokeWeight(3);
 noFill();
 ellipse (100,height-50,30,30);
 ellipse (150,height-50,30,30);
 ellipse (450,height-50,30,30);
 line(90,height-50,110,height-50);
 line(100,height-60,100,height-40);
 line(140,height-50,160,height-50);
 line(440,height-60,460,height-40);
 line(460,height-60,440,height-40);
 noStroke();
 int num=1;
 
for (int i=1; i<rowCount; i++) {  
   String col = inst.getString(i,0);
   int enr = sqrt(inst.getInt(i,1)/((latmax-latmin)*10));
   float lng = map(inst.getFloat(i,2),lngmin,lngmax,0,width);
   float lat = map(inst.getFloat(i,3),latmax,latmin,0,height);
   fill(inst.getInt(i,1) % 255,(inst.getInt(i,1) % 4)*25+150,(inst.getInt(i,1) % 3)*50+100,150);
   if (inst.getInt(i,1)>limit) {
     ellipse(lng,lat,enr,enr);
     disp++;
     }
     fill(155,0,255,255); 
   if ((dist(mouseX,mouseY,lng,lat)<enr/2) && (inst.getInt(i,1)>limit)) {
        if (mouseX<width/2) {textAlign(LEFT);
        text(col+" "+nfc(inst.getInt(i,1)),mouseX+15,mouseY+(num%2*2-1)*5*num);}
        if (mouseX>=width/2)  {textAlign(RIGHT);
        text(col+" "+nfc(inst.getInt(i,1)),mouseX-15,mouseY+(num%2*2-1)*5*num);}
        num++;
             }
    if ((sizer==1) && (mouseX>x)) {
       noFill();
       stroke(255,255,255,255);
       strokeWeight(1);
       rect (x,y,mouseX-x,(mouseX-x)/2);
       noStroke();
    } 
    latmax+=(latmaxt-latmax)*easing;
    latmin+=(latmint-latmin)*easing;    
    lngmax+=(lngmaxt-lngmax)*easing;
    lngmin+=(lngmint-lngmin)*easing;      
 }
 
// noLoop();
}

void mousePressed() {
    if (dist(mouseX,mouseY,100,height-50)<15) {limit += 500;}
    if ((dist(mouseX,mouseY,150,height-50)<15) && (limit>0)) {limit -= 500;}
    if (dist(mouseX,mouseY,450,height-50)<15) {    
        lngmint=-135; //-175;
        lngmaxt=-60; //-50;
        latmint=23; // 10;
        latmaxt=50;}//80;}
    if (mouseY<height-70) {
        sizer=1-sizer;
        if (sizer==1) {
            x=mouseX;
            y=mouseY;} 
         if (sizer==0) {   
            latmaxt=map(y,0,height,latmax,latmin);
            latmint=map(y+((mouseX-x)/2),0,height,latmax,latmin);
            lngmaxt=map(mouseX,0,width,lngmin,lngmax);
            lngmint=map(x,0,width,lngmin,lngmax);
      
         }
       
     }
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
