
//Anthony Hernandez
//October 21, 2011
//Midterm Data Visualization-
//US Nuclear Stockpile compared to US GDP and Government Spending from 1945-2000//

//Sources: www.nrdc.org, www.google.com/images/US Dollar Symbol

 
int data[] = {6, 369, 3057, 20435, 31642, 26119, 27052, 23764, 23135, 21211, 10953, 10615};
 
float gdp[]={.1,.3,.5,.7,1,1.3,2,3,4.5,7.5,10};
 
String dates[]={"1945","1950","1955","1960","1965","1970","1975","1980","1985","1990","1995","2000"};
 
PImage money;


void setup(){
  money = loadImage("dollar_ase.gif");
  size(800,600);
  background(0);
  smooth();
  float gdp[];
}

void draw(){
    background(0);
    PFont myfont;
      myfont = loadFont("OCRAStd-14.vlw"); 
      text("US Nuclear Stockpile compared to US GDP and Government Spending from 1945-2000",85,590);
      text("Nuclear Stockpile",325,215);
      text("GDP and Government Spending",300,335);
      textFont(myfont,14);
      
    for(int i = 0; i < data.length; i++){
      float rectSize = map(data[i],6,31642,0,45);
        rect(i*60+40,230,rectSize,rectSize);
        fill(255);
       
        
     //for(int b = 0; i < data.length; i++){
      //float ellSize = map(data[i],6,31642,0,45);
       //ellipse(i*60+40,400,ellSize,ellSize);
        //fill(255);

     text(dates[i],i*60+40,450);
     text(data[i],i*60+40,150);
     textSize(11);
     fill(255);
     }
     
     for(int i = 0; i < gdp.length; i++){
      float imageSize = map(gdp[i],.1,10,0,45);
        image(money,i*60+100,350,imageSize,imageSize);
      }
    
      //if(mouseX>100&&x<200&&y>200&&y<300){
        //text("US Nuclear Stockpile",mouseX,mouseY);
      }

