
//InfoGraphic showing women's earnings as a percent of mens in the years 2000 and 2010, while showing that women are earning the majority of all degrees at all levels in these same years.
//by Vesselina Ivanova

float yValueTop=470;
float percent=202.5;
float r=(183);
float g=(224);
float a;
float b;
float c;
float d;
float diam;
float e;
float f;

void setup(){
  size(600,800);
  smooth();
  background (255);
}

//graph
void draw(){
 a=random(255);
 b=random(5);
 c=random(170);
 d=random(50);
 diam=random(40);
 e=random(width);
 f=random(height);
 
 noStroke();
 fill(a,b,c,d);
 ellipse(e,f,diam,diam);
 
 fill(255);
 rect(25,10,520,760);
 //text
  fill(0);
  textSize(15);
  text("100%",30,130);
  text("90%",30,280);
  text("80%",30,430);
  text("70%",30,590);
  text("60%",30,730);
  text("Change from the Years 2000 - 2010",170,760);
  
  //blue rec
  noStroke();
  fill(r,g,255,255);
  r--;
  g--;
  if(g<=146 && r<=0){
    g=224;
    r=183;
  }
  rectMode(CORNER);
  rect(80,120,460,600);
  
  //white lines
  stroke(255);
  line(70,570,540,570);
  line(70,420,540,420);
  line(70,270,540,270);
  
  //pink rectangle
  stroke(255,82,232,255);
  fill(255,203,248);
  quad(120,720,120,yValueTop,500,yValueTop,500,720);
  yValueTop--;
  if(yValueTop<400){
    yValueTop=400;
  }else if(yValueTop==400){
      yValueTop=470;
    }
  
  fill(80);
  textSize(10);
  text("Women's Wages in Comparison to Men's",210,700);
  
  //black lines
  stroke(20);
  line(80,120,80,720);
  line(80,720,540,720);
  
  //pie percents 2000
  noStroke();
  fill(255,116,230,255);
  arc(310,570,200,200,radians(0),radians(percent));
  if(yValueTop<460 && percent<=213){
    percent++;
  } 
  if(yValueTop==450 && percent>213){
      percent=202.5;    
  }
  
  fill(255);
  textSize(15);
  text("% College Degrees",245,600);
  textSize(10);
  text("Earned by Women",270,620);
  text("Out of Total Degrees Earned",244,635);

  //Intro
  //noStroke();
  //fill(255,255,255,100);
  //bezier(80,110,20,-33,600,-33,540,110);
  fill(10);
  textSize(30);
  text("Slow Progress",216,41);
  fill(61,160,62,255);
  textSize(30);
  text("Slow Progress",215,40);
  textSize(20);
  text("Women Learn More, Still Earn Less",145,70);
  textSize(10);
  fill(0);
  text("*Info: United States Department Bureau of Labor Statistics",170,90);
  text("The Institute of Education Sciences",227,105);
}
