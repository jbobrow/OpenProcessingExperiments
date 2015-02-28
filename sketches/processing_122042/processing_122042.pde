
Fish fish;
Ball ball;
Data dataEl;
Fly fly;
Graph hugeG;

// Declare the Fonts
PFont Bold1;
PFont Bold2;
PFont Bold3;
PFont Regular;
PFont Small;
PFont BallBig;
PFont BallSmall;

int seconds;

boolean graph;
boolean printed=false;


String conditions;
String fish_catch;
int minutesNow;
int minutesPassed=20;
//int minutes=minute();
//int seconds=second();

void setup(){
size(900,600);
background(255);

// Load the FONTS!
Bold1 = loadFont("Apercu-Bold-20.vlw");
Bold2 = loadFont("Apercu-Bold-24.vlw");
Bold3 = loadFont("Apercu-Bold-34.vlw");
Regular = loadFont("Apercu-20.vlw");
Small = loadFont("Apercu-12.vlw");
BallBig = loadFont("Apercu-Bold-60.vlw");
BallSmall = loadFont("Apercu-Bold-30.vlw");
// END OF FONTS


dataEl=new Data();

dataEl.weather();
dataEl.getRiverData();
dataEl.setupCalendar();

checkWeatherConditions();
checkRiverConditions();

/****debug
println(conditions);
println(dataEl.getCurrentWaterLevel());
/***debug*/


fish=new Fish(fish_catch,width/2,0);
ball=new Ball(conditions,width/2,height/2);
fly=new Fly(fish_catch,660,300); 
hugeG=new Graph();

//These were used for the design
//fish=new Fish("trout",width/2, 0);
//ball=new Ball("bad",width/2,height/2);
//fly=new Fly("trout",660,300);
//ball.printMsgBad();

fish.printMsg();
fly.printMsg();
dataEl.printScale();

minutesNow=minute();
}

/****END SETUP****/

void draw(){


noStroke();
if(!graph){
dataEl.time();
printed=false;
}

/*I want to print the big graph only once, is thought not to tire out the machine*/
if(graph && !printed){
  hugeG.display(dataEl.getNumbers());
  hugeG.botton(); 
  hugeG.printMsg();
  printed=true;
}
//println("     " + mouseX + " " +mouseY);
/************ Call of Function to Update data Every 30 minutes**********/
updateData();
}

void checkWeatherConditions(){
  if(dataEl.getTemperature()< 4 && (dataEl.getWindSpeed()<(-3) || dataEl.getWindSpeed()>(12)) && dataEl.getPressure()<(1010) && 
    (dataEl.getVisability().equals("VeryPoor") || dataEl.getVisability().equals("Poor"))) {
    conditions="bad";
  }
  else if((dataEl.getVisability().equals("Visibility: Poor")) || (dataEl.getVisability().equals("Visibility: VeryPoor"))){
    conditions="bad";
  }
  else{
    conditions="good";
  }
}

void checkRiverConditions(){
  if(dataEl.getCurrentWaterLevel() > 1.5){
    fish_catch="trout";
  }
  else {
    fish_catch="salmon";
  }
}

  
void updateData(){
//println(minutesNow+ " " + minute()+ " " + minutesNow);
  if(minute()== minutesNow +minutesPassed){
    setup();
  }
}
void mousePressed(){
 // ball.clicked(mouseX, mouseY);
 /***Method that is invoced only when the mouse is pressed***/
  clicked(mouseX,mouseY);   
  hugeG.clicked(mouseX, mouseY);
}  

/***Method that is invoced only when the mouse is pressed***/
void clicked(int mx, int my) {

   if(mx>185-150 && mouseX<185+150 && mouseY>540-115 && mouseY<450+115){
      graph = true;
   }
  }

