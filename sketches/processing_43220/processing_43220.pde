
//Stephanie Pence
//Data Set 1: How many people attend the gathering throughout the years
//Oct 16, 2011
//http://en.wikipedia.org/wiki/Gathering_of_the_Juggalos#Early_years_.282000.E2.80.932002.29

int data[]= {7000,6600,8000,8900,5500,6000,7350,};
String years[]= {"2000","2001","2002","2003","2004","2005","2006"};
PImage juggalo;
 
void setup (){
  juggalo = loadImage("insaneclownpossepic.jpg");
  background(140,148,234);
  size(700,400);
  smooth();
}
 
void draw(){
 background(140,148,234);
 for(int i = 0; i< data.length; i++){
   float ellSize= map(data [i], 5000,25000,0,100);
     
     //fill(250);
   image (juggalo,i*100+10,50,ellSize*6,ellSize*10);
   textSize(10);
   text(data[i],i*97+30,280);
   textSize(20);
   fill(0);
   text(years[i],i*97+20,30);
   fill(0);
 }
 }


