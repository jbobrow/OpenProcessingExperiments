
//for importing csv files into a 2d array
//based on the sketch by che-wei wang: http://cwwang.com/2008/02/23/csv-import-for-processing/
 
void setup(){
 
// you must have a data folder in the same directory as your sketch
// the name of the data file must match the following line
String lines[] = loadStrings("madeup.csv");
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

//  changed the color of the dots
//  changed the size of the dots
//  cried
  for (int i=0; i< lines.length;i++){
    ellipse((int(csv[i][0]) * 2),(((int(csv[i][2])) * (-1)) * 2), 20,20);
    color c1 = color(190, 90, 0);
    color c2 = color(20, 30, 0);
    fill(c1);
    
 //   ellipse(xxx,xxx,3,3)
 
 
  }
  
 }
 
void draw(){
 
}
