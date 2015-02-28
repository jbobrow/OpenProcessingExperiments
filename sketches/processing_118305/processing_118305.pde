
//for importing csv files into a 2d array
//based on the sketch by che-wei wang: http://cwwang.com/2008/02/23/csv-import-for-processing/
 
void setup(){
 
// you must have a data folder in the same directory as your sketch
// the name of the data file must match the following line
String lines[] = loadStrings("datadata.csv");
String [][] csv;
int csvWidth=0;
 
  size(320,320);
 
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
   
  translate(10,310);
  line (0,0,300,0);
  line (0,0,0,-300);
//  line (0,300,300,0);
 
 //This is very slowly coming back to me.
 //I want to make my ellipses bigger!
 //Color doesn't have to be in front of the ellipse code part.  Changing the csv i's adds more ellipses onto my piece.
  for (int i=0; i< lines.length;i++){
    ellipse(int(csv[i][0]) * 10,((int(csv[i][2])) - 15 * (int(csv[i][2]))), 3,3);
        ellipse(int(csv[i][0]) * 10,((int(csv[i][3])) - 15 * (int(csv[i][2]))), 3,3);
        ellipse(int(csv[i][0]) * 10,((int(csv[i][4])) - 15 * (int(csv[i][2]))), 3,3);
            ellipse(int(csv[i][0]) * 10,((int(csv[i][1])) - 10 * (int(csv[i][2]))), 3,3);
            ellipse(int(csv[i][1]) * 10,((int(csv[i][1])) - 10 * (int(csv[i][2]))), 3,3);
            ellipse(int(csv[i][1]) * 10,((int(csv[i][2])) - 10 * (int(csv[i][2]))), 3,3);
            ellipse(int(csv[i][1]) * 10,((int(csv[i][3])) - 10 * (int(csv[i][2]))), 3,3);
            ellipse(int(csv[i][1]) * 10,((int(csv[i][4])) - 10 * (int(csv[i][2]))), 3,3);
    color c1 = color(150, 550, 5);
    fill(c1);

  }
 
}
 
void draw(){
 
}


