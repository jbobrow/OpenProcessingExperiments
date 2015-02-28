
//Mauricio Orantes
//Visualization of DATA

//Set Integers and Floats here

int Qty;
//float [] myOneValue; //array defined 1 dimension
//float [][] myValue; //array defined 2 dimension
String []Bankdata;
String []Bankname;
PFont myTypeface; 
String[]Bank;
int n;

//Setup
void setup() {
  size(800, 600);
  background(255);
  myTypeface = loadFont ("AgencyFB-Reg-36.vlw");//Font Settings 
  String Bank[]=loadStrings("banklist.csv"); //LoadFull Data set
  Qty = Bank.length;
  n=Qty;
  
  
  Bankdata = new String [Qty];//Data Column for State
  Bankname = new String [Qty];//Data Column for Bankname
  //Complete sum of entries in Column 
  for (int counter=0; counter<Qty; counter++) {
    String[] temp = split(Bank[counter], ',' ); //this line splits the data by commas 
    Bankdata[counter]=temp[2];
    Bankname[counter]=temp[0];
    frameRate(4);
  }
}


//Draw
void draw() {
  background(0);
  textFont(myTypeface);                                                 
  text(("FDIC Failed Bank List"), 300, 0, 300, 400);
  fill(#ffffff);
  int counter = 0;
  //for (int counter=0; counter<Qty; counter++){
  //for (int n=0;n<Qty;n++){
  // if (n>455){
  // ellipse(200,200,50,50);
  // fill(#FFFFFF);
  // } else {
  //    text(("nothing to see here people"), 275, 200, 300, 400);
  //  }

  
   if(Qty>=0){
      textSize(32);
       Reps();
      fill(#FB5B1F);
           }
   // counter = (counter + 1) % Qty;
   println(Bankname);// Prints bank name to the console

}


void Reps() { //Representation circle
  smooth();
  ellipse (400, 300, Qty, Qty);
  strokeWeight(3);
  fill(#FB5B1F);
  text(Bankname[Qty-=1],240,290);
}


