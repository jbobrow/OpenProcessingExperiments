
// Map of 6 months movement via OpenPaths.cc data
// Jonathan Bobrow
// 12-30-2012

CSV data;

int opacity = 255;

void setup(){
  size(900,600);
  strokeWeight(.1);
  background(0,25,25);
  smooth();
  
  data = new CSV();
  //data.print();
  
  for(int i = 0; i < data.csv.length-1; i++){
    float x1 = map(float(data.csv[i][1]), -74.1, -73.8, 0, width);
    float y1 = map(float(data.csv[i][0]), 40.65, 40.8, 0, height);
    float x2 = map(float(data.csv[i+1][1]), -74.1, -73.8, 0, width);
    float y2 = map(float(data.csv[i+1][0]), 40.65, 40.8, 0, height);

    float col = map(i,0,data.csv.length, 0, 255);
    stroke(col, 200 + col/5, 255, opacity);
    line( x1, y1, x2, y2);
  }
}
//for importing csv files into a 2d array
//by che-wei wang

// data retrieval
//  0: lat
//  1: lon
//  2: alt
//  3: date
//  4: device
//  5: os
//  6: version
//  7: null


class CSV{
  
  String lines[] = loadStrings("openpaths_jbobrow.csv");
  String [][] csv;
  int csvWidth=0;
  
  CSV(){
    //calculate max width of csv file
    for (int i=0; i < lines.length; i++) {
      String [] chars=split(lines[i],',');
      if (chars.length>csvWidth){
        csvWidth=chars.length;
      }
    }
      //create csv array based on # of rows and columns in csv file
    csv = new String [lines.length][csvWidth];
    
    //parse values into 2d array
    for (int i=0; i < lines.length; i++) {
      String [] temp = new String [lines.length];
      temp= split(lines[i], ',');
      for (int j=0; j < temp.length; j++){
       csv[i][j]=temp[j];
      }
    }
  }
  
  void print(){
    for(int i=0; i<csvWidth; i++){
      println(csv[0][i]);
    }
    println("columns: " + csvWidth);
    println("rows: " + csv.length);
  }
}


