
//most of my problems stemmed from having data that wouldn't work as csv
//brain fried
//found new data
//changed scaling
//more technical notes on bottom

 
void setup(){
 
// you must have a data folder in the same directory as your sketch
// the name of the data file must match the following line
String lines[] = loadStrings("data1.csv");
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
 
  for (int i=0; i< lines.length;i++){
    ellipse((int(csv[i][0]) *30),((int(csv[i][0])) - 30 * (int(csv[i][0]))), 3,3);
  }
 
}



// Ellipse()
//Because ellipse is a command, it will appear as a blue link that you can right click to find reference

//Ellipse(x,y,w,h)
//Csv[] [] ← two dimensional array

//0-colum
//i-rows

//rows 1st, columns 2nd

 



