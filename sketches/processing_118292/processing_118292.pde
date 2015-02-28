
void setup(){
 //havent figured out anything of value, still pretty lost
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
 // cant get more than 3 points...
  for (int i=0; i< lines.length;i++){
    ellipse((int(csv[i][0])),((int(csv[i][2])) - 2 * (int(csv[i][2])) * 30), 3,3);
  }
 
}
 
void draw(){
 
}



