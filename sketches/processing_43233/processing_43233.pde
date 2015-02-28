
 //stephanie pence
 // oct 19,2011
 // data set 2: Endangered cheetah chart throughout time
 
 
 
 
int data[] = {100000,82000,65000,25000,10000};
String years[]= {"1900","1930","1970","1995","2011"};
PImage cheetah;


 
void setup (){
  cheetah = loadImage("Cheetah.jpg");
  background(242,204,108);
  size(1300,600);
  smooth();
}
 
void draw(){
 background(242,204,108);
 for(int i = 0; i< data.length; i++){
   float ellSize= map(data [i], 10000,100000,0,100);
     
  
   image (cheetah,i*300+60,100,ellSize*3,ellSize*3);
   textSize(10);
   text(data[i],i*200+200,450);
   textSize(20);
   fill(0);
   text(years[i],i*200+200,30);
   fill(0);
 }
 }

