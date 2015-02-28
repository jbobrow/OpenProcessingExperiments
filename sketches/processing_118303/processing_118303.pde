
//for importing csv files into a 2d array
//based on the sketch by che-wei wang: http://cwwang.com/2008/02/23/csv-import-for-processing/
 
void setup(){
 //my data is the number of deaths in each country from battle in 2002 and 2004
// you must have a data folder in the same directory as your sketch
// the name of the data file must match the following line
String lines[] = loadStrings("battledeaths.csv");
String [][] csv;
int csvWidth=0;
 // i made the size bigger because there is a lot of data in my csv
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
   //here i translated the number according to the bigger size of the format
  translate(10,490);
  line (0,0,480,0);
  line (0,0,0,-480);
//  line (0,300,300,0);
 //i multiplied the row by 10 and colum by 5 to blow up the data, making it more readable
  for (int i=0; i< lines.length;i++){
    ellipse((int(csv[i][1])*10),((int(csv[i][2])) - 2 * ((int(csv[i][2])))*5), 3,3);
  }
 
}
 
void draw(){
 
}



