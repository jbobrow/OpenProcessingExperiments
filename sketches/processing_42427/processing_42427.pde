
// introducing array; a single variable that holds an array of data
// array called data
//data []= {23,52,67,58,98};
//0    1    2    3    4   
//23  52   67    58   98
// data [3] would come up with 58
// String 
//us gdp per capita

int data[]= {76430000,53100000,12700000,12466000,9600000,7700000,7350000,7300000,7100000};//loads data into an array
String names[]= {"USA","RUSS","CHINA","UK","JAP","CAN","MEX","THAI","AUS","KOR"};
PImage cat;

void setup (){
  cat = loadImage("cat1.png");
  background(147,34,56);
  size(875,250);
  smooth();
}

void draw(){
 background(111,32,20);
 for(int i = 0; i< data.length; i++){//painting an array of any length that ur looping through(for (i 0-datalength)
   float ellSize= map(data [i], -900000,100000000,0,100);// map data on anything
   //if(dist(mouseX,mouseY,i*100+30,100) <ellSize/2){
    
     //fill(250);
   image (cat,i*100+30,100,ellSize*1.1,ellSize*1.1);
   textSize(10);
   text(data[i],i*97+40,200);
   textSize(20);
   text(names[i],i*97+30,50);
 }
 }

  //println(data[2]);
  //map the data to ellipsesize
  //then map the postioin to i
  


