

 
void setup() {
   size(500, 550);
   background(255);
   smooth();
   frameRate(15);
   BarChartSetup();
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



//Jaar 2010
//Jongens

fill(0,0,200);
rect(60,365,50,135);
fill(255);
text("13.5%",75,470); 



//Meijes 
fill(200,0,0);
rect(110,370,50,129);
fill(255);
text("12.5%",125,470); 


//Jaar 2009
//Jongens
fill(0,0,200);
rect(180,374,50,126);
fill(255);
text("12.5%",190,470);  


//Meijes 
fill(200,0,0);
rect(230,365,50,134);
fill(255);
text("13.0%",240,470);  



//Jaar 2008
//Jongens 
fill(0,0,200);
rect(300,366,50,133);
fill(255);
text("13.0%",310,470);  



//Meijes 
fill(200,0,0);
rect(350,350,50,149);
fill(255);
text("14.5%",360,470);  
} 