class Ball{
  private int xpos;
  private int ypos;
  private String condition;
  Ball(String g,int x, int y){
    xpos=x;
    ypos=y;
    
    condition=g;
    noStroke();
    if(g.equals("good")){ 
   fill(9,165,35);
   ellipse(x,y,300,300);
   printMsgGood();
    }else{
   fill(210,12,36);
   ellipse(x,y,300,300);
   printMsgBad();
    }  
}

/**Printing messages for the class***/
void printMsgGood(){
int xpos=width/2;
int ypos=250;

fill(255);
textFont(BallSmall, 30);
textAlign(CENTER);
text("Conditions are:", xpos,ypos);
ypos+=64;
textFont(BallBig, 60);
text("Fantastic",xpos,ypos);
ypos+=54;
textFont(BallSmall, 30);
text("Go fish!", xpos, ypos);
textAlign(LEFT);
  }

void printMsgBad(){
int xpos=width/2;
int ypos=250;

fill(255);
textFont(BallSmall, 30);
textAlign(CENTER);
text("Conditions are:", xpos,ypos);
ypos+=64;
textFont(BallBig, 60);
text("Terrible",xpos,ypos);
ypos+=54;
textFont(BallSmall, 30);
text("Stay indoors!", xpos, ypos);
textAlign(LEFT);
  }
}
class Data{

private int m=month();
private String month;  
private String[] time=new String[3];
private String TIME;
private int day=day();

private String visability;
private int temperature;
private int windSpeed;
private int pressure;
private int xpos=20;
private int ypos=80;

private float currentWaterLevel;
private String[] dates;
private float[] numbers; 

/***Constructor***/
Data(){}

/**Setup Calendar***/
void setupCalendar(){
  
  switch (m) {
   case 1:  month="January";
            break;
   case 2:  month="February";
            break;
   case 3:  month="March";
            break;
   case 4:  month="April";
            break;
   case 5:  month="May";
            break;
   case 6:  month="June";
            break;
   case 7:  month="July";
            break;
   case 8:  month="August";
            break;
   case 9:  month="September";
            break;
   case 10: month="October";
            break;
   case 11: month="November";
            break;
   case 12: month="December";
            break;
  
  }
}

/*Setup and print time machine (didn't use the values time on purpose)*/
void time(){
  String day_s=Integer.toString(day());
      
      time[0]=Integer.toString(hour());
      time[1]=Integer.toString(minute());
      time[2]=Integer.toString(second());
      TIME=join(time, ":"); 
      
      fill(50);
      rect(20,20,243,30);
      
      fill(255);
      textSize(18);
      textFont(Bold1);
      text(month,30 ,42 );
      text(day_s,135 ,42 );
      text(TIME,170 ,42 );
      
}
/***Details of weather conditions***/
void weather(){

String windDirection;
String humidity;

//String temp;

//boolean error=false;

/*** Website where we took the details ***/
String Weather[] = loadStrings("http://open.live.bbc.co.uk/weather/feeds/en/2961423/observations.rss");
String[] values = split(Weather[13], ',');

/***Trim Values ***/
/*We took the values from an html file I had to tidy a little the structures***/
for(int i=0; i<values.length; i++){
 values[i]=trim(values[i]);
}
/***I have taken only the values that mattered to me**/
values[0]=values[0].substring(13);
values[6]=values[6].substring(0,22);

visability=values[6].substring(0,12);
/***This part of code is made to take the part of String in which I was interested for (first Eleven charaters and only letters)***/
for(int j=12; j<values[6].length(); j++){
  if(values[6].charAt(j)>=65 && values[6].charAt(j)<=90 || values[6].charAt(j)>=97 && values[6].charAt(j)<=122){
          visability= visability + String.valueOf(values[6].charAt(j));
  }else if(values[6].charAt(j)==60){
    break;
  }
}
/**debug **/
//println(visability);
//println((int)values[6].charAt(20));

/*****TEMPERATURE*****/
temperature=checkDigits(values[0].substring(13,14));
/****END TEMPERATURE****/

/*****WIND SPEED****/
windSpeed=checkDigits(values[2].substring(12,14));

/*****OLD CODE USED BEFORE MY AMAZING METHOD ****/
/*value1_char=values[2].charAt(12);
value2_char=values[2].charAt(13);

value1_int = int(value1_char)-48;
value2_int = int(value2_char)-48;

if(value2_int>9){
  //windSpeed=value1_int;
  temp=String.valueOf(value1_char);
  windSpeed=Integer.parseInt(temp);
}
else if(value2_int>=0 && value2_int<=9){
  temp=String.valueOf(value1_char) + String.valueOf(value2_char);
  windSpeed=Integer.parseInt(temp);
}*/
/*****FINISH OLD CODE USED BEFORE the new method ****/

/******PRESSURE*****/
pressure=checkDigits(values[4].substring(10,14));

/******END OF PRESSURE *****/
  fill(60);
  textFont(Bold1, 20);
  text("What the weather is like at Pollagh", xpos, ypos);
  ypos+=35;
  xpos+=40;
  
/***** PRINT of weather Values***/  
  textFont(Regular, 18);
for(int i=0; i<values.length-1; i++){
 // println(values[i]);
  fill(60);
  text(values[i], xpos, ypos);
ypos+=25;
}

/**Print Visability***/
text(visability, xpos, ypos);
/*println(temperature);
println(windSpeed);
println(pressure);
*/
}

/*for (int i=0; i<values[0].length(); i++){
 
    if(values[0].charAt(i)=='?'){ 
      error=true;
    }
    if(!error){
      tst+=values[0].charAt(i);
    }
}*/
    
/****CHECK THE DIGITS VALUES AND RETURN NUMBERS****/     
/*Useful method I have written to check the char within the String and return the number as int
  The first part of the code wasn't really necessary, but makes everything clearer*/
 int checkDigits(String s){
  String temp="";
  int value=0;
  char[] digits=new char[s.length()];
  for (int i=0; i<s.length(); i++){
   digits[i]=s.charAt(i);
  }
 
 for(int u=0; u<digits.length; u++){
   if(((int)digits[u]-48)>=0 && ((int)digits[u]-48)<=9){
     temp= temp + String.valueOf(digits[u]);
   }
   value=Integer.parseInt(temp);
 }
   return value;
 }  


/****ACCESSOR METHODS***/
int getTemperature(){
  return temperature;
}
int getPressure(){
  return pressure;
}
int getWindSpeed(){
  return windSpeed ;
}
String getVisability(){
  return visability;
}
float getCurrentWaterLevel(){
  return currentWaterLevel;
}
float[] getNumbers(){
  return numbers;
}

/***************DATA FROM THE RIVERS*****************/

void getRiverData(){
 String data[] = loadStrings("http://waterlevel.ie/data/day/34071_0001.csv?1385116537%22"); 
 String[] values = new String[2];
 
 String[] goodValues;
 int day_number;
 int array_length=0;
 float map;
 
 float average=0;
 int count=0;
 int xpos=50;
 /*Begin of data manipulating*/
 /***Determine the array length  only for 2 days values with useful data***/
 for (int o=data.length-1; o>0; o--){
   if((Integer.parseInt(data[o].substring(8,10))) == day || Integer.parseInt(data[o].substring(8,10)) == day-1 ){
     array_length++;
   }
  }
/*** create array where to store the useful values***/
   goodValues=new String[array_length];
/*** fill the array in reverse order, the last values becomes the first***/  
  for(int f=data.length-1, g=0; f>0; f--, g++){
    if((Integer.parseInt(data[f].substring(8,10))) == day || Integer.parseInt(data[f].substring(8,10)) == day-1 ){
      goodValues[g]=data[f];
    }
  }
  
/*** Data manipulation  and length calculations of our final array  Split the String, check if the last part is empty.
     If is empty, forget about it***/  
 array_length=0;
 for(int i=goodValues.length-1, y=0; i>=0; i--,y++){
   values=split(goodValues[i], ',');
/**If some values are missing,**/  
   if(!values[1].equals("")){
     array_length++;
   }
 }
 /*debug*/
 //println(array_length);
 
 /****Create 2 arrays where to store our values **/
  numbers = new float[array_length];
  dates= new String[array_length];
  
/***Fill the two array only with the values good for us to be utilized again in reverse order,
    it wasn't really necessary to reverse twice the values, but at the beginning I had another idea in mind ***/
 for(int p=goodValues.length-1, q=0; p>=0; p--){
   values=split(goodValues[p], ',');
   /***If the string is not empty, we keep it. Otherwise we forget about her ***/
   if(!values[1].equals("")){
    dates[q]=values[0]; 
    numbers[q]=Float.parseFloat(values[1]); 
    q++;
   }
 }  
    

    // println(i + " " + y + " " +goodValues.length );
     //println("hello");
   // numbers[y]=numbers[y--];
   
  // dates[y]=values[0];
  // numbers[y]=Float.parseFloat(values[1]);

  
/*** The very last Water Level Value ***/  
 currentWaterLevel=numbers[numbers.length-1];


 /*mapping values to be used in the grapth*/
 for (int u=0; u<numbers.length; u++){
   map=map(numbers[u], 1.0, 2.0, 0.0, 225.0);
  // println(map);
   //println(numbers[u]); 
    fill(60,100,255);
    noStroke();
    rect(xpos,560,3, -map);
   xpos+=3; 
 }
 


/****Check the average  among the last 10 values ****/ 
 for(int k=numbers.length-1; k>=numbers.length-10; k--){
   average+=numbers[k];
   count++;
 }
 average=average/count;
 
 // println(average + " " + count);
 /*If the averange is higher than the last value, waterlevel is falling*/
  if(average > numbers[numbers.length-1]){
  fill(50);   
  textFont(Bold1, 20);  
  text("The water level is falling", 20, 325);
  } else {
  fill(50); 
  textFont(Bold1, 20);
  text("The water level is rising", 20, 325);   
}
}

void printScale(){
 
   //The scale for the graph 
 strokeWeight(1);
 stroke(50);
 line(45, 565, 45, 335);
 line(45, 565, 350, 565); 
 fill(50);
 
  textFont(Small, 12);
  text("2.0m", 10, 340);
  text("1.0m", 10, 565);
  text("12 Hours Ago", 50, 585);
  text("Now", 325, 585);
 
 noStroke();
}
}
class Fish{
PImage salmon;
PImage trout;
   
/***Constructor***/  
Fish(String s, int x, int y){

     salmon = loadImage("data/Salmon.png");   
     trout = loadImage("data/Trout.png");
      if(s.equals("salmon")){
      image(salmon, x, y); 
    }
    else if (s.equals("trout")) {
      image(trout, x, y); 
    }
}

void printMsg(){
 int xpos=width-20;
 int ypos=30;
  fill(50);
  textAlign(RIGHT);
  textFont(Bold1, 20);
  text("The most likely catch of the day", xpos, ypos);
  textAlign(LEFT);
 }
 
}
class Fly{
  private int xpos;
  private int ypos;
    PImage salmonFly1;
    PImage salmonFly2;
    PImage troutFly1;
    PImage troutFly2;
    PImage troutFly3;
/***Constructor***/
  Fly(String s, int x, int y){
    xpos=x;
    ypos=y;
    
    salmonFly1= loadImage("data/SalmonFly1.png");
    salmonFly2= loadImage("data/SalmonFly2.png");
    troutFly2= loadImage("data/TroutFly2.png");
    troutFly3= loadImage("data/TroutFly3.png");
    
    if(s.equals("salmon")){
      ypos+=70;
    image(salmonFly1, xpos+10, ypos);
    xpos-=190;
    ypos+=65;
    image(salmonFly2, xpos, ypos);
    }
    else if(s.equals("trout")){
    ypos+=60;
    image(troutFly3, xpos, ypos);
    xpos-=220;
    ypos+=60;
    image(troutFly2, xpos, ypos);
    }

  }

void printMsg(){
 int xpos=width-20;
 int ypos=325;
  fill(50);
  textAlign(RIGHT);
  textFont(Bold1, 20);
  text("Recommended fly styles", xpos, ypos);
  textAlign(LEFT);
 }
}

class Graph {
private int rectX=860;
private int rectY=20; 
private int  pos=20;

/***Constructor***/
Graph(){}
  
void display(float[] numbers){
  float map;
  
  background(255);
  for (int u=0; u<numbers.length; u++){
   map=map(numbers[u], 0.4, 1.8, 0.0,560);
  // println(map);
   //println(numbers[u]); 
    fill(60,100,255);
    noStroke();
    rect(pos,585,9, -map);
   pos+=9; 
 }
  
}
/*Text and code goes here */
void printMsg(){
  pos=20;
  fill(0);
  
  textFont(Bold1, 20);
  
  
  text("2.0 meters", 20,30);
  stroke(1);
  line(pos-5,590,pos-5,20);
  line(pos-3,590,width-10,590);
}
void botton(){ 
  fill(60);
  rect(840,20, 40 ,20);
  rectMode(CORNER);
  textFont(Small, 12);
  textAlign(RIGHT);
  fill(255);
  text("Back", width-25, 34);
  textAlign(LEFT);
}

void clicked(int mx, int my) {
   if(mx>rectX-20 && mouseX<rectX+20 && mouseY>rectY-20 && mouseY<rectY+20){
      graph = false;
      setup();
   }
  }
}


