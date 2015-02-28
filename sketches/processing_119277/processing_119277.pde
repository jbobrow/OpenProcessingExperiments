
//for importing csv files into a 2d array
//based on the sketch by che-wei wang: http://cwwang.com/2008/02/23/csv-import-for-processing/
 
void setup(){
 
// you must have a data folder in the same directory as your sketch
// the name of the data file must match the following line
String lines[] = loadStrings("forest_coverage.csv");
String [][] csv;
int csvWidth=0;
 
  size(500,500);
 
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

  //test
  //println(csv[2][2]);
  // Translate-land 10 px in from the bottom left corner 
  translate(10,490);
  line (0,0,height-20,0);
  line (0,0,0,-480);
//  line (0,300,300,0);
// 
  for (int i=10; i< lines.length;i++){
    ellipse(int(csv[i][2])*(5),((int(csv[i][3]))*(-1)*5), 5,5); 
    fill (57,216,119);
  }
 
}
 
void draw(){
 
}



