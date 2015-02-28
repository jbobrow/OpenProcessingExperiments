

 
void setup() {
   size(500, 550);
   background(255);
   smooth();
   frameRate(15);
}

int y1 = 500;
int y2 = 0;

int x1 = 110;
int x2 = 500;

int counter = 1000;

void draw(){
  stroke(0);  
  BarChartSetup(); 
  checkBarLimit(); 
}

void BarChartSetup(){

fill(0);
text("Overgewicht van kinderen van 2 tot 20 jaar", 150, 50);
text("Jongens", 180, 70);
text("Meisjes", 300, 70);
text("2010", 100, 520);
text("2009", 220, 520);
text("2008", 335, 520);

fill(0,0,200);
rect(160,60,10,10);
fill(200,0,0);
rect(280,60,10,10);

stroke(0);

//verticale lijn
line(50,100,50,500);

//horizontale lijn
line(50,500,450,500);

//grens 10%
line(30,400,70,400);

//grens 20%
line(30,300,70,300);

//grens 30%
line(30,200,70,200);

//grens 40%
line(30,100,70,100);

fill(0);
text("0%", 30, 500);
text("10%", 30, 400);
text("20%", 30, 300);
text("30%", 30, 200);
text("40%", 30, 100);
}

void checkBarLimit(){

//Jaar 2010
//Jongens
if(y2 <= 135){
  

 
fill(0,0,200);
rect(60,y1,50,y2);
fill(255);
text(counter+"%",75,470); 
}

if(y2 <= 129){
//Meijes 
fill(200,0,0);
rect(110,y1,50,y2);
fill(255);
text(counter+"%",125,470); 
}

if(y2 <=126){
//Jaar 2009
//Jongens
fill(0,0,200);
rect(180,y1,50,y2);
fill(255);
text(counter+"%",190,470);  
}

if(y2 <= 134){
//Meijes 
fill(200,0,0);
rect(230,y1,50,y2);
fill(255);
text(counter+"%",240,470);  
}

if(y2 <=133){
//Jaar 2008
//Jongens 
fill(0,0,200);
rect(300,y1,50,y2);
fill(255);
text(counter+"%",310,470);  
}

if(y2 <=149){
//Meijes 
fill(200,0,0);
rect(350,y1,50,y2);
fill(255);
text(counter+"%",360,470);  

y1 = y1 - 5;
x1 = x1 -5;
y2 = y2 + 5;
x2 = x2 - 5;
counter = y1;
}


}


