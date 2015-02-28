
//Global Variables
PFont font;



// Source : http://en.wikipedia.org/wiki/Millionaire#Number_of_millionaires_by_country
int[] millionaires = 
{
  3104000,
  1719000,
  924000,
  535000,
  454000,
  396000,
  282000,
  243000,
  193000,
  170000,
};

float[] growthRate = 
{
  8.3,
  5.4,
  7.2,
  12.0,
  1.4,
  3.4,
  12.3,
  9.7,
  11.1,
  -4.7,
};


String[] country =
{
  " United States",
  " Japan",
  " Germany",
  " China",
  " United Kingdom",
  " France",
  " Canada",
  " Switzerland",
  " Australia",
  " Italy",
};

void setup()
{
  background(205,214,242); //blue background
  size(600,700);
  smooth();
  strokeWeight(10);
  colorMode(RGB, width);
  fill(97,31,222);
  font = loadFont("AgencyFB-Reg-20.vlw");
  textFont(font,22);
  textAlign(CENTER);
  text("Top 10 countries with the most millionaires in 2010" , 250,30);
}

void draw(){

int x=0; //intialise x to 0
int a = 60; //intialise a to 60
boolean b = false; //b is set to false  
int c= 370;
  
  for(int i=0;i<10;i++){
    //when i is 0 and less than 10, adds one to i and:
     
     a += 25;
     c += 25;
     //creates a 25 y-coordinate space between text down wards
     
     if(mouseX>x && mouseX<=x+60){
      //when mouseX is greater than 0 and less than or equal to 40
       
       b = true; //when rolled over b is set to true
       
       fill(255); //the fill will be black
       
       textAlign(LEFT); //Alignment set to left
       
       fill(240,12,13); //the fill will be red when the box has been rolled over
       
       text("Country : " + country[i] + " - Amount Of Millionaires : " + millionaires[i],160,a);
       //Displays country and amount of millionares according to which box is rolled over.
       //The text will be displayed at 270 x-coordinate and will intially be at 50 y-coordinate.
       //with a 25 y-coordinate space between them.
       text("Growth Rates from 2009",420,360);
      
       textAlign(LEFT);
       //textFont(font,18);
       text(growthRate[i] + "%",420,c);
       
       fill(23,65,211); //blue fill when rolled over
      
     }else{
       b = false; //b is set to false when not rolled over
       fill(255);
       textAlign(CENTER);
       text("Rollover bar's to display statistics :", 270,50);
       fill(211,23,211);
     }
     
     
      
              
    //we need to make the data range fit in out window so we can use map 
    // we take the upper bound as a little larger our biggest value
    // and the lower bound as a little lower than our lowest value
    float h = map(millionaires[i], 150000,2800000,0,700);
    float m = map(growthRate[i],150000,2800000,0,700);
     
    rect(x+10,height-h,30,h);
    //x+10 just moves the bar graph 10 along
    
    
      
     
    
    x+=60;
  }
 
}



