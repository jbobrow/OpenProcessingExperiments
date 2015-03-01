
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
  size(900,600);
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

  background(245);

  
  for( int ll = 1; ll < 28 ; ll++ ){
  
    strokeWeight(1);
    stroke(210);
    line(0,21*ll,width/2,21*ll);
  textSize(14);
  fill(170);
    text(data[ll][0],45,21*ll-5); 
  }
 
  float screenPart = height/28; 
  
  
  int yposition = height/2-100;
  int leftMargin = 20;
 
 


 



  strokeWeight(4);
  textAlign(RIGHT);
  textSize(10);
  fill(0);
  
  
if ( mouseY > 0 && mouseY < 21 ){
  int n = 1;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for
  


// After this part is just for mouse conditions //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

} else if (mouseY > 21 && mouseY < 21*2){
int n = 2;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*1) && mouseY < 21+(21*2)){
int n = 3;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*2) && mouseY < 21+(21*3)){
int n = 4;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*3) && mouseY < 21+(21*4)){
int n = 5;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*4) && mouseY < 21+(21*5)){
int n = 6;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*5) && mouseY < 21+(21*6)){
int n = 7;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*6) && mouseY < 21+(21*7)){
int n = 8;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*7) && mouseY < 21+(21*8)){
int n = 9;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*8) && mouseY < 21+(21*9)){
int n = 10;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*9) && mouseY < 21+(21*10)){
int n = 11;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*10) && mouseY < 21+(21*11)){
int n = 12;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*11) && mouseY < 21+(21*12)){
int n = 13;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*12) && mouseY < 21+(21*13)){
int n = 14;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*13) && mouseY < 21+(21*14)){
int n = 15;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*14) && mouseY < 21+(21*15)){
int n = 16;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*15) && mouseY < 21+(21*16)){
int n = 17;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*16) && mouseY < 21+(21*17)){
int n = 18;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*17) && mouseY < 21+(21*18)){
int n = 19;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*18) && mouseY < 21+(21*19)){
int n = 20;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*19) && mouseY < 21+(21*20)){
int n = 21;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*20) && mouseY < 21+(21*21)){
int n = 22;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*21) && mouseY < 21+(21*22)){
int n = 23;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*22) && mouseY < 21+(21*23)){
int n = 24;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*23) && mouseY < 21+(21*24)){
int n = 25;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*24) && mouseY < 21+(21*25)){
int n = 26;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}else if (mouseY > 21+(21*25) && mouseY < 21+(21*26)){
int n = 27;
  
 for ( int a = 1 ; a < data[n].length ; a++) {
  int graphData = data[n][a];
  int graphHigh = graphData/30;
    if ( graphData == data[n][8] ) { // IF IT'S GRAND TOTAL
    strokeWeight(9);  // INCREASE STROKE WEIGHT
    stroke(0); // CHANGE STROKE COLOR TO BLACK
    yposition = yposition+20;
    fill(0);
    textSize(14); 
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+6);
    textSize(30); // SET TEXT SIZE FOR YEAR
    text(data[n][0],width-leftMargin+5,yposition + 50);  // SHOW YEAR
    }else{
    stroke(100);
    fill(150);
    text(headers[a],(width-leftMargin)-graphHigh-10,yposition+3);
    }//end else    
  line (width-leftMargin,yposition,(width-leftMargin)-graphHigh,yposition);
  yposition = yposition + 30 ;
  }  // end for

}





}


