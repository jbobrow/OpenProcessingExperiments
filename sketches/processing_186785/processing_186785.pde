
/*
** Cyclist Count by Year At Selected Commuter Locations
** data from:
** https://data.cityofnewyork.us/d/m6ar-24vj?category=Transportation&view_name=Cyclist-Count-by-Year-At-Selected-Commuter-Locatio
** your task: create a unique data visualization.
** for more information on working with data in Processing, see: https://processing.org/tutorials/data/
*/

String[] headers;
int[][] data; 

void setup(){
  smooth();
  size(500,600);
  // load csv file into String array
  String [] lines = loadStrings("Cyclist_Count_by_Year_At_Selected_Commuter_Locations.csv");

  
  //split the first line into an array and load it into our global headers array
  headers = split(lines[0], ",");
   
   
  //create a temporary 2D String array.
  //we'll think of it as a 28 row x 9 column matrix
  String[][] tempData = new String[lines.length-1][headers.length];

  
  //Curious to see how many rows and columns we're loading into our tempData?
  //uncomment this line below.
  //println( lines.length-1 + " rows by " + headers.length + " cols.");
  
  //loop through each of the subsequent lines after the header row and
  //assign each to the row index of our tempData matrix 
  for(int i = 1; i < lines.length; i++){
    tempData[i-1] = split(lines[i], ",");//assigns an array to each temData row
  }
  

  
  //construct our global data matrix.
  //we can also think of this as a 28 row x 9 col matrix
  data = new int[tempData.length][tempData[0].length];

  //loop through each of the rows and columns of our tempData matrix.
  //a.k.a. nested for loops.
  for(int i = 0; i < tempData.length; i++){ //for each row
    for(int j = 0; j < tempData[i].length; j++){ //and for each col
        data[i][j] = Integer.parseInt(tempData[i][j]);  //
    }
  }
  
}



void draw(){

  background(130);//setting background color 
  int offSet = 50;
  
  noStroke();//Disables drawing the stroke (outline).
    for(int i = 0; i < data.length; i++){ //for each row
    for(int j = 0; j < data[i].length; j++){ //and for each col//
       rect(0,20*i,50,20);//make a rectangular 
       
       
   
       if ( data[i][j] > 0 && data[i][j] < 500 ){// I creat if else condition for changing its colors
       fill(255,245,245);//The fist one is red, because i want to set red as the main color
       rect(50*j,20*i,50,20);//adding more retangular
       }else if ( data[i][j] > 500 && data[i][j] < 1000 ) {//setting the condition
       fill(255,235,235);//-10 each times
       rect(50*j,20*i,50,20);     
       }else if ( data[i][j] > 1000 && data[i][j] < 1500 ) {
       fill(255,225,225);
       rect(50*j,20*i,50,20);
       }else if ( data[i][j] > 1500 && data[i][j] < 2000 ) {
       fill(255,215,215);
       rect(50*j,20*i,50,20);
       }
       else if ( data[i][j] > 2000 && data[i][j] < 2500 ) {
       fill(255,195,195);
       rect(50*j,20*i,50,20);
       }
       else if ( data[i][j] > 2500 && data[i][j] < 3000 ) {
       fill(255,185,185);
       rect(50*j,20*i,50,20);
       }
       else if ( data[i][j] > 3000 && data[i][j] < 3500 ) {
       fill(255,175,175);
       rect(50*j,20*i,50,20);
       }
        else if ( data[i][j] > 3500 && data[i][j] < 4000 ) {
       fill(255,165,165);
       rect(50*j,20*i,50,20);
       }
        else if ( data[i][j] > 4000 && data[i][j] < 4500 ) {
       fill(255,155,155);
       rect(50*j,20*i,50,20);
       }
        else if ( data[i][j] > 4500 && data[i][j] < 5000 ) {
       fill(255,145,145);
       rect(50*j,20*i,50,20);
       }
        else if ( data[i][j] > 5000 && data[i][j] < 5500 ) {
       fill(255,135,135);
       rect(50*j,20*i,50,20);
       } else if ( data[i][j] > 5500 && data[i][j] < 6000 ) {
       fill(255,125,125);
       rect(50*j,20*i,50,20);
       }else if ( data[i][j] > 6000 && data[i][j] < 6500 ) {
       fill(255,115,115);
       rect(50*j,20*i,50,20);
       }
       

       text(data[i][j],20+50*j,20+20*i);//the text 
       

    }
  }

  
  




}


